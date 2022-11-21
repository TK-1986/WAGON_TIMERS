class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def home
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
