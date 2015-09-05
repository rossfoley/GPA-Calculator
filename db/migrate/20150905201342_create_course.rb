class CreateCourse < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :user
      t.string :name
      t.string :grade
      t.string :level
      t.decimal :credit, :precision => 4, :scale => 3

      t.timestamps
    end
    add_index :courses, :user_id
  end
end
