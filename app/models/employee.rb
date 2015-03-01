class Employee < ActiveRecord::Base
  has_many :jobs_employees
  has_many :jobs, through: :jobs_employees
end
