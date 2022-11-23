class BookingsController < ApplicationController
  # before_action :set_booking, only: %i[show edit update destroy]
  # before_action :authenticate_user!
  # belongs_to :car
  # belongs_to :user

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
      flash[:notice] = "Votre réservation a bien été créée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.save
    flash[:notice] = "Votre réservation a bien été modifiée"
    redirect_to new_car_booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    @booking.save
    flash[:notice] = "Votre réservation a bien été modifiée"
    redirect_to new_car_booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Votre réservation a bien été supprimée"
    redirect_to new_car_booking_path(@booking)
  end

  def reserved
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.save
    redirect_to new_car_booking_path(@booking)
    if @booking.save
      flash[:notice] = "Votre réservation a bien été prise en compte"
      redirect_to new_car_booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end


rails d model booking
rails db:drop
rails db:create
supprimer le fichier que tavais de lancien booking
rails g model booking user:references car:references start_date:date end_date:date
