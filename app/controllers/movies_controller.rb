class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params[:search], params[:is_showing])
  end

  def show
    @movie = Movie.find(params[:id])
    @schedule = Schedule.find_by(movie_id: @movie.id)

    @start_time = Schedule.where(movie_id: params[:id]).pluck(:start_time, :id)
  end


  def setup_resevation
    movie_id = params[:movie_id]
    schedule_id = params[:schedule_id]
    start_time = params[:start_time]
    redirect_to movie_schedule_sheets_path(movie_id: movie_id, schedule_id: schedule_id, start_time: start_time)
  end

end
