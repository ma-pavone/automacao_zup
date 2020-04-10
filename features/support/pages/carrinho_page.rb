class CarrinhoPage < SitePrism::Page

    element :lista_carrinho, 'div.cart__items'
    element :resumo_compra, 'div.cart__summary'

    elements :lista_id_produtos, 'span[qa-auto="product-sku"]'
end