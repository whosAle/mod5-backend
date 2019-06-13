class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :amount
      t.string :purpose

      t.timestamps
    end
  end
end
