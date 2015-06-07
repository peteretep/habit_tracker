Fabricator(:habit) do
  name { habit_examples.sample }
  streak Random.rand(5..30)
end

def habit_examples
  ['Avoid alcohol', 'Avoid chocolate', 'Excercise 1hr']
end