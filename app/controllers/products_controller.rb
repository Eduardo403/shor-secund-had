class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  #see a new product
  def show
    @product = Product.find(params[:id])
  end
  def new
    @product = Product.new
  end
  #create a new product
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "Product was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end
  #Edit Product
  def edit
    @product = Product.find(params[:id])
    if @product.save
      redirect_to products_path, notice: "Product was update successfully "
    else
      render :new, status: :unprocessable_entity
    end
  end
  #helper
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
