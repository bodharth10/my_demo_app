class Photo < ApplicationRecord
	 require 'csv'

		 mount_uploader :file, PictureUploader
		 validates :title, :presence => true
		 #validates :file, :presence => true
		 paginates_per  5

	 def self.import(file)
	 	CSV.foreach(file.path, headers: true) do |row|
	 		 byebug
	 		 Photo.create! row.to_hash
	 	 end	
	 end
end
