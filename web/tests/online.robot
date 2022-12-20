*** Settings ***
Documentation                Verifica se a aplicação está on-line

Library                      Browser

Test Teardown    Take Screenshot

*** Test Cases ***
Portal admin deve estar on-line
    New Browser             headless=false    browser=chromium

    New Page                http://localhost:3000

    Get Text                h1
    ...                     contains    Painel do Administrador

    Sleep                   5
