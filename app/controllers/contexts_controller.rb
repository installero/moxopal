class ContextsController < ApplicationController
  def new
    @context = Context.new
  end

  def show
  end

  def index
  end

  def edit
  end

  def create
    context = Context.new(params[:context])

    respond_to do |format|
      if context.save
        flash[:notice] = 'Context created'
        format.html { redirect_to context }
      else
        format.html { redirect_to new_context_path }
      end
    end
  end

end
