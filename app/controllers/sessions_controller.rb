class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.post("https://github.com/login/oauth/access_token") do |req|
      req.body = { 'client_id': 'cf1fcce0b0cfbefa8c34', 'client_secret': 'b3b8dcbc826962f500126772de9d7d0c66607b55', 'code': params[:code] }
      req.headers['Accept'] = 'application/json'
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
