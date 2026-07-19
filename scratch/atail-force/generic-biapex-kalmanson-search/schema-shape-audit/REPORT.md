# Round-two transported-schema shape audit

Date: 2026-07-17

Status: **BOUNDED EXACT SHAPE AUDIT. THE 57 FULL-LRA CORES COLLAPSE TO AN
EQUALITY-CYCLE FAMILY PLUS ONE COUPLED-SHARED-PAIR CORE. THIS DOES NOT PROVE
COVERAGE OF THE LIVE ARBITRARY-CARDINALITY SURFACE, AND NO SOURCE `sorry` IS
CLOSED.**

## Scope and epistemic boundary

This audit reads
`../schema_bank_round2.json` (SHA-256
`567efba964c4bc710dda46c6e40155cfa25fd5f93214fe3ed3a832dac9b24e1f`),
its provenance payloads, and the 24 round-two portfolio outputs. It does not
change production Lean, the protected FA-UNIQ lane, `ShellCurvature`,
`surplusM44`, or the card-five scratch file.

The following labels are important:

- schema counts and incidence/path statistics are exact for the serialized
  round-two bank;
- the subcore SAT/UNSAT results are exact rational linear-arithmetic decisions
  for the displayed bounded order types;
- the claimed compression into equality-cycle motifs is a classification of
  this bank, not a theorem that every live configuration has such a motif;
- no Lean build was run while the user-owned `ShellCurvature` refactor was
  active.

The required bank preflight found the existing consumers
`ATailOrdinalKalmansonCycle.false_of_transGen_cycle`,
`CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`, and
`false_of_two_selected_rows_shared_late_pair`. The indexed-corpus searches did
not find a theorem turning an arbitrary multi-inequality equality cycle into
`False`, nor a coupled interlocking-shared-pair consumer, nor a theorem forcing
either object from the faithful whole-carrier surface. In particular,
`SharedPairSeparationCore` treats one shared pair; it does not couple two
individually alternation-compatible shared pairs.

## Bank census

The 231 ordered transport orbits are disjoint by provenance kind:

| kind | unique schemas | provenance records | core-size range |
|---|---:|---:|---:|
| `K1` | 95 | 101 | 4--9 |
| `K2` | 79 | 80 | 4--10 |
| `FULL_LRA` | 57 | 57 | 6--12 |

The bank itself already quotients by increasing order embeddings and boundary
reversal. `analyze.py` additionally finds 75 coarse abstract incidence
signatures after forgetting exact boundary positions: 20 for `K1`, 19 for
`K2`, and 46 for `FULL_LRA`. These 75 signatures are descriptive degree/path
signatures, not certified graph-isomorphism orbits.

Overall core-size distribution:

| vertices | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| schemas | 5 | 43 | 67 | 47 | 14 | 6 | 10 | 22 | 17 |

## K1/K2 are one equality-transport-cycle mechanism

Every one of the 174 unique `K1`/`K2` schemas has:

1. a directed cycle in its active-center membership graph; and
2. a simple directed path visiting every active center.

The provenance confirms the same normal form at the distance-term level. A
`K1` or `K2` collision records two shortest equality paths identifying the two
terms on each side of one strict Kalmanson inequality. In 92/101 `K1`
provenances and 73/80 `K2` provenances, one path has length one and the other
has length 2--8. Thus the large literal bank is mostly different ordered
embeddings and path lengths of one generic equality-closure contradiction.

This is not the live missing theorem. The verified card-eleven global-equality
quotient survivor already shows that excluding all single-inequality `K1/K2`
collisions does not close the surface.

## FULL_LRA row and staircase shape

The 57 genuine multi-inequality cores are much simpler in row complexity than
their 6--12 vertex spans suggest:

- 44/57 use exactly three row centers;
- 49/57 require only 6--9 membership literals;
- all 57 minimized cores use only selected-row equalities and strict
  Kalmanson inequalities: no triangle inequality or positivity constraint
  remains;
- 23/57 use only `K2` inequalities, and every core uses at least one `K2`;
- 48/57 contain an adjacent-pair Kalmanson ladder of width at least five.

The long vertex spans are therefore usually telescoping boundary gaps, not
evidence that many independent rows are required. This supports a
variable-gap staircase theorem rather than a card-11/card-12 literal theorem
bank.

## Exact equality-cycle reduction

For each `FULL_LRA` schema, the audit chooses distinct selected-row centers and
one pair of support members per center. The chosen member pairs must form a
simple cycle on the same number of terminal vertices. It then rechecks that
cycle alone against all strict Kalmanson inequalities on the ordered core.

`check_equality_cycle_subcores.py` records 74 simple-cycle witnesses. The
result is:

| result | count |
|---|---:|
| Kalmanson-only UNSAT cycle witnesses | 59 |
| Kalmanson-only SAT cycle witnesses | 15 |
| full-LRA schemas containing an UNSAT cycle | **56/57** |

The full replay and the Kalmanson-only replay agree on all 74 witnesses, so
none of these decisions uses positivity or triangle inequalities.

The minimum impossible cycle length by schema is:

| minimum cycle length | schemas |
|---|---:|
| 3 | 46 |
| 4 | 8 |
| 5 | 1 |
| 7 | 1 |

Modulo cycle relabeling, boundary reversal, and deletion of unused gap
vertices, the 59 UNSAT witnesses occupy 31 ordered types: 18 triangle types,
10 four-cycle types, and one type each at lengths five, six, and seven. The
length-six type is an additional witness for the schema already killed at
length five.

### Ordinal cycles are only a minority

The script also replays exactly the eight one-row cancellation orientations
used by `whole-carrier-ordinal-coverage/search.py`. Only 17/59 UNSAT cycle
witnesses, spanning 17/56 killed schemas, contain a directed ordinal strict
cycle that feeds production
`ATailOrdinalKalmansonCycle.false_of_transGen_cycle` directly. The other 42
witnesses require a genuine sum of several Kalmanson inequalities.

Therefore “promote the ordinal-cycle consumer” is not a complete strategy.
The missing reusable consumer must accept a multi-inequality Farkas/staircase
certificate, or prove the relevant telescoping equality-cycle theorem
directly.

## The sole non-cycle FULL_LRA core

Schema 204 is the only `FULL_LRA` schema not containing an independently
impossible simple equality cycle. After deleting unused boundary vertices its
normal form is

```text
A < B < X < C < D < Y

row A: X,Y
row C: X,Y
row B: A,C
row D: A,C
```

It is a coupled pair of alternation-compatible shared pairs. It has a short
two-inequality proof:

1. `K1(A,B,X,C)` says `AB + XC < AX + BC`. The `B`-row equality
   `AB = BC` gives `XC < AX`.
2. `K2(A,C,D,Y)` says `AY + CD < AD + CY`. The `D`-row equality
   `AD = CD` gives `AY < CY`.
3. The `A`- and `C`-row equalities `AX = AY` and `CX = CY` contradict the two
   strict comparisons.

The serialized minimized core instead uses one `K1`, nine `K2`, and four row
equalities. `CoupledAlternatingSharedPairs.lean` records the generic
`SelectedFourClass`/CCW-boundary theorem
`false_of_coupled_alternating_shared_pairs` with the short proof above. It has
no `sorry` or `admit`, but was intentionally not elaborated or axiom-audited
while the user-owned `ShellCurvature` refactor was active.

## Direct-CNF terminal comparison

The separately reported size-independent terminal

```text
0 < 1 < 2 < 3 < 4 < g
row g: 0,1
row 2: 1,4
row 3: 0,4
```

is exactly Kalmanson-UNSAT. Its membership schema (and reversal) embeds in
exactly 2/57 `FULL_LRA` schemas, indices 209 and 230. Both were already killed
by the equality-triangle family. It embeds in 0/11 schemas remaining after the
first triangle-only reduction and does not cover schema 204.

This terminal is valid and compact, but the current bank does not support
treating it as the sole coverage target.

## Stability check against the 262-schema direct-CNF bank

The direct-CNF lane's `cegar_round3_a1/bank_030.json` contains 262 unique
transported schemas: the same 95 `K1` and 79 `K2` schemas, plus 88 `FULL_LRA`
schemas. Re-running the equality-cycle audit without modifying that lane gives:

| minimum impossible cycle length | schemas among 88 `FULL_LRA` cores |
|---|---:|
| 3 | 72 |
| 4 | 12 |
| 5 | 2 |
| 7 | 1 |
| no impossible simple cycle | 1 |

Thus 87/88 full-linear cores reduce to an impossible equality cycle. The sole
exception is again exactly the interlocking shared-pair schema above (index
234 in the 262-schema ordering). The 87 cycle-bearing cores occupy 43 ordered
cycle types, and the minimum required cycle length still never exceeds seven.
Also, 70/88 full-linear schemas use exactly three row centers.

This is meaningful stability evidence: adding 31 new full-linear schemas did
not increase the observed minimum cycle-length bound. It is not evidence of
an `n`-independent theorem by itself, because every source instance still has
`n = 11` or `n = 12`. Core vertex count at most 12 is tautological on those
sources, and no run probes the possibility of a first essential length-eight
cycle at larger cardinality.

## Exact coverage gaps

Round two did not decide any bounded outer problem:

- all 24 outputs are `UNKNOWN`;
- reasons are 13 wall budgets, 10 outer timeouts, and one canceled metric
  check;
- 10 card-eleven workers never obtained a first post-preload outer model;
- the portfolio made 41 outer attempts, added 61 refinements (58 new bank
  schemas after deduplication), and found 31 full-LRA cores;
- card 11 was sampled for second-apex gaps 1--5 and seeds 4--7;
- card 12 was sampled only for gaps 1, 2, 3, and 6 at seed 4;
- no `n >= 13` instance and no arbitrary-cardinality coverage theorem was
  decided.

Even a Lean proof of all 57 current `FULL_LRA` schemas would only provide a
consumer bank. It would not prove that every faithful live whole-carrier
configuration contains one. That producer/coverage implication remains the
load-bearing open problem.

## Precise variable-cardinality coverage conjecture

Let `n >= 11`, let

```text
row : Fin n -> Finset (Fin n)
blocker : Fin n -> Fin n
```

and fix distinct omitted apices `o₁,o₂ : Fin n`. Define
`FaithfulOrderedRowSurface row blocker o₁ o₂` to mean exactly:

1. `card (row c) = 4` and `c ∉ row c` for every center `c`;
2. distinct rows intersect in at most two members;
3. any fixed unordered member pair occurs together in at most two rows;
4. the digraph `c -> x` for `x ∈ row c` is strongly connected;
5. `blocker s ∉ {s,o₁,o₂}` and `s ∈ row (blocker s)` for every source `s`;
6. the carrier order is the displayed cyclic order, modulo global reversal.

For a cycle of length `k`, take injective center and terminal lists

```text
center, terminal : Fin k -> Fin n
```

(the two images may overlap) and require

```text
terminal i ∈ row (center i)
terminal (i+1) ∈ row (center i)
```

cyclically. A `KalmansonFarkasCycle` additionally carries:

- a finite, nonzero family of `K1/K2` inequalities with nonnegative rational
  weights; and
- rational weights on the `k` row equalities;

such that the coefficient of every abstract unordered distance term is zero.
This symbolic balance is a small independently checkable certificate: strict
Kalmanson inequalities contribute positive total slack, the row equalities
contribute zero, and the zero coefficient sum is contradictory.

The sharpest conjecture currently supported by the data is:

```text
conjecture exists_smallFarkasCycle_or_interlockingSharedPairs
    (hn : 11 <= n)
    (H : FaithfulOrderedRowSurface row blocker o₁ o₂) :
    SingleKalmansonEqualityCollision row
      ∨ (∃ k, 3 <= k ∧ k <= 7 ∧ KalmansonFarkasCycle row k)
      ∨ InterlockingSharedPairs row
```

Here `SingleKalmansonEqualityCollision` is the already-understood `K1/K2`
case with arbitrary equality-closure paths. `InterlockingSharedPairs` is the
six-role schema

```text
A < B < X < C < D < Y,
X,Y ∈ row A ∩ row C,
A,C ∈ row B ∩ row D,
```

up to cyclic rotation and reversal.

This formulation is deliberately falsifiable. The direct-CNF outer solver can
negate all three alternatives at fixed `n`. A verified SAT result would refute
the bounded theorem at that `n`; UNSAT plus a checked outer certificate would
prove only the fixed-cardinality abstraction. Arbitrary-cardinality closure
would still require a mathematical reduction showing that a minimal witness
to failure has bounded size, or a direct staircase argument proving the
length-seven alternative uniformly.

The `k <= 7` bound is therefore **EMPIRICALLY STABLE WITHIN THE 88 CURRENT
FULL-LRA CORES**, not proven and not yet justified for `n > 12`. There is also
no stable bound in the current data for the length of a `K1/K2`
equality-closure path; that case should stay abstract rather than being frozen
to the observed maximum.

## Recommended theorem boundary

The bank suggests two consumer theorems, in this order:

1. **Immediate, narrow, high confidence:**

   ```text
   false_of_coupled_alternating_shared_pairs
   ```

   with the six-role order and four row-pair equalities of schema 204. This
   closes the sole non-cycle metric motif and should be proved by perpendicular
   bisectors plus crossing chords, not by replaying ten inequalities.

2. **Uniform cycle consumer:** a theorem provisionally shaped as

   ```text
   false_of_negativeWinding_selectedRowEqualityCycle
   ```

   accepting a finite cycle of row equalities plus a checked Kalmanson/Farkas
   balance or an equivalent negative-winding condition. Its proof should sum
   the telescoping Kalmanson ladder over arbitrary boundary gaps. Production
   `false_of_transGen_cycle` should remain the one-inequality/ordinal special
   case.

The actual closure producer would then need to prove

```text
faithful whole-carrier blocker/row surface
  -> negative-winding equality cycle
     or coupled alternating shared pairs.
```

That implication is **conjectural**. The 231-schema bank and 24 unknown round
two jobs are discovery evidence, not coverage evidence. The optimized direct
CNF/outer-SAT lane should decide or falsify a bounded version before this is
promoted as the parent theorem shape.

## Reproduction

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run \
  scratch/atail-force/generic-biapex-kalmanson-search/schema-shape-audit/analyze.py \
  scratch/atail-force/generic-biapex-kalmanson-search/schema_bank_round2.json \
  --output \
  scratch/atail-force/generic-biapex-kalmanson-search/schema-shape-audit/analysis.json

UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run \
  scratch/atail-force/generic-biapex-kalmanson-search/schema-shape-audit/check_triangle_subcores.py \
  scratch/atail-force/generic-biapex-kalmanson-search/schema_bank_round2.json \
  --output \
  scratch/atail-force/generic-biapex-kalmanson-search/schema-shape-audit/triangle_subcores.json

UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run \
  scratch/atail-force/generic-biapex-kalmanson-search/schema-shape-audit/check_equality_cycle_subcores.py \
  scratch/atail-force/generic-biapex-kalmanson-search/schema_bank_round2.json \
  --output \
  scratch/atail-force/generic-biapex-kalmanson-search/schema-shape-audit/equality_cycle_subcores.json
```

All three commands are single-process. The generated JSON payloads retain the
exact schema indices, order types, centers, member pairs, and SAT/UNSAT
results used above.
