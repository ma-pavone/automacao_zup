#language: pt

Funcionalidade: Buscar produto
    Como um usuario navegando em algum e-commerce
    Eu quero buscar um determinado produto
    Para colocar e validar o produto dentro do carrinho


Contexto: Acessar loja e buscar produto
Dado que acesse o site e-commerce
Quando realizar a busca pelo <produto> 
|   produto |    bola nike    |
Entao deve exibir a pagina de busca

@quickview
Cenario: Adicionar ao carrinho pelo quickview do conferir
Quando clicar no botao conferir de algum produto
    E escolher a cor e o tamanho no modal de compra rapida
    E clicar no botao adicionar ao carrinho
    Entao deve estar relacionado na lista de Meu carrinho

@pp
Cenario: Adicionar ao carrinho pela pagina de produto
Quando clicar em algum produto
    E escolher a cor e o tamanho na pagina de produto
    E clicar no botao comprar
Então o produto deve estar listado na pagina do carrinho

@indisponivel
Cenario: Tentar adicionar um produto indisponível
Quando encontrar algum produto com tamanho ou cor indisponiveis
    E selecionar esse produto indisponivel
Então devo visualizar a mensagem de "Produto indisponível"