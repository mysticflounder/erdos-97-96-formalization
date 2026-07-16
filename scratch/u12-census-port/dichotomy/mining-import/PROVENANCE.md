# Provenance — |A|=12 minimal-core mining of record (imported 2026-07-06)

Source: session scratchpad of the 2026-07-06 math-prover minimal-core census
(`/private/tmp/claude-501/-Users-adam-projects-math-projects-erdos-97-96-formalization/f1cc942b-5f16-4d74-a071-8d71886e1f01/scratchpad/`),
the run cited by the archived 2026-07-06 closure plan
(`docs/archive/2026-07-10-closure-plan-consolidation/closure-plan-2026-07-06.md` §7; "minimal infeasible
cores form hundreds of classes … 10 cubes→35 classes … 70→146") and by the
nthdegree memory "Minimal-core class census for |A|=12 dead center-K4 cubes
(2026-07-06)". Session scratchpads are volatile temp storage; copied here to
make the dichotomy classification reproducible in-repo.

Files (sha256 at import):

```
139f77e07f3e1496938a8efe78b5a3fbf9c0758fd951790ebcfb7c71a131641f  result_654.json
a9848cb7bb4f3d8ff252501251a203b10545e12316f967eba29f25068a4950f7  result_555.json
eb3ec5dae8106a993ca2b44a4bc675f138066e535cafd822da432327c4bb3ea8  mine.py
bec760574078046f1fb0e0c4803774f66f1e87e9fd74886ce46b35f0ab2307e0  run_full.py
db2539c80dcfb031423f17a5ae37d31b9a7701a9defe76b023d7404f9611623d  enum4.py
d3ba3bcda2e4674cc3d36f67fb652e756cbd0ee3ffd9e3b82c30ca6ee4ba2099  confirm_sample.py
1e62963800b4a1d99fb8762370054f65a0511857f9cf573e2c9ca00ef9bae0ef  analyze.py
```

Key facts about the record (verified by inspection 2026-07-06):

- `result_654.json`: incremental save at 70/120 cubes (accumulation tail
  `[70, 146]`), `confirmed: false` — the per-class Singular confirmation
  phase in `run_full.py` never ran to completion; all class `mode` /
  `sing_base_empty` / `sing_sat_empty` fields are `null`. 146 classes.
- `result_555.json`: mining completed at M=60 (`[60, 120]`), `confirmed:
  false`, same null confirmation fields. 120 classes.
- Cube universe: `sample_cubes(PROFILES[prof], 2000, seed=7)[:M]` — the
  deterministic seed-7 census sample prefix, NOT the `_u12_dead_*.jsonl`
  files; the mined prefix contains both stage-1-dead (ℂ-empty equality
  system) and stage-1-alive (stage-2-only-dead) cubes: 654 = 34+36 of 70,
  555 = 21+39 of 60 (from `percube[].Cempty`).
- Mining oracle (`mine.py`): per subset P, pairwise-induced equidistance
  system (per center c ∈ P, pivot min(K_c∩P), |K_c∩P| ≥ 2) + per-pair
  Rabinowitsch saturation over all pairs in P + gauge x0=(0,0), x1=(1,0)
  for original labels 0,1 when present in P; msolve char-0 SOLVE `[-1]`
  ⇒ dead ("no-distinct-real"). Exhaustive over C(12,k), k = 4..7,
  search timeout 1.0 s (dead verdicts measured ≤ 0.251 s).
- Only per-class representatives (`rep_cube`, `rep_P`, `rep_edges`) and
  counts were persisted; per-core instances were not.
- The δ = R−(2k−4) distribution cited in the closure plan ({−1:6, 0:56,
  +1:79, +2:5}) is the 654 class distribution per `confirm_sample.py`'s
  formula (R = Σ_active centers (outdeg−1)); 555's δ distribution was never
  computed in the record.

The dichotomy classification (`../classify.py`) re-derives everything it
uses from these files plus the ported census data in `scratch/u12-census-port/`.
