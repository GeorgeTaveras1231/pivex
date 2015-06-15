defmodule Pivex.Story do
  defstruct [:name, :id, :type, :status, :description]
end

defmodule Pivex.Stories do
  @client HTTPoison

  @doc """
    Make a request to stories_path
  """

  def get(token, project_id) do
    path = Pivex.URL.stories_path(project_id)
    case @client.get(path, [{"X-TrackerToken", token}]) do
     {:ok, response} -> handle_response(response)
    end
  end

  defp handle_response(%{status_code: 200, body: body}) do
    {:ok, parsed_json} = body |> JSON.decode

    parsed_json |> Enum.map(&to_story/1)
  end

  defp to_story(map) do
    %Pivex.Story{
      type: map["story_type"],
      status: map["current_state"],
      id: map["id"],
      name: map["name"],
      description: map["description"]
    }
  end
end

