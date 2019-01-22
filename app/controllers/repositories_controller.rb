class RepositoriesController < ApplicationController
  
  def index
    resp = Faraday.get"https://api.github.com/user/repos", {}, {
      Authorization: "token #{session[:token]}"
    }
    @results = JSON.parse(resp.body)

    response = Faraday.get"https://api.github.com/user", {}, {
      Authorization: "token #{session[:token]}"
    }
    b = JSON.parse(response.body)
    session[:username] = b["login"]
  end

end
