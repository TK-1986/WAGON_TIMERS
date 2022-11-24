class CarsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :load_and_authorize_resource, if: :devise_controller?
  # has_many :bookings
  # belongs_to :user

  def index
    if params[:query].present?
      sql_query = <<~SQL
        cars.brand @@ :query
        OR cars.modele @@ :query
      SQL
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save!
      redirect_to cars_path
      flash[:notice] = "Votre annonce voiture a bien été créée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to cars_path(@car)
    flash[:notice] = "Votre annonce voiture a bien été modifiée"
  end

  def edit
    @car = Car.find(params[:id])
    @car.user = current_user
    @car.save
    redirect_to cars_path
    flash[:notice] = "Votre annonce voiture a bien été modifiée"
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
    flash[:notice] = "Votre annonce voiture a bien été supprimée"
  end

  private

  def car_params
    params.require(:car).permit(:brand, :modele, :year, :price, :description, :photo)
  end
end
