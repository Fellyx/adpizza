class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  def criar_item_pedido
      @pedido = Pedido.new
      @ultimo_pedido = Pedido.last
      @item_id = params[:item_id]
      @qtd_item = params[:qtd_item_pedido]
      @vl_item_pedido = params[:vl_item_pedido]
      @item_pedido = ItensPedidos.new(item_id: @item_id, pedido_id: @ultimo_pedido,qtd_item_pedido: @qtd_item, vl_item_pedido: @vl_item_pedido)
      @item_pedido.save
  end

  # GET /pedidos/new
  def new
    @clientes_pedidos = Cliente.all
    @items_para_pedido = Item.all
    @pedido = Pedido.new
    @editando = 0
  end

  # GET /pedidos/1/edit
  def edit
    @editando = 1
    @clientes_pedidos = Cliente.all
    @items_para_pedido = Item.all

  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:cliente_id, :dt_pedido, :vl_total)
    end

    
end
