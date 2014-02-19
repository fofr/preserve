class Activity < ActiveRecord::Base

  def resolve
    self.activity_class.constantize.find(self.activity_id)
  end

end
