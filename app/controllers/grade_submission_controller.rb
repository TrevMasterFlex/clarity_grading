class GradeSubmissionController < ApplicationController
  def create
    @error_found = FALSE
    @grade_submission = GradeSubmission.new(grade_submission_params)
	if @error_found
	  redirect_to :controller => 'welcome', :action => 'index', :user1_email => params["user1_email"], :user2_email => params["user2_email"], :message => "Grade submission NOT saved! You have incomplete, incorrect, or too many selections."
	else
      @grade_submission.save
	  redirect_to :controller => 'welcome', :action => 'index', :user1_email => params["user1_email"], :user2_email => params["user2_email"], :message => "Grade submission saved!"
	end
  end
  
  private

  def first_two_grades(grade_set)
    grade1 = nil
    grade2 = nil
    grades_found = 0
    for grade in grade_set
      if params[grade] == "on"
        if grades_found == 0
          grade1 = grade
        elsif grades_found == 1
          grade2 = grade
        end
        grades_found = grades_found + 1
      end
    end
    if grades_found > 2
      @error_found = TRUE
    end
    return [grade1, grade2]
  end
  
  def grade_submission_params
    user1_email = params["user1_email"]
	user2_email = params["user2_email"]
	stone_control_number = params["stone_control_number"]
	clarity_grades = ["fl", "if", "vvs1", "vvs2", "vs1", "vs2", "si1", "si2", "i1", "i2", "i3"]
	polish_grades = ["polish_excellent", "polish_very_good", "polish_good", "polish_fair", "polish_poor"]
	symmetry_validation_grades = ["symmetry_validation_excellent", "symmetry_validation_very_good", "symmetry_validation_good", "symmetry_validation_fair", "symmetry_validation_poor"]
	symmetry_given_grades = ["symmetry_given_excellent", "symmetry_given_very_good", "symmetry_given_good", "symmetry_given_fair", "symmetry_given_poor"]
	clarity_grade_1, clarity_grade_2 = first_two_grades(clarity_grades)
	polish_grade_1, polish_grade_2 = first_two_grades(polish_grades)
	symmetry_validation_1, symmetry_validation_2 = first_two_grades(symmetry_validation_grades)
	symmetry_given_1, symmetry_given_2 = first_two_grades(symmetry_given_grades)
	if (clarity_grade_1.nil? or polish_grade_1.nil? or symmetry_validation_1.nil? or symmetry_given_1.nil? or !symmetry_given_2.nil? or user1_email.empty? or user2_email.empty? or stone_control_number.empty? or !(stone_control_number !~ /\D/))
      @error_found = TRUE
    else
		clarity_agreement = clarity_grade_2.nil?
		polish_agreement = polish_grade_2.nil?
		grader_symmetry_agreement = symmetry_validation_2.nil?
		overall_symmetry_agreement = (grader_symmetry_agreement and symmetry_validation_1.gsub("symmetry_validation_", "") == symmetry_given_1.gsub("symmetry_given_", ""))
		overall_agreement = (clarity_agreement and polish_agreement and overall_symmetry_agreement)
	end
	return {"user1_email"=> user1_email, "user2_email"=> user2_email, "stone_control_number"=> stone_control_number, "clarity_grade_1"=> clarity_grade_1, "clarity_grade_2"=> clarity_grade_2, "polish_grade_1"=> polish_grade_1, "polish_grade_2"=> polish_grade_2, "symmetry_validation_1"=> symmetry_validation_1, "symmetry_validation_2"=> symmetry_validation_2, "symmetry_given"=> symmetry_given_1, "clarity_agreement"=> clarity_agreement, "polish_agreement"=> polish_agreement, "grader_symmetry_agreement"=> grader_symmetry_agreement, "overall_symmetry_agreement"=> overall_symmetry_agreement, "overall_agreement"=> overall_agreement}
  end
  
end