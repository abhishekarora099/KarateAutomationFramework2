Feature: To test the updation of job entry in the test application
    Test the endpoint PUT /normal/webapi/update

  Background: Create and Initialize base url
    Given url 'http://localhost:9897'

  Scenario: To update the job entry for existing job in JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',"jobTitle": "Software Engg-2","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": '#(id)',
      "jobTitle": "Software Engg-3",
      "jobDescription": "To develop andriod application and web application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]
      },
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]   
      }
      ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    And print response
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == " + id + ")].project")
    And match projectArray[0] == '#[2]'
    
    Scenario: To update the job entry for existing job in JSON format by calling another feature file
    Given call read("../createJobEntry.feature")
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": 130,
      "jobTitle": "Software Engg-3",
      "jobDescription": "To develop andriod application and web application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]
      },
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]   
      }
      ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    And print response
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == 130)].project")
    And match projectArray[0] == '#[2]'
    
    
    Scenario: To update the job entry for existing job in JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',"jobTitle": "Software Engg-2","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": '#(id)',
      "jobTitle": "Software Engg-3",
      "jobDescription": "To develop andriod application and web application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]
      },
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]   
      }
      ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    And print response
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == " + id + ")].project")
    And match projectArray[0] == '#[2]'
    
    Scenario: To update the job entry for existing job in JSON format by calling another feature file
    Given call read("../createJobEntry.feature")
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": 130,
      "jobTitle": "Software Engg-3",
      "jobDescription": "To develop andriod application and web application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]
      },
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]   
      }
      ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    And print response
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == 130)].project")
    And match projectArray[0] == '#[2]'
    
    
     Scenario: To update the job entry for existing job in JSON format by calling another feature file using shared context
     * def postRequest = call read("../createJobEntry.feature")
     And print "Calling Feature ==>", postRequest.id
     And print "Calling Feature ==>", postRequest.getRandomValue()
     
     
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": '#(postRequest.id)',
      "jobTitle": "Software Engg-3",
      "jobDescription": "To develop andriod application and web application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]
      },
      {
      "projectName": "Movie App",
      "technology": [
      "Kotlin",
      "SQL Lite",
      "Gradle",
      "Jenkins"
      ]   
      }
      ]
      }
      """
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    And print response
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == " + postRequest.id + ")].project")
    And match projectArray[0] == '#[2]'
    
     Scenario: To update the job entry for existing job in JSON format by calling another feature file with variables
          * def getRandomValue = function() {return Math.floor((100)*Math.random());}
          * def id = getRandomValue()
           * def postRequest = call read("../createJobEntrywithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(id)'}
    
    