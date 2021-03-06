class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :if_not_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  # GET /foods or /foods.json
  def index
    @foods = @q.result(distinct: true).order("scores DESC").page(params[:page]).per(12)
  end

  # GET /foods/1 or /foods/1.json
  def show
    @review = Review.new
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: "作成できました。" }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "更新できました。" }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "削除できました。" }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result
  end


  private

  def set_q
    @q = Food.ransack(params[:q])
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :image, :content, :company, :price, :taste, :genre, :image_cache)
  end

  def if_not_admin
    unless current_user.admin?
      redirect_to foods_path, alert: "管理者以外はアクセスできません"
    end
  end
end
