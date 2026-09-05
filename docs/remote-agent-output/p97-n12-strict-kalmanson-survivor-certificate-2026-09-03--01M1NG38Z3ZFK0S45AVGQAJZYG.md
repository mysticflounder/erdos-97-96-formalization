# P97 strict-Kalmanson Wave 5 — exact n=12 survivor certificate

**Date:** 2026-09-03  
**Status:** exact strict-Kalmanson abstraction witness; planar realizability unresolved.

## Selected supports
```text
 0 -> [1, 2, 8, 10]
 1 -> [3, 4, 8, 11]
 2 -> [0, 1, 4, 6]
 3 -> [1, 5, 7, 10]
 4 -> [2, 3, 5, 6]
 5 -> [0, 3, 7, 8]
 6 -> [2, 4, 5, 7]
 7 -> [3, 5, 9, 11]
 8 -> [0, 7, 9, 10]
 9 -> [2, 6, 7, 11]
10 -> [0, 8, 9, 11]
11 -> [1, 4, 7, 9]
```

## Exact distance-array witness
The following symmetric off-diagonal integer array realizes every selected row equality. Entries are upper-triangular; diagonal entries are zero.
```text
  0 -20 -20   1  -4  15  -8  -1 -20   1 -20 -23
-20   0 -20  15  15  35  13  23  15  37  17  15
-20 -20   0 -21 -20   1 -20  -1  -8  15  -4   1
  1  15 -21   0 -20  15  -5  15   9  33  15  21
 -4  15 -20 -20   0 -20 -20   1   0  25   8  15
 15  35   1  15 -20   0 -20  15  15  41  25  33
 -8  13 -20  -5 -20 -20   0 -20 -19  15   0   9
 -1  23  -1  15   1  15 -20   0 -20  15   1  15
-20  15  -8   9   0  15 -19 -20   0 -20 -20  -5
  1  37  15  33  25  41  15  15 -20   0 -20  15
-20  17  -4  15   8  25   0   1 -20 -20   0 -20
-23  15   1  21  15  33   9  15  -5  15 -20   0
```

## Exact replay result
```json
{
  "equality_components": 35,
  "kalmanson_inequalities": 990,
  "lexicographically_first_minimum_slack_name": [
    "K1",
    0,
    2,
    3,
    11
  ],
  "minimum_slack": 1,
  "minimum_slack_count": 38,
  "row_values": {
    "0": -20,
    "1": 15,
    "10": -20,
    "11": 15,
    "2": -20,
    "3": 15,
    "4": -20,
    "5": 15,
    "6": -20,
    "7": 15,
    "8": -20,
    "9": 15
  },
  "schema": "p97-n12-strict-survivor-verification/v1",
  "source_sha256": "f923b139610992f6ceab881fab2e5893710dfc584c59c79a509bc859e8f07ec0",
  "status": "PASS"
}
```

All 12 rows have exactly four selected support atoms. Their row values alternate `-20` on even centers and `15` on odd centers. All 990 strict Kalmanson comparisons have positive integer slack; the minimum slack is 1, attained 38 times. The row equalities quotient the 66 distance edges into 35 components.

## Replay
```bash
python src/verify_n12_strict_survivor.py results/n12-strict-kalmanson-survivor.json
```

## File identities

- `results/n12-strict-kalmanson-survivor.json` — 2019 bytes, SHA-256 `f923b139610992f6ceab881fab2e5893710dfc584c59c79a509bc859e8f07ec0`
- `src/verify_n12_strict_survivor.py` — 2291 bytes, SHA-256 `cf39f56f6d47fbca71832d2edb0d843b47bf33c8ad676a0039bf6f32fdae9fa3`
- `results/n12-strict-kalmanson-survivor-verification.json` — 557 bytes, SHA-256 `a17098bca3b4ec124f0301fe9b4ef10c6d3b71e225f792b88239765d32b340e6`

## Claim boundary
This is a counterexample to the *pure* n=12 strict-Kalmanson all-center selected-four row abstraction. It is not a planar Euclidean configuration and not a P97 counterexample. The ongoing computation is testing planar rank-two realizability and mining the smallest exact planar obstruction.
