module Refinery
  module Members
    class Member < Refinery::Core::BaseModel
      self.table_name = 'refinery_members'
      extend FriendlyId

      attr_accessible :name, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :staff, :position, :area_served, :state_id

      acts_as_indexed :fields => [:name, :service_name, :service_head, :address, :phone, :fax, :email, :website, :creation, :accept_calls_from, :hours, :affiliation, :staff, :area_served]

      validates :name, :presence => true, :uniqueness => true
      belongs_to :state, class_name: "::Refinery::States::State"

      friendly_id :name, use: :slugged
    end
  end
end
