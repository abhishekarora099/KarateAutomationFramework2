Feature: To get the JWT token for the user
         POST https://jobapplicationjwt.herokuapp.com/users/sign-up
         
   
    Scenario: Register the user and generate the token
    # Register the user
         Given url 'https://jobapplicationjwt.herokuapp.com/users/sign-up'
         And headers {Accept: 'application/json', Content-Type: 'application/json'}
         And request {"password":'#(password)', "username": '#(username)'}
         When method post
         Then status 200
         
     # Get the token
         Given url 'https://jobapplicationjwt.herokuapp.com/users/authenticate'
         And headers {Accept: 'application/json', Content-Type: 'application/json'}
         And request {"password":'#(password)', "username": '#(username)'}
         When method post
         Then status 200
         * def authToken = response.token
         