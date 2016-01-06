class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @tools = @user.tools
    session[:most_recent_tool_id] = Tool.last.id
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @tool = Tool.new
  end

  def create
    @user = User.find(params[:user_id])
    @tool = @user.tools.new(tool_params)
    if @tool.save
      flash[:notice] = "You have made a tool!"
      redirect_to user_tools_path
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    @tool.update(tool_params)
    redirect_to @tool
  end

  def destroy
    @tool.destroy
    redirect_to user_tools_path
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
   params.require(:tool).permit(:name, :use, :user_id)
  end

  # don't write tests for private methods

end
