class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @user = User.find_by(username: params['user_id'])
    if @user.nil?
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'User not found.' }
      end
    else
      redirect_to user_path @user.username
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @markdown_body = markdown.render @item.body
    puts "====="
    puts @markdown_body
    puts "====="
  end

  # GET /items/new
  def new
    puts "current_user => #{current_user}"
    @item = current_user.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = current_user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to user_items_path(@item.user), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to user_items_path(@item.user), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to user_items_path(@item.user), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :body, :user, :published, :private)
    end
end
