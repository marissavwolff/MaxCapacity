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
    @members = @project.members
# <<<<<<< new-day
# =======
  #   require 'asana'
  #   client = Asana::Client.new do |c|
  #     c.authentication :access_token, '1/1205422980318130:72fecd4355e1f6dfe789e2b414108a98'
  #   end
  #   workspaces = client.workspaces.get_workspaces(options: { pretty: true })
  #   workspace_id = workspaces.to_a[0].gid
  #   @goals = client.goals.get_goals(workspace: workspace_id, options: { pretty: true })
  #   # first_goal = goals.to_a[0]
  #   @result = client.tasks.get_tasks_for_project(project_gid: '1205422662236262', options: { pretty: true, fields: ["name", "due_on", "completed", "assignee.name", "start_on", "tags.name", "notes"] })
  #   @result = @result.elements

  # end

#   def new_tool
#     @project = Project.find(params[:project_id])

#   end

#   def edit_tool
# >>>>>>> master
    @project = Project.find(params[:id])
    asannn = '1/1205422980318130:72fecd4355e1f6dfe789e2b414108a98'

    require 'asana'
    client = Asana::Client.new do |c|
        c.authentication :access_token, asannn
    end
    workspaces = client.workspaces.get_workspaces(options: {pretty: true})
    workspace_id = workspaces.to_a[0].gid
    @goals = client.goals.get_goals(workspace: workspace_id, options: {pretty: true})
    # first_goal = goals.to_a[0]
    @result = client.tasks.get_tasks_for_project(project_gid: '1205422662236262', options: {pretty: true, fields: ["name", "due_on", "completed", "assignee.name", "start_on", "tags.name", "notes", "projects.name"]})
    @result = @result.elements

    # @task_name = @result.to_a[0].name
    # @task_due_on = @result.to_a[0].due_on
    # @task_completed = @result.to_a[0].completed
    # @task_assignee_name = @result.to_a[0].assignee[:name]
    # @task_start_on = @result.to_a[0].start_on
    # @task_tags = @result.to_a[0].tags # collection
    # @task_notes = @result.to_a[0].notes
  end

  def new_tool
    @project = Project.find(params[:project_id])

  end

  def edit_tool
    # @project = Project.find(params[:id])
    # @project.update(project)
    # require 'asana'
    # client = Asana::Client.new do |c|
    #     c.authentication :access_token, '1/1205422980318130:72fecd4355e1f6dfe789e2b414108a98'
    # end
    # workspaces = client.workspaces.get_workspaces(options: {pretty: true})
    # workspace_id = workspaces.to_a[0].gid
    # @goals = client.goals.get_goals(workspace: workspace_id, options: {pretty: true})
    # # first_goal = goals.to_a[0]


    # @result = client.tasks.get_tasks_for_project(project_gid: '1205422662236262', options: {pretty: true})

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
    params.require(:project).permit(:name, :project_manager, :asana_token, :deadline, :capacity, :description, priority: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
