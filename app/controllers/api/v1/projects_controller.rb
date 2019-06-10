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
end
