class ArtworkSharesController < ApplicationController
    def create
        shared = ArtworkShare.new(artwork_share_params)
        if shared.save
            render json: shared
        else
            render json: shared.errors.full_messages
        end
    end

    def destroy
        shared = ArtworkShare.find(params[:id])
        shared.destroy
        render json: shared
    end

    private


    def artwork_share_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end
end