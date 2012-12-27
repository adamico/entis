module Refinery
  module Centers
    module Admin
      class CentersController < ::Refinery::AdminController

        crudify :'refinery/centers/center',
                :title_attribute => 'name', :xhr_paging => true, :order => "name", :sortable => false,
                :paging => false

        helper_method :observer_only?
        before_filter :find_all_observers

        private

        def find_all_observers
          @observers = Center.with_observer_status.scoped
        end

        def observer_only?
          params[:observer] && params[:observer] == 'true' 
        end
      end
    end
  end
end
