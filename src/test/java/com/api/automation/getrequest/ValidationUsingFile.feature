Feature: To validate the GET end point 
  To validate the get end point response from external file
  
  
  Background: Setup the Base path
    Given url 'http://localhost:9897'
    And print 'this is background keyword'
    
    
    
  Scenario: To get all the data from application in JSON format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get 
    Then status 200
    * def actualResponse = read("../JsonResponse.json")
    And print "JsonResponse ==>", actualResponse
    And match response == actualResponse