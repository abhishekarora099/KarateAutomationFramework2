Feature: To get the variables set by karate-config.js

   Background: To get the value of myVarName
      Given print "Background Variable value =>",myVarName
      
   Scenario: To get the value of username and password from karate-config.ks
       Given print "Scenario Variable value ==>",username
       And print "Scenario Variable value ==>",password
       
       