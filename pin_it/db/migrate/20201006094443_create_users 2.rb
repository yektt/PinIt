class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name_surname
      t.string :password
      t.string :image_url

      t.timestamps
    end
  end
end
