class Api::V1::JobBoard < ApplicationRecord


    def self.get_job_boards
        if Api::V1::JobBoard.count === 0
            records = JSON.parse(File.read('./lib/json/jobBoards.json'))
            records.each do |record| 
                # Api::V1::JobBoard.create!()
                record[1].each do |info|
                    Api::V1::JobBoard.create!(name: info["name"], rating: info["rating"], root_domain: info["root_domain"], logo_file: info["logo_file"], description: info["description"])
                end  
            end
        end
    end 
end



