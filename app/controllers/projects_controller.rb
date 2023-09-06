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

    client = Asana::Client.new do |c|
        c.authentication :access_token, '1/1205422980318130:72fecd4355e1f6dfe789e2b414108a98'
    end
    workspaces = client.workspaces.get_workspaces(options: {pretty: true})
    workspace_id = workspaces.to_a[0].gid
    @goals = client.goals.get_goals(workspace: workspace_id, options: {pretty: true})
    # first_goal = goals.to_a[0]


  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "Project successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :capacity, :description, :tool_system, :members, :priority)
  end
end
