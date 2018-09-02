class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.string :password_digest
      t.string :auth_code
      t.boolean :admin
      t.boolean :instructor
      t.boolean :student

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
