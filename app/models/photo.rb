class Photo < ActiveRecord::Base
 belongs_to :albums
 mount_uploader :image, Uploader
end
