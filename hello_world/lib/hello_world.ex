defmodule HelloWorld do
  @moduledoc """
  Documentation for `HelloWorld`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> HelloWorld.hello()
      :world

  """
  def hello_confined do
    "Hello, #{HelloWorld.Name.random()}."
  end

  def hello_random do
    "Hello, #{Faker.Person.first_name()}."
  end
end
