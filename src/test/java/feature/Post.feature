Feature: Post API Demo

  Background:

    * url 'http://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')
  # Simple Post scenario
 Scenario: Post Demo 1
   Given url 'https://reqres.in/api/users'
   And request {"name" : "Bughra","job" : "SDET"}
   When method POST
   Then status 201
   And print response

   # Post scenario with background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name" : "Bughra","job" : "SDET"}
    When method POST
    Then status 200
    And print response

    #Post with response assertion
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name" : "Bughra","job" : "SDET"}
    When method POST
    Then status 200
    And match response == {"per_page": 6,"total": 12,"data": [{"last_name": "Bluth","id": 1,"avatar": "https://reqres.in/img/faces/1-image.jpg","first_name": "George","email": "george.bluth@reqres.in"},{"last_name": "Weaver","id": 2,"avatar": "https://reqres.in/img/faces/2-image.jpg","first_name": "Janet","email": "janet.weaver@reqres.in"},{"last_name": "Wong","id": 3,"avatar": "https://reqres.in/img/faces/3-image.jpg","first_name": "Emma","email": "emma.wong@reqres.in"},{"last_name": "Holt","id": 4,"avatar": "https://reqres.in/img/faces/4-image.jpg","first_name": "Eve","email": "eve.holt@reqres.in"},{"last_name": "Morris","id": 5,"avatar": "https://reqres.in/img/faces/5-image.jpg","first_name": "Charles","email": "charles.morris@reqres.in"},{"last_name": "Ramos","id": 6,"avatar": "https://reqres.in/img/faces/6-image.jpg","first_name": "Tracey","email": "tracey.ramos@reqres.in"}],"page": 1,"total_pages": 2,"support": {"text": "To keep ReqRes free, contributions towards server costs are appreciated!","url": "https://reqres.in/#support-heading"}}
    And print response
    #Post with read response from file
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name" : "Bughra","job" : "SDET"}
    When method POST
    Then status 200
    And match response == expectedOutput
    And print response

     #Read body data from file
  Scenario: Post Demo 5
    Given path '/users'
    And def requestBody = read('request1.json')
    And request requestBody
    When method POST
    Then status 200

    # Read body data from file and change request values
  Scenario: Post Demo 6
    Given path '/users'
    And def requestBody = read('request1.json')
    And request requestBody
    And set requestBody.job = "Devloper"
    When method POST
    Then status 200


