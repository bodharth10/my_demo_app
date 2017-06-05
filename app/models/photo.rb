class Photo < ApplicationRecord
  require 'csv'
  require 'open-uri'
  # validate :avatar_size_validation
   mount_uploader :file, PictureUploader
   validates :title, presence: true
   validates :file, presence: true
   paginates_per  6

  def self.import(file)
   CSV.foreach(file.path, headers: true) do |row|
    @imag = row['file']
     p = Photo.new
       p.remote_file_url = @imag
       p.title = row['title']
       p.save!
   end 
 end

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 5MB" if photo.size > 5.megabytes
  end
end
