class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end
  
  skip_before_action :authenticate_user!

  def show

  end
end
