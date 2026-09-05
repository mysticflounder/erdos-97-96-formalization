# cardGeThirteen card-14 Kalmanson certificate

This Markdown transport preserves the complete machine-readable JSON certificate below. The original JSON SHA-256 is `9cf470b3880eca078342de4f86300422f9b25e4c9e431ca87f9d1aadacccebad`.

```json
{
  "blocked_leaf": "Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen",
  "cnf_sha256": "706c42a5956b0142d9b04f38cb5fcdf66252edb325097d045293168028ba2274",
  "contradiction": "d(1,4) > d(1,6) = d(1,9) > d(1,4)",
  "cyclic_order": [
    1,
    3,
    4,
    5,
    0,
    6,
    7,
    8,
    9,
    2,
    10,
    11,
    12,
    13
  ],
  "date": "2026-09-03",
  "equalities": [
    {
      "from_row_center": 3,
      "lhs": [
        3,
        4
      ],
      "rhs": [
        3,
        6
      ]
    },
    {
      "from_row_center": 10,
      "lhs": [
        10,
        4
      ],
      "rhs": [
        10,
        9
      ]
    },
    {
      "from_row_center": 1,
      "lhs": [
        1,
        6
      ],
      "rhs": [
        1,
        9
      ]
    }
  ],
  "generic_clause": {
    "cyclic_roles": "a,b,c,d,e,f",
    "equality_level": "¬Eq(d(a,d),d(a,e)) ∨ ¬Eq(d(b,c),d(b,d)) ∨ ¬Eq(d(f,c),d(f,e))",
    "hit_level": "¬hit(a,d) ∨ ¬hit(a,e) ∨ ¬hit(b,c) ∨ ¬hit(b,d) ∨ ¬hit(f,c) ∨ ¬hit(f,e)"
  },
  "model_sha256": "03166e4a947c0b66559edb8732a91828ad5a4e0ff5efb8a90e91e0959c233d84",
  "profile": "firstOppositeO1Six",
  "roles": {
    "a": 1,
    "b": 3,
    "c": 4,
    "d": 6,
    "e": 9,
    "f": 10
  },
  "schema": "p97-card14-kalmanson-triangle-certificate/v1",
  "scope": {
    "not_proved": "The whole firstOppositeO1Six profile, all six card-14 profiles, or the arbitrary-cardinality leaf.",
    "proved": "The authenticated maximal card-14 assignment is incompatible with strict convex Euclidean distance order."
  },
  "selected_rows": {
    "a": {
      "center": 1,
      "required_pair": [
        6,
        9
      ],
      "support": [
        6,
        7,
        9,
        12
      ]
    },
    "b": {
      "center": 3,
      "required_pair": [
        4,
        6
      ],
      "support": [
        4,
        6,
        11,
        13
      ]
    },
    "f": {
      "center": 10,
      "required_pair": [
        4,
        9
      ],
      "support": [
        4,
        8,
        9,
        11
      ]
    }
  },
  "source_checkpoint": "3589c08c0",
  "strict_kalmanson": [
    {
      "after_cancellation": "d(1,4) > d(1,6)",
      "inequality": "d(1,4)+d(3,6) > d(1,6)+d(3,4)",
      "quadruple": [
        1,
        3,
        4,
        6
      ]
    },
    {
      "after_cancellation": "d(1,9) > d(1,4)",
      "inequality": "d(1,9)+d(4,10) > d(1,4)+d(9,10)",
      "quadruple": [
        1,
        4,
        9,
        10
      ]
    }
  ]
}
```
