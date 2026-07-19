# Whole-carrier bi-apex/Kalmanson audit

Date: 2026-07-17

Status: **FAITHFUL LIVE EXTRACTION KERNEL-CHECKED; LOCAL AND SINGLE-INEQUALITY
QUOTIENT COVERAGE NONEXHAUSTIVE; FULL-FARKAS LIVE N >= 11 UNKNOWN**

This lane corrects the quantifier mismatch in the fixed fourteen-role
`robust-all-center` surface.  For one chosen carrier cardinality, the solver
represents every cyclic boundary vertex, one selected four-point radius row at
every center, both strict Kalmanson inequalities, metric triangle and
positivity constraints, the two-circle and convex-bisector incidence bounds,
strong connectivity of the selected witness digraph, and a total critical
blocker map omitting two prescribed physical apices.

A SAT result is only an abstract Kalmanson-metric shadow, not a Euclidean or
live-parent counterexample.  An UNSAT result is bounded solver evidence, not a
Lean proof and not arbitrary-cardinality coverage.  The purpose of this probe
is to decide whether generic ordinal/full-Kalmanson closure is even a viable
uniform target before more fixed-profile mining is admitted.

## First bounded results

The monolithic Boolean/LRA encoding returned:

| carrier size | omitted apices tested | result |
|---:|---|---|
| 6 | `0,3` | `UNSAT` |
| 7 | `0,3` | `UNSAT` |
| 8 | `0,4` | `UNSAT` |
| 9 | `0,4` | `UNSAT` |
| 10 | `0,5` | `UNKNOWN` after 30 s |
| 11 | `0,1` and `0,5` | `UNKNOWN` after 60 s each |
| 12 | `0,6` | `UNKNOWN` after 60 s |

The corrected independent CEGAR formulation separates structural row/blocker
choices from the complete linear Kalmanson check. Every positivity,
Kalmanson, triangle, and selected-row equality constraint is tracked. A
deletion-minimal LRA core records its complete vertex set, and refinements are
transported only through increasing embeddings or reversal of that full
ordered set. This transport is sound because every retained base inequality
maps to the corresponding universally available base inequality on the image.

At source hash
`bd50beff0bc616670c48594b2f6f05f6194e60849a0ef9d9bc063e401f69c05a`,
the corrected CEGAR results were:

| carrier size | omitted apices | wall budget | result |
|---:|---|---:|---|
| 9 | `0,4` | 60 s | `UNSAT`, 16 tracked order schemas, 27.28 s |
| 10 | `0,5` | 30 s | `UNKNOWN`, 43 schemas |
| 11 | `0,5` | 30 s | `UNKNOWN`, 80 schemas |

The current driver subsequently added wall-safe random seeds, schema preload,
and the global-equality/full-linear hybrid described below; the pinned hash is
retained only for the earlier regression results.
An independent replay proves the first card-eight core and all 16 dihedral
images LRA-UNSAT, with every single equality deletion SAT. A normalized
six-vertex card-nine schema is likewise LRA-UNSAT in all 168 increasing
card-nine embeddings, again with every single equality deletion SAT. These
are exact solver replays, not Lean certificates. No SAT shadow or coverage
certificate has been obtained. The live theorem begins at card 11, so the
small-card UNSAT results do not advance the proof by themselves.

## Live-card hierarchy and first full-Farkas core

The local one-row ordinal abstraction has an independently verified faithful-
structural card-11 SAT shadow. Global equality closure kills that table with
one strict inequality and a six-center equality chain. The live extractor now
kernel-proves generic `EdgeClosure` consumers for both strict Kalmanson sums.

`global_equality_quotient_cegar.py` then exhausts every single K1/K2 collision
modulo the complete row-equality quotient. At card 11 with omitted apices
`0,4`, it finds an independently verified quotient survivor after 60
transported schemas in 23.40 seconds. This is not a full-linear survivor.
Exact LRA replay rejects it with four strict inequalities and three selected
rows; all four positive Farkas weights are one. The normalized
`false_of_three_rows_four_kalmanson_farkas_core` theorem kernel-checks with
only `propext`, `Classical.choice`, and `Quot.sound`.

A 180-second full-linear hybrid run on the same card/apex gap ended
`UNKNOWN / wall budget` after 98 transported schemas, 70,932 embedding cuts,
five full-linear checks, and five genuine full-LRA cores. It did not find a
full Kalmanson shadow. The 98 schemas are merged into
`schema_bank_round0.json`; a randomized multi-gap portfolio preloads this bank
instead of rediscovering the same prefix independently.

Two preloaded 24-worker portfolio rounds and the first direct-CNF continuations
produced many exact infeasibility witnesses. Every outer SAT assignment passed
independent semantic replay, and every metric-UNSAT refinement passed
independent QF-LRA replay, all single-constraint deletion checks, and exact
rational Farkas cancellation. The direct card-11 outer itself is small (242
variables), so the former Z3 throughput bottleneck is removed.

Those runs also exposed a bank-normalization defect. A transported schema used
the complete vertex set of its first oracle core, including ambient gap
vertices not active in the contradiction. The resulting cuts are sound, but
the same active theorem shape can reappear at different spacings. Therefore
the raw progression `98 -> 173 -> 231 -> 262 -> 435 -> 464` is historical
sound-cut provenance, **not** a count of distinct mathematical types. The raw
continuations were stopped at verified checkpoints once this was found.

Rank-normalizing each contradiction to its active ordered roles collapses the
raw 262 checkpoint to 215 transported types. Adding the independently checked
interlocking shared-pair terminals gives a corrected 217-type bank. This
corrected bank, rather than the raw 464 frontier, is the current bounded
coverage object.

A complete full-row re-audit of the 30 plus 173 verified card-11 models found
a substantially smaller certificate in **203/203** cases. Every row table has
an exact five-constraint alternate consisting of two strict Kalmanson
inequalities and three selected-row equalities. The split is 148 `K1+K1`, 49
`K1+K2`, and 6 `K2+K2`; all strict weights are one and all row weights are
`+1` or `-1`. Exact deletion checks and `Fraction` cancellation replays pass.
Thus the 6--34-constraint source-oracle cores are discovery artifacts: one
generic three-pair arithmetic consumer covers every verified model so far.
The 203 certificates collapse to 20 reflection-canonical six-membership cuts:
19 are new relative to the raw 435 bank, and the 20 subsume 156/435 raw
schemas under increasing embeddings and reversal. All 203 row tables,
coefficients, cancellations, and canonical reconstructions independently
replay. The remaining work is to combine these smaller cuts with the corrected
active-role bank and prove coverage, not to formalize hundreds of literal
weighted cores.

## Corrected active-role decision: pure Kalmanson is blocked

The proposed bounded coverage theorem is false already at card 11. Against the
corrected 217-type bank, the direct CNF outer returns an independently
verified structural SAT model. Exhaustive replay finds:

- zero global K1/K2 equality-quotient collisions;
- zero coupled cyclic interlocking shared-pair terminals; and
- zero Kalmanson-infeasible simple equality cycles of lengths three through
  seven, after enumerating 65,944 literal cycles and checking 64,753 distinct
  normalized order types.

The stronger fixed-row check is also SAT. An independent verifier substitutes
an exact rational value for all 55 distance variables and checks positivity,
every triangle inequality, every strict Kalmanson inequality, and every
selected-row equality. The solve took 0.055 seconds. This is an abstract
Kalmanson metric, not a planar Euclidean realization, but it conclusively
blocks every pure Kalmanson/Farkas consumer on the current structural surface.

The next audit must use the live information omitted by that surface: planar
Euclidean rank/PSD constraints, exact full radius filters, MEC/cap placement,
or common critical-map coupling. No further Kalmanson-only coverage run is
authorized by this checkpoint.

## Faithful extraction result

`WholeCarrierBiApexKalmansonSurface.lean` now defines and kernel-extracts the
smallest source-valid surface from every

```lean
R : FrontierBiApexRobustResidual parent.
```

Unlike the old `(8,4,5)` surface, the record has no fixed cardinality, cap
profile, or named roles. It retains only:

- a CCW enumeration `Fin D.A.card -> R^2` whose image is exactly `D.A`, plus
  the inverse index of every carrier label;
- one `FaithfulCarrierPattern D.A`, chosen from `D.K4`, hence one
  `SelectedFourClass` at every actual carrier center;
- the original common `CriticalShellSystem H` through the record indices;
- distinct physical apices; and
- exclusion of both physical apices from the image of `H.blockerVertex`,
  derived respectively from first- and second-apex full deletion robustness.

The extractor is

```lean
nonempty_wholeCarrierBiApexKalmansonSurface
    (R : FrontierBiApexRobustResidual parent) :
    Nonempty (WholeCarrierBiApexKalmansonSurface R).
```

It uses only current production theorems. There is no missing extraction
lemma and no cardinality split.

## Derived solver-facing facts

The surface does not store redundant consequences as extra assumptions. The
same file kernel-proves all of the following from its fields and the indexed
live parent:

- every selected row has exactly four carrier labels and omits its center;
- selected rows at distinct centers meet in at most two labels;
- any fixed pair of distinct carrier labels occurs together in rows at at
  most two carrier centers, by `Dumitrescu.perpBisector_apex_bound`;
- the chosen selected-witness digraph is strongly connected, by applying
  production `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed` to the
  reachable set and `parent.minimal`;
- the actual critical blocker map is total and fixed-point-free;
- each source belongs to the represented row at its actual blocker;
- every represented blocker row is the exact ambient critical shell, not
  merely an arbitrary selected four-subset; and
- both strict Kalmanson inequalities hold for every four increasing indices
  of the actual CCW carrier enumeration; and
- either strict sum is contradictory when arbitrary global `EdgeClosure`
  chains identify its two sides with its two diagonals.

These are exactly the source-level ingredients represented by the current
generic solver, apart from routine metric triangle/nonnegativity facts and
the solver's homogeneous normalization of strict slack.

## What remains

This closes the earlier quantifier/extraction gap for the **generic
whole-carrier object**. It does not validate the old fixed fourteen-role
surface and it does not turn a bounded solver result into Lean coverage.

If the generic solver returns UNSAT, the remaining bridge is to:

1. emit a complete proof certificate for each carrier cardinality claimed;
2. verify that certificate in Lean against the extracted surface; and
3. justify the claimed cardinality range. The live residual has no ambient
   upper-cardinality bound, so finitely many `n` values are not uniform
   closure without a separate live reduction.

A SAT result remains a model of the encoded necessary consequences, not a
Euclidean counterexample. It instead identifies an additional geometric field
that a direct live consumer must use.

## Bank preflight

Before defining the surface, the required registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found the reusable production
pieces: `FaithfulCarrierPattern`,
`exists_faithfulCarrierPattern_of_globalK4`,
`FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`, whole-carrier boundary
indexing, blocker-row exactness, and the generic strict Kalmanson bridge. No
new local contradiction was needed.

## Lean validation

From `lean/`:

```bash
lake env lean -R .. -M 16384 \
  -o /private/tmp/WholeCarrierBiApexKalmansonSurface.olean \
  ../scratch/atail-force/generic-biapex-kalmanson-search/\
WholeCarrierBiApexKalmansonSurface.lean
```

The focused check exits zero. The extractor and every printed derived fact
depend only on `propext`, `Classical.choice`, and `Quot.sound`.

- **KERNEL-CHECKED:** faithful extraction and every listed derived fact.
- **THEOREM-DISCOVERY ONLY:** the Python/Z3 whole-carrier searches.
- **NOT PROVED:** solver completeness, checked UNSAT coverage, any ambient
  cardinality upper bound, the live robust contradiction, K-A-PAIR, or a
  production `sorry` closure.
