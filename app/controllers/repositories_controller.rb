class RepositoriesController < ApplicationController

  def index

    @resp = Faraday.get "https://api.github.com/user" do |req|
      req.params["access_token"] = session[:token]
    end

    @resp2 = Faraday.get "https://api.github.com/user/repos" do |req|
      req.headers = {Authorization: "token #{session[:token]}"}
    end

    body = JSON.parse(@resp.body)
    @name = body["login"]

    body2 = JSON.parse(@resp2.body)

    @repoName = body2
  end

end
