class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    userr = Userr.find_by(email: params[:session][:email].downcase)
    if userr && userr.authenticate(params[:session][:password])
      log_in userr
      redirect_to userr
      # Log the user in and redirect to the user's show page.
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      # Create an error message.
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
