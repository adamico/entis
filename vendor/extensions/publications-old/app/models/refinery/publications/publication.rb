module Refinery
  module Publications
    class Publication < Refinery::Core::BaseModel
      self.table_name = 'refinery_publications'

      attr_accessible :authors, :title, :review, :year, :position

      acts_as_indexed :fields => [:authors, :title, :review]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
