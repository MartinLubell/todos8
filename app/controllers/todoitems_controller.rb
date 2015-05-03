class TodoitemsController < ApplicationController
  before_action :set_todolist, except: :update_done

  # GET /todoitems
  # GET /todoitems.json
  def index
    @todoitems = @todolist.todoitems.paginate(page: params[:page], per_page: 5)
  end
  
  # GET /todoitems/1
  # GET /todoitems/1.json
  def show
    @todoitem = @todolist.todoitems.find(params[:id])
  end
  
  # GET /todoitems/new
  def new
    @todoitem = @todolist.todoitems.new
  end
  
  def edit
    @todoitem = @todolist.todoitems.find(params[:id])
  end
  
  def create
    @todoitem = @todolist.todoitems.new(todoitem_params)
    if @todoitem.save
      redirect_to @todolist, notice: "To Do item successfully added!"
    else
      redirect_to @todolist, alert: "Unable to add To Do item!"
    end
  end
  
  def update
    @todoitem = @todolist.todoitems.find(params[:id])
    if @todoitem.update(todoitem_params)
      redirect_to @todolist, notice: 'TodoItem was successfully updated.'
    else
      render :edit, alert: "Unable to update To Do item!"
    end
  end

  def update_done
    logger.info("This should be valid: #{params[:todoitem_id]}")
    #logger.info("This should be true: #{@todolist_id}")
    @todoitem = Todoitem.find(params[:todoitem_id])
    @todoitem.done = true
    #logger.info("This should be true: #{@todoitem.task}")
    @todoitem.save

    @dom = params[:todoitem_dom_id]
    respond_to do |format|
      format.js
    end
    #render 'update_done.js.erb'
  end

  def destroy
    @todoitem = @todolist.todoitems.find(params[:id])
    @todoitem.destroy
    redirect_to @todolist, notice: "To Do item deleted!"
  end

  private
    def set_todolist
      @todolist = Todolist.find(params[:todolist_id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def todoitem_params
      params.require(:todoitem).permit(:task_title, :description, :due_date, :done)
    end
end
