class ProductsController < ApplicationController
  
  def index
  @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    #debugger
    @product = Product.find_by_id(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    debugger
    @product = @user.products.new(product_params)
    if @product.save
      stripe_product = Stripe::Product.create({name: params[:product][:name]})
      stripe_price = Stripe::Price.create({unit_amount: params[:product][:price],currency: 'usd', product: stripe_product.id ,})
      debugger
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end



  private
  def product_params
    params.require(:product).permit!
  end
end
