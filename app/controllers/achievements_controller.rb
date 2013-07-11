class AchievementsController < ApplicationController
  layout 'simple'

  # GET /achievements
  # GET /achievements.json
  def index
    @achievements = Achievement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @achievements }
    end
  end

  # GET /achievements/1
  # GET /achievements/1.json
  def show
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @achievement }
    end
  end

  # GET /achievements/new
  # GET /achievements/new.json
  def new
    @achievement = Achievement.new

    if can? :create, Achievement
      render 'new'
      return
    else
      redirect_to achievements_path
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @achievement }
    end
  end

  # GET /achievements/1/edit
  def edit
    @achievement = Achievement.find(params[:id])

    if can? :edit, Achievement
      render 'edit'
      return
    else 
      redirect_to achievements_path
    end

  end

  # POST /achievements
  # POST /achievements.json
  def create
    @achievement = Achievement.new(params[:achievement])

    if can? :create, Achievement
      respond_to do |format|
        if @achievement.save
          format.html { redirect_to @achievement, notice: 'Achievement was successfully created.' }
          format.json { render json: @achievement, status: :created, location: @achievement }
        else
          format.html { render action: "new" }
          format.json { render json: @achievement.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to achievements_path
    end

  end

  # PUT /achievements/1
  # PUT /achievements/1.json
  def update
    @achievement = Achievement.find(params[:id])

    if can? :update, Achievement
      respond_to do |format|
        if @achievement.update_attributes(params[:achievement])
          format.html { redirect_to @achievement, notice: 'Achievement was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @achievement.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to achievements_path
    end
    
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievement = Achievement.find(params[:id])
    
    if can? :destroy, Achievement
      @achievement.destroy
    else 
      redirect_to achievements_path
    end
    
    respond_to do |format|
      format.html { redirect_to achievements_url }
      format.json { head :no_content }
    end
  end

  def add_achievement_to_profile
    user = current_user
    achievement = Achievement.find(params[:id])
    user.profile.achievements << achievement

  end

end
