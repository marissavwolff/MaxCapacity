class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update]

  def index
    @projects = Project.all
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
      redirect_to projects_path, notice: "Project successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to projects_path
  end

  private

  def add_members
    member_ids = params[:project][:members]
    member_ids.each do |id|
      member = Member.find(id)
      ProjectMember.new(member: member, project: @project) # When @project saves, this will be created
    end
  end

  def method_name
    
  end

  def project_params
    params.require(:project).permit(:name, :deadline, :capacity, :description, priority: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
