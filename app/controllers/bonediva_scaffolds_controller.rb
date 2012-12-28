class BonedivaScaffoldsController < ApplicationController
  # GET /bonediva_scaffolds
  # GET /bonediva_scaffolds.json
  def index
    @bonediva_scaffolds = BonedivaScaffold.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bonediva_scaffolds }
    end
  end

  # GET /bonediva_scaffolds/1
  # GET /bonediva_scaffolds/1.json
  def show
    @bonediva_scaffold = BonedivaScaffold.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bonediva_scaffold }
    end
  end

  # GET /bonediva_scaffolds/new
  # GET /bonediva_scaffolds/new.json
  def new
    @bonediva_scaffold = BonedivaScaffold.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bonediva_scaffold }
    end
  end

  # GET /bonediva_scaffolds/1/edit
  def edit
    @bonediva_scaffold = BonedivaScaffold.find(params[:id])
  end

  # POST /bonediva_scaffolds
  # POST /bonediva_scaffolds.json
  def create
    @bonediva_scaffold = BonedivaScaffold.new(bonediva_scaffold_params)

    respond_to do |format|
      if @bonediva_scaffold.save
        format.html { redirect_to @bonediva_scaffold, notice: 'Bonediva scaffold was successfully created.' }
        format.json { render json: @bonediva_scaffold, status: :created, location: @bonediva_scaffold }
      else
        format.html { render action: "new" }
        format.json { render json: @bonediva_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonediva_scaffolds/1
  # PATCH/PUT /bonediva_scaffolds/1.json
  def update
    @bonediva_scaffold = BonedivaScaffold.find(params[:id])

    respond_to do |format|
      if @bonediva_scaffold.update_attributes(bonediva_scaffold_params)
        format.html { redirect_to @bonediva_scaffold, notice: 'Bonediva scaffold was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bonediva_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonediva_scaffolds/1
  # DELETE /bonediva_scaffolds/1.json
  def destroy
    @bonediva_scaffold = BonedivaScaffold.find(params[:id])
    @bonediva_scaffold.destroy

    respond_to do |format|
      format.html { redirect_to bonediva_scaffolds_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def bonediva_scaffold_params
      params.require(:bonediva_scaffold).permit(:description, :image, :title)
    end
end
