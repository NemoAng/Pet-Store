require "test_helper"

class BirdBreedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bird_breed = bird_breeds(:one)
  end

  test "should get index" do
    get bird_breeds_url
    assert_response :success
  end

  test "should get new" do
    get new_bird_breed_url
    assert_response :success
  end

  test "should create bird_breed" do
    assert_difference('BirdBreed.count') do
      post bird_breeds_url, params: { bird_breed: { description: @bird_breed.description, name: @bird_breed.name } }
    end

    assert_redirected_to bird_breed_url(BirdBreed.last)
  end

  test "should show bird_breed" do
    get bird_breed_url(@bird_breed)
    assert_response :success
  end

  test "should get edit" do
    get edit_bird_breed_url(@bird_breed)
    assert_response :success
  end

  test "should update bird_breed" do
    patch bird_breed_url(@bird_breed), params: { bird_breed: { description: @bird_breed.description, name: @bird_breed.name } }
    assert_redirected_to bird_breed_url(@bird_breed)
  end

  test "should destroy bird_breed" do
    assert_difference('BirdBreed.count', -1) do
      delete bird_breed_url(@bird_breed)
    end

    assert_redirected_to bird_breeds_url
  end
end
