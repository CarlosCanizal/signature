class FormFieldsController < ApplicationController

  require 'json'

  def position
    fields = params[:fields]
    #fields = fields.to_json
    #fields = JSON.parse(fields.to_json)

    fields.each_with_index do |field,index|
      field = fields[index.to_s]
      form_id = 1
      field_id = fields[index.to_s]["field_id"]
      ####
      field["page"] = 1;

      if FormField.where(:form_id => form_id, :field_id => field_id).present?
        @form_field = FormField.where(:form_id => form_id, :field_id => field_id).last()
        @form_field.update_attributes(field)
      else
        #####
        field["form_id"] = 1;
        @form_field = FormField.create(field)
      end
      @form_field.save
    end

    respond_to do |format|
      format.html
      format.json { render json: fields[0]   }
    end
  end

  # GET /form_fields
  # GET /form_fields.json
  def index
    @form_fields = FormField.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @form_fields }
    end
  end

  # GET /form_fields/1
  # GET /form_fields/1.json
  def show
    @form_field = FormField.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form_field }
    end
  end

  # GET /form_fields/new
  # GET /form_fields/new.json
  def new
    @form_field = FormField.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @form_field }
    end
  end

  # GET /form_fields/1/edit
  def edit
    @form_field = FormField.find(params[:id])
  end

  # POST /form_fields
  # POST /form_fields.json
  def create
    @form_field = FormField.new(params[:form_field])

    respond_to do |format|
      if @form_field.save
        format.html { redirect_to @form_field, notice: 'Form field was successfully created.' }
        format.json { render json: @form_field, status: :created, location: @form_field }
      else
        format.html { render action: "new" }
        format.json { render json: @form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /form_fields/1
  # PUT /form_fields/1.json
  def update
    @form_field = FormField.find(params[:id])

    respond_to do |format|
      if @form_field.update_attributes(params[:form_field])
        format.html { redirect_to @form_field, notice: 'Form field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_fields/1
  # DELETE /form_fields/1.json
  def destroy
    @form_field = FormField.find(params[:id])
    @form_field.destroy

    respond_to do |format|
      format.html { redirect_to form_fields_url }
      format.json { head :no_content }
    end
  end
end
