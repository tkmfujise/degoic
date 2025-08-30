class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false, default: ''

      t.timestamps
    end

    add_index :projects, :name, unique: true
  end
end
