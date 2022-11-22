*** Settings ***
Documentation                Representação dos elementos da página de Login

Library                      Browser


*** Keywords ***
Go To Login Page
    New Browser             headless=false        browser=chromium

    New Page                http://localhost:3000

Fill Credentials
    [Arguments]             ${email}        ${pass}

    Fill Text               css=input[name="email"]        ${email}

    Fill Text               css=input[name="password"]     ${pass}

Field Type Should Be email
    Get Attribute           css=input[placeholder="Seu e-mail"]
    ...                     type    equal    email

    Sleep                   8

Submit Credentials
    Click                   css=button >> text="Entrar no sistema"

Alert Text Should Be
    [Arguments]             ${field}     ${expected_text}

    Get Text                xpath=//input[@type="${field}"]/..//span
    ...                     equal        ${expected_text}