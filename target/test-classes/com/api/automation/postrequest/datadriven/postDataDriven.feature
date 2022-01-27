Feature: To create job Description in the test application

  Background: Read the test data for data driven
  * def testdata = read("testData.csv")

  Scenario Outline: Data Driven for the job description entry
     Given url 'http://localhost:9897'
     And path '/normal/webapi/add'
     And request {"jobId": '#(jobId)',"jobTitle": '#(jobTitle)',"jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
     And headers {Accept:'application/json', Content-Type:'application/json'}
     When method post
     And status <status>
     
     Examples:
     |jobId|jobTitle|jobDescription|status|
     |9980|Software Engg-2|To develop android application|201|
     |id|Software Engg-2|To develop android application|400|
     |false|Software Engg-2|To develop android application|400|
     
     
     
   Scenario Outline: Data Driven for the job description entry using csv file
     Given url 'http://localhost:9897'
     And path '/normal/webapi/add'
     And request {"jobId": '#(jobId)',"jobTitle": '#(jobTitle)',"jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
     And headers {Accept:'application/json', Content-Type:'application/json'}
     When method post
     And status <status>
     
     Examples:
     |testdata|
     
     