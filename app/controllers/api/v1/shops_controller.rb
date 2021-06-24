class Api::V1::ShopsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_shop, only: [ :show, :update, :destroy]
  def index
    @shops = policy_scope(Shop)
  end

  def show
  end

  def update
    if @shop.update(shop_params)
      render :show
    else
      render_error
    end
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    authorize @shop
    if @shop.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @shop.destroy
    head :no_content
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
    authorize @shop  # For Pundit
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :phone_number, :website, :images)
  end

  def render_error
    render json: { errors: @shop.errors.full_messages },
      status: :unprocessable_entity
  end
end
