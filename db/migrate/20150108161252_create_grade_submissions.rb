class CreateGradeSubmissions < ActiveRecord::Migration
  def change
    create_table :grade_submissions do |t|
      t.string :user1_email
      t.string :user2_email
      t.float :stone_control_number
      t.string :clarity_grade_1
      t.string :clarity_grade_2
      t.string :polish_grade_1
      t.string :polish_grade_2
      t.string :symmetry_validation_1
      t.string :symmetry_validation_2
	  t.string :symmetry_given
      t.boolean :clarity_agreement
      t.boolean :polish_agreement
      t.boolean :grader_symmetry_agreement
	  t.boolean :overall_symmetry_agreement
      t.boolean :overall_agreement

      t.timestamps
    end
  end
end
