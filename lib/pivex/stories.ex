defmodule Pivex.Stories do
  @url "https://www.pivotaltracker.com/services/v5"
  @client HTTPoison

  @doc """
    Make a request to stories_path
  """

  def get(token, project_id) do
    stories_path(project_id) |>
      @client.get [{"X-TrackerToken", token}]
  end

  @doc """
    Get the stories path for a project

    Examples:
      iex> Pivex.Stories.stories_path("123")
      "#{@url}/projects/123/stories"
  """
  def stories_path(project_id) do
    "#{@url}/projects/#{project_id}/stories"
  end
end
