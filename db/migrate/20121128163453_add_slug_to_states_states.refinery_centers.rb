# This migration comes from refinery_centers (originally 4)
class AddSlugToStatesStates < ActiveRecord::Migration
  def change
    add_column :refinery_states, :slug, :string
    add_index :refinery_states, :slug
  end
end
