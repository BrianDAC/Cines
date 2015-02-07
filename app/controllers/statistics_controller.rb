class StatisticsController < ApplicationController

	def index
     @purchase = Purchase.all
     @total_boletos  = Purchase.all.count
     @billings=Billing.all
     @total1 = 0
     @billings.each do |b|
     	 if b.status == 1
     		@total1 = @total1 + b.total_amount
     	end
     end

     @bills = Billing.group("date(created_at)").sum("total_amount")
     


     
	end
end
