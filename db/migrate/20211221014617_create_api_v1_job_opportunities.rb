class CreateApiV1JobOpportunities < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_job_opportunities do |t|
      t.string :job_title 
      t.string :company_name
      t.string :job_url
      t.timestamps
    end
  end
end
