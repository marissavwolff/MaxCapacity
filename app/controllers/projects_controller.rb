class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  skip_before_action :authenticate_user!

  def show
    @project = Project.find(params[:id])
    @members = @project.members
    # require 'asana'

    # client = Asana::Client.new do |c|
    #     c.authentication :access_token, '1/1205422980318130:72fecd4355e1f6dfe789e2b414108a98'
    # end
    # @goals = client.goals.get_goal

    url = 'https://app.asana.com/api/1.0/workspaces'
    user_serialized = URI.open(url).read
    @user = JSON.parse(user_serialized)
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
