class ApplicantFieldsController < ApplicationController
  # GET /applicant_fields
  # GET /applicant_fields.json
  def index
    @applicant_fields = ApplicantField.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicant_fields }
    end
  end

  # GET /applicant_fields/1
  # GET /applicant_fields/1.json
  def show
    @applicant_field = ApplicantField.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant_field }
    end
  end

  # GET /applicant_fields/new
  # GET /applicant_fields/new.json
  def new
    @applicant_field = ApplicantField.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applicant_field }
    end
  end

  # GET /applicant_fields/1/edit
  def edit
    @applicant_field = ApplicantField.find(params[:id])
  end

  # POST /applicant_fields
  # POST /applicant_fields.json
  def create
    @applicant_field = ApplicantField.new(params[:applicant_field])

    respond_to do |format|
      if @applicant_field.save
        format.html { redirect_to @applicant_field, notice: 'Applicant field was successfully created.' }
        format.json { render json: @applicant_field, status: :created, location: @applicant_field }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applicant_fields/1
  # PUT /applicant_fields/1.json
  def update
    @applicant_field = ApplicantField.find(params[:id])

    respond_to do |format|
      if @applicant_field.update_attributes(params[:applicant_field])
        format.html { redirect_to @applicant_field, notice: 'Applicant field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_fields/1
  # DELETE /applicant_fields/1.json
  def destroy
    @applicant_field = ApplicantField.find(params[:id])
    @applicant_field.destroy

    respond_to do |format|
      format.html { redirect_to applicant_fields_url }
      format.json { head :no_content }
    end
  end
end
