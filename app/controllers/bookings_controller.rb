class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def dashboard
    @bookings = Booking.all
    @bookings = @bookings.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
  end

  def index
    @bookings = Booking.all
    @booking = Booking.find(params[:id])
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      flash[:notice] = "Votre réservation a bien été créée"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.save
    flash[:notice] = "Votre réservation a bien été modifiée"
    redirect_to dashboard_path
  end

  def edit
    @booking = Booking.find(params[:id])
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    @booking.save
    flash[:notice] = "Votre réservation a bien été modifiée"
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Votre réservation a bien été supprimée"
    redirect_to dashboard_path
  end

  def reserved
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.save
    redirect_to dashboard_path
    if @booking.save
      flash[:notice] = "Votre réservation a bien été prise en compte"
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
