class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :autehnticate_user!
  load_and_authorize_resource
  # GET /user
  # GET /user.json
  def index
    @users = User.all
  end

  # GET /user/1
  # GET /user/1.json
  def show
    if current_user != @user
      redirect_to root_url, alert: "Sorry, this isn't your profile!"
    end
  end
   # GET /users/new
   def new
    @user = User.new
   end

   # GET /users/1/edit
   def edit
    if current_user != @user
      redirect_to root_url, alert: "Sorry, you can't edit someone else's profile!"
    end
   end

   # POST /users
   # POST /users.json
   def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: "User was successfully created!"}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
   end

   # PATCH/PUT /users/1
   # PATCH/PUT /users/1.json
   def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: "User was successfully updated!"}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
   end

   # DELETE /users/1
   # DELETE /users/1.json
   def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: "User was successfully deleted."}
      format.json {head :no_content}
    end
   end

   private
   def set_user
    @user =User.find(params[:id])
   end

   def user_params
    params.require(:user).permit(:first_name, :last_name)
   end
end
