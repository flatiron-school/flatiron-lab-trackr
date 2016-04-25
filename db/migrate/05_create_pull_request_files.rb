class CreatePullRequestFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :pull_request_files do |t|
      t.string :name
      t.string :content
      t.references :pull_requests, index: true, foreign_key: true
      t.timestamps
    end
  end
end
