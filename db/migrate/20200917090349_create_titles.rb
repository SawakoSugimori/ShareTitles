class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.references :picture, foreign_key: true


      t.timestamps
    end
  end
end
