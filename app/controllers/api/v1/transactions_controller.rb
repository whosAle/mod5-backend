class Api::V1::TransactionsController < ApplicationController

  def contribute
    user = User.find(params[:user_id])
    project = Project.find(params[:project_id])

    amount = params[:amount].to_i

    if user.capital < amount
      render json: {error: "insufficient capital"}, status: :not_acceptable
    else
      Transaction.create(user_id: user.id, project_id: params[:project_id], amount: amount, purpose: "contribution")

      user.update(capital: user.capital - amount)
      project.update(total_capital: project.total_capital + amount)

      render json: {user: user, project: project}, status: :created
    end

  end
end
