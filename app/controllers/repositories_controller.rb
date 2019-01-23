class RepositoriesController < ApplicationController

  def index
  #  binding.pry
  response = Faraday.get "https://api.github.com/user/repos" , {} , {
    Authorization: "token #{session[:token]}"
  }
  @results = JSON.parse(response.body)
   #binding.pry
  end

end
