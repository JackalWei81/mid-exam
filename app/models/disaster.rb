class Disaster < ActiveRecord::Base
  validates_presence_of :name, :description

  belongs_to :category
  belongs_to :user


  has_many :comments, :dependent => :destroy

  delegate :name, :to=> :category, :prefix => true, :allow_nil =>true

end
