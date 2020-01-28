require("pry-byebug")
require_relative("models/properties")

property1 = PropertyTracker.new({
  "address" => "60 Castle Street",
  "value" => "£500000",
  "number_of_bedrooms" => "3",
  "year_built"=> "1892"
  })
property1.save()

property2 = PropertyTracker.new({
  "address" => "34 Leith Street",
  "value" => "£200000",
  "number_of_bedrooms" => "2",
  "year_built"=> "1902"
  })
property2.save()

binding.pry
nil
