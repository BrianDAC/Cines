class ServicesController < ApplicationController
  def index
    @show = Show.find(params[:show])
  end

end
