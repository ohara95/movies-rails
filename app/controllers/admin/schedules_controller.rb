class Admin::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.includes(:movie).where(movie_id: params[:movie_id])
    @schedule = Schedule.find_by(movie_id: params[:movie_id])
    @schedule_name = Movie.find(params[:movie_id]).name
    # 映画詳細と紐づくスケジュールを表示
  end

  def show
    @schedule = Schedule.find_by(movie_id: params[:id])
  end
  
  def new
    @schedule = Schedule.new(flash[:schedule])
  end

  def create
    movie = Movie.find(params[:movie_id])
    schedule = movie.schedules.new(schedule_params)
    # schedule.movie = movie
    # schedule.movie_id = movie.id
    # movie.schedules.new(schedule_params)アソシエーション
    if schedule.save
      redirect_to admin_movie_schedules_path(movie_id: schedule.movie_id)
    else
      redirect_to new_admin_movie_schedule_path(movie_id: params[:movie_id]), flash: {
        schedule: schedule,
        error_messages: schedule.errors.full_messages
      }
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    schedule = Schedule.find(params[:id])

    if schedule.update(schedule_params)
      redirect_to admin_movie_schedules_path(movie_id: schedule.movie_id)
    else
      redirect_to edit_admin_schedule_path, flash: {
        schedule: schedule,
        error_messages: schedule.errors.full_messages
      }
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to admin_movie_schedules_path(movie_id: params[:movie_id]) ,flash: { notice: "削除されました" }
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time)
  end
  
end