class Types::PostType < Types::BaseObject
  description "A blog User"
  field :id, ID, null: false
  field :first_name, String, null: false
  # fields should be queried in camel-case (this will be `truncatedPreview`)
  field :bio, String, null: false
  # Fields can return lists of other objects:
  field :comments, [Types::CommentType], null: true,
    # And fields can have their own descriptions:
    description: "This User's comments, or null if this User has comments disabled."
end
