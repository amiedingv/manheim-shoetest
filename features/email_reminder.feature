Feature: reminder of the upcoming shoes releases

In order to be reminded of upcoming shoe releases As a user of the Shoe Store I want to be able to submit my email address 
There should be an area to submit email address
on successful submission of a valid email address user should receive a message

Background:
  Given I am on the shoes store home page

@check_email_field_display
Scenario: vefiry there is an area to submit email address
  When I verify there is an area to submit email address
  Then I verify there is an email submit button

@email_submission_successful_message
Scenario Outline: check successful submission message
  When I type the following email address "<email>"
    And I click the submit button
  Then I verify the submission message "Thanks! We will notify you of our new shoes at this email:" appears on page
  Examples:
    |email|
    |realemail.1@gmail.com|
    |realemail.2@hotmail.com|
    |realemail.3@private.com|

@email_field_validation
Scenario Outline: verify if the system check the email format
  When I type the following email address "<email>"
  And I click the submit button
  Then I verify if the system check the email format
  Examples:
    |email|
    |.|
    |shoes@gmail|
    |shoes@.com|
    |x@xb@c.com|
    | |
    

@same_email_summit_again
Scenario: the same email submit again, and check if the app gives warnning message
  When I type the following email address:
  |shoes@gmail.com|
  |shoes@gmail.com|
  Then I click the submit button
  Then I verify the submission message "you email has submited" appears on page



# @check_in_different_browsers