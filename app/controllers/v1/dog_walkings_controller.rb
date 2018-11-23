class V1::DogWalkingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params[:filter] == "1"
      @dog_walkings = DogWalking.select { |dw| dw.booked_date >= Date.today }
    else
      @dog_walkings = DogWalking.all
    end
    render json: @dog_walkings, status: :ok
  end

  def show
    @dog_walking = DogWalking.find(params[:id])
    render json: @dog_walking, status: :ok
  end

  def create
    @dog_walking = DogWalking.new(dog_walking_params)
    @dog_walking.calculate_pricing
    @dog_walking.calculate_end_time
    @dog_walking.status = "booked"
    @dog_walking.save

    render json: @dog_walking, status: :created
  end

  def start_walk
    dog_walking = DogWalking.find(params[:dog_walking_id])
    dog_walking.start_time = Time.now
    dog_walking.status = "started"
    dog_walking.save
    
    render json: dog_walking, status: :ok
  end

  def finish_walk
    dog_walking = DogWalking.find(params[:dog_walking_id])
    dog_walking.end_time = Time.now
    dog_walking.status = "finished"
    dog_walking.save

    render json: dog_walking, status: :ok
  end

  private
    def dog_walking_params
      params.require(:dog_walking).permit(
        :booked_date, :pets,
        :latitude, :longitude,
        :start_time, :duration)
    end

end
