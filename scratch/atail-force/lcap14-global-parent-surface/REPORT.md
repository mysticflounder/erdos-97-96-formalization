# lcap14 global parent surface

Date: 2026-07-24

Status: **ENCODER VALIDATED; DECISION RUN IN PROGRESS. NO SAT/UNSAT
TERMINAL RECORDED YET. NOT A EUCLIDEAN REALIZABILITY RESULT, A LEAN PROOF,
OR CLOSURE OF ANY `sorry`.**

## Scope

Source-indexed finite decision surface for the open production theorem

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_frontierLargeOppositeCapsBiApexRobustResidual
```

at the exact least live profile: card 14, cap profile `(5,6,6)`, Moser
vertices `0,4,9`, first apex `O1 = 0`, physical second apex `O2 = 4`
(orientation fixed WLOG up to reflection).

This is the successor prescribed by the closure plan after the
`n14-cap-aware-kalmanson` anonymous probe: it is source-indexed by the
frontier pair, the physical-apex deletion rows, and the common critical
map, and it adds the global fields the 2026-07-22 `cardge14-*` audits
proved indispensable:

- complete per-center radius partitions (`eq` atoms with transitivity);
- all-center K4 (one selected four-row inside one class at every center);
- the total critical map (exactly one blocker per source, blocker image
  omitting both robust apices, per-source criticality: no four-clique at
  the blocker avoids its source);
- both-apex full deletion robustness in its proven two-mode normal form
  (five-class or two disjoint K4 classes);
- the frontier pair with all six production survival/double-deletion
  witnesses, the retained row `T0 ∋ q,w`, double row `T1`, two
  strict-cap hits in each, and `one_frontier_source_strict`;
- full pair-deletion minimality (every 12-point subcarrier fails
  all-center K4 at a named witness center) plus weak selected-row escape
  for every proper subset (singleton minimality is subsumed by blocker
  totality);
- partition-level geometric theorem families: bisector at most two
  centers per pair, cyclic alternation of shared pairs, two circles meet
  in at most two points, cap incidence bounds
  (`selectedFourClass_inter_capByIndex_card_le_two`,
  `Card11SelectedCube.support_inter_capByIndex_card_le_one`) lifted to
  4-cliques, and `CapSelectedRowCounting.outsidePair_unique_capCenter`.

Omitted fields are listed in the emitted metadata (planarity beyond the
triangle/Kalmanson relaxation, MEC-disk bounds, alternative-triangle
`noM44` content, cardinalities other than 14, deeper subset minimality).

## Files

- `encode.py` — CNF builder; `surface.cnf` (2,685 vars, 558,764 clauses,
  SHA-256 `ae185d52b4f96a1a59b2c5f65053372c64b9b17766234fa024d42697b971f462`).
- `verify_model.py` — encoder-independent semantic replay of decoded
  models (rebuilds partitions by union-find, re-derives every field).
- `smoke_test.py` — validation gates.

## Validation

```bash
UV_CACHE_DIR=/private/tmp/lcap14-uv-cache uv run --no-project python \
  scratch/atail-force/lcap14-global-parent-surface/smoke_test.py
```

All gates pass:

1. Ground truth: the exact `Q(sqrt(3))` carrier of
   `cardge14-nonlinear-escape-geometry` fails all-center K4 exactly
   outside `{A,B,C}` (so the global block excludes it), while every
   partition-level constraint family holds on its exact distance classes
   with respect to its own convex order and caps.
2. Wiring: three-bisector-owner, both-sources-nonstrict,
   endpoint-two-hit, and no-pair-minimality-witness corruptions are each
   UNSAT.

## Next steps

1. Decide `surface.cnf` (CaDiCaL, DRAT captured; verify any UNSAT with
   `drat-trim`; semantically replay any SAT model with `verify_model.py`).
2. On SAT: exact QF_LRA metric oracle (triangle + strict Kalmanson +
   partition (dis)equalities) and CEGAR cuts.
3. On verified UNSAT: trim and mine the core for the aggregate
   occurrence theorem shape; escalate toward a checked coverage object.
