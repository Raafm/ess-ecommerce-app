Feature: Login no aplicativo
    As a usuario do aplicativo
    I want to entrar no aplicativo com meu e-mail e senha cadastrado
    So that eu tenha acesso às funcionalidades do sistema que são acessíveis somente depois do login

Scenario: Login correto
    Given Não estou logado com nenhum usuário na aplicação
        And existe um usuario cadastrado com o email "acruchi@gmail.com" e senha "123456"
        And estou na página inicial e  "login"
    When eu tento acessar o aplicatico com o email "acruchi@gmail.com"
        And com a senha "123456"
    Then o cliente é encaminhado para a tela inicial do aplicativo

Scenario: Login admin
    Given Não estou logado com nenhum usuário na aplicação
        And existe um admin cadastrado com o email "admin@gmail.com" e senha "admin"
        And estou na página inicial e "login"
    When eu tento acessar o aplicatico com o email"admin@gmail.com"
        And com a senha "admin"
    Then o admin é encaminhado para a pagina do administrador

Scenario: Login com a senha errada
    Given Não estou logado com nenhum usuário na aplicação
           And existe um usuario cadastrado com o email "acruchi@gmail.com" e senha "123456"
           And estou na página de "login"
    When eu tento acessar o aplicatico com o email "acruchi@gmail.com"
        And o campo da senha é preenchido por "1234"
    Then eu recebo uma mensagem de erro dizendo que a senha está errada
        And eu continuo na página de login

Scenario: Login com a email errado
    Given Não estou logado com nenhum usuário na aplicação
           And estou na página de "login"
    When eu tento acessar o aplicatico com o email "test@gmail.com"
        And o campo da senha é preenchido por "123456"
    Then eu recebo uma mensagem de erro dizendo que o email está incorreto
        And eu continuo na página de login


Scenario: Esqueceu a senha
    Given Não estou logado com nenhum usuário na aplicação
        And esqueci a senha
        And estou na página de "login"
    When seleciono na opção de Esqueceu a senha
    Then sou encaminhado para uma pagina de esqueci a senha
        And preencho o campo de email ou usuario com o email "acruchi@gmail.com"
        And seleciono recuperar a senha 
    Then sou encaminhado para a pagina de recuperar a senha

Scenario: Recuperar a senha com o codigo correto
    Given o usuario "acruchi" esta na pagina de recuperar a senha
    When o usuarrio tenta recupera a senha com o codigo "3245" 
    Then seleciona no verificar
        And confirma que o codigo esta correto
        And pede uma nova senha
    Then é encaminhado para a pagina de login 


Scenario: Recuperar a senha com o codigo incorreto
    Given o usuario "acruchi" esta na pagina de recuperar a senha
        And o codigo de recuperar a senha eh "3245"
    When o usuarrio tenta recupera a senha com o codigo "3244" 
    Then seleciona no verificar
        And confirma que o codigo esta incorreto
    Then o ususario continua na pagina de recuperar a senha