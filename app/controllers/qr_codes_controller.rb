class QrCodesController < ApplicationController
  layout 'simple'
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /qr_codes
  # GET /qr_codes.json
  def index
    @qr_codes = QrCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @qr_codes }
    end
  end

  # GET /qr_codes/1
  # GET /qr_codes/1.json
  def show
    @qr_code = QrCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qr_code }
    end
  end

  # GET /qr_codes/new
  # GET /qr_codes/new.json
  def new
    @qr_code = QrCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @qr_code }
    end
  end

  # GET /qr_codes/1/edit
  def edit
    @qr_code = QrCode.find(params[:id])
  end

  # POST /qr_codes
  # POST /qr_codes.json
  def create
    @qr_code = QrCode.new(params[:qr_code])

    respond_to do |format|
      if @qr_code.save
        format.html { redirect_to @qr_code, notice: 'Qr code was successfully created.' }
        format.json { render json: @qr_code, status: :created, location: @qr_code }
      else
        format.html { render action: "new" }
        format.json { render json: @qr_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /qr_codes/1
  # PUT /qr_codes/1.json
  def update
    @qr_code = QrCode.find(params[:id])

    respond_to do |format|
      if @qr_code.update_attributes(params[:qr_code])
        format.html { redirect_to @qr_code, notice: 'Qr code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @qr_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qr_codes/1
  # DELETE /qr_codes/1.json
  def destroy
    @qr_code = QrCode.find(params[:id])
    @qr_code.destroy

    respond_to do |format|
      format.html { redirect_to qr_codes_url }
      format.json { head :no_content }
    end
  end
end
