class Photo < ApplicationRecord
	 require 'csv'
	 require 'open-uri'

		 mount_uploader :file, PictureUploader
		 validates :title, presence: true
		 validates :file, presence: true
		 paginates_per  5

	 def self.import(file)
	 	CSV.foreach(file.path, headers: true) do |row|
	 		 #photo_hash = {:title => row['title'] , :file => URI.parse(row['file']) }
	 		    binding.pry
		      @imag = row['file']
		      p = Photo.new
		      p.remote_file_url = @imag
	 		    p.title = row['title']
	 		    p.save!
	 	 end	
	 end
end
