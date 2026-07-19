# n=14 cap-aware bi-apex/Kalmanson discovery encoder

Date: 2026-07-17

Status: **THEOREM-DISCOVERY IMPLEMENTATION COMPLETE; STRUCTURAL SMOKE GATES
PASS; TWO NO-BANK FULL-LINEAR PROBES ARE UNKNOWN UNDER 30 S AND 60 S WALL
BUDGETS.  NO SAT OR UNSAT TERMINAL WAS OBTAINED.  THIS IS NOT A EUCLIDEAN
REALIZABILITY RESULT, A LEAN PROOF, OR CLOSURE OF ANY `sorry`.**

## Scope

This lane implements the first cap-aware successor to
`generic-biapex-kalmanson-search/cegar.py` at the exact least live profile

```text
n = 14
v2 = 0, v3 = 4, v1 = 9
C1 = {0,1,2,3,4}
C2 = {4,5,6,7,8,9}
C3 = {9,10,11,12,13,0}.
```

Only files under `scratch/atail-force/n14-cap-aware-kalmanson/` were added.
No Lean or Lake command was run, and no production source, plan document,
protected mining lane, or historical bank was modified.

## Required theorem-bank preflight

Before adding the finite constraints, the following registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora with

  ```bash
  nthdegree docs search --lean \
    "selected critical row support intersection cap at most two endpoint at most one"
  ```

The indexed search found the current production endpoint theorem.  The bank
census again found
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`,
but that is a metric consumer, not a producer for this anonymous carrier
surface.  No bank entry supplies a cap-aware finite closure theorem, so this
lane does not rederive or shadow an existing banked contradiction.

## Exact source-proved cap constraints

The general bound used by the encoder is the current production theorem

```lean
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
```

in `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean`.  Its relevant
statement is:

```lean
(hcenter : center ∈ S.capByIndex i) :
  (K.support ∩ S.capByIndex i).card ≤ 2
```

The endpoint sharpening is the current production theorem

```lean
Card11SelectedCube.support_inter_capByIndex_card_le_one
```

in `lean/Erdos9796Proof/P97/Census554/GeometryBridge.lean`.  It says that a
selected row centered at Moser apex `oppositeVertexByIndex i` meets any other
cap `j != i` in at most one point.  In the normalized three-cap partition,
each Moser vertex is an endpoint of exactly the other two caps.  Therefore it
justifies precisely these six endpoint-cap instances:

```text
center 0: C1 <= 1, C3 <= 1
center 4: C1 <= 1, C2 <= 1
center 9: C2 <= 1, C3 <= 1.
```

The encoder does **not** assert a blanket endpoint theorem outside these
source-valid incidences.

The source statements were inspected directly.  This scratch lane did not
run a fresh Lean build because production builds were explicitly gated by the
concurrent shell-curvature lane.

## Encoding

`search.py` imports the current generic whole-carrier CEGAR module without
alteration.  It consequently retains all of its structural blocks:

- exactly four non-self support members in every selected row;
- pairwise selected-row intersection at most two;
- each support pair occurring at at most two centers;
- cyclic alternation for a pair shared by two centers;
- strong connectivity of the selected witness digraph;
- one actual blocker per source;
- source membership in its blocker row; and
- omission of blocker values `0` and `4`.

The metric oracle is also inherited unchanged: positive distances, all
triangle inequalities, both strict Kalmanson inequalities for every cyclic
quadruple, and all selected-row equalities.

The cap-aware successor adds:

- 17 center-cap constraints `|row(center) ∩ cap| <= 2`, one for every
  incidence of a carrier center with a closed cap; and
- the six endpoint-cap constraints above with bound one.

No bank is preloaded.  Both payloads record

```json
"preloaded_schema_count": 0
```

so the historical eager 454-schema / 1.68-million-embedding preload is absent.
The only learned cuts are fully tracked metric cores discovered during the
current invocation and transported by the generic increasing-embedding plus
reflection rule.

The imported generic sources were pinned by content during these runs:

```text
7d81e96cf1a44d1d262104df6df2176ec66736ed1456bf54876c0646398f02e6  cegar.py
e2f680edbfc716b98618bca9b4c3dccdcd1a2286bea71ee5fe313c327aa4e745  payload_verifier.py
```

## Smoke gates

Command:

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/n14-cap-aware-kalmanson/smoke_test.py
```

Exact output:

```text
PASS: n=14 cap-aware structural smoke gates
base=SAT; decoded row/blocker semantics replayed
interior same-cap triple=UNSAT; endpoint same-cap pair=UNSAT
cap_constraint_counts={'cap_center_card_le_two': 17, 'cap_endpoint_card_le_one': 6}
```

The gate checks all of the following:

1. the complete inherited structural surface plus the new cap clauses is SAT;
2. the decoded rows satisfy an encoder-independent cap-cardinality replay;
3. the blocker image omits `0` and `4`;
4. forcing three C1 points into the row at interior center 1 is UNSAT;
5. forcing two C1 points into the row at endpoint center 0 is UNSAT; and
6. deliberately corrupted interior and endpoint rows are rejected by the
   independent cap verifier.

These are encoding smoke tests.  Their small UNSAT checks are not geometric
theorems and have no DRAT certificate.

## Bounded discovery probes

### Seed 0, 30 seconds

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/n14-cap-aware-kalmanson/search.py \
  --wall-seconds 30 --outer-timeout-ms 5000 --metric-timeout-ms 5000 \
  --random-seed 0 \
  --output scratch/atail-force/n14-cap-aware-kalmanson/seed0_30s.json \
  --summary-only
```

Result:

```text
status               UNKNOWN
reason               wall budget
elapsed              30.008653542026877 s
refinements          73
order schemas        73
preloaded schemas    0
```

### Seed 1, 60 seconds

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/n14-cap-aware-kalmanson/search.py \
  --wall-seconds 60 --outer-timeout-ms 5000 --metric-timeout-ms 5000 \
  --random-seed 1 \
  --output scratch/atail-force/n14-cap-aware-kalmanson/seed1_60s.json \
  --summary-only
```

Result:

```text
status               UNKNOWN
reason               wall budget during cut transport
elapsed              60.00014474999625 s
refinements          169
order schemas        169
preloaded schemas    0
```

`UNKNOWN` here means only unresolved under the stated wall budget.  It is not
solver evidence for SAT or UNSAT.  The growing schema counts show that the
no-bank search continues to discover distinct metric-dead row patterns; they
do not constitute a coverage theorem or a convergence estimate.

Checkpoint hashes:

```text
ecc2d3f56ae1b61f8c1e74fdb8950905fc5e04328c7f9946c1f96c2f548aa8a1  seed0_30s.json
fb628143ef70d13aeb7c91c1c330d1c20d86a97f929d64f0a9c3209390795dd1  seed1_60s.json
```

## Independent verification and trust boundary

`verify_result.py` does not import the cap-aware encoder.  For any future SAT
payload it:

1. invokes the existing solver-independent exact-rational verifier for every
   generic row, blocker, distance, triangle, and strict Kalmanson constraint;
2. separately checks the fixed apex/cap metadata; and
3. separately checks all 17 general and six endpoint cap-row cardinalities.

`search.py` calls this verifier before labelling any payload
`SAT_VERIFIED_KALMANSON_SHADOW`; it can also be replayed as a separate process.
No SAT payload was found in the two runs, so the complete exact-rational path
was not exercised on a terminal witness in this lane.

The two UNKNOWN payloads and their recorded refinements were generated by Z3
4.17.0.  The individual metric-UNSAT cores and transported cuts were not
cross-solver replayed in this lane, and there is no DRAT/LRAT or Lean
certificate.  Because neither run terminates UNSAT, no coverage conclusion
depends on those cuts.  The smoke tests and cap-row semantics were replayed;
the bounded search frontier itself remains solver-trusted discovery state.

Most importantly, even a future independently verified SAT terminal would be
only an abstract Kalmanson metric shadow, not a planar Euclidean configuration.
A future UNSAT exhaustion would exclude this exact finite abstraction only;
it would still require certificate checking and a formal extraction before it
could affect the Lean proof.

## Files

- `search.py` — cap-aware no-bank CEGAR driver;
- `verify_result.py` — solver-independent SAT payload and cap replay;
- `smoke_test.py` — structural/negative smoke gates;
- `seed0_30s.json` — exact seed-0 UNKNOWN checkpoint; and
- `seed1_60s.json` — exact seed-1 UNKNOWN checkpoint.

## Recommended next proof-producing target

No further anonymous run is justified merely by these UNKNOWN results.  The
public load-bearing target remains the cap-strengthened direct contradiction

```lean
theorem false_of_largeOppositeCapsBiApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius Hinitial}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    False
```

The next discovery object should therefore be source-indexed: retain the
named frontier pair, the actual physical-apex deletion rows, the chosen
critical sources, and their common critical-map provenance.  The most concrete
existing consumer target is a live Lemma 81 occurrence:

```text
actual W-row contains F, X, Z
actual Z-row contains P, X
cyclic order W < F < P < X < Z.
```

Thus the missing positive content is an actual-row overlap (`Z` in the
`W`-row and a common `X`) together with the five-role order.  The known exact
n=14 cap-incidence fixture avoids every such placement, so this producer must
visibly use Euclidean/full-radius/MEC, `noM44`, or stronger global minimality
information omitted by the anonymous encoder.  An equivalent source-indexed
producer for another already-checked terminal, or a direct geometric
contradiction, is equally valid.

`CriticalFiberClosingCore` is only an optional internal route.  If used, the
quantifier order must be late-choice rather than a demand on arbitrary
`Hinitial`:

```lean
∃ Hfav : CriticalShellSystem D.A,
  Nonempty
    (CriticalFiberClosingCore
      (rebaseFrontierCommonDeletionParentResidual R Hfav))
```

The proof must first choose favorable `Hfav`, rebase the full `F/R/B/L`
ladder, and only then produce the core for the rebased parent.  It may return:

1. a chosen repeated blocker fiber together with the ordered cross-row
   incidence needed by `OrderedCrossRowCore`; or
2. that fiber, a source-faithful second center, and cap localization needed by
   `SameCapCollisionPairCore`.

Production `false_of_criticalFiberClosingCore` refutes either optional output,
but no fixed-initial-system core theorem should be advertised as the public
goal.  A longer run of the current anonymous surface can at most decide a
finite Kalmanson relaxation that has forgotten exactly the source-indexed
rows needed above.  Do not resume it.  If a later, richer source-indexed
encoder uses a small canonical bank, every imported cut must carry checked
provenance; eagerly restoring the historical bank would defeat this corrected
audit.
