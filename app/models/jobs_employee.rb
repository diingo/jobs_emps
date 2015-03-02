class JobsEmployee < ActiveRecord::Base
  belongs_to :employee
  belongs_to :job

  before_save :set_employee_type

  def set_employee_type
    self.employee_type ||= self.employee.type
  end

  # Find all employees of a certain type (e.g. crew member) for a specific job
  def self.find_employees(job_id, employee_type)
    self.where(job_id: job_id, employee_type: employee_type).map do |job_emp|
      Employee.find(job_emp.employee_id)
    end
  end
end
