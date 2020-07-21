class AddInformationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :description, :text
    add_column :users, :last_name, :string
    rename_column :users, :name, :first_name
  end
end
