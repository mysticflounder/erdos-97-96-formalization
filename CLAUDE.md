# Agent Instructions

## Existing P97 Theorem Banks

Before deriving a new finite-pattern, row-slot, incidence, or local metric
contradiction for Problem 97, check the already-mined theorem-bank registry:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially
  "Sibling `p97-rvol` banks";
- `certificates/p97_rvol_general_n_mining.md` for the concise census; and
- `certificates/p97_rvol_general_n_mining.json` for every declaration,
  normalized statement shape, source path, and import-reachability result.

Also search the indexed Lean corpora before reproving a candidate:

```bash
nthdegree docs search --lean "<mathematical statement or theorem name>"
```

The sibling census has already identified:

- 96 general-n U5 class-level incidence incompatibility families, supported by
  88 metric-point and 112 scalar-algebra kernels;
- 18 unimported U1 source-unit contradiction consumers for ordinals
  `2, 12, 40, 47, 88, 136, 169, 206`; and
- `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`.

Do not bulk-copy these banks. Port only the exact transitive module closure of
a theorem that is consumed by a live proof-spine obligation, and wire that
consumer in the same change. The canonical repo cannot reverse-import
`p97-rvol`, because `p97-rvol` already depends on this repo.

The five-point obstruction is not a general two-large-cap closer: its exact
pattern covered only 287 of 4,000 stored sampled cubes. The C5D3B source surface
is also not currently portable: its `CGN4gExt` layer duplicates declarations
that have since moved into the canonical repo and must be rebased first.
