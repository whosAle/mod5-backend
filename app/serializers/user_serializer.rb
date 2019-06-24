class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :bio, :avatar, :capital, :name

  has_many :projects

  def name
    "#{self.object.first_name} #{self.object.last_name}"
  end
end
