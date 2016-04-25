class CreateLabs < ActiveRecord::Migration[5.0]
  def change
    create_table :labs do |t|
      t.string :name
      t.string :url
      t.references :cohort, index: true, foreign_key: true
      t.timestamps
    end
  end
end
