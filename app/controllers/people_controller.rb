class PeopleController < ApplicationController

  def index
    @people = Person.all
    respond_with(@people)
  end

  def show
    @person = Person.find_by(:id => params[:id])
    respond_with(@person)
  end

  def create
    @person = Person.create(person_params)
    respond_with(@person)
  end

  private

  def person_params
    return params.require(:person).permit(:prefix, :first_name, :middle_name, :last_name, :email, :phone)
  end
end
