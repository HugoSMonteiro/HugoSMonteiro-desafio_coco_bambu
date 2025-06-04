*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Resource   ../resources/base_keywords.robot

*** Variables ***
${BASE_URL_API}    https://dummyjson.com  

*** Test Cases ***
Api Carts - Consultar e Editar Carrinho
    [Documentation]    Teste  DummyJson API
    Create Session    api    ${BASE_URL_API}   

    # Adicionar item ao carrinho
    ${headers}    Create Dictionary    Content-Type=application/json
    ${body}    Create Dictionary
    ...    userId=1
    ...    products=${{ [{"id": 144, "quantity": 8}, {"id": 98, "quantity": 1}] }}

    ${post_response}    POST On Session    api    /carts/add    json=${body}    headers=${headers}
    Log    ${post_response.json()}
    Should Be Equal As Numbers    ${post_response.status_code}    201
    Log To Console    \n✅ Carrinho adicionado com sucesso!\n${post_response.json()}

    # Atualizar Itens do Carrinho
    ${headers}    Create Dictionary    Content-Type=application/json
    ${body}    Create Dictionary
    ...    merge=true
    ...    products=${{ [{"id": 1, "quantity": 1}] }}

    ${put_response}    PUT On Session    api    /carts/1    json=${body}    headers=${headers}
    Log    ${put_response.json()}
    Should Be Equal As Numbers    ${put_response.status_code}    200
    Log To Console    \n✅ Carrinho atualizado com sucesso!\n${put_response.json()}

     # Excluir Carrinho
    ${delete_response}    DELETE On Session    api    /carts/1
    Log    ${delete_response.json()}
    Should Be Equal As Numbers    ${delete_response.status_code}    200
    Log To Console    \n✅ Carrinho excluído (simulado) com sucesso!\n${delete_response.json()}

    # Validar Resposta
    ${response_json}    Set Variable    ${delete_response.json()}
    Dictionary Should Contain Key    ${response_json}    isDeleted
    Dictionary Should Contain Key    ${response_json}    deletedOn
    Should Be True    ${response_json["isDeleted"]}    msg=A chave 'isDeleted' deve ser True
    Log To Console    \n✅ Validação das chaves 'isDeleted' e 'deletedOn' realizada com sucesso!