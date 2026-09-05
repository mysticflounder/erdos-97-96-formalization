{
  "checks": {
    "cayley_menger_determinant": -21624050,
    "cayley_menger_vertices": [
      0,
      1,
      2,
      3
    ],
    "equilateral_chain_occurrence_count": 4,
    "exact_k4_every_center": true,
    "first_equilateral_chain_occurrence": [
      2,
      0,
      9,
      7,
      8,
      6
    ],
    "maximum_distance_multiplicity_by_center": [
      4,
      4,
      4,
      4,
      4,
      4,
      4,
      4,
      4,
      4,
      4
    ],
    "minimum_kalmanson_slack": 1,
    "minimum_positive_distance": 12,
    "minimum_triangle_slack": 1,
    "static_bank_clause_count": 25366,
    "static_bank_violations": 0
  },
  "claim_boundary": {
    "established": "exact abstract symmetric positive strict metric satisfying all 660 strict Kalmanson comparisons, all strict triangle inequalities, and one exact four-neighbour distance class at every center",
    "not_established": "planar Euclidean realization; exact replay gives a nonzero four-point Cayley-Menger determinant"
  },
  "cyclic_order": [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
  ],
  "distance_matrix": [
    [
      0,
      35,
      35,
      45,
      59,
      47,
      35,
      47,
      57,
      35,
      24
    ],
    [
      35,
      0,
      24,
      35,
      57,
      46,
      35,
      48,
      59,
      45,
      35
    ],
    [
      35,
      24,
      0,
      12,
      35,
      31,
      21,
      35,
      48,
      35,
      26
    ],
    [
      45,
      35,
      12,
      0,
      35,
      35,
      26,
      41,
      55,
      43,
      35
    ],
    [
      59,
      57,
      35,
      35,
      0,
      35,
      35,
      51,
      66,
      55,
      48
    ],
    [
      47,
      46,
      31,
      35,
      35,
      0,
      18,
      35,
      51,
      41,
      35
    ],
    [
      35,
      35,
      21,
      26,
      35,
      18,
      0,
      18,
      35,
      26,
      21
    ],
    [
      47,
      48,
      35,
      41,
      51,
      35,
      18,
      0,
      35,
      35,
      32
    ],
    [
      57,
      59,
      48,
      55,
      66,
      51,
      35,
      35,
      0,
      35,
      35
    ],
    [
      35,
      45,
      35,
      43,
      55,
      41,
      26,
      35,
      35,
      0,
      12
    ],
    [
      24,
      35,
      26,
      35,
      48,
      35,
      21,
      32,
      35,
      12,
      0
    ]
  ],
  "fixed_row0_mask": 582,
  "hashes": {
    "exact_replay_sha256": "38afd8f29b358228043b184e2622850d9d66dc4225b73281438367dece2fef87",
    "lp_sha256": "e1201b4d498abc8ded93903a0b5c4795c6300f792a785611506de4fb6147149f",
    "metric_sha256": "16d030bd01e683d1bd3bd02dee81836bc95830f34838343878fc887557c637f5",
    "strict_bank_sha256": "14ebc9de12f2d153cf63b13d20ab382902a140b0ecd4bc1a5bd979e796c12550",
    "support_cell_sha256": "dff2525bdb5eb3200e0fd0ec7bc0440c598f161ccd1737f4d2f51f22f67278b4"
  },
  "lp_summary": {
    "objective_or_margin": null,
    "quotient_components": 34
  },
  "n": 11,
  "replay_command": "python src/verify_survivor_exact.py --supports results/cells-gcc-v1small-strict-only/cell-073-mask-582.json --lp results/n11-v1-mask582-lp.json --metric results/n11-v1-mask582-shifted-metric.json --bank generated/bank-v1-plus-small.txt --output results/n11-strict-survivor-exact-replay.json",
  "schema": "p97-n11-strict-kalmanson-survivor-certificate/v1",
  "supports": {
    "0": [
      1,
      2,
      6,
      9
    ],
    "1": [
      0,
      3,
      6,
      10
    ],
    "10": [
      1,
      3,
      5,
      8
    ],
    "2": [
      0,
      4,
      7,
      9
    ],
    "3": [
      1,
      4,
      5,
      10
    ],
    "4": [
      2,
      3,
      5,
      6
    ],
    "5": [
      3,
      4,
      7,
      10
    ],
    "6": [
      0,
      1,
      4,
      8
    ],
    "7": [
      2,
      5,
      8,
      9
    ],
    "8": [
      6,
      7,
      9,
      10
    ],
    "9": [
      0,
      2,
      7,
      8
    ]
  }
}
