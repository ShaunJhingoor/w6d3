class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all 
        render json: @artworks
      end
    
      def create
        @artwork = Artwork.new(Artwork_params)
        if @artwork.save 
            render json: @artwork
        else 
          render json: @artwork.errors.full_messages, status: :unprocessable_entity 
        end
      end
    
      def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
      end
    
      def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(Artwork_params)
          render json: @artwork
        else 
          render json: @artwork.errors.full_messages, status: :unprocessable_entity 
        end 
      end
    
      def destroy 
        @artwork = Artwork.find(params[:id])
        @artwork.destroy 
        redirect_to Artworks_url
      end
  private 
      def Artwork_params 
          params.require(:Artworks).permit(:artist_id,:image_url)
    end
end