class Employees::ReservationsController < ApplicationController
	layout 'private'
	def new
		@billings=Billing.all
		@billing=Billing.new
	end

   	
	def create
	@billings=Billing.all
  	@billing = Billing.new(permit_params)
	  	if @billing.save
	  		redirect_to new_employees_reservation_path
	  	else
	  		render 'new'
	  	end
    end

	def edit
      @billing = Billing.find(params[:id])
    end
	
	def destroy
	  @billing = Billing.find(params[:id])
	  @billing.destroy
	  redirect_to new_employees_reservation_path
    end
    
    def update
    	@billing = Show.find(params[:id])

    if @billing.update(permit_params)
      redirect_to new_employees_reservation_path
    else
      render 'edit'
    end
  end

    private

	def permit_params
  		params.require(:billing).permit(:reservation_id, :name_billing, :lastname_billing, :ci_billing, :payment_id, :payment, :cod_billing, :date_billing)
 	end








end
