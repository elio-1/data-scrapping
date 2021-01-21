require_relative '../lib/mayor.rb'

uri_array = ['http://annuaire-des-mairies.com/95/aincourt.html']

describe "the array_get_townhall_email function" do
  it "should be an array" do
    expect(array_get_townhall_email(gets_urls)).to be_instance_of(Array)
  end
  it "shouldn't be nil" do
    expect(array_get_townhall_email(gets_urls)).not_to be_nil
  end
  it "shouldn't be empty" do
    expect(array_get_townhall_email(gets_urls)).not_to be_empty
  end
end

describe "the gets_name function" do
  it "should be an array" do
    expect(gets_urls).to be_instance_of(Array)
  end
  it "shouldn't be nil" do
    expect(gets_urls).not_to be_nil
  end
  it "shouldn't be empty" do
    expect(gets_urls).not_to be_empty
  end
end

describe "the get townhall name function" do
  it "should be an Array" do
    expect(gets_name).to be_instance_of(Array)
  end
  it "shouldn't be nil" do
    expect(gets_name).not_to be_nil
  end
  it "shouldn't be empty" do
    expect(gets_name).not_to be_empty
  end
end
