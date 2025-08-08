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
  HardMathHintData(
    hint: "Try to make an equation",
    solution: "N³ - N² = 48 → N = 4",
  ),
  HardMathHintData(
    hint: "*6,-6...",
    solution: "66 * 6 = 396,\n396 - 6 = 390->ANS",
  ),
  HardMathHintData(hint: "p = (1120/80)²", solution: "p = 196->ANS"),
  HardMathHintData(hint: "!", solution: "Factorial: 5! = 120->ANS"),
  HardMathHintData(
    hint: "Focus on unit digits",
    solution: "0 + 1 + 4 + 9 = 14; Unit digit: 4->ANS",
  ),
  HardMathHintData(
    hint: "Addition of Squares",
    solution: "51+1 = 52\n52+4 = 56\n56+9 = 65\n65+16 = 81->ANS",
  ),
  HardMathHintData(
    hint: "Take common",
    solution: "4⁶¹×(1 + 4 + 4²)\n21 is divided by 3(smallest)->ANS",
  ),
  HardMathHintData(
    hint: "2*× (num + 1)²",
    solution: "2*(1)² = 18\n2*(2)² = 8\n2*(3)² = 18\n 2*(4)² = 32->ANS",
  ),
  HardMathHintData(
    hint: "Observe the pattern of powers of 10 modulo 7:\nTry 10^1 % 7, 10^2 % 7, 10^3 % 7, ...",
    solution:
        "10^1 % 7 = 3\n10^2 % 7 = 2\n10^3 % 7 = 6\n10^4 % 7 = 4\n10^5 % 7 = 5\n10^6 % 7 = 1\nThe cycle repeats every 6 steps.\nNow, 100 % 6 = 4, so:\n10^100 % 7 = 10^4 % 7 = 4",
  ),
  HardMathHintData(
    hint: "Focus on Unit digit\nUnit digit of power 7 cycle:7,9,3,1",
    solution:
        "For 7->245/4 = 61 with remainder of 1;7^1 = 1\nFor 1-> Unit digit will always be 1\n7 * 1 = 7->ANS",
  ),
  HardMathHintData(hint: "Addition", solution: "20,40,60,42 +38 = 80;38→ANS"),
  HardMathHintData(
    hint: "Prime Number",
    solution: "Addition of digits\n11,13,17,3+8+8=19\n88->ANS",
  ),
  HardMathHintData(hint: "Cube-Square.", solution: "8³ - 2² = 508->ANS"),
  HardMathHintData(hint: "a+2b+3c", solution: "18 + 6 + 15 = 39->ANS"),
  HardMathHintData(hint: "-1,-2,3", solution: "564->ANS"),
  HardMathHintData(hint: "Digits", solution: "156+1+5+6 = 168->ANS"),
  HardMathHintData(hint: "(a*b)/c", solution: "(8*1)/4 = 2->ANS"),
  HardMathHintData(
    hint: "Cubes in reverse order.",
    solution: "7³, 5³, 3³, 1³ → 125.",
  ),
  HardMathHintData(hint: "Prime Number", solution: "23,29,31(10+?=31);21(ANS)"),
  HardMathHintData(hint: "Multiplication ", solution: "9*7 = 63;7(ANS)"),
  HardMathHintData(
    hint: "Addition",
    solution: " Addition in opposite side;10+5 = 15(ANS) ",
  ),
  HardMathHintData(hint: "(a+b)-(a-b)", solution: "(7+4)-(7-4) = 8(ANS)"),
  HardMathHintData(
    hint: "Traverse the row in reverse order",
    solution: " Multiply;3*? = 30;10(ANS)",
  ),
  HardMathHintData(hint: "Find the pattern column wise", solution: "8079"),
  HardMathHintData(
    hint: "Sum of Upper= Sum of lower ",
    solution: "6+15+24+?=48;3(ANS)",
  ),
  HardMathHintData(
    hint: "Multiplication in opposite ",
    solution: "6*3;15*4;24*5;180/6=30(ANS)",
  ),
  HardMathHintData(
    hint: "Summation of Digits",
    solution: "All number adds up to the center number;9->ANS",
  ),
  HardMathHintData(
    hint: "Look in different stars",
    solution:
        "1st star:- All are divisible by 9->Center of 2nd Star\n3nd star:- All are divisible by 17->ANS ",
  ),
];
