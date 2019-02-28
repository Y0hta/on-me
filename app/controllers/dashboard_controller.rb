class DashboardController < ApplicationController
  before_action :authenticate_user!
  require "active_support/core_ext/numeric/conversions"

  def index
    sum = 0
    Transaction.where(user_id: current_user.id).each do |t|
      sum += t.amount
    end
    
    @earning = sum.to_s(:delimited)
    @cups = sum/300
    @page_views = current_user.impressionist_count.to_s(:delimited)
  end
end
