class Disaster < ActiveRecord::Base
  validates_presence_of :name, :description

  belongs_to :category

  delegate :name, :to=> :category, :prefix => true, :allow_nil =>true

end
