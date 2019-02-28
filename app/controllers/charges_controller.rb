class ChargesController < UsersController
  def new
  end

  def create
    # Amount in yen
    @amount = 300
    user = @@user
    acct = user.stripe_id
    @transaction = Transaction.new
    
    @transaction.user_id = user.id
    @transaction.amount = @amount
    @transaction.customer_name = params[:customer_name] if params[:customer_name]
    @transaction.customer_message = params[:customer_message] if params[:customer_message]

    @transaction.save

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    
    token = Stripe::Token.create({
      :customer => customer.id,
    }, {:stripe_account => acct})

    conn_customer = Stripe::Customer.create({
      :email => params[:stripeEmail],
      :description => 'Shared Customer',
      :source => token.id,
    }, :stripe_account => acct)

    # Direct charge
    charge = Stripe::Charge.create({
      :customer    => conn_customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'jpy',
    }, :stripe_account => acct)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
