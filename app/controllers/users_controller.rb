class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :if_user_admin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user_params['roles'] = user_params['roles'].split(',')

    @user = User.new(user_params)

    # render text: user_params.inspect

   if @user.save
     redirect_to users_url
   else
     render :new
   end

  end

  def show

  end

  def update
    user_params['roles'] = user_params['roles'].split(',')
    #render text: user_params.inspect
    if @user.update(user_params)
      redirect_to users_path
      log(current_user.id, "Отредактировал пользователя", "")
    else
      render :show
    end
  end

  def destroy
    @user.destroy unless @user.email == "avpn@mail.ru"
    redirect_to users_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit!
  end

end
