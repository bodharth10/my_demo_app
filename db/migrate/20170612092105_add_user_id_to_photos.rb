class AddUserIdToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :user_id, :interger
  end
end
