class RemoveAddFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :add, :string
  end
end
