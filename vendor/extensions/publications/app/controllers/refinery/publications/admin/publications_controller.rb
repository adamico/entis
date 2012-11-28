module Refinery
  module Publications
    module Admin
      class PublicationsController < ::Refinery::AdminController

        crudify :'refinery/publications/publication',
                :title_attribute => 'title',
                :order => "year DESC",
                :sortable => false,
                :xhr_paging => true

      end
    end
  end
end
