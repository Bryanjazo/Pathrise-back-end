class Api::V1::JobSource < ApplicationRecord


    def self.to_csv
    
        
        attributes = %w{id job_title company_name job_url job_source}

        CSV.generate(headers: true) do |csv|
            csv << attributes
            
            
            all.each do |job|
                
    
                
              csv << attributes.map{ |attr| job.send(attr) }
            end
          end
        end
      
  

    def self.get_job_sources 
    start1 = 0
    start2 = 0
    opps = Api::V1::JobOpportunity.all
    jobBoard = Api::V1::JobBoard.all
    
    while start1 < opps.count do
        matchURI = opps[start1].job_url
        if start2 === jobBoard.count
            job = Api::V1::JobSource.new(job_title: opps[start1].job_title, company_name: opps[start1].company_name, job_url: opps[start1].job_url, job_source: 'Unknown' )
            if !Api::V1::JobSource.find_by(job_url: job.job_url)
                    start1 += 1
                    start2 = 0
                    job.save!  
                else 
                    start1 += 1
                end
            elsif opps[start1].job_url === nil         
                no_job_url = Api::V1::JobSource.new(job_title: opps[start1].job_title, company_name: opps[start1].company_name, job_url: 'Unknown', job_source: "Unknown" )
                if !Api::V1::JobSource.find_by(company_name: no_job_url.company_name)
                    start1 += 1
                    start2 = 0
                    no_job_url.save!
                else 
                    start1 += 1
                end
            elsif matchURI.match(jobBoard[start2].root_domain)
                job_url = Api::V1::JobSource.new(job_title: opps[start1].job_title, company_name: opps[start1].company_name, job_url: opps[start1].job_url, job_source: jobBoard[start2].name )
                if !Api::V1::JobSource.find_by(job_url: job_url.job_url)
                    start1 += 1
                    start2 = 0
                    job_url.save!
                else
                    start1 += 1
                end
            else
                start2 += 1
            end
        end
    end

end

