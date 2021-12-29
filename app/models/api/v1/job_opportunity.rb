class Api::V1::JobOpportunity < ApplicationRecord

    def self.get_job_opportunities
        if Api::V1::JobOpportunity.count === 0
            csv_text = File.read('./lib/csv/job_opportunities.csv')
            
            csv = CSV.parse(csv_text, :headers => true)
            csv.each do |row|
                Api::V1::JobOpportunity.create!(id: row.to_hash['ID (primary key)'], job_title: row.to_hash['Job Title'], company_name: row.to_hash['Company Name'], job_url: row.to_hash['Job URL'])
            end
        end
    end
end

