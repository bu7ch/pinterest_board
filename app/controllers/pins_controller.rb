class PinsController < ApplicationController
before_action :find_pin,  only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC")
  end
  def show

  end
  def new
    @pin = Pin.new
  end
  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      redirect_to @pin, notice: "Succesfully saved"
    else
      render 'new'
    end
  end
  def edit

  end
  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was Sucessfully updated!"
    else
      render 'edit'
  end
  def update

  end

  private
  def pin_params
    params.require(:pin).permit(:title, :description)
  end
  def find_pin
    @pin = Pin.find(params[:id])
  end
end
