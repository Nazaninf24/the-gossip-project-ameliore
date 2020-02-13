class CommentsController < ApplicationController
    before_action :find_gossip
    before_action :find_comment, only: [:destroy, :edit, :update]



    def create
        @user = User.find(session[:user_id])
        @comment = @gossip.comments.create(params[:comment].permit(:content))
        @comment.user_id = @user.id
        @comment.save

    if @comment.save
        redirect_to gossip_path(@gossip), alert: 'Votre commentaire a bien été créé'
    else
        render 'new'
    end            
    end

    def edit

    end

    def update
        if @comment.update(params[:comment].permit(:content))
            redirect_to gossip_path(@gossip), alert: 'Votre commentaire a bien été modifié'
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_to gossip_path(@gossip), alert: 'Votre commentaire a bien été supprimé'
    end

    private
    def find_gossip
        @gossip = Gossip.find(params[:gossip_id])
    end

    def find_comment
        @comment = @gossip.comments.find(params[:id])
    end


end