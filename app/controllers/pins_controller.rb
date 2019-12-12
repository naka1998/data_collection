class PinsController < ApplicationController
  def index
    @pins = Pin.all
    @pin = Pin.new
  end

  def new
    @pin = Pin.new(pin_params)
    p @pin
    case @pin.data_type
    when "elevator" then
      @pin.build_elevator
    when "restroom" then
      @pin.build_restroom
    when "slope" then
      @pin.build_slope
    when "step" then
      @pin.build_step
    else
      puts "error"
    end
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.station_id = 1
    if @pin.save
      redirect_to pins_path
    else
      render new_pin_path
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    @pin.update(pin_params)
    redirect_to pins_path
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to pins_path
  end

  private
  def pin_params
    params.require(:pin).permit(:data_type, :lat, :lng, :floor,
      elevator_attributes: [:description, :from, :to],
      restroom_attributes: [:description, :is_multipurpose],
      step_attributes: [:description, :level],
      slope_attributes: [:description, :level])
  end
end
