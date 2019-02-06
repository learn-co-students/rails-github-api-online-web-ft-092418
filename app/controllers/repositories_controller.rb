class RepositoriesController < ApplicationController
  
  def index
    # get all my repos here
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
      req.headers['Accept'] = 'application/json'
    end
    @repos = JSON.parse(resp.body)
    binding.pry
  end

  def create 
    resp = Faraday.post("https://api.github.com/user/repos") do |req| 
      req.body = { 'name': params[:name] }
      req.headers['Accept'] = 'application/json'
      req.headers['Authorization'] = "token #{session[:token]}"
    end
    binding.pry
    redirect_to root_path
  end

end
