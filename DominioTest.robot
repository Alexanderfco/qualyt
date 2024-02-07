*** Settings ***
Library           SeleniumLibrary
Library           String

*** Variables ***
${URL}                    http://sistemas.t2mlab.com:3008/
${BROWSER}                chrome
${EMAIL}                  gestor_sb
${SENHA}                  123
${NOME_DOMINIO}           Teste Automatizado
${NOME_CATEGORIA}         Categoria testeee

*** Keywords ***
Abrir Navegador e Efetuar Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Efetuar Login com    ${EMAIL}    ${SENHA}

Fechar Navegador
    Close Browser

Efetuar Login com
    [Arguments]    ${username}    ${password}
    Input Text        id:formBasicEmail       ${username}
    Input Text        id:formBasicPassword    ${password}
    Click Element     xpath=//div[@class='sc-aXZVg keSpkO']//button

Gerar String Aleatória
    [Documentation]    Gera uma string aleatória para uso nos testes
    ${random_string}    Generate Random String    10
    [Return]    ${random_string}

Clicar e Aguardar Elemento
    [Arguments]    ${element_xpath}
    Sleep    2s
    Click Element    ${element_xpath}

Enviar Formulário com o
    [Arguments]    ${input_value}
    Input Text       id:nomeDominio    ${input_value}
    Click Element    xpath=//div[@class="sc-aXZVg bgiAWQ"]//button

*** Test Cases ***
TC001 - Registrar Domínio
    [Tags]    FluxoPrincipal
    ${domain_name}    Gerar String Aleatória
    Abrir Navegador e Efetuar Login
    Clicar e Aguardar Elemento    xpath=//div[@title='Sistema de Biblioteca']//button
    Clicar e Aguardar Elemento    xpath=//div[@class="sc-aXZVg jawhTA"]//button[text()="Domínio"] 
    Clicar e Aguardar Elemento    xpath=//div[@class="sc-aXZVg jawhTA"]//button[text()="Cadastrar Domínio"]
    Enviar Formulário com o    ${domain_name}
    Clicar e Aguardar Elemento    xpath=//div[@class="modal-footer"]//div[@class="sc-aXZVg bgiAWQ"]//button
    Fechar Navegador

TC002 - Logout
    Abrir Navegador e Efetuar Login
    Clicar e Aguardar Elemento    (//*[contains(text(), "Sair")])[2]
    Clicar e Aguardar Elemento    //*[contains(text(), "Sim")]
    Fechar Navegador

TC003 - Buscar Domínio cadastrado
    Abrir Navegador e Efetuar Login
    Clicar e Aguardar Elemento    xpath=//div[@title='Sistema de Biblioteca']//button
    Clicar e Aguardar Elemento    xpath=//div[@class="sc-aXZVg jawhTA"]//button[text()="Domínio"] 
    Clicar e Aguardar Elemento    xpath=//div[@class="sc-aXZVg jawhTA"]//button[text()="Buscar Domínio"]
    Fechar Navegador

TC004 - Registrar Categoria
    ${category_name}    Gerar String Aleatória
    Abrir Navegador e Efetuar Login
    Clicar e Aguardar Elemento    xpath=//div[@title='Sistema de Biblioteca']//button
    Clicar e Aguardar Elemento    xpath=//div[@class="sc-aXZVg jawhTA"]//button[text()="Categoria"] 
    Clicar e Aguardar Elemento    xpath=//div[@class="sc-aXZVg jawhTA"]//button[text()="Cadastrar Categoria"]
    # Enviar Formulário com o ${category_name}
    # Clicar e Aguardar Elemento    xpath=//div[@class="modal-footer"]//div[@class="sc-aXZVg bgiAWQ"]//button
    Fechar Navegador

