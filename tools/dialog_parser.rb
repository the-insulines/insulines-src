require 'rubygems'
require 'nokogiri'

class DialogParser
  attr_accessor :file, :xml, :actors, :conversations, :user_variables, :name

  def initialize(filename)
    self.file = File.open(filename)
    self.xml = Nokogiri::XML(self.file)
    self.name = filename.split('/')[2].gsub('.xml', '')
  end

  def parse
    assets = self.xml.root.children.select { |c| c.name == 'Assets' }.first
    assets.children.each do |asset|
      case asset.name
      when "Actors"
        self.load_actors(asset)
      when "Items"
      when "Locations"
      when "Conversations"
        self.load_conversations(asset)
      when "UserVariables"
        self.load_user_variables(asset)
      end
    end
  end

  def load_actors(actors_xml)
    self.actors = {}
    onlyChildrenWithName("Actor", actors_xml).each do |actor_xml|
      id = actor_xml.attributes['ID'].value.to_i
      self.actors[id] = { :id => id }
      
      onlyChildrenWithName("Fields", actor_xml).each do |fields|
        self.actors[id] = self.parse_fields(fields, self.actors[id])
      end
    end
  end

  def onlyChildrenWithName(name, xml)
    xml.children.select { |f| f.name == name }
  end

  def load_user_variables(user_variables_xml)
    self.user_variables = {}
    onlyChildrenWithName("UserVariable", user_variables_xml).each do |user_variable_xml|
      onlyChildrenWithName("Fields", user_variable_xml).each do |fields|
        variable = self.parse_fields(fields, {})
        self.user_variables[variable[:name]] = variable
      end
    end
  end
    
  def load_conversations(conversations_xml)
    self.conversations = {}
    onlyChildrenWithName("Conversation", conversations_xml).each do |conversation_xml|
      conversation = { :id => conversation_xml.attributes["ID"].value.to_i }
      
      conversation_xml.children.each do |conversation_children|
        if conversation_children.name == "Fields"
          conversation = self.parse_fields(conversation_children, conversation)
        end

        if conversation_children.name == "DialogEntries"
          conversation[:dialog_entries] = self.parse_dialog_entries(conversation_children)
        end
      end
      self.conversations[conversation[:id]] = conversation
    end


  end

  def parse_fields(fields_xml, bucket)
    onlyChildrenWithName("Field", fields_xml).each do |field|
      current_field = ''
      field.children.each do |field_children|
        current_field = field_children.children.first.to_s.downcase.to_sym if field_children.name == "Title"
        bucket[current_field] = field_children.children.first.to_s if field_children.name == "Value"
      end
    end
    bucket
  end

  def parse_links(links_xml, bucket)
    bucket[:links] = []

    onlyChildrenWithName("Link", links_xml).each do |link_xml|
      link = {
        :origin_conversation_id => link_xml.attributes['OriginConvoID'].value.to_i,
        :destination_conversation_id => link_xml.attributes['DestinationConvoID'].value.to_i,
        :origin_dialog_id => link_xml.attributes['OriginDialogID'].value.to_i,
        :destination_dialog_id => link_xml.attributes['DestinationDialogID'].value.to_i,
        :is_connector => eval(link_xml.attributes['IsConnector'].value),
      }
      bucket[:links] << link
    end
    bucket
  end

  def parse_conditions_string(conditions_xml, bucket)
    bucket[:conditions_string] = conditions_xml.children.first.to_s if conditions_xml.children.first
    bucket
  end

  def parse_user_script(script_xml, bucket)
    bucket[:user_script] = script_xml.children.first.to_s if script_xml.children.first
    bucket
  end

  def parse_dialog_entries(dialog_entries_xml)
    dialog_entries = []
    onlyChildrenWithName("DialogEntry", dialog_entries_xml).each do |dialog_entry_xml|
      dialog_entry = { 
        :id => dialog_entry_xml.attributes['ID'].value.to_i,
        :is_root => eval(dialog_entry_xml.attributes['IsRoot'].value),
        :is_group => eval(dialog_entry_xml.attributes['IsGroup'].value)
      }

      dialog_entry_xml.children.each do |dialog_entry_children|
        
        case dialog_entry_children.name
        when "Fields"
          dialog_entry = self.parse_fields(dialog_entry_children, dialog_entry)
        when "OutgoingLinks"
          dialog_entry = self.parse_links(dialog_entry_children, dialog_entry)
        when "ConditionsString"
          dialog_entry = self.parse_conditions_string(dialog_entry_children, dialog_entry)
        when "UserScript"
          dialog_entry = self.parse_user_script(dialog_entry_children, dialog_entry)
        end
          
      end

      dialog_entries << dialog_entry
    end
    dialog_entries
  end

  def escape(string)
    return '' if !string
    string.gsub!(/\n/, "\\n")
    string.gsub!('"', '\"')
    string
  end
  
  def updateConditionsString(string)
    return '' if !string

    string.gsub!(/Dialog\[(\d{1,2})\]/, 'dialog.currentConversation.dialogEntries.dialog\1')
    string.gsub!(/Variable\s?\["(\w*)"\] /, 'stateManager.dialogs.userVariables["\1"]')
    string
  end

    def updateUserScript(string)
    return '' if !string
    string.gsub!(/variable_(.*) =/, 'stateManager.dialogs.userVariables["\1"] =')
    string.gsub!(/Variable\s?\["(\w*)"\] /, 'stateManager.dialogs.userVariables["\1"]')
    string
  end
  
  def to_lua
    self.parse if !self.conversations
    result = "#{self.name}_conversations = {\n"
    result += "  \n"
    
    result += "  userVariables = {\n"
    
    if self.user_variables
      self.user_variables.each do |key, user_variable| 
        result += "    #{user_variable[:name]} = {\n"
        result += "      initialValue = #{user_variable[:"initial value"].downcase},\n"
        result += "    },\n"
      end
    end
    
    result += "  },\n"
    result += "  \n"

    self.conversations.each do |id, conversation|
      result += "  #{conversation[:title].downcase.gsub(' ', '_')} = {\n"

      result += "    actor = '#{self.actors[conversation[:actor].to_i][:name].downcase}',\n"
      result += "    conversant = '#{self.actors[conversation[:conversant].to_i][:name].downcase}',\n"
      result += "    dialogEntries = {\n"

      conversation[:dialog_entries].each do |dialog_entry|
        result += "        dialog#{dialog_entry[:id]} = {\n"
        result += "          isRoot = #{dialog_entry[:is_root]},\n"
        result += "          isGroup = #{dialog_entry[:is_group]},\n"
        result += "          actor = '#{self.actors[dialog_entry[:actor].to_i][:name].downcase}',\n"
        result += "          conversant = '#{self.actors[dialog_entry[:conversant].to_i][:name].downcase}',\n"
        result += "          menuText = \"#{self.escape(dialog_entry[:"menu text"]) }\",\n"
        
        if dialog_entry[:"dialogue text"] && !dialog_entry[:"dialogue text"].empty?
          result += "          dialogueText = {\n"
          dialog_entry[:"dialogue text"].split('|').each do |dialog_text|
            result += "            \"#{self.escape(dialog_text)}\",\n"
          end
          result += "          },\n"
        end

        result += "          conditionsString = '#{self.updateConditionsString(dialog_entry[:conditions_string])}',\n"
        
        if dialog_entry[:user_script]
          result += "          userScript = function()\n"
          result += "            #{self.updateUserScript(dialog_entry[:user_script])}\n"
          result += "          end,\n"
        end
        
        result += "          links = {\n"
        
        dialog_entry[:links].each do |link|
          result += "            {\n"
          result += "              originConversationId = #{link[:origin_conversation_id]},\n"
          result += "              destinationConversationId = #{link[:destination_conversation_id]},\n"
          result += "              originDialogId = #{link[:origin_dialog_id]},\n"
          result += "              destinationDialogId = #{link[:destination_dialog_id]},\n"
          result += "              isConnector = #{link[:is_connector]},\n"
          result += "            },\n"
        end
        
        result += "          },\n"

        result += "        },\n"
      end
      
      result += "    },\n"      

      # p conversation; return;
      result += "  },\n"
      result += "  \n"

      #   result += asset_result
      # end
    end
    result += "}\n"
  end

end