Feature: Get API Demo

  Background:

    * url 'http://reqres.in/api'
    * header Accept = 'application/json'


  Scenario: Get Demo 1
    Given url 'http://reqres.in/api/users?page=2'
    When method Get
    Then status 200
    And print response
    And print response Status
    And print response Time
    And print Response Headers
    And print response Cookies

    # Get with Background
  Scenario: Get Demo 2
    Given path '/users/2'
    When method Get
    Then status 200
    And print response

    # Get With Background, path and parameters
  Scenario: Get Demo 3
    Given path '/users'
    When method Get
    Then status 200
    And param page = 2
    And print response

    # With Assertions
  Scenario: Get Demo 4
    Given path '/users'
    And param page = 2
    When method Get
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 10
    And match response.data[4].last_name == 'Edwards'
