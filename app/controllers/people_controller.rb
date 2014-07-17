class PeopleController < ApplicationController

  def index
    @people = Person.all
    render :json => @people
  end

  def show
    @person = Person.find_by(:id => params[:id])
    if @person
      render :json => @person
    else
      render :json => "Person not found", :status => 404
    end
  end
end
