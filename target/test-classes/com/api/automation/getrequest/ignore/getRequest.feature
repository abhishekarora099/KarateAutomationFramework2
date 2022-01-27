Feature: To test the get end point of the application
  To test different get end point with different data formate supported by the application
  
  Background: Setup the Base path
    Given url 'http://localhost:9897'
    And print 'this is background keyword'
  Scenario: To get all the data from application in JSON format using path variable
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get 
    Then status 200
  @ignore
  Scenario: To get all the data from application in XML format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get 
    Then status 200