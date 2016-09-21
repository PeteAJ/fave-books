class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
              t.string :name
              t.string :favorite_genre
              t.string :email
              t.string :password_digest
      
      t.timestamps null: false
    end
  end
end
