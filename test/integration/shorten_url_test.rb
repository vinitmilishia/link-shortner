require "test_helper"

class ShortenUrlTest < ActionDispatch::IntegrationTest
  def random_long_url
    "https://my.verylong.url/#{SecureRandom.hex(16)}"
  end

  test "Iteration 1 - should create a shortened URL" do
    # force our slug generator to generate something deterministic
    SlugGenerator.implementation = -> { "abc123" }

    long_url = random_long_url()

    # create a shortened url
    post "/api/links", params: { url: long_url }
    assert_response :created

    # following the url should redirect us to the long url
    get "/abc123"
    assert_redirected_to long_url
  end

  test "Iteration 2 - posting the same url multiple times should return the same slug" do
    # force our slug generator to generate something deterministic
    generated_slugs = [ "one", "two" ]
    SlugGenerator.implementation = -> { generated_slugs.shift or fail "ran out of slugs" }

    long_url = random_long_url()

    # create a shortened url
    post "/api/links", params: { url: long_url }
    assert_response :created

    # try to create the same url, get a different status code
    post "/api/links", params: { url: long_url }
    assert_response :ok

    # fetching the first generated slug should redirect us
    get "/one"
    assert_redirected_to long_url

    # the second url should not be used however
    get "/two"
    assert_response :not_found
  end
end
