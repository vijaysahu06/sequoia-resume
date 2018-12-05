class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :university
      t.string :qualification
      t.integer :year
      t.integer :resume_id

      t.timestamps
    end
  end
end
