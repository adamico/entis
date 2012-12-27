module Refinery
  module States
    class State < Refinery::Core::BaseModel
      self.table_name = 'refinery_states'
      extend FriendlyId

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      has_many :centers, class_name: "::Refinery::Centers::Center",
        conditions: "observer = false OR observer IS NULL"
      has_many :observers, class_name: "::Refinery::Centers::Center",
        conditions: {observer: true}

      friendly_id :name, use: :slugged
    end
  end
end
