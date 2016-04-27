class RenameColumnPullRequetsOnPullRequestFiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :pull_request_files, :pull_requests_id, :pull_request_id
  end
end
