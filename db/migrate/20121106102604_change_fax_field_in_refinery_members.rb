class ChangeFaxFieldInRefineryMembers < ActiveRecord::Migration
  def change
    change_table "refinery_members" do |t|
      t.change(:fax, :text)
      t.change(:creation, :text)
    end
  end
end
