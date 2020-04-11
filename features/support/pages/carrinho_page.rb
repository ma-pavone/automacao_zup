class CarrinhoPage < SitePrism::Page
    set_url '/cart'

    element :lista_carrinho, 'div.cart__items'
    element :resumo_compra, 'div.cart__summary'

    elements :lista_id_produtos, 'span[qa-auto="product-sku"]'
    
    def ler_lista_produtos(cart)
        $lista_produtos = Array.new
        cart.each do |id_produto|
            $lista_produtos << id_produto.text.tr('# ', '')
        end
    end
end