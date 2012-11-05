module Refinery
  module States
    class State < Refinery::Core::BaseModel
      self.table_name = 'refinery_states'

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      has_many :members, class_name: "::Refinery::Members::Member"
    end
  end
end
