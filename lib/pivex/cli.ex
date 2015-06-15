defmodule Pivex.CLI do
  @module_doc """
    Pivex is a PivotalTracker client.

    COMMANDS:
      stories --token=$TOKEN --project=$PROJECT
        - Fetch stories from #{Pivex.URL.stories_path("$PROJECT")}
  """

  def main(["stories" | argv]) do
    {opts, _, _} = OptionParser.parse(argv)
    Pivex.Stories.get(opts[:token], opts[:project])
    |> Enum.each(&print_story/1)
  end

  def main(["--help"]) do
    IO.puts @module_doc
  end

  defp print_story(story) do
    IO.puts """
      ---------------------
      name: #{story.name}
      id: #{story.id}
      status: #{story.status}
      type: #{story.type}
      description: #{story.description}
    """
  end

end
