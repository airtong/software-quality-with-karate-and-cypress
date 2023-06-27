Feature: Testing The Go REST API

Background:
    * def url_base = 'https://gorest.co.in/public/v2/'
    * def auth = 'Bearer 03a68fdafecd7bddaf5e84f3c5783ac51fd772499f1c20c036801caa93f7d814'
    * def folder_path = 'C:\\Users\\airton\\Documents'

Scenario: Testing the creation of a user
    Given url url_base
    And path 'users'
    And request {"name":  "Jonathan Carlton", "email": "johnnycage@email.com", "gender": "male","status": "active" }
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method POST
    Then status 201

Scenario: Testing the (negative) creation of a user ()
    Given url url_base
    And path 'users'
    And request {"name":  "Jonathan Carlton", "email": "johnnycage@email.com", "gender": "male","status": "active" }
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method POST
    Then status 422
    And response.message == "has already been taken"

Scenario: Testing the request from existing users
    Given url url_base
    And path 'users'
    When method GET
    Then status 200

Scenario: Testing the creation of a post for the user 3278168
    Given url url_base
    And path 'users/3278168/posts'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "title": "Esse jogo foi epico!", "body": "Relembrando a emocionante final da NBA de 2018! Cavaliers vs. Warriors, um confronto epico entre LeBron James e Stephen Curry. Cestas incriveis, jogadas memoraveis e uma rivalidade intensa. O basquete no seu melhor! Quem voce acha que foi o destaque daquela final? #NBAFinals #ThrowbackThursday" }
    When method POST
    Then status 201

Scenario: Testing the (negative) request for the user 2
    Given url url_base
    And path 'users/2'
    When method GET
    Then status 404

