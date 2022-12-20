require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
 test 'render a list of products' do
get products_path

assert_response :success
assert_select '.product',2
end
  test 'render a details page' do
get product_path(products(:ps4))
assert_response :success
assert_select '.title','ps4'
assert_select '.description','en perfecto estado'
assert_select '.price','120$'


  end
  test 'render a new product form' do
    get new_products_path
assert_response :success
assert_select 'form'
  end
  end
end
