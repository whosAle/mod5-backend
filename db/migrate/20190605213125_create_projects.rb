class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.integer :doer_id
      t.integer :base_capital
      t.string :location
      t.string :title
      t.string :description
      t.string :category
      t.boolean :completed
      t.boolean :inprogress

      t.timestamps
    end
  end
end
