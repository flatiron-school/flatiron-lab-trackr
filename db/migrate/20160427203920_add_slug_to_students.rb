class AddSlugToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :slug, :string
  end
end
