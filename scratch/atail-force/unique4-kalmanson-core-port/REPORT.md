# Exact-four Kalmanson core ports

Date: 2026-07-22

Scope: scratch-only exact replay and cardinality-generic Lean consumers for the
current exact-four fixed-row full-LRA cores.  This directory does not change
production Lean, closure documents, or the live outer's bank.

## Result

Ten exact signed row/order schemas now have source-clean Lean consumers in
[`UniqueFourKalmansonCores.lean`](UniqueFourKalmansonCores.lean).  All ten
statements are independent of the carrier cardinality.  They require only a
convex-independent carrier, an injective CCW boundary enumeration, increasing
named boundary positions, selected rows at the named centers, and the listed
support memberships.

The two smallest new consumers are:

```lean
false_of_one_k1_three_cyclic_selected_rows
```

with four ordered roles and rows

```text
center 1: {0,2}
center 2: {0,1}
center 3: {1,2},
```

and

```lean
false_of_four_k2_five_selected_row_equalities
```

with six ordered roles and rows

```text
center 0: {1,5}
center 1: {0,2}
center 2: {0,1,5}
center 3: {0,2}.
```

The former uses one `K1(0,1,2,3)` inequality.  The latter uses
`K2(0,1,3,4)`, `K2(0,1,4,5)`, `K2(1,2,3,4)`, and `K2(1,2,4,5)`.

A third new consumer,

```lean
false_of_one_k2_two_k1_three_selected_rows
```

uses five ordered roles, `K2(0,1,2,3)`, `K1(0,1,2,4)`, and
`K1(0,2,3,4)`, with rows

```text
center 1: {0,3}
center 2: {0,1}
center 4: {1,3}.
```

The two earlier row-only cores also have direct consumers.  Every consecutive
fixed-pair `K2` path and every fixed-outer-endpoint `K1` path telescopes to the
corresponding endpoint Kalmanson inequality.  That endpoint inequality is
already supplied directly by `CapCrossingKalmanson`, so no list/interval
telescoping theorem is needed.  After replacing paths by endpoint inequalities
and dropping path-interior roles, both row-only schemas use six roles and six
memberships.

The same compression kernel-checks the three formerly pending entries from the
eight-schema checkpoint and the two post-bank-eight `/tmp/root_bank8` cores:

- round-three card four: 3 `K1` terms become 1 endpoint `K1`;
- round-three card five: 10 terms become 1 `K1` and 2 endpoint `K2`s;
- round-two card four: 18 terms become 1 `K1` and 4 endpoint `K2`s (one
  repeated-weight path requires two nested endpoint inequalities);
- post-bank-eight card four: 10 terms become 1 `K1` and 2 endpoint `K2`s;
- post-bank-eight card five: 9 terms become 1 endpoint `K1` and 1 endpoint
  `K2`.

## Candidate theorem audit

The existing

```lean
false_of_two_kalmanson_three_selected_rows
```

does **not** directly consume any of these five normalized cores.  Its two
strict inequalities and exact incidence pattern are absent.  Each external
core is deletion-minimal in its own literal constraint set; in particular,
the four-, ten-, one-, four-, and three-inequality cores cannot be replaced by
that two-inequality theorem merely by dropping constraints.

The existing `WeightedKalmansonCutDataSoundness` checker **does** consume the
first five normalized signed cuts.  Because one scratch module cannot be imported by
another through the current Lake source path,
[`WeightedKalmansonExactFourReplay.lean`](WeightedKalmansonExactFourReplay.lean)
copies that checked scratch bridge source-faithfully and adds only the five
typed payloads.  Kernel `decide` proves:

```text
rowOnlyFourCut.check        = true
rowOnlyFiveCut.check        = true
fullPartitionFourCut.check = true
fullPartitionFiveCut.check = true
roundTwoFiveCut.check       = true.
```

Thus `false_of_check_of_rowsMatch` is a valid generic consumer for each cut.
The ten direct theorems are smaller producer-facing interfaces: they need selected
rows only at the actually used centers rather than a row family at every
boundary vertex.

## Exact external replay

The two original `/tmp/exact4_opp1_{4,5}.full_lra.json` artifacts were copied
here and independently replayed with
`generic-biapex-kalmanson-cnf/verify_farkas_core.py`.  Both are exact rational
QF_LRA UNSAT; all variable coefficients cancel, and every single-constraint
deletion is SAT.  Their checked outputs are:

- [`exact4_opp1_4.farkas.verify.json`](exact4_opp1_4.farkas.verify.json):
  4 strict inequalities and 6 row equalities;
- [`exact4_opp1_5.farkas.verify.json`](exact4_opp1_5.farkas.verify.json):
  10 strict inequalities and 6 row equalities.

The smaller full-partition and round-two cores were copied here and
independently replayed with the same verifier:

- [`fullpart_opp1_4.farkas.verify.json`](fullpart_opp1_4.farkas.verify.json):
  1 strict inequality plus 3 row equalities;
- [`fullpart_opp1_5.farkas.verify.json`](fullpart_opp1_5.farkas.verify.json):
  4 strict inequalities plus 5 row equalities;
- [`round2_opp1_5.farkas.verify.json`](round2_opp1_5.farkas.verify.json):
  3 strict inequalities plus 3 row equalities.

The two post-bank-eight payloads were copied from `/tmp`, independently
replayed, and then referenced only through the durable copies in this lane:

- [`root_bank8_opp1_4.farkas.verify.json`](root_bank8_opp1_4.farkas.verify.json):
  10 strict inequalities plus 8 row equalities;
- [`root_bank8_opp1_5.farkas.verify.json`](root_bank8_opp1_5.farkas.verify.json):
  9 strict inequalities plus 5 row equalities.

Both are exact rational QF_LRA UNSAT, deletion-minimal in their literal source
constraint sets, and have exact Farkas coefficient cancellation.  Their much
smaller endpoint consumers are stronger geometric consequences of boundary
order, not deletion-minimal subcores of the original literal encodings.

The current `round2_opp1_4` core has 24 constraints on all eleven roles.  It is
externally exact and deletion-minimal but was not given a bespoke Lean theorem
here because the smaller four-role theorem already provides a stronger
extension-stable exclusion for this profile.

## Minimal normalized schema mappings

[`kalmanson_schema_bank.proposed.json`](kalmanson_schema_bank.proposed.json)
records all ten endpoint-normalized proposed bank entries without editing the
live outer-owned bank.  Its theorem names and role maps match the checked Lean
declarations.

| source core | source roles / memberships | reduced roles / memberships | canonical schema |
|---|---:|---:|---|
| row-only `opp1_4` | 9 / 9 | 6 / 6 | `(0,1) (0,2) (4,1) (4,3) (5,2) (5,3)` |
| row-only `opp1_5` | 10 / 9 | 6 / 6 | `(0,1) (0,3) (4,2) (4,3) (5,1) (5,2)` |
| full-partition `opp1_4` | 4 / 6 | 4 / 6 | `(0,1) (0,2) (1,2) (1,3) (2,1) (2,3)` |
| full-partition `opp1_5` | 6 / 9 | 6 / 9 | `(0,1) (0,5) (1,0) (1,2) (2,0) (2,1) (2,5) (3,0) (3,2)` |
| round-two `opp1_5` | 5 / 6 | 5 / 6 | `(0,1) (0,3) (2,3) (2,4) (3,1) (3,4)` |
| round-three `opp1_4` | 7 / 9 | 5 / 9 | see proposed JSON |
| round-three `opp1_5` | 10 / 6 | 6 / 6 | see proposed JSON |
| round-two `opp1_4` | 11 / 11 | 7 / 11 | see proposed JSON |
| post-bank-eight `opp1_4` | 10 / 12 | 8 / 12 | see proposed JSON |
| post-bank-eight `opp1_5` | 11 / 8 | 6 / 7 | see proposed JSON |

The JSON also records the source-vertex-to-unreflected-role map and the exact
Lean consumer for every entry.  Every schema is reflection-canonical and is
transported over order-preserving and reflected injections.

## Source injectability and remaining gap

The consumers are source-injectable for an arbitrary carrier size **once an
occurrence theorem supplies the named ordered roles and selected-row
memberships**.  Global K4 supplies a `SelectedFourClass` at each center, and
the consumers use no complete-class, fixed-cardinality, MEC, or blocker-map
fact.  Therefore adding unrelated carrier vertices preserves each theorem.

This is not yet a source theorem from `OriginalUniqueFourResidual`.  The
smallest uniform source producer needed by the entire port is:

> There is an order-preserving or order-reversing injection of the roles of at
> least one schema in `kalmanson_schema_bank.proposed.json` into the carrier's
> cyclic boundary enumeration such that every listed `(center, point)` pair is
> a membership of `point` in the selected row at `center`.

No metric conclusion is required from that producer: convexity and the role
order generate all endpoint Kalmanson inequalities inside the checked
consumers.  Equivalently, the remaining theorem is one finite disjunction of
ten row-incidence occurrence propositions.  This is strictly smaller than a
producer for the original literal cores because path-interior roles and row
reference points unused after transitivity have been removed.

The live outer bank advanced while this port was running.  Earlier replay
files for the then-five-entry proposed bank were deleted after the proposed
bank changed, so no stale hash-mismatched coverage result is retained here.
No current outer coverage claim is made.  The port proves that any occurrence
of one of the ten normalized schemas is contradictory; it does not prove that
the parent residual must contain such an occurrence.

## Preflight and validation

Before proving these consumers, the required general-n bank registries and
their JSON inventories were checked.  `nthdegree docs search --lean` found the
existing Kalmanson geometry and selected-row consumers, but no existing theorem
with any of the five exact signed incidence patterns.

The direct-consumer Lean file passes focused warnings-as-errors elaboration.
The weighted replay file passed before the endpoint refactor and remains an
exact replay of the original five cuts.  Every printed
proof-facing axiom closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, new axiom, `native_decide`, or unsafe declaration
in the new direct-consumer file.  The typed payload checks use kernel `decide`,
not `native_decide`.
