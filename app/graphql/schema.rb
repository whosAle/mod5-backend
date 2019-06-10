
# Schema = GraphQL::Schema.define do
#   query QueryType
# end

class Schema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
