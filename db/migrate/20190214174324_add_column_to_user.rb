class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :image_id, :string
    add_column :users, :occupation, :string, default: "Artist"
    add_column :users, :introduction, :text, default: :occupation
    add_column :users, :personal_link, :string
  end
end
