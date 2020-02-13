class UserController < ApplicationController
  def show
  	@user = User.find(params['id'])
  end
  def new
  		@user = User.new
  		
  end
  def create
  	city = City.find_or_create_by(name: params[:city], zip_code: [:zip_code])
  	@user = User.create(first_name: params['first_name'],last_name: params['last_name'], age: params['age'], email: params['email'], description: params['description'], password: params['password'], city: city)

  	if @user.save
  		log_in(@user)
			redirect_to gossip_index_path, alert: "Bienvenue #{@user.first_name}"

		else
			render 'new'
			
		end
  end
  	
end
