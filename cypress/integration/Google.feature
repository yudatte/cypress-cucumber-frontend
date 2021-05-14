Feature: Teste Google

    @Positivo
    Scenario: Teste 1 - Acessar o Google
        Given acesso o Google
        When clico na barra de busca
        Then escrevo qualquer texto

    @Positivo
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

    @Negativo
    Scenario: Teste 4 - Pesquisa "estou com sorte"
        Given acesso o Google
        Then clico em estou com sorte

    @Negativo
    Scenario: Teste 5 - Teste API retornando resultado OK
        Given eu uso o ambiente de testes de API 
        And eu uso a rota "/3/search/person"
        And eu defino o query parameter "api_key" como "c13d92e8fd77e67e081ec7b217fc941f"
        And eu defino o query parameter "query" como "Sérgio Mallandro"
        When envio uma requisição GET
        And eu salvo o valor do campo "results/0/known_for/1/original_title" no response na variável temporária "originalTitle"
        And eu imprimo a duração da requisição
        Then o status code deve ser 200
        And o valor salvo na variável temporária "originalTitle" deve ser "Xuxa - Lua de Cristal"
