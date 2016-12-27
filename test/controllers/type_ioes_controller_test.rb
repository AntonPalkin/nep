require 'test_helper'

class TypeIoesControllerTest < ActionController::TestCase
  setup do
    @type_io = type_ioes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_ioes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_io" do
    assert_difference('TypeIoe.count') do
      post :create, type_io: { description: @type_io.description, name: @type_io.name }
    end

    assert_redirected_to type_io_path(assigns(:type_io))
  end

  test "should show type_io" do
    get :show, id: @type_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_io
    assert_response :success
  end

  test "should update type_io" do
    patch :update, id: @type_io, type_io: { description: @type_io.description, name: @type_io.name }
    assert_redirected_to type_io_path(assigns(:type_io))
  end

  test "should destroy type_io" do
    assert_difference('TypeIoe.count', -1) do
      delete :destroy, id: @type_io
    end

    assert_redirected_to type_ioes_path
  end
end
