class RepositoriesController < ApplicationController

  def index
    hash = {'access_token' => session[:token]}
    gh = GithubService.new(hash)
    @repos_array = gh.get_repos

  end

  def create
    hash = {'access_token' => session[:token]}
    gh = GithubService.new(hash)
    gh.create_repo(params[:name])
    redirect_to '/'
  end
end
