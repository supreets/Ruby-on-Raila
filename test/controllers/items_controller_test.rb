require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  
  test "should return new page" do
    get :new
    assert_response :success
  end
  
  test "should return create page" do
   
    post :create, :item => {name: "name",price: 10}
    assert_redirected_to items_path
  end
  
  test "should open show page" do
    get :show, :id => 1
    assert_response :success
  end
  
  test "should open edit page" do
    get :edit, :id => 1
    assert_response :success
  end
end
