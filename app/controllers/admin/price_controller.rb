class Admin::PriceController < ApplicationController
	layout 'private'
	def new
		@prices=Price.all
		@price=Price.new
	end
	def create
	@prices=Price.all
  	@price = Price.new(permit_params)

	  	if @price.save
	  		redirect_to new_admin_price_path
	  	else
	  		render 'new'
	  	end
    end
    def edit
      @price = Price.find(params[:id])
    end
    def update
    @price = Price.find(params[:id])

    if @price.update(permit_params)
      redirect_to new_admin_price_path
    else
      render 'edit'
    end
  end

    private

	def permit_params
  		params.require(:price).permit(:price)
 	end

end
