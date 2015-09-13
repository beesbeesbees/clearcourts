class CitationsController < ApplicationController
  before_action :set_citation, only: [:show, :pay, :charge]
  skip_before_filter :verify_authenticity_token, :only => :charge

  def index
    @citations = Citation.all
  end

  def pay
  end

  def charge
    Stripe.api_key = ENV['stripe_secret_key'.freeze]
    token = params[:stripeToken]

    begin
    charge = Stripe::Charge.create(
      :amount => @citation.total_cost, # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => "payment for citation #{@citation.citation_number}"
      )

    redirect_to pay_confirmed_citation_path(@citation)

    #send email
    rescue Stripe::CardError => e
      # The card has been declined
      redirect_to :back, notice: "Your card was declined."
    end
  end

  def pay_confirmed
  end

  private
    def set_citation
      @citation = Citation.find(params[:id])
    end

end
