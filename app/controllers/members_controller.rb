class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :destroy, :update]

  def show
  end

  def index
    @members = Members.all
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

private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :company, :title, :email, :line_manager, :capacity, :photo)
  end
end
