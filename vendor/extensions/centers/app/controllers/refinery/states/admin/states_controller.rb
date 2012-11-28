module Refinery
  module States
    module Admin
      class StatesController < ::Refinery::AdminController

        crudify :'refinery/states/state',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
