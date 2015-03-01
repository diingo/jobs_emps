class Job < ActiveRecord::Base
  has_many :jobs_employees
  has_many :employees, through: :jobs_employees
end
