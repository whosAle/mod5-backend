class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :doer_id, :user_id, :base_capital, :total_capital, :location, :title, :description, :category, :completed, :inprogress

  belongs_to :user

  def total_capital
    self.object.base_capital + self.object.total_capital
  end
end
