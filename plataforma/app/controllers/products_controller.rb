class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def index
    if current_user.has_role? :admin
      @products = Product.all
    else
    flash[:alert] = "No tiene acceso"
    redirect_to root_path
  end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to products_path
      else
        render :new
      end
  end

  def show
    @products = Product.all
    @product = Product.find(params[:id])

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to products_path
      else
        render :edit
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :characteristic, :mark, :kind, :discount, :reference, {photos: []})
  end

end
