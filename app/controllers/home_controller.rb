class HomeController < ApplicationController
  
  def index
  	require 'net/http'
  	require 'json'

  	@url = 'https://api.coinmarketcap.com/v2/ticker/'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@coins = JSON.parse(@response)
  end

  def lookup
  	@sym = params[:sym]
  	if @sym != ""  
  		@sym = @sym.upcase
  	elsif @sym == ""
  		redirect_to '/index'
  	end
  end


end
