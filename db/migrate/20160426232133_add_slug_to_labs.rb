class AddSlugToLabs < ActiveRecord::Migration[5.0]
  def change
    add_column :labs, :slug, :string
    add_column :labs, :deploy_date, :datetime
  end
end
