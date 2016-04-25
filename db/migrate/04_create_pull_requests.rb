class CreatePullRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :pull_requests do |t|
      t.string :url
      t.references :lab, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.timestamps
    end
  end
end
