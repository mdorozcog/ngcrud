require 'fileutils'

class ResourceCrud
  KLASSES = %w[interface service create edit list].freeze

  def initialize(name, **props)
    @name = name
    @props = props
    @generator_hash = {}
  end
  
  def generator
    dirname = File.dirname("src/app/features/#{@name.downcase}")
    unless File.directory?(dirname)
      FileUtils::mkdir_p("src/app/features/#{@name.downcase}/#{@name.downcase}-create")
      FileUtils::mkdir_p("src/app/features/#{@name.downcase}/#{@name.downcase}-list")
    end

    p "Generating interface..."
    interface = ERB.new(File.open("lib/templates/resource_interface.erb").read)
    interface_file = File.new("./src/app/features/#{@name.downcase}/#{@name.downcase}.ts", "w")
    interface_file.write(interface.result(get_binding))
    interface_file.close
    p "Generating service..."
    service = ERB.new(File.open("lib/templates/resource_service.erb").read)
    service_file = File.new("./src/app/features/#{@name.downcase}/#{@name.downcase}.service.ts", "w")
    service_file.write(service.result(get_binding))
    service_file.close

    p "Generating components..."
    create_html = ERB.new(File.open("lib/templates/components/resource_create_html.erb").read)
    file_html = File.new("./src/app/features/#{@name.downcase}/#{@name.downcase}-create/#{@name.downcase}-create.component.html", "w")
    file_html.write(create_html.result(get_binding))
    file_html.close
    create_ts = ERB.new(File.open("lib/templates/components/resource_create_ts.erb").read)
    file_ts = File.new("./src/app/features/#{@name.downcase}/#{@name.downcase}-create/#{@name.downcase}-create.component.ts", "w")
    file_ts.write(create_ts.result(get_binding))
    file_ts.close

    list_html = ERB.new(File.open("lib/templates/components/resource_list_html.erb").read)
    file_html = File.new("./src/app/features/#{@name.downcase}/#{@name.downcase}-list/#{@name.downcase}-list.component.html", "w")
    file_html.write(list_html.result(get_binding))
    file_html.close
    list_ts = ERB.new(File.open("lib/templates/components/resource_list_ts.erb").read)
    file_ts = File.new("./src/app/features/#{@name.downcase}/#{@name.downcase}-list/#{@name.downcase}-list.component.ts", "w")
    file_ts.write(list_ts.result(get_binding))
    file_ts.close
    
  end

  private
    def get_binding
      binding
    end
end