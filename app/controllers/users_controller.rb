class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :user_titles, :user_pictures]
  before_action :require_user_logged_in, only: [:edit, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  # GET /users/1
  # GET /users/1.json
  # def show
   
  # end

  # GET /users/new
  def new
    @user = User.new
  end

  def show
    @titles = @user.titles.page(params[:page]).per(25)
    @pictures = Picture.order(id: :desc).page(params[:page]).per(25)
  end
  
  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def user_titles
    @titles = @user.titles.page(params[:page]).per(25)
    @pictures = Picture.order(id: :desc).page(params[:page]).per(25)
  end

  def user_pictures
    @pictures = @user.pictures.page(params[:page]).per(25)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
