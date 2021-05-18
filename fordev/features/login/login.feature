@fordev
Feature: Login
    Como um cliente
    Quero poder acessar minha conta e me manter logado
    Para que eu possa ver e responder enquetes de forma rápida

    Scenario (Cenário): Credenciais Válidas
        Given (Dado) que o cliente informou credenciais válidas
        When (Quando) solicitar para fazer login <login>
        Then (Então) o sistema deve enviar ao usuário para a tela de pesquisas
        And (e) manter o usuário conectado

    Scenario (Cenário): Credenciais Inválidas
        Given (Dado) que o cliente informou credenciais inválidas
        When (Quando) solicitar para fazer login <login>
        Then (Então) o sistema deve retornar uma mensagem de erro

    Scenario Outline:
        

Examples: 
|  0  |  0  |  0  |
|  0  |  0  |  0  |
|  0  |  0  |  0  |