class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :courses
      t.string :cohort
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.string :education

      t.timestamps
    end
  end
end
