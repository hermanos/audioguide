class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:curent_user] = @user
        format.html { redirect_to root_path, notice: 'User was successfully signed up.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        session[:curent_user] = nil
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def signin
    users = User.where('username=?',params[:username])
    @user = (users.count > 0 ? users.first : nil)
    if @user.nil? 
      session[:curent_user] = nil
      respond_to do |format|
      format.html {redirect_to root_path, notice: 'The username does not exist'}
      end
    elsif @user[:password] == params[:password]
      session[:curent_user] = @user
      respond_to do |format|
      format.html {redirect_to root_path, notice: 'Loged in!'}
      end
    else
      session[:curent_user] = nil
      respond_to do |format|
      format.html {redirect_to root_path, notice: "The password is wrong"}
      end
    end
  end

  def signout
    session[:curent_user] = nil
    redirect_to root_path
  end
end
