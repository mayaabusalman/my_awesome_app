# frozen_string_literal: true

# This class is for session controller
class SessionsController < ApplicationController
  before_action :check_logged_in, except: [:destroy]

  def new end

  def create
    user = User.find_by_email(params[:session][:email])

    if user&.authenticate(params[:session][:password])
      login(user)
      redirect_to root_path
    else
      @alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    log_out
    @alert = 'Logged out'
    render :new
  end

  def check_logged_in
    redirect_to root_path if logged_in?
  end
end
