class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    # @reservations.each do |item|
    #   p '---------'
    #   p Movie.find(item.movie_id)
    #   p '---------'
      
    # end
    @movies = Movie.all
  end
  
  def new
    
  end

  def edit
    @reservations = Reservation.find(params[:id])
  end
  
  def destroy
    reservations = Reservation.find(params[:id])
    reservations.destroy
    redirect_to admin_reservations_path ,flash: { notice: "削除されました" }
  end
  
end