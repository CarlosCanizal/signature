require 'test_helper'

class ApplicantFieldsControllerTest < ActionController::TestCase
  setup do
    @applicant_field = applicant_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applicant_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create applicant_field" do
    assert_difference('ApplicantField.count') do
      post :create, applicant_field: { applicant_id: @applicant_field.applicant_id, field_id: @applicant_field.field_id, value: @applicant_field.value }
    end

    assert_redirected_to applicant_field_path(assigns(:applicant_field))
  end

  test "should show applicant_field" do
    get :show, id: @applicant_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @applicant_field
    assert_response :success
  end

  test "should update applicant_field" do
    put :update, id: @applicant_field, applicant_field: { applicant_id: @applicant_field.applicant_id, field_id: @applicant_field.field_id, value: @applicant_field.value }
    assert_redirected_to applicant_field_path(assigns(:applicant_field))
  end

  test "should destroy applicant_field" do
    assert_difference('ApplicantField.count', -1) do
      delete :destroy, id: @applicant_field
    end

    assert_redirected_to applicant_fields_path
  end
end
