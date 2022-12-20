*** Settings ***
Documentation                Suite de testes de recebimento de pedido de ajuda

Resource                     ../resources/base.resource

*** Test Cases ***

Deve receber uma notificação de pedido de ajuda

    # 1a pessoa --> administrador
    # 2a pessoa --> aluno

    # Dado que tenho um aluno válido

    ${admin}    Get Fixture    admin
    ${joao}     Get Fixture    joao

    Clear Help and Reset Student    ${joao}[student][email]

    ${token}             Get Service Token    ${admin}
    ${student_id}        POST New Student     ${token}    ${joao}[student]

    # Quando este aluno envia um pedido de ajuda via mobile

    POST Question        ${student_id}    ${joao}[question]

    # Então devo receber uma notificação no painel do administrador
    
    Do Login    &{admin}

    Open Notifications

    Notification Should Be    ${joao}[question]


Deve responder um pedido de ajuda

    ${admin}    Get Fixture    admin
    ${juca}     Get Fixture    juca

    Clear Help and Reset Student    ${juca}[student][email]

    ${token}            Get Service Token    ${admin}
    ${student_id}       POST New Student     ${token}    ${juca}[student]

    POST Question       ${student_id}    ${juca}[question]

    Do Login    &{admin}

    Open Notifications

    Notification Should Be    ${juca}[question]

    Open Question             ${juca}[student][name]

    Answer Question           ${juca}[answer]

    Verify Toaster            Resposta enviada com sucesso