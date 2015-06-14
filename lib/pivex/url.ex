defmodule Pivex.URL do
  @url "https://www.pivotaltracker.com/services/v5"

  @doc """
    Get the stories path for a project

    Examples:
      iex> #{__MODULE__}.stories_path("123")
      "#{@url}/projects/123/stories"
  """
  def stories_path(project_id) do
    "#{@url}/projects/#{project_id}/stories"
  end
end
