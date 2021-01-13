Feature: Teste Login

    @Negativo
    Scenario: Teste 1 - Acessar o Google
        Given acesso o Google
        When clico na barra de busca
        Then escrevo qualquer texto

    @Negativo
    Scenario: Teste 2 - Preenchendo a barra de pesquisa com texto
        Given acesso o Google
        When clico na barra de busca
        Then escrevo qualquer texto

    @Positivo
    Scenario: Teste 3 - Pesquisando algo no Google
        Given acesso o Google
        When clico na barra de busca
        Then escrevo qualquer texto
        And pressiono enter

    @Positivo
    Scenario: Teste 4 - Pesquisa "estou com sorte"
        Given acesso o Google
        Then clico em estou com sorte
