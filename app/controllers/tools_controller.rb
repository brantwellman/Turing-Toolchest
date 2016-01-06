class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    @tools = Tool.all
    session[:most_recent_tool_id] = Tool.last.id
  end

  def show
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "You have made a tool!"
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
    end
      redirect_to tools_path
  end

  def edit
  end

  def update
    @tool.update(tool_params)
    redirect_to @tool
  end

  def destroy
    @tool.destroy
    redirect_to tools_path
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
   params.require(:tool).permit(:name, :use)
  end

  # don't write tests for private methods

end
