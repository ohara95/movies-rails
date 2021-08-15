class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end
  
  def create
    reservation = Reservation.new(reservation_params)
    is_reserved = Reservation.exists?(date: params[:date], sheet_id: params[:sheet_id])

    if is_reserved
      flash[:error] = "その座席はすでに予約済みです"
      redirect_to movie_schedule_sheets_path(movie_id: params[:movie_id], schedule_id: params[:schedule_id], sheet_id: params[:sheet_id], start_time: params[:date])
      return
    end
    
    if reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to movie_path(params[:movie_id])
    end
  end

  private

  def reservation_params
    params.permit(:email, :name, :date, :sheet_id, :schedule_id)
  end
end

