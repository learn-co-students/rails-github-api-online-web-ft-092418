class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    response = Faraday.post "https://github.com/login/oauth/access_token" do |req|
      req.body = {'client_id': ENV['GITHUB_CLIENT_ID'], 'client_secret': ENV['GITHUB_CLIENT_SECRET'] , 'code': params[:code]}
      req.headers['Accept'] =  'application/json'
    end
    session[:token] = JSON.parse(response.body)["access_token"]
  #   binding.pry

  response_user = Faraday.get "https://api.github.com/user" , {} , {
    Authorization: "token #{session[:token]}", Accept: 'application/json' }

  resp_json = JSON.parse(response_user.body)
  session[:username] = resp_json["login"]
#  binding.pry



#  binding.pry


    redirect_to '/'
  end
end
