class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_students
      t.integer :days_per_week
      t.integer :course_id
      t.timestamps
    end
  end
end
