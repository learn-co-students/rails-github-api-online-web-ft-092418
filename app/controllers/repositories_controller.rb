class RepositoriesController < ApplicationController
  
  def index
    user = Faraday.get("https://api.github.com/user") do |req|
      req.headers['Authorization'] = 'token ' + session[:token]
      req.headers['Accept'] = 'application/json'
    end
    repos = Faraday.get 'https://api.github.com/user/repos' do |req|
      req.headers['Authorization'] = 'token ' + session[:token]
      req.headers['Accept'] = 'application/json'
    end
    @user_data = JSON.parse(user.body)
    @repo_data = JSON.parse(repos.body)
  end
end
