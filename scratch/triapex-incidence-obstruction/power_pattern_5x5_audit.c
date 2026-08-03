#include <stdint.h>
#include <stdio.h>

/*
 * Exhaust the corrected 5x5 power-pattern determinant criterion for the
 * fifteen full circles in check_model.py.  A zero bit is a certified circle
 * incidence; every off-support entry is nonzero in that literal equality
 * shadow.  Stop counting a submatrix after its second perfect matching.
 */

static const uint16_t forced_zero[15] = {
    (1u << 1) | (1u << 6) | (1u << 9) | (1u << 14),
    (1u << 2) | (1u << 7) | (1u << 10) | (1u << 14),
    (1u << 3) | (1u << 7) | (1u << 11) | (1u << 13),
    (1u << 0) | (1u << 4) | (1u << 10) | (1u << 13),
    (1u << 1) | (1u << 5) | (1u << 6) | (1u << 8),
    (1u << 3) | (1u << 6) | (1u << 10) | (1u << 14),
    (1u << 1) | (1u << 7) | (1u << 11) | (1u << 14),
    (1u << 3) | (1u << 4) | (1u << 11) | (1u << 12),
    (1u << 1) | (1u << 5) | (1u << 9) | (1u << 11),
    (1u << 1) | (1u << 4) | (1u << 11) | (1u << 13),
    (1u << 0) | (1u << 7) | (1u << 12) | (1u << 13),
    (1u << 3) | (1u << 5) | (1u << 12) | (1u << 13),
    (1u << 0) | (1u << 1) | (1u << 2) | (1u << 3) |
        (1u << 13) | (1u << 14),
    (1u << 4) | (1u << 5) | (1u << 6) | (1u << 7) |
        (1u << 12) | (1u << 14),
    (1u << 8) | (1u << 9) | (1u << 10) | (1u << 11) |
        (1u << 12) | (1u << 13),
};

static int rows[5];
static int cols[5];
static int matching_count;

static void count_matchings(int row_index, unsigned used_columns) {
  if (matching_count > 1) return;
  if (row_index == 5) {
    ++matching_count;
    return;
  }
  for (int j = 0; j < 5; ++j) {
    if ((used_columns & (1u << j)) == 0 &&
        (forced_zero[rows[row_index]] & (1u << cols[j])) == 0) {
      count_matchings(row_index + 1, used_columns | (1u << j));
    }
  }
}

int main(void) {
  long long checked = 0;
  for (unsigned row_mask = 0; row_mask < (1u << 15); ++row_mask) {
    if (__builtin_popcount(row_mask) != 5) continue;
    int ri = 0;
    for (int i = 0; i < 15; ++i)
      if (row_mask & (1u << i)) rows[ri++] = i;

    for (unsigned col_mask = 0; col_mask < (1u << 15); ++col_mask) {
      if (__builtin_popcount(col_mask) != 5) continue;
      int ci = 0;
      for (int i = 0; i < 15; ++i)
        if (col_mask & (1u << i)) cols[ci++] = i;

      ++checked;
      matching_count = 0;
      count_matchings(0, 0);
      if (matching_count == 1) {
        printf("HIT after %lld submatrices\n", checked);
        return 1;
      }
    }
  }
  printf("NO_HIT checked %lld\n", checked);
  return 0;
}
