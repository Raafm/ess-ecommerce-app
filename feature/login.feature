    Cenário de GUI
    Scenario: Login Correto
        Given Estou na pagina "Inicial" da aplicação sem estar logado
        When Eu preencho o campo de login, com o "Usuario" e "Senha" corretos e confirmo
        Then o usuario recebe um pop up inicando que o login foi realizado com sucesso
        And é direcionado para a página do usuario

    Cenário de Serviço
    Scenario: Login Correto
        Given o usuario "Rafael" não está logado
        When o usuario preenche os campos de "Usuario" com o "Email" ou entao com "Nome"
        And preenche o campo de senha com a senha correta e confirma
        Then o usuario realiza o login

    Cenario de GUI
    Scenario: Login incorreto
        Given  usuario e "Rafael" stá na pagina "Inicial" da aplicação e Deslogado
        When o usuario preenche o campo de usuario ou de senha de forma errada
        Then uma "mensagem de erro" indica que o login não foi realizado
        And pede para repertir o login

    Cenário de Serviço
    Scenario:  Login incorreto
        Given o usuario "Rafael" está deslogado e tenta logar
        When preenche errado um dos campos de "Usuario" ou de "Senha"
        Then o sistema não realiza o login do usuario "Rafael"

    Scenario: Login incorreto
    Ideia geral:Usuário preenche os dados de login de forma incorreta, 
    levando a repetir a página de acesso com um spam de um pop up, indicando login incorreto
    
    Scenario:Esqueceu senha
    Ideia geral: Usuário se esquece da senha e seleciona a opção de recuperar a senha. 
    Then leva-o para outra página para recuperar a senha
    
    Scenario:Esqueceu usuário
    Ideia geral: Usuário se esquece do usuaio e selecione a opção de recuperar o usuário.
    Then leva-o para outra página para recuperar o usuaio.
