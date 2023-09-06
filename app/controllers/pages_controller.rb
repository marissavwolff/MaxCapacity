class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about_us, :index ]

  def home
  end

  def show
  @project = Project.find(params[:id])
  @user = current_user
  end
end
