class CreateStudentGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :student_groups do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
