require 'test_helper'

class IoesControllerTest < ActionController::TestCase
  setup do
    @io = ioes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ioes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create io" do
    assert_difference('Ioe.count') do
      post :create, io: { description: @io.description, name: @io.name }
    end

    assert_redirected_to io_path(assigns(:io))
  end

  test "should show io" do
    get :show, id: @io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @io
    assert_response :success
  end

  test "should update io" do
    patch :update, id: @io, io: { description: @io.description, name: @io.name }
    assert_redirected_to io_path(assigns(:io))
  end

  test "should destroy io" do
    assert_difference('Ioe.count', -1) do
      delete :destroy, id: @io
    end

    assert_redirected_to ioes_path
  end
end
