class Job < ActiveRecord::Base
  has_many :jobs_employees
  has_many :employees, through: :jobs_employees

  def self.create_with_params(job_params, params)
    job = Job.new(job_params)

    job.add_users(params)

    job.save
    job
  end

  def self.update_with_params(job, job_params, params)
    job.add_users(params)

    job.update_attributes(job_params)
  end

  def add_users(params)
    manager_id = params[:job][:manager_id]
    executive_id = params[:job][:executive_id]
    self.employee_ids = [manager_id, executive_id]
    # Just in case something weird happens:
    self.employee_ids = self.employee_ids.reject(&:blank?)
    self.employee_ids = self.employee_ids.uniq
  end
end
