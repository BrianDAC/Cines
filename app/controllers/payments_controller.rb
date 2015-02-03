class PaymentsController < ApplicationController
  def pay
    @bill=Billing.find(params[:id])
    @tarjetas = ['Visa','Master Card', 'America Express']
    @payment=Payment.new

  end

  def create
    @payment = Payment.new(permit_params)
    if @payment.save
      redirect_to :root
    else
      render 'new'
    end
  end


  private

  def permit_params
    params.require(:payment).permit(:cardnumber, :cardtype, :pay_date, :due_date, :cardname, :billing_id)
  end
end
