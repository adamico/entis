class AddObserverToRefineryCenter < ActiveRecord::Migration
  def change
    add_column :refinery_centers, :observer, :boolean
  end
end
