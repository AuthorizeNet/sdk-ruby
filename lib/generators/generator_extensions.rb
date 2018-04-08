# Extends the Rails::Generator::Commands classes to add support for route and gem configuration generation.

module Rails
  module Generator
    module Commands
      class Base
        def route_code(route_options)
          route_options[:path] = route_options[:name] unless route_options.key? :path
          code = "map.#{route_options[:name]} '#{route_options[:path]}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
          code += ", :conditions => #{route_options[:conditions]}" if route_options.key? :conditions
        end

        def gsub_file_check(relative_destination, regexp, *_args)
          path = destination_path(relative_destination)
          content = File.read(path)
          !(content =~ regexp).nil?
        end

        def gem_code(gem_options)
          gem_options[:lib] = gem_options[:name] unless gem_options.key? :lib
          code = "config.gem '#{gem_options[:name]}', :lib => '#{gem_options[:lib]}'"
        end
      end

      # Here's a readable version of the long string used above in route_code;
      # but it should be kept on one line to avoid inserting extra whitespace
      # into routes.rb when the generator is run:
      # "map.#{route_options[:name]} '#{route_options[:name]}',
      #     :controller => '#{route_options[:controller]}',
      #     :action => '#{route_options[:action]}'"

      class Create
        def route(route_options)
          sentinel = 'ActionController::Routing::Routes.draw do |map|'
          if gsub_file_check 'config/routes.rb', /(#{Regexp.escape(route_code(route_options))})/mi
            logger.identical route_code(route_options)
          else
            logger.route route_code(route_options)
            gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |m|
              "#{m}\n  #{route_code(route_options)}"
            end
          end
        end

        def gem(gem_options)
          sentinel = 'Rails::Initializer.run do |config|'
          if gsub_file_check 'config/environment.rb', /(#{Regexp.escape(gem_code(gem_options))})/mi
            logger.identical gem_code(gem_options)
          else
            logger.gem gem_code(gem_options)
            gsub_file 'config/environment.rb', /(#{Regexp.escape(sentinel)})/mi do |m|
              "#{m}\n  #{gem_code(gem_options)}"
            end
          end
        end
      end

      class Destroy
        def route(route_options)
          logger.remove_route route_code(route_options)
          to_remove = "\n  #{Regexp.escape(route_code(route_options))}"
          gsub_file 'config/routes.rb', /(#{to_remove})/mi, ''
        end

        def gem(gem_options)
          logger.remove_gem gem_code(gem_options)
          to_remove = "\n  #{Regexp.escape(gem_code(gem_options))}"
          gsub_file 'config/environment.rb', /(#{to_remove})/mi, ''
        end
      end
    end
  end
end
