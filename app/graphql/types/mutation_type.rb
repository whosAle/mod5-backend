class Types::MutationType < Types::BaseObject
  # TODO: remove me
  field :take_project, Types::ProjectType, null: false do
    description "Adds a doer to the selected project"
    argument :id, ID, required: true
    argument :doer_id, Integer, required: true
  end

  def take_project(args)
    project = Project.find(args[:id])
    project.update(doer_id: 1, inprogress: true)
    # project.update(doer_id: args[:doer_id], inprogress: true)
    # byebug
    project
  end
end
