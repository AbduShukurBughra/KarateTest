Feature: Sample API Test

  Scenario: Test a Sample Get API

    Given url 'http://reqres.in/api/users?page=2'
    When method GET
    Then status 200
