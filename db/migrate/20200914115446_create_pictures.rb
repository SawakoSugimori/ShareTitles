class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :user
      t.references :title

      t.timestamps
    end
  end
end
