# CardGe13 exact-tight-cover PIQD audit

Date: 2026-09-04

Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.

## Outcome

The exact-card-13 local tight-cover geometry is not presently a terminal.

1. A source-labelled abstract Kalmanson-metric relaxation is SAT in both PIQD
   SMT engines, and both returned assignments pass PIQD model replay. Adding
   the retained exact first-apex row and its two required first-opposite
   interior members remains SAT/SAT with replay.
2. One surviving abstract cell was lifted to a planar QF_NRA query with strict
   convexity and the source-entitled `K/L` off-radius exclusions. Both engines
   returned `UNKNOWN` at the bounded run. This is no verdict in either
   direction.
3. Adding one existential four-support distance row at every carrier center
   made the abstract linear query substantially harder: both PIQD engines
   returned `UNKNOWN` at the bounded run. No stronger conclusion is drawn.
4. Splitting one fixed support cell is decisive: its five fixed rows remain
   SAT/SAT with replay even after exact-class off-radius exclusions, while
   adding only the center-9 K4 row is UNSAT/UNSAT.
   All 495 supports have independently reconstructed Kalmanson cancellations
   of length at most three, and the exhaustive 29-family cancellation bank now
   has a kernel-checked Lean endpoint. This closes that cell, not the full
   branch.
5. An independently supplied exact rational 13-point local model replays
   successfully and also satisfies the two displayed source-blocker failure
   checks. Its originally proposed `x2`-to-`k2` interval is not the source cap,
   but an alternate apex assignment realizes the source `3,2,5` boundary block
   sizes. The model still is not a source model: it has no four-point distance
   class at either `z` or `d`, contrary to the global `D.K4` premise, and its
   full MEC/frontier/robust-apex provenance remains unchecked.

The next discriminating layer is therefore the minimum-enclosing-disk and
triangle identities in the exact DR boundary/cap packet, together with the
global `K4` row—not another theorem using only four rows, tight cover, and
generic convex order.

## Source boundary

The checked Lean packet supplies:

- four-point rows `C0`, `C1`, and `K` surviving deletion of `z` at three
  pairwise distinct carrier centers;
- `z` omitted by all three rows;
- `z` in the five-point `oppInterior2` block in the large-interior arm;
- two disjoint named rows `K,L` at the second apex with distinct positive
  radii; and
- the corrected `K/L` interior profile `2+3`, with `L \ {z}` split `1+2`
  across `C0,C1` after an exact tight cover is available.

The finite assertion

```text
A = {z} ⊔ C0 ⊔ C1 ⊔ K
```

is no longer assumed unconditionally. The checked theorem
`Problem97.ThreeRowsFreshOrExactThirteenTight_split` and its packet adapter
`cardGeThirteenPacket_fresh_or_exactThirteenTight` derive a source-faithful
three-way split from `12 < D.A.card`: a pairwise-overlap failure among the
three rows, a fresh carrier point outside their inserted union, or the exact
13-point cover displayed above. The adapter derives `z ∈ D.A` and all row
cardinality, containment, and omission facts directly from the packet. In
particular, no `b0 ≠ z` or `b1 ≠ z` assumption was added.

## PIQD abstract metric run

Producer:
`scripts/cardge13_exact13_tight_cover_lra_piqd.py`.

After the retained-row experiment was split into a separate producer, the
current baseline producer re-emitted the same journal hash below. This checks
that the split did not alter the original query bytes.

The byte-identical `QF_LIRA` journal has SHA-256
`4c86244000c38827294fa7d58aa631841bf2413207f0205ccfc1e615ab06b8c2`
and contains:

- 13 labelled points and 78 positive abstract distances;
- 858 unit-slack strict triangle forms;
- 1,430 unit-slack strict Kalmanson forms in the DR direct order;
- Boolean support/center selection for `C0,C1,K,L,z,b0,b1`;
- the exact tight cover, `2+3` interior profile, and `1+2` trace bound;
- all four row equalities; and
- exact-class off-radius alternatives for `K,L` only.

PIQD results:

| Engine | Verdict | Solve | PIQD model replay |
|---|---:|---:|---:|
| Z3 4.17.0 | SAT | 994 ms | SATISFIED, 31 ms |
| cvc5 1.3.3 | SAT | 7,344 ms | SATISFIED, 56 ms |

One Z3 survivor is:

```text
z=8, b0=7, b1=8=z
C0={2,3,4,5}
C1={0,1,7,9}
K ={6,10,11,12}
L ={3,7,8,9}
```

Thus `L∩C0={3}` and `L∩C1={7,9}`. This is a concrete regression against
silently assuming both blocker centers differ from `z`.

This SAT result is only an abstract Kalmanson-metric survivor. It is not a
planar configuration and not a counterexample to the Lean branch.

### Retained first-apex incidence rerun

A second producer,
`scripts/cardge13_exact13_retained_first_row_lra_piqd.py`, added a fifth exact
row `T` centered at the direct-profile
first apex (label `1`). It forces both first-opposite interior labels `6,7`
into `T`, sets `T.card=4`, and applies full off-radius exclusions at that
center. This is the finite metric content of
`OriginalUniqueFourResidual.class_card_eq_four`, `.interior_q_mem`, and
`.interior_w_mem` after the direct label map; it does not encode the residual's
MEC or bisector-localization geometry.

The byte-identical journal has SHA-256
`4049cb6f14cba4d4c1a02adfd66768d955db3c5fee43dace917b8d7e8105d082`
and 3,053 commands.

| Engine | Verdict | Solve | PIQD model replay |
|---|---:|---:|---:|
| Z3 4.17.0 | SAT | 3,213 ms | SATISFIED, 34 ms |
| cvc5 1.3.3 | SAT | 6,509 ms | SATISFIED, 58 ms |

One Z3 support assignment is:

```text
C0={4,5,6,7}  C1={0,2,3,10}  K={1,9,11,12}
L ={2,4,8,10} T ={4,5,6,7}
z=8, b0=1, b1=9
```

Consequently, the retained two-point first-apex incidence does not by itself
turn the four-row tight-cover/Kalmanson abstraction into a terminal. The
rational witness's failure of that incidence distinguishes that particular
witness, but is not a general closure argument.

## PIQD planar nonlinear run

Producer:
`scripts/cardge13_exact13_tight_cover_qfnra_piqd.py`.

The fixed Z3 survivor was encoded with 26 coordinate variables, four squared
radii, 143 supporting-edge strict-convexity inequalities, 16 row equalities,
the selected `K/L` radius order, and 16 `K/L` off-radius disequalities. The
SMT journal SHA-256 is
`bf22e243293909e7c7a9efa8fa58eb844e62318037fd65248db85a4d156320d4`.

| Engine | Verdict | Recorded solve time |
|---|---:|---:|
| Z3 4.17.0 | UNKNOWN | 126,389 ms |
| cvc5 1.3.3 | UNKNOWN | 150,012 ms |

No conclusion follows from these timeouts. The run was not extended.

## PIQD all-center K4 linear run

Producer:
`scripts/cardge13_exact13_all_center_k4_lra_piqd.py`.

This extends the retained-first-row query with an existential four-element
equal-distance support at each of all 13 possible centers, faithfully encoding
the lower-bound content of `D.K4`. It deliberately adds no off-radius
exclusions to these rows: `K4` elects four equal-distance points but does not
state that the class is exact. The resulting `QF_LIRA` journal contains 3,430
commands and has SHA-256
`934d9b095455b66c7a3e16f0660e5dc0d1d37bd40f11cb03e2baa0bb57cd7ed6`.

| Engine | Verdict | Recorded solve time |
|---|---:|---:|
| Z3 4.17.0 | UNKNOWN | 120,011 ms |
| cvc5 1.3.3 | UNKNOWN | 124,541 ms |

Neither engine produced a model, so no replay was possible. These bounded
timeouts are not evidence of satisfiability or unsatisfiability and will not be
escalated by merely increasing the timeout. The next solver step is to split
the finite support choices into authenticated source-compatible cells and
mine short linear cancellation certificates per cell.

An external checkpoint proposes exactly such a first cell:

```text
/Users/adam/Downloads/cardGeThirteen-exact13-global-k4-row-domain-checkpoint-2026-09-04--01M1NW3RPQN5KVD4GQDP1PQG2B.md
```

Its observed document SHA-256 is
`3441eb8b2d4d16773fcb497a95c85164e061a1b8c4cf638f7e42cb01cec4233d`.
The referenced standalone verifier was not present in the handoff directory,
so the row-domain calculation was independently reconstructed in
`scripts/cardge13_exact13_center9_row_domain_piqd.py`. The reconstruction
reproduces all 495 support exclusions exactly:

```text
455 supports: one strict Kalmanson form
 32 supports: two strict Kalmanson forms
  8 supports: three strict Kalmanson forms
```

These 495 support certificates collapse to only 29 distinct form-tuples:
19 of length one, eight of length two, and two of length three. This is the
appropriate compression boundary for a generated Lean cancellation bank.

The canonical certificate payload has SHA-256
`46c7aec09b4b324dea08b4beb279b484e289cc550c9fc7aaee9d2f0e9593d32c`.
PIQD independently confirms the boundary. The fixed five-row equality cell is
SAT in both engines with model replay. Strengthening all five supports to exact
classes by excluding every nonmember from the row radius remains SAT/SAT with
replay. Adding the single existential center-9 K4 row to the weaker equality
base is UNSAT in both engines; the symbolic certificates use only the fixed
row equalities, so exactness cannot restore a support.

| Query | Z3 4.17.0 | cvc5 1.3.3 |
|---|---:|---:|
| five fixed row equalities | SAT, 146 ms; replay 31 ms | SAT, 11,764 ms; replay 31 ms |
| five exact fixed classes | SAT, 318 ms; replay 33 ms | SAT, 28,444 ms; replay 58 ms |
| plus center-9 K4 | UNSAT, 328 ms | UNSAT, 9,428 ms |

The equality-base, exact-base, and K4 journal SHA-256 values are respectively
`37aa793ecff42cbe10d438e76a0a1f914080cefa5d6cdfd0cb6f1f70e8b4aa69`,
`d0e34b343c056f4be08e65bc80fb1b14227437292b03e75720a3f8c9249e5b62`,
and `089401c16bd551725f8b52709287dd08d86b471cc0cbefc058f42468de0633e0`.

The table's equality and K4 rows are the retained run-0004 execution; the
exact-class row is the latest run-0005 execution. A later byte-identical K4
rerun returned Z3 UNSAT in 1,178 ms and cvc5
`UNKNOWN` at 30,039 ms under concurrent repository load. This later timeout
is no contrary verdict; the retained earlier cvc5 UNSAT result and the exact
495-support cancellation census remain the decisive evidence.

One claim in the external checkpoint does not replay: its displayed integer
matrix has strict-triangle minimum slack `-2`, with three of the 858 forms
below the required unit slack. It does satisfy all 1,430 strict Kalmanson forms
with minimum slack `1`. The matrix is therefore not the advertised strict
metric witness. This does not affect the symbolic row-domain cancellation or
the PIQD SAT/UNSAT split above, which quantify over fresh distance variables.

This remains a fixed-cell result, not a proof of the live branch: the source
classifier has not shown that this cell is exhaustive.

An exploratory reuse of the same cancellation search at every other raw
center found that center `9` is genuinely special for these five fixed rows.
Only center `9` eliminates all 495 supports with at most three positive
Kalmanson forms. Every other center has an uncovered support; for example,
center `0` leaves support `{1,4,5,7}`, and a fixed-support PIQD check of that
equality-only cell is SAT in both engines. Strengthening the five source rows
to exact classes makes that particular center-0 support UNSAT/UNSAT, showing
that exactness adds real strength beyond the equality certificates.

A stronger cell-wise PIQD scan then gave each center one existential
four-support row while retaining all five exact fixed classes. Center `9` is
UNSAT/UNSAT. Every other center is Z3-SAT; cvc5 is also SAT at centers
`0,2,4,5,6,7,8,10,11,12` and returns `UNKNOWN` at centers `1,3` under the
30-second bound. Thus center `9` is the unique eliminated center in this fixed
cell even after source-row exactness. The live source adapter must preserve
the raw-label/center-9 assignment; arbitrary-center substitution is false in
the abstract relaxation.

### Lean certificate ingress status

Luna has added the isolated module
`CardGeThirteenCenter9K4RowDomain.lean`. It defines row-tagged
`FixedFiveRows` (so the two distinct rows centered at raw label `0` are not
collapsed), the positive-incidence-only `Center9FourSupportRow`, and a generic
kernel endpoint for one-, two-, or three-form Kalmanson cancellations.
`requiredSupport_covers_center9SupportDomain` checks all 495 four-subsets by
ordinary kernel reduction; `false_of_certificateFamily` proves all 29
row-derived cancellation families; and `false_of_center9_fourSupportRow`
combines the finite classifier with those proofs. An independent focused
`lake env lean` check of the complete module exits successfully. A subsequent
locked `lake-build` also exits successfully; printed axioms for the coverage,
family-soundness, and main theorems are only `propext`, `Classical.choice`,
and `Quot.sound`, and the forbidden-marker scan is clean.

This is complete fixed-cell ingress, but not promotion to the live target. The
exact-13 branch already supplies the positional boundary through
`ExactThirteenBranchIngress`. The additional theorem
`ExactThirteenBranchIngress.exists_center9FourSupportRow_of_globalK4` pulls a
selected four-class at positional center `2` back through that boundary and
directly constructs the required `Center9FourSupportRow`; its focused Lean
check succeeds. Consequently the remaining fixed-cell obligation is precisely
the source adapter for the five tagged rows and their positional support
identities. The center-9 ingress lane's final hygiene/axiom handoff was still
in progress when this audit was updated.

## Exact rational negative control

The external handoff file is:

```text
/Users/adam/Downloads/cardGeThirteen-exact13-tight-four-circle-countermodel-with-verifier-2026-09-04--01M1NRMJET3VG9K1Q3QKM7ASHN.md
```

Observed document SHA-256:
`56951d9c86e5a47f0f07a6c3f657b0356f437fd438825b6100ceb265a826b997`.
The extracted embedded verifier hashes to
`f274fc8b832872ce2d7d0f490c082836d6ae45bd8a5aaf8f965a1dd4c01d78ee`
without a final newline. This does **not** match the document's advertised
verifier digest `7347a531...`; therefore the external artifact identity is not
authenticated as claimed.

After a full source review, the exact extracted bytes were executed under the
locally observed digest. All embedded Fraction assertions passed, including:

- strict convexity of all 13 rational points;
- complete four-point distance classes `C0,C1,K,L`;
- tight cover and corrected `2+1` trace;
- two distinct positive second-apex radii; and
- two local deletion views.

An independent exact regrouping of all distances at the two displayed blocker
centers gave multiplicity profiles

```text
b0: [4,1,1] before source deletion, [3,1,1] after deleting l0
b1: [4,1,1] before source deletion, [3,1,1] after deleting l2
```

so the v2 local source-blocker claim is also reproducible from the base
coordinates.

The model's originally proposed interval
`x2 < l2 < l1 < z < b1 < k1 < k2` has a `4+1` complementary split around
`A2=O` and therefore is not itself the source cap. A corrected Luna audit found
an alternate direct placement on the same hull:

```text
A1=b0, [k3,x0,l0], A2=O, [x1,x2], A3=l2, [l1,z,b1,k1,k2].
```

This has the required `3,2,5` blocks and the final five-point block has the
correct `K/L` count `3+2`, while preserving the named `K@O,L@O` rows. Thus
generic DR block cardinality/order does **not** exclude the rational model.
Whether this alternate placement satisfies the deeper named
`SurplusCapPacket` MEC/triangle identities remains open. The relevant order
anchors are `DRExactThirteenValuation.directOrder`, `.mirrorOrder`,
`.directIndex_surplus_order`, `.directIndex_firstOpposite_order`,
`.mirrorIndex_surplus_order`, and `.mirrorIndex_firstOpposite_order`.

A later source-order handoff records the alternate placement directly:

```text
/Users/adam/Downloads/cardGeThirteen-exact13-source-order-four-circle-countermodel-2026-09-04--01M1NSNZJEHZQFYCXBT7FS9KZR.md
```

Its document SHA-256 is
`12a6eb8e3669a0a42c7efadce5eb4043c945d978ba171f5c6f09e2f921089c1c`.
Unlike the first handoff, it does not embed the claimed verifier source, so its
coordinate assertions were not independently replayed. It reports that the
first source failure is MEC containment for the disk through `O,l2,b0`, which
does not contain `l0,x0,k3`. This is consistent with, but does not authenticate,
the proposed source discriminator.

There is also a source-level failure before treating the witness as a model of
the retained live residual. For the source-compatible direct placement,
`A1=b0` and the two first-opposite interior points are `x1,x2`.
`OriginalUniqueFourResidual.class_card_eq_four`, `.interior_q_mem`, and
`.interior_w_mem` require both points to belong to the exact four-point class
at `A1`. The witness's unique four-class at `b0` is
`C0={O,l0,l1,x0}`, containing neither. The witness therefore tests the weaker
four-row/order abstraction, not the complete residual passed to the live
theorem.

The same handoff suggests a source-independent disk kernel. If `P,B` lie on
one closed disk, distinct points `X,Y` lie in it, and `BP = BX = BY`,
and `PX = PY`, then the assumptions are inconsistent. Closed-disk inequalities
are enough: their sum forces the equality case, hence `X=Y`. Any Lean statement
of this kernel must retain `X != Y`; the previously advertised `P != X` and
strict-interior assumptions are redundant. A source wrapper would still have
to identify `P` with the apex, `B` with a blocker endpoint, and `X,Y` with the
two points of the relevant two-point trace.

An independent exact distance census also found that every distance from `z`
to another carrier point is distinct, and the same is true at `d=k2`. Thus the
local model fails `CounterexampleData.K4` at both centers. This supplies a
second concrete source discriminator: global four-point rows centered at `z`
and `d` are available in the live branch but absent from the local negative
control. These are distinct from the `CriticalShellSystem` rows sourced at
`z,d`, whose centers are the unknown blockers `H.centerAt z` and
`H.centerAt d`; generic `no_qfree_at` does not identify either blocker with
the other source.

## Source-wrapper audit

The checked live finite packet is
`CardGeThirteenUncoveredThreeCenterPacket`. It retains three exact deletion
rows and their omissions, but it does not itself expose positional row
identities. The exact arm's cardinality equation can, however, be combined
with the original two-radius branch binders through
`ExactThirteenBranchIngress.of_twoRadiusBranch`. That checked ingress already
constructs `ExactThirteenBoundaryBlocks`, splits direct/mirror orientation,
and supplies a `DRExactThirteenValuation.LabelMap` plus a convex boundary
enumeration. The first missing binders are narrower and more concrete:
`FixedFiveRows` for that boundary and a `Center9FourSupportRow` at positional
center `2`. The packet's three rows have no checked transport to those five
tagged raw supports, including the two independent raw-center-0 rows.

The closed-disk kernel is correspondingly leaf-specific. Its source wrapper
needs two MEC-boundary apices `B,P`, a `B`-centered row containing `P,X,Y`,
and a `P`-centered row containing the distinct pair `X,Y`. The pair cannot be
identified generically with `R.interior_q,R.interior_w`:
`FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior` forces
any other carrier center equidistant from that pair into their own strict cap
interior, excluding the other triangle apex. A concrete exact-13 incidence
cell also survives with both blocker centers away from the other apices, so
the disk kernel is not yet a uniform terminal without the missing DR leaf
classification.

The source-independent kernel is now formalized as
`Erdos9796Proof.Geometry.false_of_two_interior_same_boundary_radius` in
`Geometry/TwoInteriorSameBoundaryRadius.lean`. Its focused build succeeds and
its printed axioms are only `propext`, `Classical.choice`, and `Quot.sound`.
This does not change the wrapper gap above.

The three-way packet split has also been audited branch by branch. In every
overlap arm, non-disjointness provides only one common point, while
`ThreeCenterCommonDeletionExactRows` bounds the intersection cardinality by
two. Every existing shared-pair Kalmanson/nonalternation terminal needs a
second distinct shared point and then boundary indices plus cyclic order or a
nonalternation hypothesis. Distinct packet centers rule out the same-center
radius API. No noncircular overlap consumer is currently available.

The fresh-point arm gives `q ∈ D.A` outside `z` and all three retained row
supports. In particular `q ∉ P.thirdRow.support`, so
`selectedFourClass_survives_erase_of_not_mem` yields a source-clean
four-point witness at `S.oppApex2` in `D.A.erase q`; the existing
`exists_selectedFourClass_in_erase_of_deletion_survives` adapter packages it.
This is a genuine fourth-row producer, but no current terminal consumes it.
The nearest overlap terminal first needs a distinct center and intersection
cardinality at least three; the blocked-deletion route instead needs a blocked
triple, and the tetrahedron route needs another q-deleted row plus positive
cross-incidences. Freshness alone does not imply removability of `q`, so the
removable-vertex API is not source-clean here.

In the exact-cover arm, the three row centers induce a fixed-point-free map
into the three disjoint supports once their own-row omissions are transported.
The elementary finite classification is a directed two-cycle or one of the
two directed three-cycles. That classification is now available separately,
but neither it nor the exact-13 ingress identifies the packet rows with the
particular five-row center-9 PIQD cell. This is the first source-binding
obligation; a generic relabeling is unsound because the cross-center probe
above has open cells. In particular, `S.oppApex2` is not positional raw center
`9` in the three profile/orientation layouts, so its retained row cannot be
silently reused as the required global K4 row.

## Next checkable milestones

1. Consume the three checked
   `cardGeThirteenPacket_fresh_or_exactThirteenTight` branches: classify row
   overlaps, use global K4 at a genuinely fresh point, and send only the exact
   13-point cover to the finite cell classifier. The overlap audit is now
   complete and records its first missing antecedent: a second shared point
   plus cyclic-order data. The fresh arm now has a checked q-deleted fourth-row
   producer; its first terminal gap is a three-point cross-row intersection
   (or, on the deletion route, a blocked triple).
2. Export complete `Fin 13` cells from the DR `secondOpposite` direct/mirror
   boundary data, retaining blocker=`z` cases and the deletion role.
3. Connect `OriginalUniqueFourResidual`'s MEC and bisector-localization fields
   to the exact-13 boundary cells. The exact first-apex row and its two required
   members alone have now been tested and remain satisfiable.
4. Classify exactly which DR leaves provide the source wrapper for the now
   formalized two-circle closed-disk kernel with explicit `X != Y`.
5. Enumerate the blocker-center aliases and source-containing critical rows
   faithfully, retaining the directed two-cycle/three-cycle split. The
   monolithic all-center `D.K4` query timed out in both engines; use cell-wise
   support-domain cancellation instead of a longer run. Do not generalize the
   center-9 bank across centers: a center-0 residual cell is PIQD SAT/SAT.
6. Run exact linear Kalmanson filtering per authenticated cell and retain the
   short one-to-three-inequality cancellation bank. The current all-in-one
   query is discovery only and supplies no exhaustive cell certificate.
7. Send only exact-LRA survivors to planar QF_NRA. A decisive solver result
   remains computation evidence until replay, source coverage, and a checked
   Lean ingress are present.

No change to the live theorem or aggregate import is justified by this audit.
