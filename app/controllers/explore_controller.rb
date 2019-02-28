class ExploreController < ApplicationController
  def index
    @searched = User.search(params[:keyword]).reverse_order.page(params[:page])
  end
end
