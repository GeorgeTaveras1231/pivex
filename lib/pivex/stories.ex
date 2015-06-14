defmodule Pivex.Stories do

  @url "https://www.pivotaltracker.com/services/v5"
  @client HTTPoison

  def get(token, project_id) do
    stories_path(project_id) |>
      @client.get [{"X-TrackerToken", token}]
  end

  def stories_path(project_id) do
    "#{@url}/projects/#{project_id}/stories"
  end
end
