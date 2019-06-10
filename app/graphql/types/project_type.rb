# UserType = GraphQL::ObjectType.define do
class Types::ProjectType < Types::BaseObject
  description "A Project"
  field :id, ID, null: false
  field :base_capital, Integer, null: false
  field :user_id, Integer, null: false
  field :location, String, null: false
  field :description, String, null: false
  field :category, String, null: false
  field :completed, Boolean, null: false
  field :inprogress, Boolean, null: false

  field :user, [Types::UserType], null: true,
    # And fields can have their own descriptions:
    description: "The Project's user who."
end
