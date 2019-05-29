class MusclesController < ApplicationController

    # CREATE
    # def create
    #     @muscle = muscle.new(muscle_params)
    #     if @muscle.save
    #     flash[:success] = "Created muscle"
    #     redirect_to @muscle
    #     else
    #     render :new
    #     end
    # end

    # def new
    #     @muscle = muscle.new if @muscle == nil
    # end

    # READ
    # def show
    #     @muscle = muscle.find(params[:id])
    #     @projects = @muscle.projects
    # end

    def index
        @muscles = Muscle.paginate(page: params[:page], :per_page => 5)
    end

    # UPDATE
    # def edit
    #     @muscle = muscle.find(params[:id])
    # end

    # def update
    #     @muscle = muscle.find(params[:id])
    #     if @muscle.update_attributes(muscle_params)
    #     flash[:success] = "Updated muscle"
    #     redirect_to @muscle
    #     else
    #     render 'edit'
    #     end
    # end

    # DESTROY
    # def destroy
    #     muscle.find(params[:id]).destroy
    #     flash[:success] = "Deleted muscle"
    #     redirect_to muscles_url
    # end
    
    # private
    # def muscle_params
    #     params.require(:muscle).permit(:company, :address, :city, :state, :zip)
    # end
end
