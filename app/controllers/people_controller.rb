class PeopleController < ApplicationController
  respond_to :json, :xml

  def index
    @people = Person.all
    respond_with(@people)
  end

  def show
    @person = Person.find_by(:id => params[:id])
    if @person
      respond_with(@person)
    else
      respond_with({message: 'Person not found'}, status: 404)
    end
  end

  def create
    @person = Person.create(person_params)
    respond_with(@person)
  end

  def update
    @person = Person.find_by(:id => params[:id])
    @person.update(person_params)
    respond_with(@person)
  end

  def destroy
    @person = Person.find_by(:id => params[:id])
    @person.destroy if @person
    respond_with(@person)
  end

  private

  def person_params
    params.require(:person).permit(:prefix, :first_name, :middle_name, :last_name, :suffix, :email, :phone)
  end
end
