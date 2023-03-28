class ResourceCrud
  KLASSES = %w[interface service create edit list].freeze

  def initialize(name, **props)
    @name = name
    @props = props
    @generator_hash = {}
  end
  
  def generator
    p "Generating interface..."
    interface = ERB.new(File.open("lib/templates/resource_interface.erb").read)
    interface_file = File.new("./src/app/features/#{name.downcase}.ts", "w")
    interface_file.puts(interface.run(get_binding))
    interface_file.close
    p "Generating service..."
    service = ERB.new(File.open("lib/templates/resource_service.erb").read)
    service_file = File.new("./src/app/features/#{name.downcase}.service.ts", "w")
    service_file.puts(service.run(get_binding))
    service_file.close
    
  end

  private
    def get_binding
      binding
    end
end