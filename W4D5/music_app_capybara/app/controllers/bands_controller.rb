class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end
    
    def new
        @band = Band.new
        render :new
    end

    def create
        band = Band.new(band_params)
        if band.save
            render :index
        else
            render :new
        end
    end

    def edit
        band = Band.find(band_params)
        if band
            render :edit
        else
            render :create
        end
    end

    def show
        band = Band.find(band_params)
        if band
            render :show
        else
            render :index
        end
    end

    def update
    end

    def destroy
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
