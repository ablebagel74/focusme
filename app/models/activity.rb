class Activity < ActiveRecord::Base
  attr_accessible :task, :times, :username

  validates :task, :presence => true
  validates :times, :presence => true
  validates :username, :presence => true

end
