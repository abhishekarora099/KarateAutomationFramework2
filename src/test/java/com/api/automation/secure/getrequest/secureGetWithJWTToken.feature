@ignore
Feature: To send the get request with JWT Token
         GET https://jobapplicationjwt.herokuapp.com/auth/webapi/all
         
    
    Scenario: Send the GET request with JWT token
         * def token = call read('../../getToken.feature) {username:'abhishek', password:'arora'}
         Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
         And headers {Accept:'application/json', Authorization:'#("Bearer " + token.authToken)'}
         When method get
         Then status 200
                 