defmodule Pivex.Story do
  defstruct [:name, :id, :type, :status, :description]
end

defmodule Pivex.Stories do
  @client HTTPoison

  @doc """
    Make a request to stories_path
  """

  def get(token, project_id) do
    Pivex.URL.stories_path(project_id)
    |> @client.get([{"X-TrackerToken", token}])
    |> handle_response
  end

  defp handle_response(%{status_code: 200, body: body}) do
    {:ok, parsed_json} = body |> JSON.decode

    parsed_json |> Enum.map(&to_story/1)
  end

  defp to_story(%{
    "story_type" => type,
    "current_state" => status,
    "id" => id,
    "name" => name,
    "description" => description}
  ) do

    %Pivex.Story{
      type: type,
      status: status,
      id: id,
      name: name,
      description: description
    }
  end
end

