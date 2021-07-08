class AddEnableToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :enable, :boolean, default: false, null: false
  end
end
