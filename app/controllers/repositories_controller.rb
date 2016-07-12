class RepositoriesController < ApplicationController
  def index
    github_repos = GithubService.new({"access_token" => session[:token]})
    @repos_array = github_repos.get_repos
  end

  def create
    repo = GithubService.new({"access_token" => session[:token]})
    repo.create_repo(params[:name])
    redirect_to '/'
  end
end
