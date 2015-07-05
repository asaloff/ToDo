class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :tasks, :slug, :string
  end
end
