class RemoveImgFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :img, :string
  end
end
