class UserDetailsController < ApplicationController
  def index
    @user_details = UserDetail.all
  end

  def show
  end

  
  def new
    @user_detail = UserDetail.new
  end



  def create
    @user_detail = UserDetail.new(user_detail_params)
    if @user_detail.save
      redirect_to new_user_detail_path, notice: 'Thank you for your contribution!'
    else
      render :new
    end
  end





  private

  def user_detail_params
    params.require(:user_detail).permit(:name, {contribution: []}, :contacts, :content)
  end
end
