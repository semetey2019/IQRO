import 'dart:math';

int levenshteinDistance(String s1, String s2) {
  // Create a matrix to store distances
  List<List<int>> matrix =
      List.generate(s1.length + 1, (i) => List<int>.filled(s2.length + 1, 0));

  // Initialize the first row and first column
  for (int i = 0; i <= s1.length; i++) {
    matrix[i][0] = i;
  }
  for (int j = 0; j <= s2.length; j++) {
    matrix[0][j] = j;
  }

  // Fill the matrix
  for (int i = 1; i <= s1.length; i++) {
    for (int j = 1; j <= s2.length; j++) {
      int substitutionCost = (s1[i - 1] == s2[j - 1]) ? 0 : 1;
      matrix[i][j] = [
        matrix[i - 1][j] + 1, // deletion
        matrix[i][j - 1] + 1, // insertion
        matrix[i - 1][j - 1] + substitutionCost // substitution
      ].reduce((min));
    }
  }

  // Levenshtein distance is found in the bottom-right corner of the matrix
  return matrix[s1.length][s2.length];
}
