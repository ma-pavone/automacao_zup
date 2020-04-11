class Seletor_cor < SitePrism::Section
    elements :selecao_cor,  '[qa-option="available"]'
    elements :cor_indisponivel, '[qa-option="unavailable"]'
end
class Seletor_tamanho < SitePrism::Section
    elements :selecao_tamanho, '[qa-option="available"]'
    elements :tamanho_indisponivel, '[qa-option="unavailable"]'
end




class ProdutoPage < SitePrism::Page

    element :descricao, 'section#features'
    element :sessao_compra, 'section#buy-box'
    element :id_produto, '[qa-automation="product-sku"]'
    element :botao_comprar, '[qa-automation="product-buy-button"]'
    element :botao_aviseme, '.tell-me-button'

    section :seletor_cor, Seletor_cor, 'section.product-sku-selector'
    section :seletor_tamanho, Seletor_tamanho, 'section.product-size-selector'
end
