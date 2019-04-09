class CommentsController < ApplicationController

    def index
        if User.exists?(params[:user_id])
            render json: User.find(params[:user_id]).comments
        elsif Artwork.exists?(params[:artwork_id])
            render json: Artwork.find(params[:artwork_id]).comments
        else
            errors = [User.find(params[:user_id]).errors.full_messages, Artwork.find(params[:artwork_id]).errors.full_messages ]
            render json: errors
        end
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
    end


    def comment_params
        params.require(:comments).permit(:body, :user_id, :artwork_id)
    end
end