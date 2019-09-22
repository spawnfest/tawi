defmodule TecheventsWeb.PageView do
  use TecheventsWeb, :view

  def description(desc) do
    {excerpt, _} = String.split_at(desc, 140)
    excerpt
  end
end
