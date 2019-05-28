defmodule Heapify do
  @moduledoc """
  Heapify a list. Return a min heap from the list.
  """

  @doc """
  Make a heap out of a list using siftup algorithm. 
  """
  @spec run(list) :: list
  def run(list) when is_list(list) do
    len = Enum.count(list)
    
    Enum.reduce(0..len - 1, list, fn index, acc ->
      siftup(acc, index)
    end)
  end
  def run(_), do: raise "Invalid Argument. run/1 can only take a list."

  defp siftup(list, 0), do: list
  defp siftup(list, index) do
    father = div((index - 1), 2)
    if(Enum.at(list, father) > Enum.at(list, index)) do
      list
      |> swap(father, index)
      |> siftup(father)
    else
      siftup(list, 0)
    end
  end

  defp swap(list, index1, index2) do
    tmp = Enum.at(list, index1)
    list = List.update_at(list, index1, fn _ -> Enum.at(list, index2) end)
    List.update_at(list, index2, fn _ -> tmp end)
  end
end
