class DailyChallenge {
  final String question;
  final String answer;
  final String? imagePath;
  final String hint;
  final String solution;

  DailyChallenge({
    required this.question,
    required this.answer,
    this.imagePath,
    required this.hint,
    required this.solution,
  });
}

final List<DailyChallenge> dailyQuestions = [
  DailyChallenge(
    question: "",
    answer: "21",
    imagePath: 'assets/1 (1).jpg',
    hint: "Prime Number",
    solution: "23,29,31 (10+?=31); 21 (ANS)",
  ),
  DailyChallenge(
    question: "",
    answer: "9",
    imagePath: 'assets/2 (1).jpg',
    hint: "Multiplication",
    solution: "9 × 7 = 63; 9 (ANS)",
  ),
  DailyChallenge(
    question: "",
    answer: "15",
    imagePath: 'assets/3 (1).jpg',
    hint: "Addition",
    solution: "Addition in opposite side; 10 + 5 = 15 (ANS)",
  ),
  DailyChallenge(
    question: "",
    answer: "8",
    imagePath: 'assets/4.jpg',
    hint: "(a+b)-(a-b)",
    solution: "(7 + 4) - (7 - 4) = 8 (ANS)",
  ),
  DailyChallenge(
    question: "",
    answer: "10",
    imagePath: 'assets/5.jpg',
    hint: "Traverse the row in reverse order",
    solution: "Multiply; 3 × ? = 30; 10 (ANS)",
  ),
  DailyChallenge(
    question: "",
    answer: "8079",
    imagePath: 'assets/6.jpg',
    hint: "Find the pattern column-wise",
    solution: "Answer = 8079",
  ),
  DailyChallenge(
    question: "",
    answer: "3",
    imagePath: 'assets/7.jpg',
    hint: "Sum of Upper = Sum of Lower",
    solution: "6 + 15 + 24 + ? = 48; 3 (ANS)",
  ),
  DailyChallenge(
    question: "",
    answer: "30",
    imagePath: 'assets/8.jpg',
    hint: "Multiplication in opposite",
    solution: "6×3; 15×4; 24×5; 180/6 = 30 (ANS)",
  ),
  DailyChallenge(
    question: "",
    answer: "31",
    imagePath: 'assets/9.jpg',
    hint: "2^n - 1",
    solution: "Answer = 31",
  ),
  DailyChallenge(
    question: "",
    answer: "120",
    imagePath: 'assets/10.jpg',
    hint: "Factorial",
    solution: "5! = 120 (ANS)",
  ),

  DailyChallenge(
    question: "-2, 3, 10, 15, ?",
    answer: "26",
    imagePath: null,
    hint: "Observe the jump pattern",
    solution: "Sequence increases in steps: +5, +7, +5, +11 → next +11 = 26",
  ),
  DailyChallenge(
    question: "-2, 4, 8, 10, 20, 22, ?",
    answer: "44",
    imagePath: null,
    hint: "Alt: Multiply and add",
    solution: "Pattern alternates between ×2 and +2: 22 × 2 = 44",
  ),
  DailyChallenge(
    question: "11,5 = 7\n13,4 = 8\n14,3 = 8\n15,2 = ?",
    answer: "8",
    imagePath: null,
    hint: "Look at pair patterns",
    solution: "Output remains constant as 8. So, 8 is the answer.",
  ),
  DailyChallenge(
    question: "25, 32, 37, 47, 58, ?",
    answer: "71",
    imagePath: null,
    hint: "Add increasing numbers",
    solution: "+7, +5, +10, +11, +13 → 58+13 = 71",
  ),
  DailyChallenge(
    question: "-108, 120, 138, 192, ?",
    answer: "228",
    imagePath: null,
    hint: "Add pattern",
    solution: "+18, +54, +36 → 192 + 36 = 228",
  ),
  DailyChallenge(
    question: "-2, 3, 30, 155, ?",
    answer: "498",
    imagePath: null,
    hint: "Increasing multiply",
    solution: "155 × 3 + 33 = 498",
  ),
  DailyChallenge(
    question: "-10, 22, 46, 94, ?",
    answer: "190",
    imagePath: null,
    hint: "Double and add",
    solution: "×2 + 2 logic → 94 × 2 + 2 = 190",
  ),
  DailyChallenge(
    question: "1 8 125 216 ?",
    answer: "729",
    imagePath: null,
    hint: "Cube numbers",
    solution: "1³, 2³, 5³, 6³, ? = 9³ = 729",
  ),
  DailyChallenge(
    question: "29, 38, 47, 56, ?",
    answer: "65",
    imagePath: null,
    hint: "Add 9",
    solution: "Each term +9 → 56 + 9 = 65",
  ),
  DailyChallenge(
    question: "23, 29, 31, ?",
    answer: "37",
    imagePath: null,
    hint: "Prime series",
    solution: "Next prime after 31 is 37",
  ),
];
