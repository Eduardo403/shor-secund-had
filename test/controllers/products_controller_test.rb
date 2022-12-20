require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "render a list of products" do
    get products_path

    assert_response :success
    assert_select ".product", 2
  end
  test "render a details page" do
    get product_path(products(:ps4))
    assert_response :success
    assert_select ".title", "ps4"
    assert_select ".description", "en perfecto estado"
    assert_select ".price", "120$"
  end
  test "render a new product form" do
    get new_product_path
    assert_response :success
    assert_select "form"
  end

  test "allow to create a new product" do
    post products_path,
         params: {
           product: {
             title: "ps4",
             description: "en perfecto estado",
             price: 120
           }
         }

    assert_redirected_to products_path
    assert_equal flash[:notice], "Product was successfully created"
  end
  test "dose not allow to create a new product with empty fields" do
    post products_path,
         params: {
           product: {
             title: "",
             description: "en perfecto estado",
             price: 120
           }
         }

    assert_response :unprocessable_entity
  end
  test "render an edit product form" do
    get edit_product_path(products(:ps4))
    assert_redirected_to products_path
    assert_response :success
    assert_select "form"
  end
end
