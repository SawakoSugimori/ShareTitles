class RemoveTitleFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pictures, :title
  end
end
