class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end
  
  skip_before_action :authenticate_user!

  def show
    @project = Project.find(params[:id])
    @members = @project.members
    require 'asana'
    personal_access_token = '0/123456789....'
    @client = Asana::Client.new do |c|
      c.authentication :access_token, 'personal_access_token'
    end

    @client.workspaces.get_workspaces.first
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_path, notice: "Project successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :capacity, :description, :tool_system, :members)
  end
end
