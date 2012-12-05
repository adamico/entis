class ChangeServiceHeadInRefineryCenters < ActiveRecord::Migration
  def change
    change_table :refinery_centers do |t|
      t.change :service_head, :text
    end
  end
end
