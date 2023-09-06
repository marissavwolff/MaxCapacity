class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:filter].present?
      if params[:filter] == 'my-projects'
        @projects = current_user.projects
      elsif params[:filter] == 'completed-projects'
        @projects = Project.where('completed = true')
      end
    else
      @projects = Project.all
    end
  end

  def days_to_deadline
    @days = Project.deadline - Date.today
  end

  skip_before_action :authenticate_user!

  def show

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
