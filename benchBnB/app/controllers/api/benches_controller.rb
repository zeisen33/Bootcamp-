class Api::BenchesController < ApplicationController
    def index
        # debugger
        @benches = Bench.all
        render :index
    end

    def create
        @bench = Bench.new(bench_params)
        if @bench.save
            render :show            
        else
            render json: { errors: @bench.errors.full_messages }, status: 422
        end
    end

    def show
        # debugger
        @bench = Bench.find_by(id: params[:id])
        render :show
    end

    private
    def bench_params
        params.require(:benches).permit(:title, :description, :price, :seating, :lat, :lng)
    end
end
