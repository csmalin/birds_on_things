class Album < ActiveRecord::Base
  belongs_to :users
  has_many :photos
end
