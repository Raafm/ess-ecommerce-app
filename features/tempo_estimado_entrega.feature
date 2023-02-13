Feature: Calculo do tempo estimado de entrega

  Scenario: Ver tempo estimado de entrega de um pedido
    Given o usuário "mariavmuniz" está na página "histórico de pedidos"
    And o pedido “12A456” está em trânsito
    When o usuário "mariavmuniz" tenta acompanhar o pedido de número  "12A456"
    Then o usuário é redirecionado para a página de acompanhamento do pedido
    And o usuário consegue ver o tempo estimado de entrega

  Scenario: Tempo estimado de entrega após recebimento do pedido
    Given o usuário "mariavmuniz" está na página "histórico de pedidos"
    And o pedido “12A456” já foi entregue ao destinatário
    When o usuário "mariavmuniz" tenta acompanhar o pedido “12A456”
    Then o usuário é redirecionado para a página de acompanhamento do pedido
    And o usuário consegue ver  a mensagem “pedido entregue”

  Scenario: Tempo estimado de entrega após cancelamento do pedido
    Given o usuário "mariavmuniz" está na página "histórico de pedidos"
    And o pedido “12A456” foi cancelado
    When o usuário "mariavmuniz" tenta acompanhar o pedido “12A456”
    Then o usuário é redirecionado para a página de acompanhamento do pedido
    And o usuário consegue ver a mensagem “pedido cancelado”
