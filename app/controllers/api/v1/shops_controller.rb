class Api::V1::ShopsController < Api::V1::BaseController
  def index
    @shops = policy_scope(Shop)
  end
end
