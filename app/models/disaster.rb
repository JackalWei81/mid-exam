class Disaster < ActiveRecord::Base
  validates_presence_of :name, :description

  belongs_to :category

  has_many :comments

  delegate :name, :to=> :category, :prefix => true, :allow_nil =>true

end
