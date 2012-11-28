module Refinery
  module Centers
    class CentersController < ::ApplicationController

      before_filter :find_all_centers
      before_filter :find_all_states
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @center in the line below:
        present(@page)
      end

      def show
        @center = Center.find(params[:id])
        @state = Refinery::States::State.find(params[:state_id])
        @other_centers = @state.centers.order('name ASC').reject {|m| m === @center}

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @center in the line below:
        present(@page)
      end

    protected

      def find_all_states
        @states = Refinery::States::State.order('name ASC')
      end

      def find_all_centers
        @centers = Center.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/centers").first
      end

    end
  end
end
