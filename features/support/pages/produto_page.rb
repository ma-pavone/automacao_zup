class ProdutoPage < SitePrism::Page

    element :descricao, 'section#features'
    element :sessao_compra, 'section#buy-box'

    elements :selecao_cor, '[qa-automation="product-color"]' '[qa-option="available"]'
    elements :selecao_tamanho, '[qa-automation="product-size"]' '[qa-option="available"]'
    element :tamanho_unico, '[data-ga-element="radio_Único"]'


    element :id_produto, '[qa-automation="product-sku"]'
    element :botao_comprar, '[qa-automation="product-buy-button"]'
end
