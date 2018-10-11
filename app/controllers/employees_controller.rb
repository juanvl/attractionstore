class EmployeesController < ApplicationController
  before_action :require_login
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    if !am_i_company?
      redirect_to attractions_url
      return
    end
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    if !am_i_company?
      redirect_to attractions_url
      return
    end
  end

  # GET /employees/new
  def new
    if !am_i_company?
      redirect_to attractions_url
      return
    end
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
    if !am_i_company?
      redirect_to attractions_url
      return
    end
  end

  # POST /employees
  # POST /employees.json
  def create
    if !am_i_company?
      redirect_to attractions_url
      return
    end

    @user = User.new
    @user.email = employee_params[:email]
    @user.password = employee_params[:password]
    @user.save
    
    @employee = Employee.new
    @employee.national_registry_number = employee_params[:national_registry_number]
    @employee.name = employee_params[:name]
    @employee.job_role = employee_params[:job_role]
    @employee.user = @user
    @employee.company = Company.find_by(user_id:current_user.id)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if !am_i_company?
      redirect_to attractions_url
      return
    end
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    if !am_i_company?
      redirect_to attractions_url
      return
    end
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:national_registry_number, :name, :job_role, :email, :password)
    end

    def am_i_company?
      @company = Company.find_by(user_id:current_user.id)
      if @company
        return true
      else
        return false
      end
    end
end
