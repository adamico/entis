class CreatePublicationsPublications < ActiveRecord::Migration

  def up
    create_table :refinery_publications do |t|
      t.string :authors
      t.text :title
      t.string :review
      t.integer :year
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-publications"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/publications/publications"})
    end

    drop_table :refinery_publications

  end

end
