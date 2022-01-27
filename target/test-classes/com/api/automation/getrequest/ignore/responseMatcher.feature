Feature: To validate the GET end point 
  To validate the get end point response
  
  
  Background: Setup the Base path
    Given url 'http://localhost:9897'
    And print 'this is background keyword'
    
    
    
  Scenario: To get all the data from application in JSON format using path variable
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get 
    Then status 200
    And print response
    And match response ==
    """
    [
  {
    "jobId": 1,
    "jobTitle": "Software Engg",
    "jobDescription": "To develop andriod application",
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
          "Gradle"
        ]
      }
    ]
  }
]
    """
  @ignore
  Scenario: To get all the data from application in XML format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get 
    Then status 200
    And print response
    
    
    
  Scenario: To get all the data from application in JSON format and validate a specific property
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get 
    Then status 200
    And print response
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match header Content-Type == 'application/json'