class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :total_hours
      t.text :description
      t.integer :tuition
      t.string :location
      t.timestamps
    end
  end
end
