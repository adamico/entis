module Refinery
  module Centers
    class Center < Refinery::Core::BaseModel
      self.table_name = 'refinery_centers'
      extend FriendlyId

      attr_accessible :name, :state_id, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :area_served, :staff, :position

      acts_as_indexed :fields => [:name, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :area_served, :staff]

      validates :name, :presence => true, :uniqueness => true
      belongs_to :state, class_name: "::Refinery::States::State"

      friendly_id :name, use: :slugged
    end
  end
end
