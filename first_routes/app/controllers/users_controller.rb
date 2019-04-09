class UsersController < ApplicationController
    def index
        if params[:username]
            if User.exists?(['username ilike ?', params[:username]])
                users = User.where("users.username ILIKE '#{params[:username]}'")
            else
                users = User.all
            end
        else
            users = User.all
        end
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to :users
    end

    def favorited_artworks
        art_user_fav = Artwork.favorites(params[:id])
        art_share_fav = ArtworkShare.favorites(params[:id])
        render json: [art_user_fav,art_share_fav]
    end

    def collections
        render json: Collection.collections(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end