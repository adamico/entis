module Refinery
  module States
    class State < Refinery::Core::BaseModel
      self.table_name = 'refinery_states'
      extend FriendlyId

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      has_many :members, class_name: "::Refinery::Members::Member"

      friendly_id :name, use: :slugged
    end
  end
end
