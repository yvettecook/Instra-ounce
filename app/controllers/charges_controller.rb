class ChargesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @amount = @post.price*100

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer     => customer.id,
    :amount       => @amount,
    :description  => 'Rails Stripe Customer',
    :currency     => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end


end
