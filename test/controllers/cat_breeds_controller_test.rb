require "test_helper"

class CatBreedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat_breed = cat_breeds(:one)
  end

  test "should get index" do
    get cat_breeds_url
    assert_response :success
  end

  test "should get new" do
    get new_cat_breed_url
    assert_response :success
  end

  test "should create cat_breed" do
    assert_difference('CatBreed.count') do
      post cat_breeds_url, params: { cat_breed: { description: @cat_breed.description, name: @cat_breed.name } }
    end

    assert_redirected_to cat_breed_url(CatBreed.last)
  end

  test "should show cat_breed" do
    get cat_breed_url(@cat_breed)
    assert_response :success
  end

  test "should get edit" do
    get edit_cat_breed_url(@cat_breed)
    assert_response :success
  end

  test "should update cat_breed" do
    patch cat_breed_url(@cat_breed), params: { cat_breed: { description: @cat_breed.description, name: @cat_breed.name } }
    assert_redirected_to cat_breed_url(@cat_breed)
  end

  test "should destroy cat_breed" do
    assert_difference('CatBreed.count', -1) do
      delete cat_breed_url(@cat_breed)
    end

    assert_redirected_to cat_breeds_url
  end
end
