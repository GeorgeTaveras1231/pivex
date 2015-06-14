defmodule StoriesTest do
  use ExUnit.Case, async: true
  import Mock
  @api_url "https://www.pivotaltracker.com/services/v5"

  test ".stories_path(project_id)" do
    assert Pivex.Stories.stories_path("123") == @api_url <> "/projects/123/stories"
  end

  test_with_mock ".get(token, project_id)", HTTPoison,
    [get: fn (_url, _headers) -> "[]" end] do
    stories_url = @api_url <> "/projects/123123/stories"

    Pivex.Stories.get('abc123', "123123")
    assert called(HTTPoison.get(stories_url, [{"X-TrackerToken", 'abc123'}]))
  end
end
