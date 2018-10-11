class AttractionsController < ApplicationController
  before_action :require_login
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  # GET /attractions
  # GET /attractions.json
  def index
    @company = get_my_company_id

    @attractions = Attraction.where(company_id:@company.id)
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    if am_i_employee?
      return
    end
    
    @company = get_my_company_id
    @attraction = Attraction.new
    @attraction.name = attraction_params[:name]
    @attraction.address = attraction_params[:address]
    @attraction.duration_minutes = attraction_params[:duration_minutes]
    @attraction.max_capacity = attraction_params[:max_capacity]
    @attraction.picture = attraction_params[:picture]
    @attraction.company_id = @company.id

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render :show, status: :created, location: @attraction }
      else
        format.html { render :new }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { render :show, status: :ok, location: @attraction }
      else
        format.html { render :edit }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    if am_i_employee?
      return
    end
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:name, :address, :duration_minutes, :max_capacity, :company_id, :picture)
    end

    def get_my_company_id
      @employee = Employee.find_by(user_id:current_user.id)
    
      if @employee
        @company = Company.find(id=@employee.company_id)
      else
        @company = Company.find_by(user_id:current_user.id)
      end
    end

    def am_i_employee?
      @employee = Employee.find_by(user_id:current_user.id)
      if @employee
        return true
      else
        return false
      end
    end
end
