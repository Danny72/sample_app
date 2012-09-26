class UsersController < ApplicationController

  before_filter :signed_in_user, :only => [:index, :edit, :update]
  before_filter :correct_user,   :only => [:edit, :update]
  before_filter :admin_user,     :only => :destroy

  def index
    @users = User.paginate(:page => params[:page])
  end

  def new
    if !signed_in?
      @user = User.new
    else
      flash[:notice] = "You already have an account"
      redirect_to root_path 
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the SampleApp"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user    
    else
      render 'edit'
    end
  end 

  def destroy
    user = User.find(params[:id])
    if user.admin?
      flash[:notice] = "Admin cannot delete themselves!"
      redirect_to root_url
    else  
      user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location 
        redirect_to signin_url, :notice => "Please sign in." 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
