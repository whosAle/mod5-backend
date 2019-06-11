class Api::V1::ProjectsController < ApplicationController
  def index
    render json: Project.all
  end

  def update
    project = Project.find(params[:id])
    byebug
    project.update(doer_id: params[:doer_id], inprogress: true)
    render json: project
  end

  def complete
    byebug
    project = Project.find(params[:project_id])
    project.update(completed: true)
    Transaction.create(user_id: project[:doer_id], project_id: project[:id], amount: project[:base_capital])
    user = User.find(project[:doer_id])
    byebug
    new_capital = user[:capital] + project[:base_capital]
    user.update(capital: new_capital)
    byebug
    render json: project
  end
end
