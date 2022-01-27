Feature: To upload the file using Karate Framework
  Background: Setup the Base path
     Given url 'http://localhost:9897'
  Scenario: To upload the file in the test application
     Given path '/normal/webapi/upload'
     And multipart file file = {read:'FileToUpload.txt', filename: 'FileToUpload.txt', Content-type: 'multipart/form-data'}
     When method post
     Then status 200
     And print response
     
     
   Scenario: To upload the file in the test application with json data
     Given path '/normal/webapi/upload'
     * def fileLocation = '../data/jobEntry.json'
     And multipart file file = {read:'#(fileLocation)', filename: 'jobEntry.json', Content-Type: 'multipart/form-data'}
     When method post
     Then status 200
     And print response
     And match response.message contains 'jobEntry.json'