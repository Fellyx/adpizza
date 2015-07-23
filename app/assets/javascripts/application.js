// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

item_id = [];	
qtd_item_pedido = [];
vl_item_pedido = [];

function pegarvaloritem(handler){
	//Como todas as linhas adicionandas possuem inputs com o mesmo id da padrao, eu sei qual estou usando pois enviei e recebi em handler
	// Usando o handler eu manipulo a mais próxima "closest"
	//Limpo os campos qtd_item e vl_item_pedido
	$(handler).closest('tr').find('td.qtd_item').find('input#qtd_item').val("");
	tirarvaloranterior(handler);		
	$(handler).closest('tr').find('td.vl_item_pedido').find('input#vl_item_pedido').val("");

	//Procura o campo preco_item_atual mais proximo para colocar o valor
	$(handler).closest('tr').find('td.preco_item_atual').find('input#preco_item_atual').val($('#vl_item_'+$(handler).val()).val());


}



function removerlinhatabela(handler){
	//Como todas as linhas adicionandas possuem inputs com o mesmo id da padrao, eu sei qual estou usando pois enviei e recebi em handler
	// Usando o handler eu manipulo a mais próxima "closest"
	var tr = $(handler).closest('tr');
	tirarvaloranterior(handler);
	//Removo a linha desejada
	tr.fadeOut(400, function(){
		tr.remove();
	});

	return false;
}

function adicionarlinhatabela(handler){
	//Como todas as linhas adicionandas possuem inputs com o mesmo id da padrao, eu sei qual estou usando pois enviei e recebi em handler
	// Usando o handler eu manipulo a mais próxima "closest"
	var novalinha = $("<tr>");
	var colunas = "";

	colunas += '<td class = "item"><select name="" id="item" onChange = "pegarvaloritem(this)">';
	//Pego o valor do select padrao e coloco no novo select
	$("#item option").each(function(){
		colunas += '<option value="'+$(this).val()+'">'+$(this).text()+'</option>';
		
	});
	colunas += '</select></td>';
	colunas += '<td class = "preco_item_atual"><input type = "text" id = "preco_item_atual"  readonly = "readonly" value="" ></td>';
	colunas += '<td class="qtd_item"><input type = "number" id = "qtd_item" onkeyup="calcularprecoitem(this)" value=""></td>';
	colunas += '<td class = "vl_item_pedido"><input type = "text" id = "vl_item_pedido" readonly = "readonly" value=""></td>';
	colunas += '<td><input type ="button" onclick = "removerlinhatabela(this)" value ="Remover" ></td>';

	
	novalinha.append(colunas);
	//Adiciono a nova linha
	$('#tabela-itens-pedido').append(novalinha);

	return false;

}

function calcularprecoitem(handler){

	tirarvaloranterior(handler);
	//Como todas as linhas adicionandas possuem inputs com o mesmo id da padrao, eu sei qual estou usando pois enviei e recebi em handler
	// Usando o handler eu manipulo a mais próxima "closest"
	//Pego o valor do qtd_item e coloco na variavel vl1; 
	var vl1 = $(handler).val();
	
	//Pego o valor do preco_item_atual e coloco em vl2;
	var vl2 = $(handler).closest('tr').find('td.preco_item_atual').find('input#preco_item_atual').val();
	
	//Faço o Calculo
	var produto = vl1 * vl2;
	
	//Coloco o resultado em vl_item_pedido
	$(handler).closest('tr').find('td.vl_item_pedido').find('input#vl_item_pedido').val(produto);

	var antigo_valor_total = $('#pedido_vl_total').val();
	if(antigo_valor_total != ""){
		antigo_valor_total = parseInt(antigo_valor_total);
	}
	
	
	var valor_do_item_proximo = $(handler).closest('tr').find('td.vl_item_pedido').find('input#vl_item_pedido').val();
	valor_do_item_proximo = parseInt(valor_do_item_proximo);
	var valor_atual = antigo_valor_total + valor_do_item_proximo;
	$('#pedido_vl_total').val(valor_atual);

}

function tirarvaloranterior(handler){
	if($('#pedido_vl_total').val() != ""){

		var paratirar = $(handler).closest('tr').find('td.vl_item_pedido').find('input#vl_item_pedido').val();
		if(paratirar != ""){
			var pedido_vl_total = parseInt($('#pedido_vl_total').val());
			paratirar = parseInt(paratirar);
			pedido_vl_total = pedido_vl_total - paratirar;
			$('#pedido_vl_total').val(pedido_vl_total);
		}	

	}	

}

function pegarvalorestabelaitens(){

	//Pegar Valores Item Do Pedido
	$('#tabela-itens-pedido > tbody > tr > td.preco_item_atual > input#preco_item_atual').each(function(i){
		item_id[i] = $(this).val();
	});

	//Pegar Valores Quantidade Item Do Pedido
	$('#tabela-itens-pedido > tbody > tr > td.qtd_item > input#qtd_item').each(function(i){
		qtd_item_pedido[i] = $(this).val();
	});

	//Pegar Valores Item Pedido
	$('#tabela-itens-pedido > tbody > tr > td.vl_item_pedido > input#vl_item_pedido').each(function(i){
		vl_item_pedido[i] = $(this).val();
	});

	
}

function cadastrar_itens(){
	pegarvalorestabelaitens();
	for(var i = 0;i < item_id.length;i++){
		 
		$.ajax({
			type: "get",
			url: "http://localhost:3000/criar_item_pedido",
			data: { item_id: item_id[i], qtd_item_pedido: qtd_item_pedido[i], vl_item_pedido: vl_item_pedido[i]}
		});
	}
	
	$('#guardar_pedido').show();
};