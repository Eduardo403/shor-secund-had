class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_photo
  end
  #see a new product
  def show
    product
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
    product
  end
  #update
  def update
    if product.update(product_params)
      redirect_to products_path, notice: "Product was update successfully "
    else
      render :edit, status: :unprocessable_entity
    end
  end
  #delete product
  def destroy
    product.destroy
    redirect_to products_path,
                notice: "Product was successfully deleted",
                status: :see_other
  end
  #helper
  def product_params
    params.require(:product).permit(:title, :description, :price, :photo)
  end
  def product
    @product = Product.find(params[:id])
  end
end
