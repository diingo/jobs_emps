class CreateJobsEmployees < ActiveRecord::Migration
  def change
    create_table :jobs_employees do |t|
      t.string :employee_type
      t.integer :employee_id, index: true
      t.integer :job_id, index: true
      t.timestamps
    end
  end
end
