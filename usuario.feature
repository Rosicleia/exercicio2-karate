Feature: Gestão de usuários
    Como um usuário administrador
    Desejo cadastrar usuários
    Para ter o acesso as informações cadastradas

    Background: Base url
        Given url "https://petstore.swagger.io/v2"
        And path "user"
         * def dadosUsuario = { id: 1, username: "Raro", firstName: "Academy", lastName: "QA", email: "raqa@email.com", password: "qa", phone: "99999999999", userStatus: 0 }

    Scenario: Cadastrar um novo usuário
        Given request dadosUsuario
        When method post
        Then status 200
        And match response contains { code: 200, type: "unknown" }
        * def message = response.message
        * def idUsuario = dadosUsuario.id
        And assert parseInt(message) == idUsuario

    Scenario: Consultar um usuário
        And path dadosUsuario.username
        When method get
        Then status 200
        And assert response.id == dadosUsuario.id
        And assert response.username == dadosUsuario.username
        And assert response.firstName == dadosUsuario.firstName
        And assert response.lastName == dadosUsuario.lastName
        And assert response.email == dadosUsuario.email
        And assert response.password == dadosUsuario.password
        And assert response.userStatus == dadosUsuario.userStatus

    Scenario: Atualizar um usuário
        * def atualizaUsuario = { id: dadosUsuario.id, username: dadosUsuario.username, firstName: dadosUsuario.firstName, lastName: "Turma QA", email: "raroqa@email.com", password: "turmaqa", phone: dadosUsuario.phone, userStatus: dadosUsuario.userStatus }
        Given request dadosUsuario
        And path dadosUsuario.username
        When method put
        Then status 200         
        And match response contains { code: 200, type: "unknown" }
        * def message = response.message
        * def idUsuario = dadosUsuario.id
        And assert parseInt(message) == idUsuario
        * print response



# 2. Crie testes para as rotas do recurso User no [Swagger PetStore](https://petstore.swagger.io/#/).

#     1. `POST /user`. Seu teste deve enviar uma requisição válida e verificar se o ``response code`` retornado
#      é ``200`` e se o body retornado contém as **propriedades** ``code``, ``type`` e ``message``.

#     2. `GET /user/{username}`. Envie uma requisição procurando pelo usuário criado na rota anterior. 
#     Seu teste deve verificar se o ``response code`` retornado é ``200`` e se o body retornado
#      contém **todas** as informações cadastradas por você na rota `POST /user`.

#     3. `PUT /user/{username}`. Envie uma requisição que atualiza as informações do usuário cadastrado
#      anteriormente. Seu teste deve verificar se o ``response code`` retornado é ``200`` e se o 
#      body retornado contém as informações atualizadas por você.

# 3. Atualize o repositório ``exercicio2-karate`` com os testes criados por você.
