Feature: shoes release every month
    In order to view upcoming shoes being released every month
    As a user of the Shoe store I want to be able to visit a link for each month 
    and see the shoes being released 
    
    Month should display a small Blurb of each shoe
    Month should display an image each shoe being released
    Each shoe should have a suggested price pricing

Background:
  Given I am on the shoes store home page

@check_link_availablity_for_12_months
Scenario: verify every month is able to visit
  Then I verify all the links for 12 months are able to visit

@check_shoes_content
Scenario Outline: Each month release item should display a small blurb, image and price
  Then I verify released shoes of current and past "<month>" should display a small blurb, image, and price tag
  Examples:
  |month|
  |January|
  |February|
  |March|
  |April|
  |May|
  |June|
  |July|
  |August|
  |September|
  |October|
  |November|
  |December|

@furture_month_no_release_items
Scenario: make sure the future months has no release items
  Then I verify there are NO release contents for future months

@unique_shoes_released_in_same_month
Scenario: test released shoes in a month has no duplicates
  Then I verify there is no duplicated shoes released in the same month
