class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :edit]
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    #prototype.update(prototype_params)
    #prototype.save (@prototype) prototype = Prototype.includes(:user)
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      prototype = Prototype.includes(:user)
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
  private

  def prototype_params
    params.require(:prototype).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  end

end
