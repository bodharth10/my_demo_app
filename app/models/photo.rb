class Photo < ApplicationRecord
	 require 'csv'
	 require 'open-uri'

		 mount_uploader :file, PictureUploader
		 validates :title, presence: true
		 validates :file, presence: true
		 paginates_per  5

	 def self.import(file)
	 	CSV.foreach(file.path, headers: true) do |row|
	 		 photo_hash = {:title => row['title'] , :file => URI.parse(row['file']) }
	 		  Photo.create! (photo_hash)
	 	 end	
	 end
end
