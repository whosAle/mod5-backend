# UserType = GraphQL::ObjectType.define do
class Types::UserType < Types::BaseObject
  description "A User"
  field :id, ID, null: false
  field :first_name, String, null: false
  field :last_name, String, null: false
  field :username, String, null: false
  field :avatar, String, null: false
  # fields should be queried in camel-case (this will be `truncatedPreview`)
  field :bio, String, null: true
  field :capital, Integer, null: false
  # Fields can return lists of other objects:
  field :comments, [Types::CommentType], null: true,
    # And fields can have their own descriptions:
    description: "This User's comments, or null if this User has comments disabled."
end
