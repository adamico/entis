class ChangeWebsiteFieldInRefineryMembers < ActiveRecord::Migration
  def change
    change_table "refinery_members" do |t|
      t.change(:website, :text)
    end
  end
end
