class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :start_date
      t.string :end_date
      t.boolean :is_current
      t.text :description
      t.integer :resume_id

      t.timestamps
    end
  end
end
