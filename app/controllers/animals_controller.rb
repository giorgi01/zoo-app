class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  def index
    @animals = Animal.all
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      flash[:success] = 'Animal was successfully created.'
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  def update
    if @animal.update(animal_params)
      flash[:success] = 'Animal was successfully updated.'
      redirect_to animal_path(@animal)
    else
      render 'edit'
    end
  end

  def destroy
    @animal.destroy
    flash[:success] = 'Animal was successfully destroyed.'
    redirect_to animals_path
  end

  def search
    @requested_animals = Animal.search(params[:keyword])
  end

  private
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def animal_params
      params.require(:animal).permit(:specie, :breed, :color, :gender, :age)
    end
end
