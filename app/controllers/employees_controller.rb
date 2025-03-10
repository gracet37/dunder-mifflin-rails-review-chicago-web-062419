class EmployeesController < ApplicationController
    before_action :employee, only: [:show, :edit, :update]
    def index 
        @employees = Employee.all
    end

    def new 
        @employee = Employee.new
    end
    
    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    #assign_attributes

    def update
        @employee = Employee.update(employee_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else 
            render :edit
        end
    end

    def destroy
        @employee = Employee.find(params[:id]).destroy
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

    def employee
        @employee = Employee.find(params[:id])
    end
end
