module Refinery
  module States
    class StatesController < ::ApplicationController

      before_filter :find_all_states
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @state in the line below:
        present(@page)
      end

      def show
        @state = State.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @state in the line below:
        present(@page)
      end

    protected

      def find_all_states
        @states = State.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/states").first
      end

    end
  end
end
