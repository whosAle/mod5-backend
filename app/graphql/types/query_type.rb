# QueryType = GraphQL::ObjectType.define do
class Types::QueryType < Types::BaseObject
  graphql_name "Query"
  description "The query root of this schema"

####### USER MODEL QUERIES ############
  # First describe the field signature:
  field :user, Types::UserType, null: true do
    description "Find a user by ID"
    argument :id, ID, required: true
  end

  field :project, Types::ProjectType, null: true do
    description "Find a project by ID"
    argument :id, ID, required: true
  end

  field :projects, Types::ProjectType, null: true do
    description "Find a project by ID"
  end

  # Then provide an implementation:
  def user(body)
    User.find(body[:id])
  end

  def project(body)
    Project.find(body[:id])
  end

  def projects
    byebug
    Project.all
  end



  ####### TRANSACTION MODEL QUERIES ############



  ####### PROJECT MODEL QUERIES ############
end

# QueryType = GraphQL::ObjectType.define do
#   name "Query"
#   description "The query root for this schema"
#
#   field :user do
#     type UserType
#     argument :id, !types.ID
#     resolve -> (obj, args, ctx) {
#       User.find(args[:id])
#     }
#   end
#
#   field :actor do
#     type ActorType
#     argument :id, !types.ID
#     resolve -> (obj, args, ctx) {
#       Actor.find(args[:id])
#     }
#   end
# end
