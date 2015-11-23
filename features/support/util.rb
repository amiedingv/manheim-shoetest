
module Util
  
  # click submit button
  def click_submit_button
    @browser.input(:id,"remind_email_input").parent.button.click
  end
  # fill in the email field with email
  def fillin_email(text)
    @browser.text_field(:id,"remind_email_input").set text 
  end
  # verify if the text appear on the web page
  def verify_text_appear(text)
    expect(@browser.text.include?(text)).to be true
  end 
  # navigate to this month
  def navigate_to_this_month(month)
    @browser.goto @shoes_home+"months/"+ month
  end
  def this_month_has_released_shoes
    return @browser.ul(:id,"shoe_list").lis.size > 0
  end
  # check all the content of the released shoes in one month
  def check_all_shoes_content_by_month
    size = @browser.ul(:id,"shoe_list").lis.size
    size.times do |i|
      li_html = @browser.ul(:id,"shoe_list").lis[i]
      check_brand(li_html)
      check_name(li_html)
      check_price(li_html)
      check_description(li_html)
      check_release_month(li_html)
      check_shoes_image(li_html)
    end
  end
  
  # check brand area of each shoes is not empty
  def check_brand(html)
    brand = html.td(:text,"Brand").parent.tds[1].a.text.empty?
    expect(brand).to be false
  end
  # check name area of each shoes is not empty
  def check_name(html)
    name = html.td(:text,"Name").parent.tds[1].text.empty?
    expect(name).to be false
  end
  # check price area of each shoes is not empty
  def check_price(html)
    price = html.td(:text,"Price").parent.tds[1].text
    expect(price).to start_with("$")
  end
  # check description area of each shoes is not empty
  def check_description(html)
    description = html.td(:text,"Description").parent.tds[1].text.empty?
    expect(description).to be false
  end
  # check release month area of each shoes should equal with the title month
  def check_release_month(html)
    title = @browser.title
    expect_month = title.split(" ")[2].split("'s")[0]
    actual_month = html.td(:text,"Release Month").parent.tds[1].text
    expect(expect_month).to eq(actual_month)
  end
  # check image area of each shoes
  def check_shoes_image(html)
    img = html.td(:class,"shoe_image").img
    expect(img.exists?).to be true
    src = img.src
    expect(src.empty?).to be false
  end
  # save all the shoes on one month to a hash
  def check_shoes_no_duplicates(month)
    hash = {}
    @browser.ul(:id,"shoe_list").lis.each do |li|
      brand = li.td(:text, "Brand").parent.tds[1].a.text
      name = li.td(:text,"Name").parent.tds[1].text
      price = li.td(:text,"Price").parent.tds[1].text
      desc = li.td(:text,"Description").parent.tds[1].text
      find_str = brand + name + price + desc
      if hash.has_key?(find_str)
        return false
      else
        hash[find_str] = 1
      end
    end
    return true
  end
end
World(Util)