class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :spice_not_found

    def index

        spices = Spice.all
        render json: spices
    end

    def create

       spice = Spice.create(spice_params)
       render json: spice, status: :created

    end

    def update

        spice = Spice.find_by(id: params[:id])
        updated_spice = spice.update(spice_params)
        render json: spice
    end



    def destroy
        spice = Spice.find_by(params[:id])
        spice.destroy
        head :no_content
    end
end

private

def spice_params

    params.permit(:title, :image, :description, :notes, :rating)
end

def spice_not_found

    render json: {error: "Spice not found..."}, status: :not_found

end