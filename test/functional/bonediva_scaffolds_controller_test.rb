require 'test_helper'

class BonedivaScaffoldsControllerTest < ActionController::TestCase
  setup do
    @bonediva_scaffold = bonediva_scaffolds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bonediva_scaffolds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bonediva_scaffold" do
    assert_difference('BonedivaScaffold.count') do
      post :create, bonediva_scaffold: { description: @bonediva_scaffold.description, image: @bonediva_scaffold.image, title: @bonediva_scaffold.title }
    end

    assert_redirected_to bonediva_scaffold_path(assigns(:bonediva_scaffold))
  end

  test "should show bonediva_scaffold" do
    get :show, id: @bonediva_scaffold
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bonediva_scaffold
    assert_response :success
  end

  test "should update bonediva_scaffold" do
    put :update, id: @bonediva_scaffold, bonediva_scaffold: { description: @bonediva_scaffold.description, image: @bonediva_scaffold.image, title: @bonediva_scaffold.title }
    assert_redirected_to bonediva_scaffold_path(assigns(:bonediva_scaffold))
  end

  test "should destroy bonediva_scaffold" do
    assert_difference('BonedivaScaffold.count', -1) do
      delete :destroy, id: @bonediva_scaffold
    end

    assert_redirected_to bonediva_scaffolds_path
  end
end
