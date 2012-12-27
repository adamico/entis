class SetObserverStatusForCenters < ActiveRecord::Migration
  def up
    centers = Refinery::Centers::Center.where(observer: nil)
    if centers.any?
      say "setting observer boolean attribute to false for center with a nil value"
      centers.each do |center|
        if center.observer.nil?
          say "updating center : #{center.name}"
          center.update_attribute(:observer, false)
        end
      end
    else
      say "no centers with observer boolean attribute with a nil value"
    end
  end

  def down
    centers = Refinery::Centers::Center.where(observer: false)
    if centers.any?
      say "reverting observer boolean attribute to nil for center with a false value"
      centers.each do |center|
        say "updating center : #{center.name}"
        center.update_attribute(:observer, nil)
      end
    else
      say "no centers with observer boolean attribute with a false value"
    end
  end
end
