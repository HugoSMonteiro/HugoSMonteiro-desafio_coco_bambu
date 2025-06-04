*** Settings ***
Library    String
Library    BuiltIn
Resource    base_keywords.robot


*** Variables ***
${CAMPO_CEP}                    xpath=//input[@placeholder='Informe seu endereço']
${TEXTO_ENDERECO_ENTREGA}       xpath=//span[contains(.,'Endereço de entrega')]
${BUTTON_PERFIL}                xpath=//span[contains(.,'Perfil')]
${BUTTON_ENTRAR}                xpath=//span[contains(.,'Entrar')]
${CAMPO_EMAIL}                  xpath=//input[@name='username']
${CAMPO_SENHA}                  xpath=//input[@name='password']
${BUTTON_LOGIN}                 xpath=//span[normalize-space()='ENTRAR']
${BUTTON_FECHAR}                xpath=//button[normalize-space()='FECHAR']
${CAMPO_CODIGO}                 xpath=(//input[@autocomplete='one-time-code'])[1]
${BUTTON_ACESSAR}               xpath=//span[normalize-space()='ACESSAR']
${BUTTON_CADASTRAR_ENDERECO}    xpath=//span[contains(.,'Cadastre aqui um endereço')]
${BUTTON_ADICIONAR_ENDERECO}    xpath=//span[contains(.,'Adicionar novo endereço')]
${MENSAGEM_NENHUM_RESULTADO}    xpath=//p[contains(text(), 'Nenhum resultado encontrado.')]



*** Keywords ***

Realizar o Login
    Wait Until Element Is Visible    ${TEXTO_ENDERECO_ENTREGA}    60
    Click Element    ${BUTTON_PERFIL}
    Click Element    ${BUTTON_ENTRAR}
    Wait Until Element Is Visible    ${CAMPO_EMAIL}    60 
    Input Text       ${CAMPO_EMAIL}    hugoprocessoseletivocb@gmail.com
    Input Text       ${CAMPO_SENHA}    Cocobambu@2314
    Click Element    ${BUTTON_LOGIN} 
    Wait Until Element Is Visible     ${BUTTON_FECHAR}    60  
    Click Element    ${BUTTON_FECHAR} 
    Wait Until Element Is Visible     ${CAMPO_CODIGO}    60
    Input Text    ${CAMPO_CODIGO}     AAAAAA 
    Click Element    ${BUTTON_ACESSAR}    

Cadastrar Endereço
    Wait Until Element Is Visible    ${BUTTON_CADASTRAR_ENDERECO}      60
    Click Element    ${BUTTON_CADASTRAR_ENDERECO}

    Sleep    5
    Click Element    ${BUTTON_ADICIONAR_ENDERECO}

Inserir CEP Valido 
    Wait Until Element Is Visible    ${CAMPO_CEP}      60
    Digitar Devagar    ${CAMPO_CEP}    73250-150    0.2  # Intervalo de 0.2 segundos      
   

Validar Mensagem Nenhum Resultado encontrado
    Wait Until Element Is Visible    ${MENSAGEM_NENHUM_RESULTADO}    60
    Element Should Contain    ${MENSAGEM_NENHUM_RESULTADO}    Nenhum resultado encontrado.


Digitar Devagar
    [Arguments]    ${locator}    ${texto}    ${intervalo}=0.1
    ${caracteres}=    Evaluate    list('${texto}')  # Converte a string em uma lista de caracteres
    FOR    ${char}    IN    @{caracteres}
        Press Keys    ${locator}    ${char}  # Adiciona o caractere ao campo
        Sleep    ${intervalo}
    END
