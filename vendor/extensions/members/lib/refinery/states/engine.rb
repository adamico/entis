module Refinery
  module States
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::States

      engine_name :refinery_members

      initializer "register refinerycms_states plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "states"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.states_admin_states_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/states/state',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::States)
      end
    end
  end
end
