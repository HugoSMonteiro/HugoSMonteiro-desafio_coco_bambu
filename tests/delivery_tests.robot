*** Settings ***
Resource             ../resources/base_keywords.robot
Resource             ../resources/delivery.robot
Test Setup           Configurar Navegador Headless e Acessar Delivery
Test Teardown        Fechar Sessão do Navegador

*** Test Cases ***

Tela Inicial do Delivery
    [Documentation]     Realizar login na aplicação para cadastrar um endereço. Não consegue cadastrar devido ao erro na consulta 
    [Tags]     ct1
   
    Realizar o Login
    Cadastrar Endereço
    Inserir CEP Valido
    Validar Mensagem Nenhum Resultado encontrado

    

    