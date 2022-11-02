*** Settings ***
Library    Browser

*** Keywords ***
Fill Credentials
    [Arguments]    ${email}    ${pass}

    Fill Text    css=input[name="email"]    ${email}
    Fill Text    css=input[name="password"]    ${pass}

Submit Credentials
    Click    css=button >> text="Entrar no sistema"

Go To Login Page
    New Browser    headless=false    browser=webkit
    New Page    http://localhost:3000

Verify Toaster
    Wait For Elements State
    ...    css=.Toastify__toast-body div >> text=Suas credenciais são inválidas, por favor tente novamente
    ...    visible    5

User Should Be Logged In
    ${logged_user}    Set Variable    css=aside strong
    Wait For Elements State    ${logged_user}    visible    5
    Get Text    ${logged_user}    equal    Admin