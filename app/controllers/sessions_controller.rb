class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.activated?
    		# Log the user in and redirect to the user's show page.
    		log_in user
    		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    		# redirect_back_or user
        if user.memberships.count > 1
          
          redirect_to team_switcher_path
        elsif user.memberships.count == 1
          set_team(Team.find(user.memberships.first.team_id))
          redirect_to root_url
        else #user has no memberships
          redirect_to "http://www.google.com"
        end
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
  	else
		flash.now[:danger] = 'Invalid email/password combination'
		render 'new'
	end
  end

  def destroy
  	log_out if logged_in?
    forget_team
  	redirect_to root_url
  end
end