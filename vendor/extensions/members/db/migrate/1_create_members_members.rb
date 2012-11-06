class CreateMembersMembers < ActiveRecord::Migration

  def up
    create_table :refinery_members do |t|
      t.string :name
      t.string :service_name
      t.string :service_head
      t.text :address
      t.text :phone
      t.string :fax
      t.text :email
      t.string :website
      t.string :creation
      t.text :accept_calls_from
      t.text :hours
      t.text :affiliation
      t.text :staff
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-members"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/members/members"})
    end

    drop_table :refinery_members

  end

end
