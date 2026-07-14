# ATAIL-FORCE `u`-row cap-multiplicity proof attempt

Date: 2026-07-13

## Verdict

**FAILED TO DERIVE** `URowCapMultiplicityFields`, or either of its two
content-bearing conjuncts, from the exact binders of
`DoubleApexOffSurplusSharedRadiusPair` without adding an assumption.

This is not a tactic failure.  The audited theorem banks and the live binders
reach a sharp boundary:

1. `p` belongs to some indexed closed cap;
2. `rows.uRow.center` belongs to some indexed closed cap;
3. `rows.uRow.center != p`;
4. the `u`-row support meets the dangerous base `{q,t1,t2,t3}` in **at most**
   two points;
5. every cap containing `rows.uRow.center` has at least two `u`-row support
   points outside it.

What is not available is:

1. a **single** cap containing both `p` and `rows.uRow.center`; and
2. at that same cap, two outside-cap `u`-row points that also lie in the
   dangerous base.

The companion Lean file
`scratch/atail-force/urow_cap_multiplicity_proof_attempt.lean` records this
boundary and proves, at source level, that the desired fields would already
close the leaf via `outsidePair_unique_capCenter`.  It has no `sorry`, but its
new declarations are **UNVALIDATED** because the shared Lake lock was reported
live/indeterminate (PID 61428).  No build or lock removal was attempted.

## Exact target split

For the leaf surplus packet `S`, the requested producer is

```text
exists k : Fin 3,
  p in S.capByIndex k
  and rows.uRow.center in S.capByIndex k
  and 2 <= card (
    rows.uRow.support intersect
      ({q,t1,t2,t3} minus S.capByIndex k)).
```

It therefore splits into two genuinely geometric claims:

- **ALIGN:** `p` and the `u`-row center share an indexed cap.
- **MULT:** at that same cap, the row contains at least two dangerous-base
  points outside the cap.

The live intersection theorem points in the opposite direction from a routine
counting proof: since the dangerous row is centered at `p` and the `u` row is
centered away from `p`, their selected four-classes intersect in at most two
points.  Consequently MULT, if proved, forces both the local dangerous overlap
and the total dangerous overlap to equal exactly two.  It is
contradiction-strength, not a loose pigeonhole consequence.

## Binder audit and first missing antecedent

The exact residual interface supplies

```text
rows      : CriticalSourceRows D q t1 t2 t3 u
hcritical : Nonempty (CriticalShellSystem D.A)
```

as independent arguments.  It supplies no equality relating `rows.uRow` to the
row selected from a witness of `hcritical`.

This matters before any common-system argument can start.  The outer live
caller constructs

```text
rows := CriticalSourceRows.ofCriticalShellSystem Hcritical ... huA
```

but the residual theorem erases that provenance.  Thus the **first exact
missing antecedent for the common-system route** is a row-provenance equality,
for example

```text
rows.uRow = CriticalRowPacket.ofCriticalShellSystem Hsys huA
```

or, better, a structure retaining the construction of all five rows from the
same `Hsys`.  `criticalShellSystemCapMultiplicity_of_uRowCapMultiplicity` in
`outside_source_cap_multiplicity.lean` confirms the precise limitation: such
an equality transports already-proved multiplicity fields, but does not create
ALIGN or MULT.

Even after provenance is restored, the first missing mathematical field is
ALIGN.  After ALIGN is supplied, MULT remains independently missing.

## What the exact hypotheses do prove

The following facts are already kernel-checked in the existing ATAIL scratch
lane and/or imported theorem bank; the new companion file merely packages
their dependency boundary:

- `uRow_center_ne_p` from `hlocalNoQFree` and live-data selection.
- `SelectedFourClass.inter_card_le_two`, giving
  `card (uRow.support intersect {q,t1,t2,t3}) <= 2`.
- cap coverage for each ambient point separately.
- `selectedFourClass_inter_capByIndex_card_le_two`, giving
  `card (uRow.support intersect cap[k]) <= 2` whenever the row center is in
  `cap[k]`.
- hence `card (uRow.support minus cap[k]) >= 2` for every cap containing the
  row center.
- hence `card (uRow.support minus {q,t1,t2,t3}) >= 2`.

The two lower bounds have the wrong complements.  They do not say that the
outside-cap pair lies **inside** the dangerous base.  Combining them with the
total-overlap upper bound cannot reverse that polarity.

`exists_secondLargeCap_of_noM44` contributes cap sizes only.  The stronger
selected-class containment lemmas found in the banks are restricted to a
Moser apex or to the `IsM44` branch, whereas this leaf assumes `hNoM44` and the
`u`-row center is arbitrary.  They cannot be instantiated here.

## Bank and indexed-corpus search

Before attempting a new argument, the following registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpus was queried for same-cap second centers, cap
multiplicity, critical-row provenance, and two selected points outside a cap.
The closest reusable declarations are consumers or upper bounds:

- `outsidePair_unique_capCenter`;
- `selectedFourClass_inter_capByIndex_card_le_two`;
- common-system row projections; and
- U5 incidence contradictions whose own membership producers are hypotheses.

No declaration produces ALIGN or MULT from these binders.

## Finite-shadow separation evidence

The finite incidence query in `scratch/atail-force/second_center_query` was
rerun with full witness output.  These results are **EMPIRICALLY VERIFIED IN
THE FINITE SHADOW ONLY** and are explicitly **not target-faithful**.

### `(4,5,6)` witness: ALIGN holds, MULT fails

```text
p = 0
u-row center = 1
B = {1,3,4,5}
uRow.support = {0,2,5,6}
O1 = {0,2,5,6,7}
O2 = {0,1,8,9,10,11}
S  = {1,2,3,4}
```

`p` and the row center share `O2`, but

```text
B minus O2 = {3,4,5}
uRow.support intersect (B minus O2) = {5}
```

has cardinality one.  Digest:
`ce24f3818d0b9465ef6afadced8a957065ffb7846cd62d7f1cb52c764850fa47`.

### `(5,5,5)` witness: ALIGN fails

```text
p = 0
u-row center = 4
B = {1,2,3,4}
uRow.support = {1,5,6,8}
```

`p` lies in `O1/O2`, while the row center lies only in `S`; there is no common
cap.  Digest:
`d1231886198381478c2ae0120c5d444b353e0b003097cc97b10c205c98883a18`.

These witnesses do **not** refute the Lean target: they omit Euclidean
coordinates, convex/MEC geometry, the full exact-radius filter, and quantified
critical-shell/no-`IsM44` obligations.  They only prove that the current pure
incidence/cardinality package cannot establish the two fields.

## Target-faithful deciding-query specification

A genuine producer decision must encode the exact Lean antecedents, not another
cap-incidence relaxation.  A target-faithful SAT/SMT/real-algebra query should
use the following specification.

### Ambient geometry

- Search the live cardinality profiles, including card 11 `(5,5,4)` and the
  card-at-least-12 profiles `(4,5,6)` and `(5,5,5)`.
- Give every carrier point a distinct real coordinate pair and enforce strict
  convex cyclic order.
- Instantiate an actual `CounterexampleData`: nonempty finite `A`,
  `ConvexIndep A`, and the exact `HasNEquidistantProperty 4 A` predicate.
- Encode the circumscribed non-obtuse MEC Moser triangle, `hCirc`, its
  structural Moser triangle, `CapTriple`, and the exact closed-cap partition.
- Enforce `q in cap[i]`, `card cap[i] > 4`, `q` non-Moser, `j != i`, and
  `card cap[j] >= 5`.
- Enforce `hNoM44` against every eligible surplus packet/Moser frame, not just
  the chosen packet.

### Live row/filter data

- Make `p,q,t1,t2,t3,u` pairwise distinct and satisfy the exact
  `U3FixedTriplePacket`, `U3LocalizedNoQFreePacket`, and
  `U1LargeCapRouteBTailLiveData` predicates, including exact-q-deleted radius
  and selected-candidate/full-filter fields.
- Encode a `CriticalShellSystem D.A`: for every source, an exact four-point
  selected radius class at a valid blocker center.
- Enforce the `t2` row center equality and exact support equality
  `{q,t1,t2,t3}`.

### Provenance variants

Two queries should be kept separate:

1. **Exact residual-signature query:** allow `rows` and `hcritical` to be
   independent, exactly as the present theorem does.
2. **Outer-path-faithful query:** require
   `rows = CriticalSourceRows.ofCriticalShellSystem Hsys ...` for the same
   `Hsys` witnessing `hcritical`.

The second is stronger and matches the actual live caller.  It is the relevant
query after the interface is repaired; the first tests whether the current
published residual is over-general.

### Negated producer

For every `k : Fin 3`, assert at least one of:

```text
p notin cap[k]
or uRow.center notin cap[k]
or card (uRow.support intersect (B minus cap[k])) <= 1,
```

where `B = {q,t1,t2,t3}`.

A satisfying assignment is a genuine falsifier only after all real geometry,
exact-radius, full-filter, `hNoM44`, and critical-shell obligations have been
certified.  An UNSAT result is usable only with a replayable certificate or a
formally checked reduction to polynomial/rational constraints.

## Ranked next steps

1. **Restore live row provenance at the residual boundary.**  Pass a
   `LiveCriticalRowProvenance`-style packet or move this argument outward to
   the scope where `Hdepth5Rows` is constructed.  This is a prerequisite for
   exploiting common-system structure, not itself a proof of ALIGN/MULT.
2. **Attack ALIGN as a standalone geometric lemma.**  Use cap position,
   MEC/cyclic order, and the full blocker filter.  Keep the `(5,5,5)` shadow as
   a regression: any proof using only current incidence/counting hypotheses is
   unsound.
3. **Condition on ALIGN and attack MULT separately.**  The `(4,5,6)` shadow
   shows common-cap alignment alone is insufficient.  The missing input must
   control which row-support points survive outside that cap, likely through
   the exact-q-deleted/full-filter geometry rather than further cap counts.
4. **Run the two target-faithful queries above.**  If the exact-signature query
   is satisfiable but the outer-path query is not, repair the theorem interface
   and pursue the common-system proof.  If the outer-path query is satisfiable,
   abandon this producer and pivot to the nested-pair/shared-radius producer.
5. **Do not route through Moser-apex or `IsM44` containment lemmas** unless a
   new lemma first identifies the arbitrary `u`-row center with the required
   apex/branch; the current hypotheses provide neither identification.

## Validation status

- Existing ATAIL scratch boundary theorems: **PROVEN / kernel-checked** per
  their current checked artifacts.
- Finite-shadow witnesses above: **EMPIRICALLY VERIFIED**, not target-faithful.
- New companion Lean source: **SOURCE-CLEAN BY INSPECTION, UNVALIDATED**.
- Producer derivation: **FAILED / no theorem claimed**.
- Lake build and `#print axioms` output for the new file: **DEFERRED** because
  the shared lock with PID 61428 was live or indeterminate; it was not removed.
