require "xgen/version"

module Xgen
  class Util
    def self.erb_template(source, destination, config)
      source_content = File.read( File.expand_path("../templates/#{source}", __FILE__) )
      template = ERB.new(source_content).result(binding)

      if destination.index('/')
        path = destination[0..(destination.rindex('/')-1)]
        Dir.mkdir(path) unless Dir.exist?(path) || path == ".."
      end
      File.write(destination, template)
    end
  end


end
