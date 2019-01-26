class RepositoriesController < ApplicationController
  
  def index
    user_resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['oauth_token'] = session[:token]
      req.headers['Accept'] = 'application/json'
    end
    @user = JSON.parse(user_resp.body)

    repo_resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.params['oauth_token'] = session[:token]
      req.headers['Accept'] = 'application/json'
    end
    @repos = JSON.parse(repo_resp.body)
  end

end
