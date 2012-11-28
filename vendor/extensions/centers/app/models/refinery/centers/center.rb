require 'friendly_id'
module Refinery
  module Centers
    class Center < Refinery::Core::BaseModel
      extend FriendlyId
      friendly_id :name, use: [:slugged]
      self.table_name = 'refinery_centers'

      attr_accessible :name, :state_id, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :area_served, :staff, :position, :slug

      acts_as_indexed :fields => [:name, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :area_served, :staff]

      validates :name, :presence => true, :uniqueness => true
      belongs_to :state, class_name: "::Refinery::States::State"
    end
  end
end
