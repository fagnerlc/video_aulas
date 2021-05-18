# Remote Authentication Use Case

## Caso de sucesso
1. :white_check_mark: Sistema valida os dados
2. :white_check_mark: Sistema faz uma requisição para a URL da API de login
3. Sistema valida os dados recebidos da API
4. Sistema entrega os dados da conta do usuário



> ## Exeção - URL inválida
1. :white_check_mark: Sistema retorna uma mensagem de erro inesperado

>## Exeção - Dados inválidos
1. :white_check_mark: Sistema retorna uma mensagem de erro inesperado

>## Exeção - Resposta inválidos
1. Sistema retorna uma mensagem de erro inesperado

>## Exeção - Falha no servidor
1. :white_check_mark: Sistema retorna uma mensagem de erro inesperado

>## Exeção - Credenciais inválidas
1. :white_check_mark: Sistema retorna uma mensagem de erro informando que as credenciais estão erradas
