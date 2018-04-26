class UserrsController < ApplicationController
  def show
    @userr = Userr.find(params[:id])
    redirect_to food_predictions_path
  end

  def new
    @userr = Userr.new
  end

  def create
    @userr = Userr.new(user_params)
    if @userr.save
      log_in @userr
      flash[:success] = "Welcome to the Sample App!"
      redirect_to order_tables_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:userr).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
