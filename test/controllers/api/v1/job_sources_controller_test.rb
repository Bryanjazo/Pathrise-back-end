require "test_helper"

class Api::V1::JobSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_job_source = api_v1_job_sources(:one)
  end

  test "should get index" do
    get api_v1_job_sources_url, as: :json
    assert_response :success
  end

  test "should create api_v1_job_source" do
    assert_difference('Api::V1::JobSource.count') do
      post api_v1_job_sources_url, params: { api_v1_job_source: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_job_source" do
    get api_v1_job_source_url(@api_v1_job_source), as: :json
    assert_response :success
  end

  test "should update api_v1_job_source" do
    patch api_v1_job_source_url(@api_v1_job_source), params: { api_v1_job_source: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_job_source" do
    assert_difference('Api::V1::JobSource.count', -1) do
      delete api_v1_job_source_url(@api_v1_job_source), as: :json
    end

    assert_response 204
  end
end
