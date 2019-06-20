class Api::V1::ProjectsController < ApplicationController
  def index
    render json: Project.all
  end

  def create
    @project = Project.create(project_params)
    if @project.valid?
      render json: @project, status: :created
    else
      render json: { error: 'failed to create project'}, status: :not_acceptable
    end
  end

  def update
    project = Project.find(params[:id])
    project.update(doer_id: params[:doer_id], inprogress: true)
    render json: project
  end

  def complete
    project = Project.find(params[:project_id])
    project.update(completed: true)
    Transaction.create(user_id: project[:doer_id], project_id: project[:id], amount: project[:base_capital])
    user = User.find(project[:doer_id])
    new_capital = user[:capital] + project[:base_capital]
    user.update(capital: new_capital)
    render json: project
  end


  private

  def project_params
    params.require(:project).permit(:user_id, :base_capital, :location, :title, :description, :category)
  end
end
