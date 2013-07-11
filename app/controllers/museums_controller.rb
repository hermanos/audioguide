class MuseumsController < ApplicationController
  layout 'user_layout'
  before_filter :authenticate_user!

  # GET /museums
  # GET /museums.json
  def index
    @museums = Museum.all
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @museums }
    end
  end 

  # GET /museums/1
  # GET /museums/1.json
  def show
    @museum = Museum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @museum }
    end
  end

  # GET /museums/new
  # GET /museums/new.json
  def new
    @museum = Museum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @museum }
    end
  end

  # GET /museums/1/edit
  def edit
    @museum = Museum.find(params[:id])

    if can? :edit, Museum 
      render 'edit'
    else
      render 'index'
    end 
  end

  # POST /museums
  # POST /museums.json
  def create
    @museum = Museum.new(params[:museum])
    @museum.manager_id = current_user.id
    @museum.published = 0

    respond_to do |format|
      if @museum.save
        format.html { redirect_to @museum, notice: 'Museum was successfully created.' }
        format.json { render json: @museum, status: :created, location: @museum }
      else
        format.html { render action: "new" }
        format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /museums/1
  # PUT /museums/1.json
  def update
    @museum = Museum.find(params[:id])

    respond_to do |format|
      if @museum.update_attributes(params[:museum])
        format.html { redirect_to @museum, notice: 'Museum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /museums/1
  # DELETE /museums/1.json
  def destroy
    @museum = Museum.find(params[:id])
    @museum.destroy

    respond_to do |format|
      format.html { redirect_to museums_url }
      format.json { head :no_content }
    end
  end

  def activate
    @museum = Museum.find(params[:id])
    @museum.update_attribute(:published, 1)
    redirect_to museums_path
  end

  def deactivate
    @museum = Museum.find(params[:id])
    @museum.update_attribute(:published, 0)
    redirect_to museums_path
  end

  
end
