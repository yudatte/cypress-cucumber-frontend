Feature: Login site CWI

    @Positivo
    Scenario: Teste 1 - Visualizar opção de recuperar senha esquecida
        Given acesso o site CWI
        When acesso a pagina de login
        Then devo visualizar botao de recuperar senha esquecida

    @Negativo
    Scenario: Teste 2 - Visualizar opção de recuperar senha esquecida
        Given acesso o site CWI
        When acesso a pagina de login
        Then devo visualizar botao de recuperar senha esquecida