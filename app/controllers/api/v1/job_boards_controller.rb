class Api::V1::JobBoardsController < ApplicationController
    def index 
        @api_v1_job_boards = Api::V1::JobBoard.all
        render json: @api_v1_job_boards
    end
end
