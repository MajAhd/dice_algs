defmodule DiceAlgsTest do
  use ExUnit.Case
  doctest DiceAlgs

  test "roll dice 1 with 0 number failed" do
    dice_1 = [0, 1, 2, 3]
    dice_2 = [2, 3, 4, 5]

    assert DiceAlgs.roll_dice(dice_1, dice_2) == %{msg: "Dice 1 has zero 0 value!"}
  end

  test "roll dice 2 with 0 number failed" do
    dice_1 = [1, 1, 2, 3]
    dice_2 = [1, 3, 0, 5]

    assert DiceAlgs.roll_dice(dice_1, dice_2) == %{msg: "Dice 2 has zero 0 value!"}
  end

  test "validate dice" do
    dice = [1, 0, 2, 0]
    assert DiceAlgs.validate_dice(dice) == 0
  end

  test "sum of dices" do
    dice_1 = [1, 2, 3]
    dice_2 = [1, 2, 3]

    assert DiceAlgs.sum_of_dices(dice_1, dice_2) == [
             [2, 3, 4],
             [3, 4, 5],
             [4, 5, 6]
           ]
  end

  test "repeat of sum of dices" do
    dice_1 = [1, 2, 3]
    dice_2 = [1, 2, 3]

    sum_of_range =
      DiceAlgs.sum_of_dices(dice_1, dice_2)
      |> List.flatten()

    unique_sum = Enum.uniq(sum_of_range)
    repeated_sum_dices = DiceAlgs.repeat_of_sums(sum_of_range, unique_sum)

    assert repeated_sum_dices == [1, 2, 3, 2, 1]
  end

  test "find distributed dices" do
    dice_1 = [1, 2, 3]
    dice_2 = [1, 2, 3]

    assert DiceAlgs.roll_dice(dice_1, dice_2) == %{
             dice_1: dice_1,
             dice_2: dice_2,
             msg: "✅ is Distributed",
             repeat_sum: ["1", "2", "3", "2", "1"],
             sum_dices: ["2", "3", "4", "5", "6"],
             visualation: [["2"], ["3", "3"], ["4", "4", "4"], ["5", "5"], ["6"]]
           }
  end
end
