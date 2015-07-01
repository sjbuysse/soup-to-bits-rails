class SoupsController < ApplicationController
    before_action :fetch_soup, only: [:show, :edit, :destroy, :update, :toggle_featured]

    def index
        @soups = Soup.all
        respond_to do |format|
            format.json {render json: @soups}
        end
    end

    def show
        respond_to do |format|
            format.html #this will render the normal show.html.erb
            format.json {render json: @soup}
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def toggle_featured
        @soup.toggle!(:featured)
        flash[:notice] = "featured attribute has been toggled"
        redirect_to(@soup)
    end

    def secret_soups
        session[:vip] = true
        redirect_to root_path
    end
    private 
    def fetch_soup
        @soup = Soup.find(params[:id])
    end
end

