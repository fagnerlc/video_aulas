#HTTP

> ## Sucesso
1. :white_check_mark: Request com verbo http válido (post/...)
2. :white_check_mark: Passar nos headers o content type JSON
3. :white_check_mark: Chamar request com body correto
4. :white_check_mark: Ok - 200 e resposta com dados
5. :white_check_mark: No content - 204 e resposta sem dados

> ## Erros
1. :white_check_mark: Bad request - 400
2. :white_check_mark: Unauthorized - 401
3. :white_check_mark: Forbidden - 403
4. :white_check_mark: Not found - 404
5. :white_check_mark: Internal server error - 500

> ## Exceção - Status code diferente dos citados acima
1. :white_check_mark: Internal server error - 500

> ## Exceção - Http request deu alguma exceção
1. :white_check_mark: Internal server error - 500

> ## Exceção - Verbo http inválido
1. :white_check_mark: Internal server error - 500