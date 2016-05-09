class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)

    # Add response behavior
    respond_to do |format|
       # if the response fomat is html, redirect as usual
       format.html { redirect_to root_path }
       # don't add the {} it will totally make you go crazy.
       format.js
     end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      # don't add the {} it will totally make you go crazy.
      format.js
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

end
