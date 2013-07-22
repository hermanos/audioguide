class ExhibitsController < ApplicationController
  layout 'simple'
  before_filter :authenticate_user!, except: :show
  
  # GET /exhibits
  # GET /exhibits.json
  def index
    @exhibits = Exhibit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exhibits }
    end
  end

  # GET /exhibits/1
  # GET /exhibits/1.json
  def show
    user = current_user
    @museum = Museum.find(params[:museum_id])
    @exhibit = Exhibit.find(params[:id])

    # if user.is?(:user)
    #   Scan.scanned?(@exhibit, user.profile)
    #   render 'show_user'
    #   return 
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.json do 
        exhibit = @exhibit.attributes
<<<<<<< HEAD
        exhibit[:image] = "http://staging.mooseumapp.com"+@exhibit.image.to_s
=======
        exhibit.except!('image') if @exhibit.image.url.nil?
>>>>>>> 88fc994d13cc7d90a17dc28a40c517776c31e087
        render json: exhibit 
      end
      format.png { render qrcode: @exhibit.qr_code }
    end
  end

  # GET /exhibits/new
  # GET /exhibits/new.json
  def new
    @museum = Museum.find(params[:museum_id])
    @exhibit = @museum.exhibits.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exhibit }
    end
  end

  # GET /exhibits/1/edit
  def edit
    @exhibit = Exhibit.find(params[:id])
    @museum = Museum.find(params[:museum_id])
  end

  # POST /exhibits
  # POST /exhibits.json
  def create
    @exhibit = Exhibit.new(params[:exhibit])
    @museum = Museum.find(params[:museum_id])
    @exhibit.museum = @museum

    respond_to do |format|
      if @exhibit.save
        format.html { redirect_to @museum, notice: 'Exhibit was successfully created.' }
        format.json { render json: @exhibit, status: :created, location: @exhibit }
      else
        format.html { render action: "new" }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exhibits/1
  # PUT /exhibits/1.json
  def update
    @exhibit = Exhibit.find(params[:id])
    @museum = @exhibit.museum

    respond_to do |format|
      if @exhibit.update_attributes(params[:exhibit])
        format.html { redirect_to @museum, notice: 'Exhibit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibits/1
  # DELETE /exhibits/1.json
  def destroy
    @exhibit = Exhibit.find(params[:id])
    @museum = @exhibit.museum
    @exhibit.destroy


    respond_to do |format|
      format.html { redirect_to @museum, notice: "Exhibit successfully deleted" }
      format.json { head :no_content }
    end
  end
end
