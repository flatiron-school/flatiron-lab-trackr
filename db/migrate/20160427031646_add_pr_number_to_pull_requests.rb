class AddPrNumberToPullRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :pull_requests, :pr_number, :string
  end
end
