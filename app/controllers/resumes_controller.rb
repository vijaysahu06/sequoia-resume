class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def show;end

  def new
    @resume = Resume.new
    @resume.educations.new
    @resume.experiences.new
  end

  def edit;end

  def create
    @resume = Resume.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:name, :email, :phone, :reffered_by, :what_do_you_like, :willing_to_relocate, :preferred_location, :experience_in_years, :experience_in_months, :level, :industry, :additional_industry, :function, :linkedin_link, :resume, experiences_attributes: [:id, :title, :company, :location, :start_date, :end_date, :is_current, :description, :_destroy], educations_attributes: [:id, :university, :qualification, :year, :_destroy])
    end
end
