defmodule CLITest do
  @module Pivex.CLI

  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  import Mock

  test ~s{#{@module}.main(["stories", "--token=abc123", "--project=123123"])} do
    mocked_stories_get = fn
      ("abc123", "123123") ->
        [
          %Pivex.Story{
            id: 1,
            name: "first",
            type: "chore",
            description: "abc123",
            status: "started"
          }
        ]
    end

    output = capture_io fn ->
      with_mock Pivex.Stories, [get: mocked_stories_get] do
        @module.main(["stories", "--token=abc123", "--project=123123"])
      end
    end

    assert output =~ """
      name: first
      id: 1
      status: started
      type: chore
      description: abc123
    """
  end
end
