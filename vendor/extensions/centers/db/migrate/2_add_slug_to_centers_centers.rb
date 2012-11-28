class AddSlugToCentersCenters < ActiveRecord::Migration
  def change
    add_column :refinery_centers, :slug, :string
    add_index :refinery_centers, :slug
  end
end
