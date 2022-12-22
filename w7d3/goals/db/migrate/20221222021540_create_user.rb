class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, index: true
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
