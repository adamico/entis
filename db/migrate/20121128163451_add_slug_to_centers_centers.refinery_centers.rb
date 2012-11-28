# This migration comes from refinery_centers (originally 2)
class AddSlugToCentersCenters < ActiveRecord::Migration
  def change
    add_column :refinery_centers, :slug, :string
    add_index :refinery_centers, :slug
  end
end
