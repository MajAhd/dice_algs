# Dice Probability

Consider rolling two regular six-sided dice. When you roll them and add the
numbers, you get a certain number ranging from 2 (two 1’s) to 12 (two 6’s). More
precisely, this number is going to have some distribution from 2 to 12. For example, there
are six ways to roll a 7 but only one way to roll a 2 or 12. The exact distribution for the
sum is shown below.

## Scripts

- please install Elixir and use iex command prompt to run app
- mix test
- run: `c "lib/dice_algs.ex"`
- run: `DiceAlgs.roll_dice()` : by default use regular dice set : 1 to 6
- run: `DiceAlgs.roll_dice([1, 3, 4, 5, 6, 8] ,[1, 2, 2, 3, 3, 4])`
- run: `DiceAlgs.roll_dice([1,1,2,2,3,3],[4,4,5,5,6,6])`
- run: `DiceAlgs.roll_dice(10..20 , 20..30)`
- OR any range of value you want.

### Result `DiceAlgs.roll_dice()`

```
  %{
  dice_1: 1..6,
  dice_2: 1..6,
  msg: "✅ is Distributed",
  repeat_sum: [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1],
  sum_dices: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
  visualation: [
    ["2"],
    ["3", "3"],
    ["4", "4", "4"],
    ["5", "5", "5", "5"],
    ["6", "6", "6", "6", "6"],
    ["7", "7", "7", "7", "7", "7"],
    ["8", "8", "8", "8", "8"],
    ["9", "9", "9", "9"],
    ["10", "10", "10"],
    ["11", "11"],
    ["12"]
  ]
}

```

# References

[data genetics](https://datagenetics.com/blog/june12013/index.html)

[math world](https://mathworld.wolfram.com/Dice.html)
