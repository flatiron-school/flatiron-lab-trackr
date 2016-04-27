class ChangeColumnUrlLabs < ActiveRecord::Migration[5.0]
  def change
    rename_column :labs, :url, :repo
  end
end
