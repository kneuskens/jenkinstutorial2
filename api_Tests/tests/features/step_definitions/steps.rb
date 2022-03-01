require 'net/http'
require 'json'

Given("the pets endpoint is up") do
  $petsUrl = "http://localhost:8080/pets"
end

When("user gets all pets") do
  $petsUri = URI($petsUrl)
  $response = JSON.parse(Net::HTTP.get($petsUri))
end

Then("returned JSON object contains the following data:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  #expect($petResponse['status']).to eq "ava
  $expectedResponseTable = table.raw
  expect($response[0]["name"]).to eq $expectedResponseTable[1][0]
  expect($response[0]["status"]).to eq $expectedResponseTable[1][1]
  expect($response[1]["name"]).to eq $expectedResponseTable[2][0]
  expect($response[1]["status"]).to eq $expectedResponseTable[2][1]
  expect($response[2]["name"]).to eq $expectedResponseTable[3][0]
  expect($response[2]["status"]).to eq $expectedResponseTable[3][1]
end

When("user get dog") do
  $petsUri = URI($petsUrl + "/dog")
  $petResponse = JSON.parse(Net::HTTP.get($petsUri))
end

When("user get cat") do
  $petsUri = URI($petsUrl + "/cat")
  $petResponse = JSON.parse(Net::HTTP.get($petsUri))
end

When("user get fish") do
  $petsUri = URI($petsUrl + "/fish")
  $petResponse = JSON.parse(Net::HTTP.get($petsUri))
end

When("user get shikorita") do
  $petsUri = URI($petsUrl + "/shikorita")
  $petResponse = JSON.parse(Net::HTTP.get($petsUri))
end

Then("pet availability should be available") do
  expect($petResponse[0]["status"]).to eq "available"
end

Then("pet availability should be not available") do
  expect($petResponse[0]["status"]).to eq "not available"
end

Then("pets should return error message") do
  expect($petResponse["status"]).to eq "Error"
  expect($petResponse["message"]).to eq "Pet not known in the Petstore"
end