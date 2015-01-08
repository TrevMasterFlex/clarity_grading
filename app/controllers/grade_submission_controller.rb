class GradeSubmissionController < ApplicationController
  def create
	redirect_to :controller => 'welcome', :action => 'index', :user1_email => params["user1_email"], :user2_email => params["user2_email"]
    o = Object.new(:foo => 'bar')
    o.save
  
  end
end
