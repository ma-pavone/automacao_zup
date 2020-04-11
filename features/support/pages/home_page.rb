class Busca < SitePrism::Section
    element :barra_busca, '#search-input'
    element :botao_busca, 'button[qa-automation="home-search-button"]'
end


class HomePage < SitePrism::Page
    set_url '/'

    element :menu, 'div.navbar__container'
    element :banner, 'main#content'

    elements :footer, 'div.container-most-wanted'
    
    section :busca, Busca, 'section.search'
end

