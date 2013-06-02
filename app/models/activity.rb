class Activity < ActiveRecord::Base
  attr_accessible :task, :times

  validates :task, :presence => true
  validates :times, :presence => true

end
