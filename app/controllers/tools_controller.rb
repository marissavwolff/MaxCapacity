class ToolsController < ApplicationController
  def new
    @member = Member.find(params[:member_id])
  end

  def edit
    @member = Member.find(params[:id])
    @member.update(member_params)
  end

  private

  def member_params
    params.require(:member).permit(:asanatoken)
  end

end
