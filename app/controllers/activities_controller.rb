class ActivitiesController < ApplicationController
  before_action :set_destination
    before_action :set_activity, only: [:show, :edit, :update, :destroy]

    def new
      @activity = Activity.new
      render partial: "form"
    end

    def edit
      render partial: "form"
    end

    def create
      @activity = @destination.activities.new(activity_params)
      if @activity.save
        redirect_to list_destination_path(@destination.list_id, @destination)
      else
        render :new
      end
    end

    def update
      if @activity.update(activity_params)
        redirect_to [@destination, @activity]
      else
        render :edit
      end
    end

    def destroy
      @activity.destroy
      redirect_to destination_activity_path
    end

    private
      def set_destination
        @destination = Destination.find(params[:destination_id])
      end

      def set_activity
        @activity = Activity.find(params[:id])
      end

      def activity_params
        params.require(:activity).permit(:body)
      end
  end
