  class ExhibitsController < ApplicationController
  layout 'simple'

  before_filter :authenticate_user!, except: [:search,:show]

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
    
    QrCode.scan(@exhibit.qr_code,'found') if user.nil? 
    
    if user_signed_in?    
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @exhibit }
        format.png { render qrcode: @exhibit.qr_code }
      end
    else 
      render 'show_unauthenticated', layout: 'unauthenticated'
    end
    
  end

  # GET /exhibits/new
  # GET /exhibits/new.json
  def new
    @museum = Museum.find(params[:museum_id])
    @exhibit = @museum.exhibits.new
    @qrcode = params[:qrcode]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exhibit }
    end
  end

  # GET /exhibits/1/edit
  def edit
    @exhibit = Exhibit.find(params[:id])
    @museum = Museum.find(params[:museum_id])
    @qrcode = @exhibit.qr_code
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

  def search
    exhibits = Exhibit.where(qr_code: params[:q])
    respond_to do |format|
      format.json do
        if exhibits.count == 0
          QrCode.scan(params[:q],'new')
          render json: {id: 0}
        else
          root_url = Rails.application.routes.url_helpers.root_url
          exhibit = exhibits.first.attributes
          exhibit["image"] = root_url[0..-2].to_s+exhibits.first.image.url.to_s
          QrCode.scan(exhibit['qr_code'],'found')
          render json: exhibit
        end
      end
    end
  end
end
