
# navigate to the home page of shoes store
Given(/^I am on the shoes store home page$/) do
  @browser.goto @shoes_home
end

# check the html element: email text field display on page
Then(/^I verify there is an area to submit email address$/) do
  expect(@browser.input(:id,"remind_email_input").exist?).to be true
end

# check the html element: submit button display on page
Then(/^I verify there is an email submit button$/) do
  expect(@browser.form(:id, 'remind_email_form').input(:type,'submit').exist?).to be true
end


# fill in email in the email text field
Then(/^I type the following email address "(.*?)"$/) do |email|
  @email = email
  fillin_email(@email)
end

# click the submit button to submit reminder email
Then(/^I click the submit button$/) do
  click_submit_button
end

# after click submit button to submit a reminder email, verify if there is a message appear on page
Then(/^I verify the submission message "(.*?)" appears on page$/) do |arg1|
  verify_text_appear(arg1 + " " + @email )
end

# verify if the system check the email format
Then(/^I verify if the system check the email format$/) do
  expect(verify_text_appear("Thanks! We will notify you of our new shoes at this email")).to be false
end

# go to each month and check if the title of the link is able to visit
Then(/^I type the following email address:$/) do |table|
  data = table.row
  data.each do |email|
    fillin_email(email)
  end
end

# go to each month and check if the title of the link is able to visit
Then(/^I verify all the links for 12 months are able to visit$/) do 
  Date::MONTHNAMES.compact.each do |month|
    navigate_to_this_month(month)
    expect(@browser.title).to eq("Shoe Store: " + month + "'s Shoes")
  end
end

# if the current and past month has release, then check the released shoes content
Then(/^I verify released shoes of current and past "(.*?)" should display a small blurb, image, and price tag$/) do |month|
  # Ignore month that in future of the year
  navigate_to_this_month(month)
  if Date.today.month >= Date::MONTHNAMES.index(month) and this_month_has_released_shoes
    check_all_shoes_content_by_month
  end
end

# verify the furture months do have shoes released
Then(/^I verify there are NO release contents for future months$/) do
  Date::MONTHNAMES.compact.each do |month|
    if Date.today.month < Date::MONTHNAMES.index(month)
      navigate_to_this_month(month)
      expect(this_month_has_released_shoes).to be false
    end
  end
end

# in the same month, make sure there is no duplicated shoes released
Then(/^I verify there is no duplicated shoes released in the same month$/) do
  Date::MONTHNAMES.compact.each do |month|
    navigate_to_this_month(month)
    if Date.today.month >= Date::MONTHNAMES.index(month) and this_month_has_released_shoes
      expect(check_shoes_no_duplicates(month)).to be true
    end
    
  end
end