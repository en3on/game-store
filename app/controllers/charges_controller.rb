class ChargesController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    game = Game.find(params[:game_id])

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: game.price.to_s.delete('.').to_i,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
