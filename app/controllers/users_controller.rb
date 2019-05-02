class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'Utilizador criado com cucesso'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:nome, :email, :password, :password_confirmation)
    end
end
