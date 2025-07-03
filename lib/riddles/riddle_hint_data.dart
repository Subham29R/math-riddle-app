class RiddleHintData {
  final String hint;
  final String solution;

  RiddleHintData({required this.hint, required this.solution});
}

final List<RiddleHintData> riddleHintList = [
  RiddleHintData(
    hint: "It's an odd number sequence.",
    solution: "The next odd number after 7 is 9.",
  ),
  RiddleHintData(
    hint: "Try forming an equation.",
    solution: "4 × 6 = 24, and 24 − 6 = 18.",
  ),
  RiddleHintData(
    hint: "Think about zero being included.",
    solution: "Any number multiplied by 0 is 0.",
  ),
  RiddleHintData(
    hint: "After first subtraction, it's not 25 anymore.",
    solution: "You can subtract 5 from 25 only once.",
  ),
  RiddleHintData(
    hint: "Let the units digit be x.",
    solution: "x + (x+3) = 9 → x = 3 → number is 36.",
  ),
  RiddleHintData(
    hint: "Add the number to a related value.",
    solution: "7+6=13, 11+10=21, 16+15=31.",
  ),
  RiddleHintData(
    hint: "Think visually.",
    solution: "8 on its side is ∞, half of 8 is 0.",
  ),
  RiddleHintData(
    hint: "Don’t count same people repeatedly.",
    solution: "2 parents + 5 sons + 3 sisters + 3 babies = 13.",
  ),
  RiddleHintData(
    hint: "These are cubes.",
    solution: "1³, 2³, 3³, 4³ → 64.",
  ),
  RiddleHintData(
    hint: "Digits are rotating.",
    solution: "Digits rotate position in sequence.",
  ),
  RiddleHintData(
    hint: "Double kids and double time.",
    solution: "Eating rate stays same, so 4× more pizzas = 12.",
  ),
  RiddleHintData(
    hint: "Use combination formula.",
    solution: "7C2 = 21 handshakes.",
  ),
  RiddleHintData(
    hint: "Add increasing differences.",
    solution: "Add 6, 9, 13 → next is +7 → 36.",
  ),
  RiddleHintData(
    hint: "Try squaring the first number and adding the second.",
    solution: "5² + 1 = 25 + 1 = 26, so the answer is 26.",
  ),
  RiddleHintData(
    hint: "Fibonacci sequence.",
    solution: "5 + 3 = 8.",
  ),
  RiddleHintData(
    hint: "Try small numbers.",
    solution: "Only 0 satisfies 3x ≤ 2x.",
  ),
  RiddleHintData(
    hint: "Think about spelling.",
    solution: "1 + G = Gone.",
  ),
  RiddleHintData(
    hint: "Count all appearances of 9.",
    solution: "10 times in tens place + 10 in ones = 20.",
  ),
  RiddleHintData(
    hint: "Look at differences.",
    solution: "Differences are 11, 24, then 44 → next = 36 + 44 = 80.",
  ),
  RiddleHintData(
    hint: "Factorials in reverse.",
    solution: "5! = 120, 4! = 24, 3! = 6...",
  ),
  RiddleHintData(
    hint: "Cubes of odd numbers.",
    solution: "1³, 3³, 5³, 7³ = 343.",
  ),
  RiddleHintData(
    hint: "Try reversing and transforming.",
    solution: "Custom pattern; may involve reverse + square logic.",
  ),
  RiddleHintData(
    hint: "Might not follow previous pattern.",
    solution: "May use a different transformation logic.",
  ),
  RiddleHintData(
    hint: "Repeated logic.",
    solution: "Pattern is possibly a×b + a + b → 5×1 + 5 + 1 = 11 (but answer is 26).",
  ),
  RiddleHintData(
    hint: "Use square roots.",
    solution: "Count how many digits are perfect squares apart.",
  ),
  RiddleHintData(
    hint: "Try assigning variables.",
    solution: "1,6,9,4 satisfy all conditions.",
  ),
  RiddleHintData(
    hint: "All are prime numbers.",
    solution: "Next prime in series is 67.",
  ),
  RiddleHintData(
    hint: "Make an equation.",
    solution: "4×6 + 6 = 30.",
  ),
  RiddleHintData(
    hint: "Check ratio or difference.",
    solution: "May use custom pattern, not clear formula.",
  ),
  RiddleHintData(
    hint: "Cube numbers in descending order.",
    solution: "7³, 5³, 3³, 1³ → 125 in the middle.",
  ),
];
