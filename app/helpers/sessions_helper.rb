# frozen_string_literal: true

# This is the sessions helper
module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
  end
end
