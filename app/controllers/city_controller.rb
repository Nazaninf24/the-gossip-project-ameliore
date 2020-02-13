class CityController < ApplicationController
  def show
  	@city = City.find(params['id'])
  	
  	@user = User.where(city_id: params['id'])

  	@user_gossips = Gossip.where(user_id: @user)

  end
end
