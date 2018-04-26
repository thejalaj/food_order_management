module SessionsHelper
  def log_in(userr)
    session[:userr_id] = userr.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Userr.find_by(id: session[:userr_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:userr_id)
    @current_user = nil
  end

end
