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

  def update
    @person = Person.find_by(:id => params[:id])
    @person.update(person_params)
    respond_with(@person)
    # respond_to do |format|
    #   format.json { render :json => @person }
    #   format.xml { render :xml => @person }
    # end
  end

  def destroy
    @person = Person.find_by(:id => params[:id])
    @person.destroy
    respond_with(@person)
  end

  private

  def person_params
    return params.require(:person).permit(:prefix, :first_name, :middle_name, :last_name, :email, :phone)
  end
end
