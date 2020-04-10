Dado("que acesse o site e-commerce") do
  @home.load
  expect(@home).to have_busca
  expect(@home).to have_menu
  expect(@home).to have_banner
  expect(@home).to have_footer
end

Quando("realizar a busca pelo <produto>") do |produto|
  @home.busca.barra_busca.set produto.rows_hash[:produto]
  @home.busca.botao_busca.click
end

Entao("deve exibir a pagina de busca") do 
  expect(@busca).to have_filtro
  expect(@busca).to have_itens_busca
  sleep 5
end

Quando("clicar no botao conferir de algum produto") do
  produto = @busca.itens_busca.sample
  produto.hover
  sleep 1
  within(produto) do
    @busca.botao_conferir.click
  end
end

Quando("escolher a cor e o tamanho no modal de compra rapida") do
  @busca.quickview.selecao_cor.sample.click
  @busca.quickview.selecao_tamanho.sample.click
end

Quando("clicar no botao adicionar ao carrinho") do
  @id_produto_quickview = @busca.quickview.id_produto.text
  @busca.quickview.adicionar_carrinho.click
  sleep 2
end

Então("deve estar relacionado na lista de Meu carrinho") do
  @busca.mini_cart.click
  $lista_produtos = Array.new
  expect(@carrinho).to have_lista_carrinho
  expect(@carrinho).to have_resumo_compra
  
  @carrinho.lista_id_produtos.each do |id_produto|
    $lista_produtos << id_produto.text.tr('# ', '')
  end
  expect($lista_produtos.include?(@id_produto_quickview)).to be_truthy
end

Quando("clicar em algum produto") do
  @busca.produtos.sample.click
  # @busca.itens_busca.sample.click
end

Quando("escolher a cor e o tamanho na pagina de produto") do
  expect(@produto).to have_descricao
  expect(@produto).to have_sessao_compra
  @produto.selecao_cor.sample.click
  byebug
  sleep 1
  @produto.selecao_tamanho.sample.click
end

Quando("clicar no botao comprar") do
  @id_produto = @produto.id_produto.text
  @produto.botao_comprar.click
end

Então("o produto deve estar listado na pagina do carrinho") do
  $lista_produtos.clear()
  expect(@carrinho).to have_lista_carrinho
  expect(@carrinho).to have_resumo_compra
  @carrinho.lista_id_produtos.each do |id_produto|
    $lista_produtos << id_produto.text.tr('# ', '')
  end
  expect($lista_produtos.include?(@id_produto)).to be true
  byebug
end

Quando("clicar em algum produto com {string} ou {string} indisponiveis") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("selecionar o icone indisponivel") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("devo visualizar a mensagem de {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end