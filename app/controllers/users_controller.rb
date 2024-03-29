class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]


  def show
  @user = User.find(params[:id])
  @books = @user.books.all


  end

  def edit
   @user =  User.find(params[:id])
   if @user == current_user
    render "edit"
   else
    redirect_to user_path(current_user.id)

   end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end


  def update
    @user =  User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user.id), notice:'You have updated user successfully.'
    else
     render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
end

