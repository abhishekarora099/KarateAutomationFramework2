Feature: To validate the GET end point 
  To validate the get end point response
  
  
  Background: Setup the Base path
    Given url 'http://localhost:9897'
    
    
    
  Scenario: To get all the data from application in XML format using path variable
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get 
    Then status 200
    And print response
    And match response/List/item/jobId == '1'
    And match response/List/item/experience/experience[1] == 'Google'
    And match /List/item/experience/experience[1] == 'Google'
    And match response.List.item.experience.experience[0] == 'Google'
    
  
  Scenario: To get all the data from application in XML format and validate using Fuzzy Matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get 
    Then status 200
    And print response
    And match response/List/item/jobId == '#notnull'
    And match response/List/item/experience/experience == '#array'
    And match /List/item/experience/experience[1] == '#ignore'
    And match response.List.item.experience.experience[0] == '#present'
    And match response/List/item/jobTitle == '#string? _.length == 13'
    And match response/List/item/jobTitle.id == '#notpresent'
    
 