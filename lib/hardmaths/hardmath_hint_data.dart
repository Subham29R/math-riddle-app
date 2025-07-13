class HardMathHintData {
  final String hint;
  final String solution;

  HardMathHintData({required this.hint, required this.solution});
}

final List<HardMathHintData> hardMathHintList = [
  HardMathHintData(hint: "Normal BODMASS", solution: "10->ANS"),
  HardMathHintData(
    hint: "N*(num)+num",
    solution: "3*2+2=8\n8*3+3=27\n112*5+5=565->ANS",
  ),
  HardMathHintData(hint: "Try to make an equation", solution: "N³ - N² = 48 → N = 4"),
  HardMathHintData(
    hint: "*6,-6...",
    solution: "66 * 6 = 396,\n396 - 6 = 390->ANS",
  ),
  HardMathHintData(
    hint: "p = (1120/80)²",
    solution: "p = 196->ANS",
  ),
  HardMathHintData(
    hint: "!",
    solution: "Factorial: 5! = 120->ANS",
  ),
  HardMathHintData(hint: "Focus on unit digits", solution: "0 + 1 + 4 + 9 = 14; Unit digit: 4->ANS"),
  HardMathHintData(
    hint: "Addition of Squares",
    solution: "51+1 = 52\n52+4 = 56\n56+9 = 65\n65+16 = 81->ANS",
  ),
  HardMathHintData(hint: "Take common", solution: "4⁶¹×(1 + 4 + 4²)\n21 is divided by 3(smallest)->ANS"),
  HardMathHintData(hint: "2*× (num + 1)²", solution: "2*(1)² = 18\n2*(2)² = 8\n2*(3)² = 18\n 2*(4)² = 32->ANS"),
  HardMathHintData(hint: "Eating rate stays same.", solution: "3×4 = 12 pizzas."),
  HardMathHintData(hint: "Focus on Unit digit\nUnit digit of power 7 cycle:7,9,3,1", solution: "For 7->245/4 = 61 with remainder of 1;7^1 = 1\nFor 1-> Unit digit will always be 1\n7 * 1 = 7->ANS"),
  HardMathHintData(hint: "Addition", solution: "20,40,60,42 + 38 = 80->ANS"),
  HardMathHintData(hint: "Prime Number", solution: "Addition of digits\n11,13,17,3+8+8=19\n88->ANS"),
  HardMathHintData(hint: "Cube-Square.", solution: "8³ - 2² = 508->ANS"),



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
