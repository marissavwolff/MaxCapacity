class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    add_members
    add_tools
    if @project.save
      redirect_to project_path(@project), notice: "Project successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    add_members
    redirect_to project_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path, status: :see_other
  end

  private

  def add_members
    member_ids = params[:project][:members]
    member_ids.each do |id|
      member = Member.find(id)
      ProjectMember.create(member: member, project: @project) # When @project saves, this will be created
    end
  end

  def add_tools
  end

  def project_params
    params.require(:project).permit(:name, :deadline, :capacity, :description, priority: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
