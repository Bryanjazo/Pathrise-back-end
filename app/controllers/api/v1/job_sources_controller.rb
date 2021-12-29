class Api::V1::JobSourcesController < ApplicationController


  def show
    @api_v1_job_board = Api::V1::JobBoard.find(params[:id])
    
    @api_v1_job_source = Api::V1::JobSource.all.where(job_source: @api_v1_job_board.name)
    if @api_v1_job_source.exists?
      render json: @api_v1_job_source
    else 
      render json: {error: "There is no #{@api_v1_job_board.name} postings at this time"}
    end
    
  end

  

  private

    def api_v1_job_source_params
      params.fetch(:api_v1_job_source, {})
    end
end
