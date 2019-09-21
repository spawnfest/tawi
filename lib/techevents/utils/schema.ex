defmodule Techevents.Utils.Schema do
  @moduledoc """
  Definition of macros for setting up a schema
"""
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset

      @type t :: %__MODULE__{}

      @primary_key{:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
    end
  end
end