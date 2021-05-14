Feature: Teste backend

    @Positivo
    Scenario: Teste 1 - Teste API retornando resultado OK
        Given eu uso o ambiente de testes de API 
        And eu uso a rota "/3/search/person"
        And eu defino o query parameter "api_key" como "c13d92e8fd77e67e081ec7b217fc941f"
        And eu defino o query parameter "query" como "Sérgio Mallandro"
        When envio uma requisição GET
        And eu salvo o valor do campo "results/0/known_for/1/original_title" do response na variável temporária "originalTitle"
        And eu imprimo a duração da requisição
        Then o status code deve ser 200
        And o valor salvo na variável temporária "originalTitle" deve ser "Lua de Cristal"

    @Positivo
    Scenario: Teste 2 - Teste API retornando resultado NOK
        Given eu uso o ambiente de testes de API 
        And eu uso a rota "/3/search/personn"
        When envio uma requisição GET
        Then o status code deve ser 401

    @Positivo
    Scenario: Teste 3 - Como usuário, eu quero pegar o ID do filme Lua de Cristal do Sérgio Malandro e comparar em duas APIs
        Given eu uso o ambiente de testes de API 
        And eu uso a rota "/3/search/person"
        And eu defino o query parameter "api_key" como "c13d92e8fd77e67e081ec7b217fc941f"
        And eu defino o query parameter "query" como "Sérgio Mallandro"
        And envio uma requisição GET
        And o status code deve ser 200
        And eu salvo o valor do campo "results/0/known_for/1/id" do response na variável temporária "movie_id"
        And eu salvo o valor do campo "results/0/known_for/1/original_title" do response na variável temporária "originalTitle"
        And eu uso o ambiente de testes de API
        And eu uso a rota "/3/movie/${movie_id}"
        And eu defino o query parameter "api_key" como "c13d92e8fd77e67e081ec7b217fc941f"
        And eu defino o query parameter "language" como "en-US"
        And envio uma requisição GET
        And o status code deve ser 200
        And o valor salvo na variável temporária "originalTitle" deve ser "Lua de Cristal"
    
    @Positivo
    Scenario: Teste 4 - Um usuário não autenticado não deve conseguir ver os resultados quando procurar por um filme
        Given eu uso o ambiente de testes de API 
        And eu uso a rota "/3/movie/45179"
        And eu defino o query parameter "api_key" como "0"
        And eu defino o query parameter "language" como "en-US"
        And envio uma requisição GET
        And o status code deve ser 401

    @Positivo
    Scenario: Teste 4 - Um usuário não autenticado não deve conseguir ver os resultados quando procurar por uma pessoa
        Given eu uso o ambiente de testes de API 
        And eu uso a rota "/3/search/person"
        And eu defino o query parameter "api_key" como "0"
        And eu defino o query parameter "query" como "Sérgio Mallandro"
        When envio uma requisição GET
        Then o status code deve ser 401

    @Positivo
    Scenario Outline: Teste 5 - Validar que o retorno dos trending semanais são movie, tv e person respectivamente
        Given eu uso o ambiente de testes de API
        And eu uso a rota "/3/trending/<media_type>/<time_window>"
        And eu defino o query parameter "api_key" como "c13d92e8fd77e67e081ec7b217fc941f"
        When envio uma requisição GET
        And eu salvo o valor do campo "results/0/media_type" do response na variável temporária "mediaType"
        Then o status code deve ser 200
        And o valor salvo na variável temporária "mediaType" deve ser "<media_type>"

        Examples:
        | media_type | time_window | 
        | movie      | week        |
        | tv         | week        |
        | person     | week        |

    @Positivo
    Scenario: Teste 6 - Um usuário não autenticado não deve conseguir ver os resultados quando procurar pelos trendings
        Given eu uso o ambiente de testes de API 
        And eu uso a rota "/3/trending/all/day"
        And eu defino o query parameter "api_key" como "0"
        When envio uma requisição GET
        Then o status code deve ser 401

    @Positivo
    Scenario: Teste 7 - A primeira API deve retornar Brad Pitt na primeira página como uma das pessoas mais populares e o resultado deve ser utilizado para fazer a busca na segunda API
        Given eu uso o ambiente de testes de API
        And eu uso a rota "/3/person/popular"
        And eu defino o query parameter "api_key" como "c13d92e8fd77e67e081ec7b217fc941f"
        And eu defino o query parameter "language" como "en-US"
        And eu defino o query parameter "page" como "1"
        When envio uma requisição GET
        And o status code deve ser 200
        And eu salvo o valor do campo "results/10/name" do response na variável temporária "name"
        And eu salvo o valor do campo "results/10/id" do response na variável temporária "id"
        And eu imprimo o valor da variável temporária "name"
        And eu imprimo o valor da variável temporária "id"
        And eu uso o ambiente de testes de API
        And eu uso a rota "/3/person/${id}"
        And eu defino o query parameter "api_key" como "c13d92e8fd77e67e081ec7b217fc941f"
        And eu defino o query parameter "language" como "en-US"
        And envio uma requisição GET
        And o status code deve ser 200
        And eu salvo o valor do campo "/id" do response na variável temporária "id2"
        And eu imprimo o valor da variável temporária "id2"
        Then o valor salvo na variável temporária "id" deve igual ao da variável temporária "id2"
