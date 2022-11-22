*** Settings ***
Documentation                Suite de testes de matrículas de alunos
...                          O administrador logado consegue matricular alunos na academia

Resource                     ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    
    ${admin}                 Create Dictionary
    ...                      name=Admin
    ...                      email=admin@smartbit.com
    ...                      pass=qacademy

    ${enroll}                Create Dictionary
    ...                      student=Falcão não mexer
    ...                      plan=Smart

    Do Login                 ${admin}
    Go To Enrolls
    Go To Enroll Form
    Fill Enroll Student      ${enroll}[student]
    Fill Enroll Plan         ${enroll}[plan]
    Fill Enroll Start Date
    Submit Enroll Form    

    Verify Toaster           Matrícula cadastrada com sucesso