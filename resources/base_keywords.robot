*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${URL}    https://app-hom.cocobambu.com/delivery


*** Keywords ***

Abrir Navegador Para Página de Delivery
    ${options}=    Evaluate    __import__('selenium.webdriver.chrome.options', fromlist=['Options']).Options()
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser   ${URL}    chrome    options=${options}
    Capture Page Screenshot

Configurar Navegador Headless e Acessar Delivery
    ${options}=    Evaluate    __import__('selenium.webdriver.chrome.options', fromlist=['Options']).Options()
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser   ${URL}    chrome    options=${options}
    Capture Page Screenshot
    
Fechar Sessão do Navegador
    Capture Page Screenshot
    Close Browser

Get Default Headers
    ${headers}    Create Dictionary    Content-Type=application/json
    RETURN    ${headers}