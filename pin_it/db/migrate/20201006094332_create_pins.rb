class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :title
      t.string :tag
      t.string :image_url

      t.timestamps
    end
  end
end
