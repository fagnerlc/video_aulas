# Login Presenter

## Regras
1. :white_check_mark: Chamar Validation ao alterar o email
2. :white_check_mark: Notificar o emailErrorStream com o mesmo erro do Validation, caso retorne erro
3. :white_check_mark: Notificar o emailErrorEtream com null, caso o Validation não retorne erro
4. :white_check_mark: Não notificar o isFormValidStream se o valor for igual ao último
5. :white_check_mark: Notificar o isFormValidStream após alterar o email
6. :white_check_mark: Chamar Validation ao alterar a senha
7. :white_check_mark: Notificar o passwordErrorStream com o mesmo erro do Validation, caso retorne erro
8. :: Notificar o passwordErrorStream com null, caso a Validação não retorne erro
9. :white_check_mark: Não notificar o passwordErrorStream se o valor for igual ao último
10. :white_check_mark: Notificar o isFormValidStream após alterar a senha
11. :: Para o firmulçário estar válido todos os Streams de erro precisam estar null e todos os campos obrigatórios não podem estar vazios
12. :white_check_mark: Não notificar o isFormValidStream se o valor for igual ao último
13. :: Chamar o Authentication com email e senha corretos
14. :: Notificar o isLoadingStream como true antes de chamar o Authentication
15. :: Notificar o isLoadingStream como false no fim do Authentication
16. :: Notificar o mainErrorStream caso o Authentication retorne um DomainError
17. :: Fechar todos os Streams no dispose
18. :: :no_entry: Gravar o Account no cache em caso de sucesso
19. :: :no_entry: Levar o usuário pra tela de Enquetes em caso de sucesso