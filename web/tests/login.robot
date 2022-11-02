*** Settings ***
Documentation       Suite de testes de autenticação
...                 Administrador deve acessar o portal de gestão de academias

Resource             ../resources/keywords.resource

*** Test Cases ***
Login do Administrador
    Go To Login Page
    Fill Credentials    admin@smartbit.com    qacademy
    Submit Credentials
    User Should Be Logged In

E-mail não cadastrado
    Go To Login Page
    Fill Credentials    404@smartbit.com    123456
    Submit Credentials
    Verify Toaster

Senha inválida
    Go To Login Page
    Fill Credentials    admin@smartbit.com    123456
    Submit Credentials
    Verify Toaster