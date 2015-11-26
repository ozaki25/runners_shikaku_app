class ChoicesController < ApplicationController
  before_action :set_choice, only: %i(edit update destroy)

  def index
    @choices = Choice.all
  end

  def new
    @choice = Choice.new
  end

  def edit
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      redirect_to @choice, notice: 'Choice was successfully created.'
    else
      render :new
    end
  end

  def update
    if @choice.update(choice_params)
      redirect_to @choice, notice: 'Choice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @choice.destroy
    redirect_to choices_url, notice: 'Choice was successfully destroyed.'
  end

  private
  def set_choice
    @choice = Choice.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:content, :collect, :question)
  end
end
