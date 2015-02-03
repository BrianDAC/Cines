class PaymentsController < ApplicationController
  def pay
    @bill=Billing.find(params[:id])
    @tarjetas = ['Visa','Master Card', 'America Express']
    @payment=Payment.new

  end

  def create
    @payment = Payment.new(permit_params)
    @bill = Billing.find(params[:id])
    if @payment.save
      @bill.status=1
      @bill.save
      redirect_to verification_path
    else
      render 'new'
    end
  end


  private

  def permit_params
    params.require(:payment).permit(:cardnumber, :cardtype, :pay_date, :due_date, :cardname, :billing_id)
  end
end
