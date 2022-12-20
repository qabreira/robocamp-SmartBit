*** Settings ***

Documentation        Suite de testes de pedido de ajuda

Resource             ../resources/base.resource

Library              AppiumLibrary

Test Setup        Start app
Test Teardown     Finish app

*** Test Cases ***
Deve conseguir solicitar ajuda

    ${admin}    Get Fixture    admin
    ${aluno}    Get Fixture    aluno

    Reset Student       ${aluno}[student][email]

    ${token}            Get Service Token    ${admin}
    ${student_id}       POST New Student     ${token}    ${aluno}[student]

    POST New Enroll     ${token}    ${student_id}

    Login With Student Id    ${student_id}
    
    Confirm Popup
    
    Go To Help Order

    Submit Help Order    ${aluno}[help]

    Wait Until Page Contains    Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.