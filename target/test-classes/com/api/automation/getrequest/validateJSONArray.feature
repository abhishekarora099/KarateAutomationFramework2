Feature: To validate the GET end point 
  To validate the get end point response
  
  
  Background: Setup the Base path
    Given url 'http://localhost:9897'
    
    
    
  Scenario: To get all the data from application in JSON format using path variable
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get 
    Then status 200
    And print response
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'
    And match response.[0].experience[*] == ['Google','Apple','Mobile Iron']
    And match response.[0].experience[*] contains ['Mobile Iron']
    
    
   Scenario: To get all the data from application in JSON format and validate using Fuzzy Matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get 
    Then status 200
    And print response
    And match response.[0].jobId == '#present'
    And match response.[0].jobId == '#number'
    And match response.[0].experience[1] == '#notnull'
    And match response.[0].project[0].projectName == '#ignore'
    And match response.[0].project[0].technology == '#array'
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'
    And match response.[0].experience[*] == ['Google','Apple','Mobile Iron']
    And match response.[0].experience[*] contains ['Mobile Iron']
    And match response.[0].jobId == '#? _ == 1'
    And match response.[0].jobTitle == '#string? _.length >= 1'
    And match response.[0].experience == '#[3] #string? _.length >=2'
    
    
  
    
 