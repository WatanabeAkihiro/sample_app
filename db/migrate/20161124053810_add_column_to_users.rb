class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduction, :text
    add_column :users, :location, :text
    add_column :users, :website, :text
  end
end
