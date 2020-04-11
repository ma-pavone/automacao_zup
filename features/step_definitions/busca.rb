Dado("que acesse o site e-commerce") do
  @home.load # ler home page
  expect(@home).to have_busca
  expect(@home).to have_menu
  expect(@home).to have_banner #verificar principais features
  expect(@home).to have_footer
end

Quando("realizar a busca pelo <produto>") do |produto|
  @home.busca.barra_busca.set produto.rows_hash[:produto] # utiliza o produto exemplo na barra de busca
  @home.busca.botao_busca.click # clica em pesquisa
end

Entao("deve exibir a pagina de busca") do 
  expect(@busca).to have_filtro
  expect(@busca).to have_itens_busca
  sleep 4
end

Quando("clicar no botao conferir de algum produto") do
  produto = @busca.itens_busca.sample #a loca um produto randomico da lista de pesquisa
  produto.hover # exibe o botao necessario para click
  sleep 1
  within(produto) do  # dentro do escopo desse produto,
    @busca.botao_conferir.click # click no botao para acessar o quickview
  end
end

Quando("escolher a cor e o tamanho no modal de compra rapida") do
  @busca.quickview.selecao_cor.sample.click # escolhe uma cor valida aleatoria
  @busca.quickview.selecao_tamanho.sample.click # escolhe um tamanho valido aleatorio
end

Quando("clicar no botao adicionar ao carrinho") do
  @id_produto_quickview = @busca.quickview.id_produto.text # pega o texto do ID do produto para validacao posterior
  @busca.quickview.adicionar_carrinho.click # click no botao dentro do quickview
  sleep 3
end

Então("deve estar relacionado na lista de Meu carrinho") do
  if page.driver.options[:options].args.include?('--headless') # valida se estamos em modo headless para acessar carrinho de forma diferente
    @carrinho.load 
    else @busca.mini_cart.click # click no mini carrinho - header
  end

  expect(@carrinho).to have_lista_carrinho # valida se estamos no checkout
  expect(@carrinho).to have_resumo_compra
  
  @carrinho.ler_lista_produtos(@carrinho.lista_id_produtos) # utiliza metodo para colocar texto dos IDs dos produtos na lista em um vetor

  expect($lista_produtos.include?(@id_produto_quickview)).to be_truthy # Valida se o produto que colocamos no carrinho esta correto com o da lista
end

Quando("clicar em algum produto") do
  within(@busca.grid) do
    @busca.itens_busca[0].click #escolhe o primeiro produto para entrar na pagina de produto
  # @busca.produtos.sample.click
  end
end

Quando("escolher a cor e o tamanho na pagina de produto") do
  expect(@produto).to have_descricao
  expect(@produto).to have_sessao_compra
  @produto.seletor_cor.selecao_cor.sample.click # dentro do seletor de sku, escolhe uma cor aleatoria valida
  sleep 1
  @produto.seletor_tamanho.selecao_tamanho.sample.click # dentro do seletor de tamanho, escolhe um tamanho valido
end

Quando("clicar no botao comprar") do
  @id_produto = @produto.id_produto.text # pega o texto do ID do produto para validacao posterior
  @produto.botao_comprar.click # click no botao comprar pela pagina de produto
end

Então("o produto deve estar listado na pagina do carrinho") do #realiza as mesmas funcoes do THEN passado
  expect(@carrinho).to have_lista_carrinho
  expect(@carrinho).to have_resumo_compra

  @carrinho.ler_lista_produtos(@carrinho.lista_id_produtos)

  expect($lista_produtos.include?(@id_produto)).to be_truthy
end

Quando("encontrar algum produto com tamanho ou cor indisponiveis") do
  within(@busca.grid) do
  @busca.produtos_indisponiveis.sample.click # seleciona produto aleatorio de uma lista pre estabelecida com produtos indisponiveis
  end
end

Quando("selecionar esse produto indisponivel") do
  @produto.seletor_cor.cor_indisponivel.sample.click # seleciona alguma cor que esta indisponivel no momento
end

Então("devo visualizar a mensagem de {string}") do |aviso|
  assert_selector('div.tell-me-button-wrapper > strong', text: aviso) # Valida sea sessao de indisponivel esta exibida
  expect(@produto).to have_botao_aviseme
end