Then(/^the system will display occupations table header name$/) do |table|
  @page_object.searchRelated.searchResults_element.when_visible(TIME_OUT_LIMIT)
  x = 1
  table_data = @page_object.searchRelated.searchResults_element

  table.rows.each  do |header_name, b|
    x = 3 if x == 2
    expect(table_data[0][x].text).to eq (header_name)
    x +=1
  end
end

Then(/^the system will display occupations search filters$/) do |table|
  @page_object.searchRelated.searchResults_element.when_visible(TIME_OUT_LIMIT)

  filters_data = @page_object.searchRelated.searchFilters_element.text
  filters_data = filters_data.split("\n").map(&:strip).reject!(&:empty?)
  # p filters_data
  expected_results = []
  table.rows.each  do |expected_result, b|
    expected_results = expected_results + [expected_result]
  end
  expect(filters_data - expected_results).to eq (expected_results - filters_data)
end





