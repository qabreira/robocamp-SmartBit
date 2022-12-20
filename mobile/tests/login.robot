*** Settings ***

Documentation        Suite de testes de login

Resource             ../resources/base.resource
Resource    ../resources/screens/login.resource

Library              AppiumLibrary

Test Setup        Start app
Test Teardown     Finish app

*** Variables ***
${message_401}    Acesso não autorizado! Entre em contato com a equipe de atendimento.


*** Test Cases ***

Deve logar com sucesso

    ${falcao}    Get Fixture    falcao

    Login With Student Id       ${falcao}[student][id]    
    Wait Until Page Contains    Olá, ${falcao}[student][name]!


Código de aluno incorreto

    Login With Student Id       999
    Wait Until Page Contains    ${message_401}


Código de aluno negativo

    Login With Student Id       -1
    Wait Until Page Contains    ${message_401}

Código de aluno alphanumerico

    Login With Student Id       asdf
    Wait Until Page Contains    ${message_401}
