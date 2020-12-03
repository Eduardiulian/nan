class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_auth, except: [:new, :create]
  # :edit, :destroy, :show, :index

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_auth
    current_user
    msg = @current_user ? "authed" : "not_authed"
    logger.info("~log: " + msg)
    redirect_to login_path unless @current_user
  end
end