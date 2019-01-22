class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private

  def authenticate_user
    unless logged_in?
      client_id = "7cff632c83e3831a11bd"
      github_url = "https://github.com/login/oauth/authorize?client_id=#{client_id}"
      redirect_to github_url
    end
  end

  def logged_in?
    !!session[:token]
  end
end
