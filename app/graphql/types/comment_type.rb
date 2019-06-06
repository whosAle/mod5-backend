# app/graphql/types/comment_type.rb
class Types::CommentType < Types::BaseObject
  field :id, ID, null: false
  field :post, PostType, null: false
end
