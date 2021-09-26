class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params[:search], params[:is_showing])
  end

  def show
    @movie = Movie.find(params[:id])
    @schedule =  Schedule.where(movie_id: @movie.id)
    start_time = @schedule.map { |i| i.start_time }
    end_time = @schedule.map { |i| i.end_time }
    @schedule_hash = { start_time: start_time, end_time: end_time }

    time = Schedule.where(movie_id: params[:id]).pluck(:start_time)
    make_time = time.map { |i| i.strftime("%H:%M") }

    @time_arr = []
    # 二次元配列作成
    time.each do |_|
      @time_arr.push([])
    end
    # f.selectの値を調整
    time.each.with_index do |item, i|
      @time_arr[i].push(make_time[i], item)
    end

  end

  def setup_resevation
    movie_id = params[:movie_id]
    start_time = params[:start_time]
    schedule_id = Schedule.find_by(start_time: start_time)
    
    redirect_to movie_schedule_sheets_path(movie_id: movie_id, schedule_id: schedule_id, start_time: start_time)
  end

end
