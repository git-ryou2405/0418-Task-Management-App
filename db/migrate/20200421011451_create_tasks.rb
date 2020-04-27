class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :taskname
      t.string :detailed
      t.datetime :created_at
      t.datetime :update_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
