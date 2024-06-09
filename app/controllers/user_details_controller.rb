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
    @user_detail.contributions ||= [] 
    if @user_detail.save
      redirect_to new_user_detail_path, notice: 'Thank you connecting, I will reach out to you soon!'
    else
      render :new
    end
  end

  # DELETE /user_details/:id
  def destroy
    @user_detail = UserDetail.find(params[:id])
    @user_detail.destroy
    redirect_to user_details_path, notice: "User Detail deleted successfully!"
  end



  private

  def user_detail_params
    params.require(:user_detail).permit(:name, contributions: [])
  end
end
