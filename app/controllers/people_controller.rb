class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find_by(:id => params[:id])
  end

  def create
    @person = Person.create(person_params)
    render :show
  end

  def update
    @person = Person.find_by(:id => params[:id])
    @person.update(person_params)
    render :show
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
