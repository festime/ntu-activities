class Activity < ActiveRecord::Base
  default_scope ->{ order("date ASC") }
  validates_presence_of :name, :date
end
