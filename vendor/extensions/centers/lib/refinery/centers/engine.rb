module Refinery
  module Centers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Centers

      engine_name :refinery_centers

      initializer "register refinerycms_centers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "centers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.centers_admin_centers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/centers/center',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Centers)
      end
    end
  end
end
