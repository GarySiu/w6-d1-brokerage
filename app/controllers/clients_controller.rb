class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find params[:id]
    @holdings = @client.holdings.all
    @total = @client.total
  end
end
