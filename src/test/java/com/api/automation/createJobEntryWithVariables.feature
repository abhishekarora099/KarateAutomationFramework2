Feature: To create the job entry in test application
       Helper file for POST /normal/webapi/add
     
  Scenario: To create the job entry with JSON data
    Given url _url
    And path _path
    And print "Helper ==>",_url
    And print "Helper ==>",_path
    And print "Helper ==>",_id
    
    And request {"jobId": '#(_id)',"jobTitle": "Software Engg-2","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    * def responseJobId = response.jobId
    * def responseJobTitle = response.jobTitle