*** Settings ***
Documentation       Suite de testes de autenticação
...                 Administrador deve acessar o portal de gestão de academias

Resource            ../resources/base.resource


*** Test Cases ***
Login do Administrador
    Go To Login Page
    Fill Credentials    admin@smartbit.com    qacademy
    Submit Credentials
    User Should Be Logged In    Admin

E-mail não cadastrado
    Go To Login Page
    Fill Credentials    404@smartbit.com    123456
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente

Senha inválida
    Go To Login Page
    Fill Credentials    admin@smartbit.com    123456
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente

E-mail no formato incorreto
    Go To Login Page
    Fill Credentials    @com.br    123
    Submit Credentials
    Field Type Should Be email

Senha em branco
    Go To Login Page
    Fill Credentials    admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória

E-mail em branco
    Go To Login Page
    Fill Credentials    ${EMPTY}    qacademy
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório

E-mail e senha são obrigatórios
    Go To Login Page
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória
