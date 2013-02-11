class ContextsController < ApplicationController
  def new
    @context = Context.new
  end

  def show
    @context = Context.find params[:id]
    @activities = @context.activities.where :created_at => (Time.now.beginning_of_week..Time.now)
  end

  def index
    @contexts = Context.active
    @archived_contexts = Context.archived
  end

  def edit
    @context = Context.find params[:id]
  end

  def create
    context = Context.new params[:context]

    respond_to do |format|
      if context.save!
        flash[:notice] = 'Context created'
        format.html { redirect_to contexts_path }
      else
        format.html { redirect_to new_context_path }
      end
    end
  end

  def shuffle
    Context.shuffle_positions
    redirect_to contexts_path
  end

  def statistics
    @contexts = Context.all
    @weeks = []
    @weeks[0] = Time.now.beginning_of_week..Time.now
    (1..4).each do |i|
      @weeks[i] = (@weeks[i-1].first-7.days)..(@weeks[i-1].first)
    end
    @weeks.reverse!
  end

  def update
    @context = Context.find(params[:id])

    if @context.update_attributes(params[:context])
      redirect_to @context
    else
      render :action => "edit"
    end
  end

  def archive
    @context = Context.find(params[:id])
    path = @context.archived? ? context_path(@context) : context_path(@context.next)
    if @context.archived?
      @context.unarchive
      redirect_to path
    else
      @context.archive
      redirect_to path
    end
  end

end
