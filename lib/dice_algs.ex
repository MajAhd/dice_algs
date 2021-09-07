defmodule DiceAlgs do
  @moduledoc """
  Dice Probability.
  Consider rolling two regular six-sided dice. When you roll them and add the
  numbers, you get a certain number ranging from 2 (two 1’s) to 12 (two 6’s). More
  precisely, this number is going to have some distribution from 2 to 12. For example, there
  are six ways to roll a 7 but only one way to roll a 2 or 12. The exact distribution for the
  sum is shown below.

  ## Distributed Dice :
   - DiceAlgs.roll_dice()  -> 1..6 , 1..6
   - DiceAlgs.roll_dice([1, 3, 4, 5, 6, 8] ,[1, 2, 2, 3, 3, 4])
   - DiceAlgs.roll_dice([1,1,2,2,3,3],[4,4,5,5,6,6])
   - DiceAlgs.roll_dice(10..20 , 20..30)
  """

  def roll_dice(dice1 \\ 1..6, dice2 \\ 1..6) do
    cond do
      validate_dice(dice1) ->
        %{msg: "Dice 1 has zero 0 value!"}

      validate_dice(dice2) ->
        %{msg: "Dice 2 has zero 0 value!"}

      true ->
        sum_of_range =
          sum_of_dices(dice1, dice2)
          |> List.flatten()

        unique_sum = Enum.uniq(sum_of_range)
        repeated_sum_dices = repeat_of_sums(sum_of_range, unique_sum)

        if distribution(repeated_sum_dices) do
          IO.puts(unique_sum)

          %{
            dice_1: dice1,
            dice_2: dice2,
            # because in elixir/erlang chars have printable codepoints i printed ad string,
            sum_dices: unique_sum |> Enum.map(fn x -> "#{x}" end),
            repeat_sum: repeated_sum_dices |> Enum.map(fn x -> "#{x}" end),
            msg: "✅ is Distributed",
            visualation: print_repeat(dice1, dice2)
          }
        else
          %{
            dice_1: dice1,
            dice_2: dice2,
            # because in elixir char can return to number
            sum_dices: unique_sum |> Enum.map(fn x -> "#{x}" end),
            repeat_sum: repeated_sum_dices |> Enum.map(fn x -> "#{x}" end),
            msg: "❌ not Distributed",
            visualation: print_repeat(dice1, dice2)
          }
        end
    end
  end

  def validate_dice(dice) do
    Enum.find(dice, fn x -> x == 0 end)
  end

  def sum_of_dices(dice1, dice2) do
    Enum.map(
      dice1,
      fn d1 ->
        Enum.map(
          dice2,
          fn d2 ->
            d1 + d2
          end
        )
      end
    )
  end

  def repeat_of_sums(sum_of_range, unique_sum) do
    Enum.map(
      unique_sum,
      fn unq ->
        Enum.sum(
          Enum.filter(
            Enum.map(
              sum_of_range,
              fn sum_r ->
                if sum_r == unq do
                  1
                end
              end
            ),
            & &1
          )
        )
      end
    )
  end

  def print_repeat(dice1, dice2) do
    sum_of_range =
      sum_of_dices(dice1, dice2)
      |> List.flatten()

    unique_sum = Enum.uniq(sum_of_range)

    Enum.map(
      unique_sum,
      fn unq ->
        Enum.filter(
          Enum.map(
            sum_of_range,
            fn sum_r ->
              if sum_r == unq do
                "#{unq}"
              end
            end
          ),
          & &1
        )
      end
    )
  end

  def distribution(sum_repeated) do
    len_sum = Enum.count(sum_repeated)
    mid = div(len_sum, 2)

    if rem(len_sum, 2) === 0 do
      r_side = Enum.slice(sum_repeated, 0..(mid - 1))
      l_side = Enum.slice(sum_repeated, mid..len_sum)

      cond do
        r_side == l_side -> false
        Enum.reverse(l_side) == r_side -> true
        Enum.reverse(l_side) !== r_side -> false
      end
    else
      r_side = Enum.slice(sum_repeated, 0..(mid - 1))
      l_side = Enum.slice(sum_repeated, (mid + 1)..len_sum)

      cond do
        r_side == l_side -> false
        Enum.reverse(l_side) == r_side -> true
        Enum.reverse(l_side) !== r_side -> false
      end
    end
  end
end
