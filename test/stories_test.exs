defmodule StoriesTest do
  use ExUnit.Case, async: true
  import Mock
  doctest Pivex.Stories

  @api_url "https://www.pivotaltracker.com/services/v5"

  test_with_mock ".get(token, project_id)", HTTPoison,
    [get: fn (_url, _headers) -> "[]" end] do
    stories_url = @api_url <> "/projects/123123/stories"

    Pivex.Stories.get('abc123', "123123")
    assert called(HTTPoison.get(stories_url, [{"X-TrackerToken", 'abc123'}]))
  end
end
