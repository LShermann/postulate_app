require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    sign_in users(:one)
    assert_difference("Job.count") do
      post jobs_url, params: { job: { description: @job.description, name: @job.name, requeriment: @job.requeriment } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    sign_in users(:one)
    patch job_url(@job), params: { job: { description: @job.description, name: @job.name, requeriment: @job.requeriment } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    sign_in users(:one)
    assert_difference("Job.count", -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
