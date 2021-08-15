class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @reserved_sheet_ids = Reservation.where(date: params[:start_time]).pluck(:sheet_id)
    # is_reserved = Reservation.find_by(date: params[:start_time])[:sheet_id].present?
    # is_reserved = params[:sheet_id].present?
    # @reserved_sheet_id = Reservation.find_by(date: params[:start_time])[:sheet_id]
  end
  
end