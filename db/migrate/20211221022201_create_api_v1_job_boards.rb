class CreateApiV1JobBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_job_boards do |t|
      t.string :name
      t.string :rating 
      t.string :root_domain 
      t.string :logo_file 
      t.string :description 
      t.timestamps
    end
  end
end
