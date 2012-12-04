module Refinery
  module Centers
    module Admin
      class CentersController < ::Refinery::AdminController

        crudify :'refinery/centers/center',
                :title_attribute => 'name', :xhr_paging => true, :order => "name", :sortable => false

      end
    end
  end
end
