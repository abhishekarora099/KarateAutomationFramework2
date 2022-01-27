Feature: To use the JSON path expression
  
  Background: Setup the Base path
    Given url 'http://localhost:9897'
    
  Scenario: To get the value of property using json path expression
    Given path '/normal/webapi/all'
    When method get
    Then status 200
    * def jobID = 1
    * def jobTitle = karate.jsonPath(response,"$[?(@.jobId ==" + jobID + ")].jobTitle")
    * def experience = karate.jsonPath(response,"$[?(@.jobId ==1)].experience")
    And print "Jobtitle ==>", jobTitle
    And print "Experience ==>", experience
    