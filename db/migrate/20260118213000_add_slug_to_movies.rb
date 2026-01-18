class AddSlugToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :slug, :string
  end
end
