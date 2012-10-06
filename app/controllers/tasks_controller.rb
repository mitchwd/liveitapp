class TasksController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    # Before_filter authenticate_user! checks that user is logged in first!
    @task.user_id = current_user.id || nil
    begin
      # Check for valid entry record
      Entry.find(params[:id])
      @task.entry_id = params[:id] || nil

      respond_to do |format|
        if @task.save
          format.html { redirect_to entry_path(@task.entry_id), notice: 'Task was successfully created.' }
          format.json { render json: @task.entry, status: :created, location: @task.entry }
        else
          format.html { redirect_to entry_path(@task.entry_id), notice: "You have already completed this entry." }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    rescue ActiveRecord::RecordNotFound
      @task.errors.add :entry, "Entry is invalid"
      respond_to do |format|
        format.html { redirect_to entries_path, notice: "Entry is invalid" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
end
