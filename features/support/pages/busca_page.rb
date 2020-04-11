class QuickView < SitePrism::Section
    elements :selecao_cor, '[qa-automation="product-color"]' '[qa-option="available"]'
    elements :selecao_tamanho, '[qa-automation="product-size"]' '[qa-option="available"]'

    element :id_produto,'section.product-sku-selector > p > span'
    element :nome_produto, 'h1[itemprop="name"]'
    element :adicionar_carrinho, 'button#buy-button-now'
end

class BuscaPage < SitePrism::Page
    elements :itens_busca, '[qa-automation="search-itens"]'    
    elements :produtos_indisponiveis, 'span[itemprop="name"]', text: 'Nike Paris Saint-Germain'

    element :grid, 'section.search-list'
    element :filtro, 'div.filters__container'
    element :botao_conferir, '[qa-automation="search-buy-button"]'
    element :mini_cart, '[qa-automation="home-cart-button"]'

    section :quickview, QuickView, 'div.is-quickview'
end
