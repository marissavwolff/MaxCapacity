class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about_us, :index ]

  def home
  end

  def show
  @project = Project.find(params[:id])
  @user = current_user
  end

  def about_us
  end
  
  def demo
  end

  def pricing
  end

  def contact_us
  end
end
