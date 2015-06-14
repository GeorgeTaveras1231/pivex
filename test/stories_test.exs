defmodule StoriesTest do
  use ExUnit.Case, async: true
  import Mock
  doctest Pivex.Stories

  @api_url "https://www.pivotaltracker.com/services/v5"

  test ".get(token, project_id)" do
    stories_url = @api_url <> "/projects/123123/stories"
    stubbed_response = fn(_url, [{"X-TrackerToken", 'abc123'}])->
      {:ok, %HTTPoison.Response{
        body: File.read!("test/fixtures/stories.json"),
        status_code: 200
      }}
    end

    expected_stories = [
      %Pivex.Story{
        id: 560,
        name: "Tractor beam loses power intermittently",
        type: "bug",
        status: "unstarted",
        description: "It's malfunctioning."
      },
      %Pivex.Story{
        id: 565,
        name: "Repair CommLink",
        description: "It's malfunctioning.",
        type: "chore",
        status: "unstarted"
      }
    ]

    with_mock HTTPoison, [get: stubbed_response] do
      assert Pivex.Stories.get('abc123', "123123") == expected_stories
    end
  end
end
