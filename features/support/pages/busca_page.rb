class QuickView < SitePrism::Section
    elements :selecao_cor, '[qa-automation="product-color"]' '[qa-option="available"]'
    elements :selecao_tamanho, '[qa-automation="product-size"]' '[qa-option="available"]'

    element :id_produto,'section.product-sku-selector > p > span'
    element :nome_produto, 'h1[itemprop="name"]'
    element :adicionar_carrinho, 'button#buy-button-now'
end

class BuscaPage < SitePrism::Page
    elements :itens_busca, 'div[qa-automation="search-itens"]'
    
    elements :produtos, 'div.item-card__images'
    element :filtro, 'div.filters__container'
     # elements :botoes_conferir, 'div.item-card__images__buttons > button#quick-view-button'
    element :botao_conferir, '[qa-automation="search-buy-button"]'
    element :mini_cart, 'a[qa-automation="home-cart-button"]'
    section :quickview, QuickView, 'div.is-quickview'
end
