class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :bio, :avatar, :capital, :name

  def name
    "#{self.object.first_name} #{self.object.last_name}"
  end
end
