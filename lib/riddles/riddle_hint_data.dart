class RiddleHintData {
  final String hint;
  final String solution;

  RiddleHintData({required this.hint, required this.solution});
}

final List<RiddleHintData> riddleHintList = [
  RiddleHintData(hint: "Odd number pattern.", solution: "Next is 9."),
  RiddleHintData(
    hint: "Do the math step by step.",
    solution: "4×6 = 24, then -6 = 18.",
  ),
  RiddleHintData(hint: "Think about 0.", solution: "Any number × 0 = 0."),
  RiddleHintData(
    hint: "Only once means one time.",
    solution: "25 - 5 = 20. Then not 25.",
  ),
  RiddleHintData(
    hint: "Try digits that add to 9.",
    solution: "36 → 3 + 6 = 9.",
  ),
  RiddleHintData(
    hint: "Add close numbers.",
    solution: "7+6=13, 11+10=21, 16+15=31.",
  ),
  RiddleHintData(hint: "Look at the shape.", solution: "Half of 8 is 0."),
  RiddleHintData(
    hint: "Don’t count same people twice.",
    solution: "Total is 13.",
  ),
  RiddleHintData(hint: "They're cubes.", solution: "1³, 2³, 3³, 4³ → 64."),
  RiddleHintData(hint: "Last digit is coming front", solution: "6457"),
  RiddleHintData(hint: "Eating rate stays same.", solution: "3×4 = 12 pizzas."),
  RiddleHintData(hint: "It's a handshake formula.", solution: "7C2 = 21."),
  RiddleHintData(hint: "Look at how it increases.", solution: "Next is 36."),
  RiddleHintData(hint: "Square then add.", solution: "5² + 1 = 26."),
  RiddleHintData(hint: "Fibonacci numbers.", solution: "5 + 3 = 8."),
  RiddleHintData(hint: "Try x = 0.", solution: "3×0 = 0 ≤ 2×0 = 0."),
  RiddleHintData(hint: "Spelling trick.", solution: "1 + G = Gone."),
  RiddleHintData(
    hint: "Count how many 9s.",
    solution: "10 in each place = 20.",
  ),
  RiddleHintData(
    hint: "Addition of Cube and Square",
    solution: "4³ + 4² = 80.",
  ),
  RiddleHintData(
    hint: "It's reverse factorials.",
    solution: "5! = 120, 4! = 24...",
  ),
  RiddleHintData(hint: "Cubes of odd numbers.", solution: "7³ = 343."),
  RiddleHintData(
    hint: "Reverse and play with it.",
    solution: "Reverse of 18 is 81.",
  ),
  RiddleHintData(hint: "+1,-2 Pattern", solution: "20 - 4 = 16."),
  RiddleHintData(hint: "(a+b)-(a-b)", solution: "6 - 4 = 2."),
  RiddleHintData(
    hint: "Think square roots.",
    solution: "Count perfect squares.",
  ),
  RiddleHintData(hint: "Try a combo that works.", solution: "1, 6, 9, 4 work."),
  RiddleHintData(hint: "They’re all primes.", solution: "Next is 67."),
  RiddleHintData(
    hint: "n*(n+1)",
    solution: "Multiply with gaps of 2;7*8 = 56.",
  ),
  RiddleHintData(hint: "/3", solution: "(1+8)/3 = 3."),
  RiddleHintData(
    hint: "Cubes in reverse order.",
    solution: "7³, 5³, 3³, 1³ → 125.",
  ),

  RiddleHintData(hint: "Opposite side", solution: "6×5 = 30"),
  RiddleHintData(hint: "/4", solution: "(44+8)/4 = 13"),
  RiddleHintData(
    hint: "Traverse the row in reverse order",
    solution: " Multiply;3*? = 30;10->ANS.",
  ),
  RiddleHintData(hint: "+2", solution: "15 + 2 = 17"),
  RiddleHintData(
    hint: "Count grid based Squares",
    solution:
        "1x1 squares: 8 rows * 8 columns = 64 squares\n" +
        "2x2 squares: 7 rows * 7 columns = 49 squares\n" +
        "3x3 squares: 6 rows * 6 columns = 36 squares\n" +
        "4x4 squares: 5 rows * 5 columns = 25 squares\n" +
        "5x5 squares: 4 rows * 4 columns = 16 squares\n" +
        "6x6 squares: 3 rows * 3 columns = 9 squares\n" +
        "7x7 squares: 2 rows * 2 columns = 4 squares\n" +
        "8x8 squares: 1 row  * 1 column  = 1 square-> Ans: 204",
  ),
  RiddleHintData(hint: "a² − b²", solution: "2² − 1² = 3"),
  RiddleHintData(hint: "√A + √B", solution: "√1 + √9 = 4"),
  RiddleHintData(
    hint: "Row addition",
    solution: "Row total increases by 20 → 10+18+?+30 = 80 → Ans: 22",
  ),
  RiddleHintData(hint: "Sum ÷ 3", solution: "(1+2+8+13+?)/3 = 10 → Ans: 6"),
  RiddleHintData(hint: "a³ + 1", solution: "a³ + 1 = 730 → a = 9"),
  RiddleHintData(hint: "a + b", solution: "10 + 5 = 15"),
  RiddleHintData(hint: "Prime number", solution: "Next prime after 33 is 37"),
  RiddleHintData(hint: "Multiply by center number", solution: "15 × 5 = 75"),
  RiddleHintData(hint: "a²−1, a²+1 pattern", solution: "8² + 1 = 65"),
  RiddleHintData(hint: "2ⁿ − 1", solution: "2⁵ − 1 = 31->(ANS)"),
  RiddleHintData(
    hint: "Add all − Subtract some",
    solution: "Sum: 1+2+8+6+6+5+4+7 = 39 → 39−5−4 = 30",
  ),
  RiddleHintData(hint: "a² − 1", solution: "12² − 1 = 143"),
  RiddleHintData(hint: "√(a+b)", solution: "√(98+98) = √196 = 14"),
  RiddleHintData(hint: "/center", solution: "All numbers divisible by 13"),
  RiddleHintData(hint: "Sum of digits", solution: "3 + 1 + 4 = 8"),
];
