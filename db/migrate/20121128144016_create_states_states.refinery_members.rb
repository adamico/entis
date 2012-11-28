# This migration comes from refinery_members (originally 2)
class CreateStatesStates < ActiveRecord::Migration

  def up
    create_table :refinery_states do |t|
      t.string :name
      t.integer :position
      t.string :slug

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-states"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/states/states"})
    end

    drop_table :refinery_states

  end

end
