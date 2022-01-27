Feature: Variables Creation in Karate Framework

  Background: Create and Intialize variables
    * def app_name = "Google"
    * def page_load_timeout = 20

  Scenario: To create a variable
    Given def var_int = 10
    And def var_string = "Karate"
    Then print "Int Variable ==>", var_int
    And print "String Variable ==>", var_string
    * def var_int_2 = var_int + 10
    And print "New Variable ==>", var_int_2
    And print "Background Section Variable ==>", app_name, page_load_timeout

  Scenario: Access the variables
    Given def var_int = 20
    And print "Previous Scenario ==>", var_int
    And print "Background Section Variable ==>", app_name, page_load_timeout
