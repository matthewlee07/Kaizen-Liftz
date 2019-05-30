class MusclesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]

    # CREATE
    def create
        @muscle = Muscle.new(muscle_params)
        if @muscle.save
            redirect_to muscles_path
        else
            render :new
        end
    end

    def new
        @muscle = Muscle.new if @muscle == nil
    end

    # READ
    def show
        @muscle = Muscle.find(params[:id])
    end

    def index
        @muscles = Muscle.order(name: :asc).paginate(page: params[:page], :per_page => 10)
    end

    # UPDATE
    def edit
        @muscle = Muscle.find(params[:id])
    end

    def update
        @muscle = Muscle.find(params[:id])
        if @muscle.update_attributes(muscle_params)

        redirect_to @muscle
        else
        render 'edit'
        end
    end

    # DESTROY
    def destroy
        Muscle.find(params[:id]).destroy

        redirect_to muscles_url
    end
    
    private
    def muscle_params
        params.require(:muscle).permit(:name)
    end
end
