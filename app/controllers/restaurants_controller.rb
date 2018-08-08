require 'byebug'
class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant.id)

    sum = 0
    count = 0
    @reviews.each do |review|
      count += 1
      sum += review.rating
    end
    if sum == 0
      @average_rating = 0
    else
      @average_rating = sum / count
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :address, :phone_number, :category)
  end

end

