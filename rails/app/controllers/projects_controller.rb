class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # = GET /projects
  def index
    @projects = Project.all.order(updated_at: :desc)
  end


  # = GET /projects/1
  def show
  end


  # = GET /projects/new
  def new
    @project = Project.new
  end


  # = GET /projects/1/edit
  def edit
  end


  # = POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # = PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # = DELETE /projects/1
  def destroy
    @project.destroy!
    redirect_to projects_path, notice: "Project was successfully destroyed.", status: :see_other
  end


  private
    def set_project
      @project = Project.find(params.expect(:id))
    end

    def project_params
      params.expect(project: [:name])
    end
end
