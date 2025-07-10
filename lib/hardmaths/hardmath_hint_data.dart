class HardMathHintData {
  final String hint;
  final String solution;

  HardMathHintData({required this.hint, required this.solution});
}

final List<HardMathHintData> hardMathHintList = [
  HardMathHintData(hint: "Odd number pattern.", solution: "Next is 9."),
  HardMathHintData(
    hint: "Do the math step by step.",
    solution: "4×6 = 24, then -6 = 18.",
  ),
  HardMathHintData(hint: "Think about 0.", solution: "Any number × 0 = 0."),
  HardMathHintData(
    hint: "Only once means one time.",
    solution: "25 - 5 = 20. Then not 25.",
  ),
  HardMathHintData(
    hint: "Try digits that add to 9.",
    solution: "36 → 3 + 6 = 9.",
  ),
  HardMathHintData(
    hint: "Add close numbers.",
    solution: "7+6=13, 11+10=21, 16+15=31.",
  ),
  HardMathHintData(hint: "Look at the shape.", solution: "Half of 8 is 0."),
  HardMathHintData(
    hint: "Don’t count same people twice.",
    solution: "Total is 13.",
  ),
  HardMathHintData(hint: "They're cubes.", solution: "1³, 2³, 3³, 4³ → 64."),
  HardMathHintData(hint: "Last digit is coming front", solution: "6457"),
  HardMathHintData(hint: "Eating rate stays same.", solution: "3×4 = 12 pizzas."),
  HardMathHintData(hint: "It's a handshake formula.", solution: "7C2 = 21."),
  HardMathHintData(hint: "Look at how it increases.", solution: "Next is 36."),
  HardMathHintData(hint: "Square then add.", solution: "5² + 1 = 26."),
  HardMathHintData(hint: "Fibonacci numbers.", solution: "5 + 3 = 8."),
  HardMathHintData(hint: "Try x = 0.", solution: "3×0 = 0 ≤ 2×0 = 0."),
  HardMathHintData(hint: "Spelling trick.", solution: "1 + G = Gone."),
  HardMathHintData(
    hint: "Count how many 9s.",
    solution: "10 in each place = 20.",
  ),
  HardMathHintData(
    hint: "Addition of Cube and Square",
    solution: "4³ + 4² = 80.",
  ),
  HardMathHintData(
    hint: "It's reverse factorials.",
    solution: "5! = 120, 4! = 24...",
  ),
  HardMathHintData(hint: "Cubes of odd numbers.", solution: "7³ = 343."),
  HardMathHintData(hint: "Reverse and play with it.", solution: "Reverse of 18 is 81."),
  HardMathHintData(hint: "+1,-2 Pattern", solution: "20 - 4 = 16."),
  HardMathHintData(hint: "(a+b)-(a-b)", solution: "6 - 4 = 2."),
  HardMathHintData(
    hint: "Think square roots.",
    solution: "Count perfect squares.",
  ),
  HardMathHintData(hint: "Try a combo that works.", solution: "1, 6, 9, 4 work."),
  HardMathHintData(hint: "They’re all primes.", solution: "Next is 67."),
  HardMathHintData(hint: "n*(n+1)", solution: "Multiply with gaps of 2;7*8 = 56."),
  HardMathHintData(hint: "/3", solution: "(1+8)/3 = 3."),
  HardMathHintData(
    hint: "Cubes in reverse order.",
    solution: "7³, 5³, 3³, 1³ → 125.",
  ),

  HardMathHintData(hint: "Opposite side", solution: "6×5 = 30"),
  HardMathHintData(hint: "/4", solution: "(44+8)/4 = 13"),
  HardMathHintData(hint: "Traverse the row in reverse order", solution: " Multiply;3*? = 30;10->ANS."),
  HardMathHintData(hint: "Count grid based Squares", solution: "1x1 squares: 8 rows * 8 columns = 64 squares\n" +
                "2x2 squares: 7 rows * 7 columns = 49 squares\n" +
                "3x3 squares: 6 rows * 6 columns = 36 squares\n" +
                "4x4 squares: 5 rows * 5 columns = 25 squares\n" +
                "5x5 squares: 4 rows * 4 columns = 16 squares\n" +
                "6x6 squares: 3 rows * 3 columns = 9 squares\n" +
                "7x7 squares: 2 rows * 2 columns = 4 squares\n" +
                "8x8 squares: 1 row  * 1 column  = 1 square"),
  HardMathHintData(hint: "+2", solution: "15 + 2 = 17"),
  HardMathHintData(hint: "a² − b²", solution: "2² − 1² = 3"),
  HardMathHintData(hint: "√A + √B", solution: "√1 + √9 = 4"),
  HardMathHintData(
    hint: "Row addition",
    solution: "Row total increases by 20 → 10+18+?+30 = 80 → Ans: 22",
  ),
  HardMathHintData(hint: "Sum ÷ 3", solution: "(1+2+8+13+?)/3 = 10 → Ans: 6"),
  HardMathHintData(hint: "a³ + 1", solution: "a³ + 1 = 730 → a = 9"),
  HardMathHintData(hint: "a + b", solution: "10 + 5 = 15"),
  HardMathHintData(hint: "Prime number", solution: "Next prime after 33 is 37"),
  HardMathHintData(hint: "Multiply by center number", solution: "15 × 5 = 75"),
  HardMathHintData(hint: "a²−1, a²+1 pattern", solution: "8² + 1 = 65"),
  HardMathHintData(hint: "a² − 1", solution: "5² − 1 = 24"),
  HardMathHintData(
    hint: "Add all − Subtract some",
    solution: "Sum: 1+2+8+6+6+5+4+7 = 39 → 39−5−4 = 30",
  ),
  HardMathHintData(hint: "a² − 1", solution: "12² − 1 = 143"),
  HardMathHintData(hint: "√(a+b)", solution: "√(98+98) = √196 = 14"),
  HardMathHintData(hint: "/center", solution: "All numbers divisible by 13"),
  HardMathHintData(hint: "Sum of digits", solution: "3 + 1 + 4 = 8"),
];
