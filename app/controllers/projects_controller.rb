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

    # START ASANA IMPLEMENTATION

    @project = Project.find(params[:id])
    asannn = '1/1205422980318130:72fecd4355e1f6dfe789e2b414108a98'

    require 'asana'
    client = Asana::Client.new do |c|
      c.authentication :access_token, asannn
    end
    workspaces = client.workspaces.get_workspaces(options: { pretty: true })
    workspace_id = workspaces.to_a[0].gid
    @goals = client.goals.get_goals(workspace: workspace_id, options: { pretty: true })
    # first_goal = goals.to_a[0]
    @result = client.tasks.get_tasks_for_project(project_gid: '1205422662236262', options: { pretty: true, fields: ["name", "due_on", "completed", "assignee.name", "start_on", "tags.name", "notes", "projects.name"]  })
    @result = @result.elements

    # START JIRA IMPLEMENTATION
    require 'jira-ruby'

    # NOTE: the token should not be encoded
    api_token = 'ATATT3xFfGF0kZ0_ZtslXAKkZbtuwZR9EZaALv8kSeB6qHasDHsWnvmWr_Xp8Kl7MBn3c43Q64BOUoZoQTT1JP7_SWj0RrXHuY-UrED8UxuY9l_Hy1IAkcBTBjhCkeW0oN17lgrByUUVpY42RyFWrnNPCr8DLMk1jj5r2NciGuqXNFy5fjEsKC4=E02B7DC7'

    options = {
      :site               => 'https://testsite953.atlassian.net/',
      :context_path       => '',
      :username           => 'bijans@gmail.com',
      :password           => api_token,
      :auth_type          => :basic
    }

    client = JIRA::Client.new(options)

    @jira = client.Issue.all

    # project.issues.each do |issue|
    #   puts "#{issue.id} - #{issue.summary}"
    # end

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

    @asana_hours = 0
    @result.each do |task|
      task.tags.each do |tag|
        @asana_hours += tag.name.to_i
      end
    end

    @project.asana_hours = @asana_hours

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
    if member_ids.present?
      member_ids.each do |id|
        member = Member.find(id)
        ProjectMember.create(member: member, project: @project) # When @project saves, this will be created
      end
    end
  end

  def add_tools
  end

  def project_params
    params.require(:project).permit(:name, :project_manager, :asana_token, :deadline, :capacity, :asana_hours, :description, priority: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
