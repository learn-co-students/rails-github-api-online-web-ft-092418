class RepositoriesController < ApplicationController
  
  def index
    user_resp = Faraday.get("https://api.github.com/user") do |req|
      req.headers['Authorization'] = "token #{session[:token]}"

      # req.params['oauth_token'] = session[:token]
      # req.headers['Accept'] = 'application/json'
    end
    @user = JSON.parse(user_resp.body)

    repo_resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
      # req.params['oauth_token'] = session[:token]
      # req.headers['Accept'] = 'application/json'
    end
    response = JSON.parse(repo_resp.body)
    # binding.pry
    # @user = response.first['owner']['login']
    @repos = response.map{|r| r['name'] }
  end

end
