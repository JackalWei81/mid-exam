class Comment < ActiveRecord::Base

  validates_presence_of :name

  belongs_to :disaster

end
