class ProjectsController < ApplicationController
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
end
