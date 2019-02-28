class DashboardController < ApplicationController
  before_action :authenticate_user!
  require "active_support/core_ext/numeric/conversions"

  def index
    @transactions = Transaction.where(user_id: current_user.id).page(params[:page]).per(3)
    sum = 0
    @transactions.each do |t|
      sum += t.amount
    end
    
    @earning = sum.to_s(:delimited)
    @cups = sum/300
    @page_views = current_user.impressionist_count.to_s(:delimited)
  end
end
