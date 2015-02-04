class Services::PurchasesController < ApplicationController
def new
		@purchases=Purchase.all
		@purchase=Purchase.new
		@ocupados=[]
		@comprados=[]
		@show=Show.find(params[:show])
	end


	def create
		@purchases=Purchase.all
		@purchase = Purchase.new(permit_params)
		if @purchase.save
			@id=''
			@aux=0
			(0..@purchase.seat.length).each do |i|
					if @purchase.seat[i] == ',' || @aux == 3 || i == @purchase.seat.length
						@name_seat=Seat.where(:seat => @id).first
						@change_stat=Showseat.where(:show_id => @purchase.show_id).where(:seat_id => @name_seat.id).first
						@change_stat.status = 1
						@change_stat.purchase_id=@purchase.id
						@change_stat.save
						@id = ''
						@aux = 0
					else
						if @purchase.seat[i].nil?

						else
							@aux = @aux + 1
							@id = @id + @purchase.seat[i]
						end
					end
				end

			redirect_to :controller => '/billings', :action => 'details', :id => @purchase.id, :valor => 2
		else
			render 'new'
		end
	end

	def edit
		@purchase= Purchase.find(params[:id])
	end

	def destroy
		@purchase = Purchase.find(params[:id])
		@purchase.destroy
		redirect_to new_services_purchases_path
	end
	def update
		@purchase = Purchase.find(params[:id])

		if @purchase.update(permit_params)
			redirect_to new_services_purchases_path
		else
			render 'edit'
		end
	end

	private

	def permit_params
		params.require(:purchase).permit(:name, :lastname, :email, :ci, :seat, :elderly, :show_id)
	end





















end
