Pivex
=====

A command line tool to interact with PivotalTracker.
Also an exercise for me to learn more Elixir :).

# Install

Run in console:
```bash
$ git clone git@github.com:GeorgeTaveras1231/pivex.git
$ cd pivex
$ mix escript.build
```

This creates an execurable called 'pivex'.

# Usage

See stories

```bash
$ TRACKER_TOKEN=abc123 # your actual token
$ PROJECT_ID=123123 # an actual project id

$ ./pivex stories --token=$TRACKER_TOKEN --project=$PROJECT_ID
```
