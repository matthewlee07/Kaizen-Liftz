class MusclesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    # READ
    def index
        @muscles = Muscle.order(name: :asc).paginate(page: params[:page], :per_page => 10)
    end
    
    def show
        @muscle = Muscle.find(params[:id])
    end

    # CREATE
    def create
        @muscle = Muscle.new(muscle_params)
        if @muscle.save
            redirect_to @muscle
        else
            render :new
        end
    end

    def new
        @muscle = Muscle.new
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
            render :edit
        end
    end

    # DESTROY
    def destroy
        Muscle.find(params[:id]).destroy
        redirect_to muscles_path
    end
    
    private
    def muscle_params
        params.require(:muscle).permit(:name)
    end

end
