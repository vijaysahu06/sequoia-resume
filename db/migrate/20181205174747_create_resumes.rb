class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :email
      t.bigint :phone
      t.string :reffered_by
      t.string :what_do_you_like
      t.boolean :willing_to_relocate
      t.string :preferred_location
      t.integer :experience_in_years
      t.integer :experience_in_months
      t.string :level, array: true, default: []
      t.string :industry, array: true, default: []
      t.string :additional_industry, array: true, default: []
      t.string :function, array: true, default: []
      t.string :linkedin_link
      t.string :resume
      t.boolean :approved

      t.timestamps
    end
  end
end
