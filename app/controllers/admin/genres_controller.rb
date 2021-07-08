class Admin::GenresController < ApplicationController


  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def index
    @genres = Genre.all
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params_update)
    redirect_to admin_genres_path
  end

  def destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :enable)
  end

  def genre_params_update
    params.require(:genre).permit(:enable)
  end
end
