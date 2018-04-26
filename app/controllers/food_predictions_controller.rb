class FoodPredictionsController < ApplicationController
  def index
    #change nil-> false pending
    today = DateTime.current
    @all_orders = FoodPrediction.where(created_at: [(today.beginning_of_day)..(today.end_of_day)])
  end

  #get
  def new
    @all_food = Food.all
    @food_prediction = FoodPrediction.new
  end

  #post
  def create
    today = DateTime.current
    @food_prediction = FoodPrediction.where(created_at: [(today.beginning_of_day)..(today.end_of_day)]).where(food_id: food_prediction_params[:food_id]).last
    unless @food_prediction.present?
        @food_prediction = FoodPrediction.new(food_prediction_params)
    end
    @food_prediction.userr = current_user if current_user.present?
    if @food_prediction.save!
      redirect_to food_predictions_path
    else
      format.html { render :new }
      format.json { render json: {:message => @food_prediction.errors.messaged}, status: :unprocessable_entity }
    end
  end

  def report
    today = DateTime.current
    all_orders = FoodPrediction.where(created_at: [(today.beginning_of_day)..(today.end_of_day)]).where(userr_id: current_user.id)
    @all_food=Food.all
    @daily_prediction_matcher_report=[]
    @all_food.each do |food|
      @daily_prediction_matcher_report[food.id]={} unless @daily_prediction_matcher_report[food.id].present?
      @daily_prediction_matcher_report[food.id]["food_name"] = food.name
      @daily_prediction_matcher_report[food.id]["prediction"] = all_orders.where(food_id: food.id).last.prediction rescue -1
      order_table =OrderTable.where(created_at: [(today.beginning_of_day)..(today.end_of_day)]).where(userr_id: current_user.id).where(is_deleted: nil).where(food_id: food.id)
      quantity=0
      order_table.each do |order|
        quantity=quantity+order.quantity
      end
      @daily_prediction_matcher_report[food.id]["quantity"]=quantity
    end
    response.headers['Content-Disposition'] = 'attachment; filename="'+ "abc" +''   + Date.today.to_s + '.xlsx"'
    render 'food_predictions/index.xlsx.axlsx'
  end

  private
  def food_prediction_params
    params.require(:food_predictions).permit(:userr_id, :food_id, :prediction, :id)
  end
end
