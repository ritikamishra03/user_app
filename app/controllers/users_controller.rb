class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
   @user=User.new(user_params)
    if @user.save
      redirect_to '/users', notice: 'user was successfully created'
    else
      render :new
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'user successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
