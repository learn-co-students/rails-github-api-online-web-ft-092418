class RepositoriesController < ApplicationController
  
  def index
    user = Faraday.get("https://api.github.com/user") do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
    end
    @user = JSON.parse(user.body)
    @username = @user["login"]

    repos = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
  end

  @repos = JSON.parse(repos.body)

end

end
