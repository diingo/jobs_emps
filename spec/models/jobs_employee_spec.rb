require 'rails_helper'

RSpec.describe JobsEmployee, :type => :model do
  before do
    @job_permitted_params = {
      city: "Munich",
      status: "in_progress"
    }
    @manager = Employee.create!(name: "Bob Bobber", type: 'Manager')
    @executive = Employee.create!(name: "Alice Smith", type: 'Executive')
    @job_raw_params = {
      job: {
        manager_id: @manager.id,
        executive_id: @executive.id
      }
    }
  end

  it "creates and updates" do
    job = Job.create_with_params(@job_permitted_params, @job_raw_params)
    # This passes:
    expect(job.jobs_employees.map &:employee_type).to include("Manager", "Executive")
    @manager.type = 'Executive'
    @manager.save!

    Job.update_with_params(job, @job_permitted_params, @job_raw_params)
    # This breaks in testing but works in production:
    expect(job.jobs_employees.map &:employee_type).to include("Manager", "Executive")
  end
end
