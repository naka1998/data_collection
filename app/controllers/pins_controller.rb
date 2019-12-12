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
      @pin.elevators.build
    when "restroom" then
      @pin.restrooms.build
    when "slope" then
      @pin.slopes.build
    when "step" then
      @pin.steps.build
    else
      puts "error"
    end
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.station_id = 1
    if @pin.valid?
      redirect_to pins_path
    else
      debugger
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
    params.require(:pin).permit(:data_type, :lat, :lng,
      elevators_attributes: [:description, :from, :to],
      restrooms_attributes: [:description, :is_multipurpose],
      steps_attributes: [:description, :level],
      slopes_attributes: [:description, :level])
  end
end
