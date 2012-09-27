require 'rubygems'
require 'nokogiri'

class LevelParser
  attr_accessor :file, :xml, :layers
  def initialize(filename)
    self.file = File.open(filename)
    self.xml = Nokogiri::XML(self.file)
    self.layers = {}
  end

  def parse
    render_priority = 1
    self.xml.root.children.each do |node|
      if node.name == "g" and node.attributes['id'].value.match('layer') then
        # I'm in a layer
        label = node.attributes['label'].value
        layer = []
        nodes = node.children.select { |c| c.name == 'image' }

        nodes.each do |asset|
          result_asset = { :render_priority => render_priority }
          render_priority += 1
          asset.attributes.each do |name, a|
            case name
              when 'href'
                result_asset[:resource_name] = a.value.split('/')[-2..-1].join('/')
                result_asset[:name] = result_asset[:resource_name].split('/').last.gsub('.png', '')
              when 'avoid_render_at_start'
                result_asset[:avoid_render_at_start] = true
              else
                result_asset[name.to_sym] = a.value
            end
          end
          layer << result_asset
        end

        self.layers[label.to_sym] = layer
      end
    end
  end

  def to_lua
    self.parse if self.layers.empty?
    result = "objects = {\n"
    result += "  \n"

    self.layers.each do |layer_name, layer|
      layer.each do |asset|
        asset_result = "  #{asset[:name]} = {\n"
        asset_result += "    layer_name = '#{layer_name}',\n"
        asset_result += "    type = RESOURCE_TYPE_IMAGE,\n"
        asset_result += "    x = #{asset[:x]}, y = #{asset[:y]},\n"
        asset_result += "    width = #{asset[:width]}, height = #{asset[:height]},\n"
        asset_result += "    resource_name = '#{asset[:resource_name]}',\n"
        asset_result += "    render_at_start = #{!asset[:avoid_render_at_start]},\n"
        asset_result += "    render_priority = #{asset[:render_priority]},\n"
        asset_result += "  },\n"
        asset_result += "  \n"

        result += asset_result
      end
    end
    result += "}\n"

    print result
  end

end


if ARGV[0]
  lp = LevelParser.new(ARGV[0])
  lp.to_lua
else
  puts "Usage: ruby parse-level.rb [filename]"
end