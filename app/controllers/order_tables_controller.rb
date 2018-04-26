class OrderTablesController < ApplicationController

  def index
    #change nil-> false pending
    today = DateTime.current
    if current_user.present?
      all_order_including_deleted=OrderTable.where(userr_id: current_user.id).where(created_at: [(today.beginning_of_day)..(today.end_of_day)]).all
      @all_orders = all_order_including_deleted.where(is_deleted: nil)
      deleted_orders = all_order_including_deleted.where(is_deleted: true)
      @food_hash=[]
      Food.all.each do |food|
        @food_hash[food.id]={} unless @food_hash[food.id].present?
        @food_hash[food.id]["cuurent_quantity"],@food_hash[food.id]["prediction"] = cal_cuurent_quantity_and_prediction food.id
      end
    end
  end

  def show
    @this_order = OrderTable.find(params[:id])
  end

  #get
  def new
    @new_order = OrderTable.new
  end

  #post
  def create
    @new_order = OrderTable.new(order_table_params)
    @new_order.userr = current_user if current_user.present?
    if @new_order.save!
      redirect_to order_tables_path
    else
      format.html { render :new }
      format.json { render json: {:message => @new_order.errors.messaged}, status: :unprocessable_entity }
    end
    #ActionCable.server.broadcast("order_tables/#{@new_order.userr_id}", {type:"new", new_hash: @new_order})
  end

  def destroy
    del_order = OrderTable.find(params[:id])
    del_order.update_attribute(:is_deleted, true)
    today = DateTime.current
    food_pred  = FoodPrediction.where(created_at: [(today.beginning_of_day)..(today.end_of_day)]).where(food_id: del_order.food_id).last
    cuurent_quantity =0
    a = 0
    cuurent_quantity , a = cal_cuurent_quantity_and_prediction del_order.food.id
   # ActionCable.server.broadcast("order_tables/#{del_order.userr_id}", {type:"delete", food_id: del_order.food_id, cuurent_quantity: cuurent_quantity})
    redirect_to order_tables_path
  end

  private
  def order_table_params
    params.require(:order_table).permit(:userr_id, :food_id, :quantity, :is_deleted, :id)
  end

  def cal_cuurent_quantity_and_prediction food_id
    today = DateTime.current
    food_pred  = FoodPrediction.where(created_at: [(today.beginning_of_day)..(today.end_of_day)]).where(food_id: food_id).last.prediction rescue -1
    quantity=0
    today = DateTime.current
    deleted_orders=OrderTable.where(userr_id: current_user.id).where(is_deleted: true).where(food_id: food_id).where(created_at: [(today.beginning_of_day)..(today.end_of_day)]) rescue {}
    deleted_orders.each do |v|
      quantity=quantity+v.quantity
    end
    return quantity, food_pred
  end
end
