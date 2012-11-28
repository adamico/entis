class CreateCentersCenters < ActiveRecord::Migration

  def up
    create_table :refinery_centers do |t|
      t.string :name
      t.integer :state_id
      t.string :service_name
      t.string :service_head
      t.text :address
      t.text :phone
      t.text :fax
      t.text :email
      t.text :website
      t.text :creation
      t.text :accept_calls_from
      t.text :hours
      t.text :affiliation
      t.string :area_served
      t.text :staff
      t.integer :position
      t.string :slug

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-centers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/centers/centers"})
    end

    drop_table :refinery_centers

  end

end
