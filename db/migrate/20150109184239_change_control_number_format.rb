class ChangeControlNumberFormat < ActiveRecord::Migration
  def change
    change_column :grade_submissions, :stone_control_number, :string
  end
end
