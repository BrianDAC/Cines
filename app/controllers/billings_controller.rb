class BillingsController < ApplicationController
  def details
    @u = params[:valor]
    if @u == '1'
      @compra_reservacion = Reservation.find(params[:id])
      @price = Price.first.price
      @entradas  = Showseat.where(:reservation_id => @compra_reservacion.id).count
      if @compra_reservacion.elderly.nil?
        @mayores = 0
      else
        @mayores = @compra_reservacion.elderly
      end
      @desc_mayores = (@mayores * @price) / 2
      @sub_total = @entradas * @price
      @total =  ((@entradas - @mayores) * @price) + @desc_mayores
      @billing=Billing.new :reservation_id => @compra_reservacion.id, :total_amount => @total, :status => 0
      @billing.save
    else
      @compra_reservacion = Purchase.find(params[:id])
      @price = Price.first.price
      @entradas  =Showseat.where(:purchase_id => @compra_reservacion.id).count
      if @compra_reservacion.elderly.nil?
        @mayores = 0
      else
        @mayores = @compra_reservacion.elderly
      end
      @monday = Date.today.monday?
      if @monday
        @sub_total = (@entradas * @price) / 2
        @total =  @sub_total
        @billing=Billing.new :purchase_id => @compra_reservacion.id, :total_amount => @total, :status => 0
        @billing.save
      else
        @desc_mayores = (@mayores * @price) / 2
        @sub_total = @entradas * @price
        @total =  ((@entradas - @mayores) * @price) + @desc_mayores
        @billing=Billing.new :purchase_id => @compra_reservacion.id, :total_amount => @total, :status => 0
        @billing.save
      end
    end

  end

  def create
    @billing=Billing.new(permit_params)
    if @billing.save
      redirect_to root_path
    else

    end
  end


  private

  def permit_params
    params.require(:billing).permit(:reservation_id, :total_amount)
  end
end
