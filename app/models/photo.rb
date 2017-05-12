class Photo < ApplicationRecord
	 mount_uploader :file, PictureUploader
	 validates :title, :presence => true
	 validates :file, :presence => true
	 paginates_per  5
end
