module Refinery
  module Publications
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Publications

      engine_name :refinery_publications

      initializer "register refinerycms_publications plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "publications"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.publications_admin_publications_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/publications/publication',
            :title => 'authors'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Publications)
      end
    end
  end
end
