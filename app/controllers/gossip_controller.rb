class GossipController < ApplicationController
	# before_action :authenticate_user, only: [:index]

	def index
		@gossip_new = Gossip.new
		puts flash[:alert]

	end

	def show
		@user = User.find(session[:user_id])
		@gossip = Gossip.find(params['id'])

		@comments = Comment.where(gossip_id: @gossip).order("created_at DESC")
		puts flash[:alert]
	end

	def new
		@gossip_new = Gossip.new
	end

	def create
		@user = User.find(session['user_id'])
		@gossip_new = Gossip.new('title' => params[:title], 'content' => params[:content],'user_id' => @user[:id])

		if @gossip_new.save
			redirect_to gossip_index_path, alert: 'Votre gossip a bien été sauvegardé'

		else
			render 'new'
			
		end
	end
	def edit
		@gossip_update = Gossip.find(params['id'])


	end
	def update
		@user = User.find(session['user_id'])
		@gossip_update = Gossip.find(params[:id])
		if @gossip_update.update('title' => params[:title], 'content' => params[:content],'user_id' => @user[:id])
			redirect_to gossip_index_path, alert: 'Votre potin a bien été mis à jour'
		else
			render :edit
		end
	end

	def destroy
		@gossip_destroy = Gossip.find(params[:id])
		@gossip_destroy.destroy
		redirect_to gossip_index_path, alert: 'Votre potin a bien été supprimé, bravo !'
	end

  private

  # def authenticate_user
  #   unless current_user
  #     flash[:danger] = "Please log in."
  #     redirect_to sessions_new_path
  #   end
  # end

end
	



