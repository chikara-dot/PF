class AddAddToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :add, :string
  end
end
