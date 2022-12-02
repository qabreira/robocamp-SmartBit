*** Settings ***
Documentation                Suite de testes de matrículas de alunos
...                          O administrador logado consegue matricular alunos na academia

Resource                     ../resources/base.resource


*** Test Cases ***
Cria um aluno via POST
    [Tags]    api
    ${admin}      Get Fixture    admin
    ${falcao}     Get Fixture    falcao

    Reset Student    ${falcao}[student][email]
    
    ${token}      Get Service Token    ${admin}
    POST New Student    ${token}       ${falcao}[student]

Deve matricular um aluno
    ${admin}      Get Fixture    admin
    ${falcao}     Get Fixture    falcao

    Reset Student    ${falcao}[student][email]

    ${token}      Get Service Token    ${admin}
    POST New Student    ${token}       ${falcao}[student]

    Do Login                 &{admin}
    
    Go To Enrolls
    Go To Enroll Form
    Fill Enroll Student      ${falcao}[student][name]
    Fill Enroll Plan         ${falcao}[enroll][plan]
    Fill Enroll Start Date
    Submit Enroll Form    

    Verify Toaster           Matrícula cadastrada com sucesso