require "test_helper"

class Api::V1::JobOpportunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_job_opportunity = api_v1_job_opportunities(:one)
  end

  test "should get index" do
    get api_v1_job_opportunities_url, as: :json
    assert_response :success
  end

  test "should create api_v1_job_opportunity" do
    assert_difference('Api::V1::JobOpportunity.count') do
      post api_v1_job_opportunities_url, params: { api_v1_job_opportunity: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_job_opportunity" do
    get api_v1_job_opportunity_url(@api_v1_job_opportunity), as: :json
    assert_response :success
  end

  test "should update api_v1_job_opportunity" do
    patch api_v1_job_opportunity_url(@api_v1_job_opportunity), params: { api_v1_job_opportunity: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_job_opportunity" do
    assert_difference('Api::V1::JobOpportunity.count', -1) do
      delete api_v1_job_opportunity_url(@api_v1_job_opportunity), as: :json
    end

    assert_response 204
  end
end
