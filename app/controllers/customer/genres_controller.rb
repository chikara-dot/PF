class Customer::GenresController < ApplicationController
  def index
   @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
      @genre = Genre.new(genre_params)
    if
      @genre.save
      flash[:notice] = "追加して欲しいジャンルを送信しました"
      redirect_to customer_genres_path
    else
      flash.now[:notice] = "追加して欲しいジャンルを入力してください"
      render :new
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
