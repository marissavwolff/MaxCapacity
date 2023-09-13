class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :destroy, :update]

  def show
    @projects = @member.projects
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
  end

  def edit
  end

  # def update
  #   @member = Member.find(params[:id])
  #   @member.update(member_params)
  # end

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to member_path(@member), notice:"You have successfully created #{@member.name}'s profile"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member), notice:"You have successfully updated #{@member.name}'s profile"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @member.project_members.destroy_all
    @member.destroy
    redirect_to projects_path, status: :see_other
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :company, :title, :email, :line_manager, :capacity, :photo, project_ids: [])
  end
end
