defmodule Pivex.CLI do
  def main(["stories" | argv]) do
    {opts, _, _} = OptionParser.parse(argv)
    Pivex.Stories.get(opts[:token], opts[:project])
    |> Enum.each(&print_story/1)
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
