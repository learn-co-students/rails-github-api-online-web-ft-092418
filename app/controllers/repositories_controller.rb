class RepositoriesController < ApplicationController

  def index
    begin
    resp = Faraday.get "https://api.github.com/user/repos" do |req|
       req.body = { 'client_id': "7cff632c83e3831a11bd",'client_secret': "7d5adeb9b122e4081de9d1009bfd96b82cdc65e3"}
       req.headers['Authorization'] =  "token " + session[:token]
    end
    body = JSON.parse(resp.body)
    @repos = listRepos(body)
    @user = body[0]["owner"]["login"]
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
  end

  def listRepos(data)
    return data.map{ |repo|
      repo["name"]
      }
  end

end
