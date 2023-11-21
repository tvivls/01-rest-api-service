class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Program not found' }, status: :not_found
  end

  def search_popular_programs
    term = params[:term]

    if term.blank?
      render json: { error: 'Search term cannot be blank' }, status: :unprocessable_entity
      return
    end

    @popular_programs = Program.where('title ILIKE ?', "%#{term}%")
                               .joins(:subscriptions)
                               .group('programs.id')
                               .order('COUNT(subscriptions.id) DESC')
  end
end
