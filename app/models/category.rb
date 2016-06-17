class Category < ActiveRecord::Base

  has_many :disasters, :dependent => :destroy
end
