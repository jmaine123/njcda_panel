class AddCourseIdToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :course_id, :integer
  end
end
