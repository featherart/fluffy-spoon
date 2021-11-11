# TrueFacts

**Fact Engine**

An engine that holds facts. Currently offers simple fact-input and subsequent fact-checking. Add facts using a file named `input.txt`. Query facts using a file named `output.txt`. This file must be formatted with a command on each line, like so:

INPUT is_a_cat (lucy)
INPUT is_a_cat (francis)
QUERY is_a_cat (lucy)

In response a file named `output.txt` will be generated that responds to the QUERY:

---
true

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `true_facts` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:true_facts, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/true_facts](https://hexdocs.pm/true_facts).

## Running

1. From the root directory run `iex -S mix`
2. iex> DataStore.start_link
3. iex> TrueFacts.parse_input("input.txt")
4. Results in the file `output.txt`

## Testing

From the root directory run `mix test`

## Implementation Notes

- Agent was my choice as I didn't need everything a GenServer offers, just a means of storing state. Instead of using a Process I could have used ETS. The reason I chose a Process is that it seemed more elegant. Also, I wanted to try writing a basic Agent and this seemed like an opportunity.
- I could have stored state in a Map but chose a Keyword List for the convenience factor. List lookup is less performant than Map lookup so this wasn't the most scalable choice, but I chose to do the thing I was able to get done in the amount of time I had.
- File.stream is generally my preferred way of reading files as it is lazy and it costs me nothing to do this little bit of premature optimization. Again, I opted for a slightly more simple implementation just to work within my time constraints.

## With More Time...

- There are no tests for any of the File I/O logic. I simply ran out of time to write these.
- Every time I write an "if" statement I feel gross. If it's binary logic this still seems like the right way to go. Still, I always think there must be a better way. Sometimes I really miss the ternary operator in JavaScript.
- Any question that doesn't involve a single fact has not been accounted for.
For ex: `INPUT are_friends (cheese, crackers)`
- If I were to iterate I would make it more flexible so that more kinds of INPUT could be parsed.
- Error handling is ... slim to non-existant. For real life production code I prefer to do a lot more error-handling and would not consider creating a PR unless all of my core functionality had unit tests.
