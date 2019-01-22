class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    code = params[:code]
    begin
    resp = Faraday.post "https://github.com/login/oauth/access_token" do |req|
      req.body = { 'client_id': "7cff632c83e3831a11bd", 'client_secret': "7d5adeb9b122e4081de9d1009bfd96b82cdc65e3", 'code': code }
      req.headers['Accept'] = 'application/json'
    end
    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    redirect_to "/"
  end

end
