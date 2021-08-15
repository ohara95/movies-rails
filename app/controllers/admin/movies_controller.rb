class Admin::MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @schedule = Schedule.find_by(movie_id: @movie.id)
  end

  def new
    @movie = Movie.new(flash[:movie])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])

    if movie.update(movies_params)
      redirect_to admin_movies_path
    else
      redirect_to edit_admin_movie_path, flash: {
        movie: movie,
        error_messages: movie.errors.full_messages
      }
    end
  end
  
  def create
    movie = Movie.new(movies_params)
    if movie.save
      redirect_to admin_movies_path
    else
      redirect_to new_admin_movie_path, flash: {
        movie: movie,
        error_messages: movie.errors.full_messages
      }
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to admin_movies_path ,flash: { notice: "削除されました" }
  end

  private
  def movies_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end
  
end
