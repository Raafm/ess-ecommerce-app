Feature: Calcular tempo estimado de entrega

  Scenario: Visualização do tempo de entrega no detalhamento de um pedido
    Given eu estou logado como o user "userMV" e senha "1234"
    And eu estou na página de "minhas compras"
    When eu seleciono a opção "enviado"
    Then eu vejo na tela a compra "iphone x" e o tempo estimado de entrega de "14 janeiro - 15 março"

  Scenario: Redirecionamento para a página de tempo estimado de entrega, após recebimento de notificação
    Given eu estou logado como o user "userMV" e senha "1234"
    And eu estou na na página "menu inicial"
    And eu vejo na tela uma notificação sobre uma atualização da compra "iphone X"
    When eu seleciono essa notificação
    Then eu estou está na página "minhas compras"
    And eu vejo na tela a compra "iphone x" e o tempo estimado de entrega de "14 janeiro - 15 março"

  Scenario: Ver detalhes do status de um pedido
    Given eu estou logado como o user "userMV" e senha "1234"
    And eu estou na na página "minhas compras"
    When eu seleciona a opção "a caminho"
    And eu seleciono a compra "iphone X"
    Then eu vejo na tela a compra "iphone x" a localização "Recife/PE", bem como todo seu histórico de movimentação

  Scenario: Ver detalhes do status de um pedido - Falha
    Given eu estou logado como o user "userMV" e senha "1234"
    And eu estou na na página "minhas compras"
    When eu seleciona a opção "a caminho"
    And eu seleciono a compra "iphone X"
    Then eu vejo uma mensagem de erro "compra não pode ser rastreada"

  Scenario: Visualização do tempo de entrega no detalhamento de um pedido - Falha
    Given eu estou logado como o user "userMV" e senha "1234"
    And eu estou na página de "minhas compras"
    When eu seleciono a opção "enviado"
    Then eu vejo na tela a compra "iphone x" e o tempo estimado de entrega de "Sem tempo estimado"
