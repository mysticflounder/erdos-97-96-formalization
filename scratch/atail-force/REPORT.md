# ATAIL critical-row coupling checkpoint — 2026-07-13

Terminology: `CARD-GE-12` means a theorem uniform under `12 ≤ D.A.card`;
`CARD-EQ-12` means an exact-cardinality finite profile or artifact. Bare
“card-12 producer” is not used for current proof status.

## Result

The scratch certificates `critical_row_coupling.lean` and
`triple_relabel_adapters.lean` kernel-check the routine interfaces and the
T1/T3 orbit reduction without editing the concurrently owned Route-B source
file.

1. Two `CriticalRowPacket`s with equal centers and equal selected `l1` points
   have equal radii and therefore equal full exact four-shell supports.
2. The two comparison maps passed to
   `u1_largeCap_routeB_tail_liveData_false` consequently identify the entire
   sixth-row support with `rows.rowAt source` whenever `f2 := t2[0]` collides
   with that named source.
3. A card-at-least-two lower bound on the off-surplus intersection of the two
   full apex-radius filters extracts exactly the distinct pair and four radius
   equations consumed by the existing Route-B sink.
4. If the sixth-row source `f2 := t2[0]` collides with `t1`, permuting the
   dangerous triple from `(t1,t2,t3)` to `(t2,t1,t3)` turns the transferred
   `t1Row` into the existing pair consumer's `t2Row`. The full fixed-triple,
   five-row, live-data, and base-pairwise packets all transport.
5. The symmetric `(t1,t3,t2)` relabeling handles an `f2 = t3` collision.
   Thus the 24 LIVE-T1 and 24 LIVE-T3 textual leaves are not independent
   mathematical residuals: after these adapters are wired, all 48 depend on
   the single existing K-A-PAIR residual.

Validation command, from the Lake root:

```bash
lake env lean ../scratch/atail-force/critical_row_coupling.lean
lake env lean ../scratch/atail-force/triple_relabel_adapters.lean
```

This exited zero on 2026-07-13. The direct command is intentional for this
unimported scratch certificate; it reads the existing imported build and does
not run a repository-wide build.

## Scope

This is a normalization checkpoint, not the ATAIL producer theorem.

- It upgrades the live source-collision comparison from one label to the full
  exact shell, so future LIVE-Q/T1/T3 proofs should not re-enumerate shell
  membership merely to recover that equality.
- It does not contradict the surviving T1/T3 source-collision cells. Those
  cells can consistently have the common support with different slot
  permutations. Instead, the relabel adapters bypass those permutations and
  feed the common support to K-A-PAIR. The two-center cap argument remains
  load-bearing.
- It does not add the sixth row to
  `DoubleApexOffSurplusSharedRadiusPair`; the five-row pair and six-row live
  theorem surfaces remain distinct.
- The content-bearing open statement is still the card-at-least-two lower
  bound for the joint full-filter fiber, or an equivalent immediate
  contradiction from the same on-spine hypotheses.

`triple_relabel_adapters.lean` intentionally imports the current Route-B pair
consumer, so its two terminal theorems inherit the pair residual's `sorryAx`.
Their contribution is a checked dependency reduction, not a new proof of
False. Once K-A-PAIR is closed, they are ready to replace the entire T1/T3
slot-enumeration blocks; until then those 48 leaves remain open on the kernel
spine.

## LIVE-C contract audit

The seven named `liveData_C_*` helper statements were checked against the
actual `CriticalRowPacket` interface, the mandatory theorem-bank registries,
and:

```bash
nthdegree docs search --lean \
  "CriticalRowPacket center equals q t1 t2 t3 u contradiction source center collision"
```

The indexed matches are the existing `center = p` reductions already used by
the parent, not a generic consumer for the other center cases. The theorem
`CriticalRowPacket.center_ne_source` closes a subcell only after the blocker
center is also identified with the extra row's source `t2[0]`. None of the
seven helper contracts provides that source equality. Nor do they provide the
p-centered exact-dangerous `t2Row` center/support hypotheses consumed by
K-A-PAIR. Thus there is no direct whole-helper reduction on the current
contracts. This is a bounded negative audit, not a nonexistence result.

This session is anchored at LIVE-T1. The shared Route-B parent is owned by a
different live session, so this checkpoint makes no edit to that source.

## Arc-overtake subsuming core and replay

The checked theorem `SixPointTwoCircleArcOvertakeOrderCore` replaces the old
round-by-round `(5,5,5)` consumer trace for archived rounds 10--28.  It uses
the exact equalities

```text
OA = OC = AC = OD = OE,
DA = DE = DF,
```

and the cyclic order `O,A,D,E,F,C`.  Its positive and reflected consumers and
the actual GeneralCarrier adapter elaborate with exactly `propext`,
`Classical.choice`, and `Quot.sound`.  The source files are:

- `six_point_two_circle_arc_overtake_order_core.lean`;
- `residual_555_round28_general_carrier_adapter.lean`.

The preserved pre-subsumption replay has SHA-256
`fcb0b93588ad95dac43aa2a1bf1364d5f7a3a24cc5cb5f15739c8541cd11ca09`.
The clean replay now has six `(4,5,6)` cuts and twenty-one `(5,5,5)` cuts.
Round 18 is a nested-equal-chord cut; the five-row circle-intersection
consumer closes current rounds 19--20.
The first uncovered `(5,5,5)` shadow is round 21, digest
`2854f002275620851be4b86b064d3f0fb02cb60099c6a60d36f241dd19fb82ec`.
Current checkpoint SHA-256:
`1c8c943281998453a17b6063bff59efa19cff4363343b08f9ffe49bb64f873d0`.

## Live arc-overtake producer boundary

`live_arc_overtake_producer.lean` now checks the full conditional wiring on
the existing five-row pair surface.  `LiveArcOvertakeFields` selects the
dangerous permutation, preserves the dangerous `p`-row, one critical
`p`-source row, and the independent `uRow`, and
`false_of_liveArcOvertakeFields` feeds the resulting faithful carrier pattern
to the GeneralCarrier adapter.  This introduces no new provenance field and
does not edit the concurrently owned Route-B source.

This is not a live sorry closure: existence of `LiveArcOvertakeFields` is the
remaining theorem.  The former round-19 survivor pinpointed its first missing
content.
Its supplied `u`-row meets the dangerous four-class in only one aligned point,
so it omits the second dangerous hit needed by the arc-overtake packet.

The exact follow-up audit in
`second_dangerous_hit_forcing_analysis.md` separates two open stages.  Stage I
must not only force two dangerous hits; it must also place the `u`-row center
in the dangerous class and align one hit with a critical row through source
`p` and a second dangerous point.  Stage II must force the overtaking cyclic
order or a named consumed alternate.  An exact nine-point strictly convex
algebraic model realizes all three aligned local rows in a different hull
order, so Stage II is not automatic from local incidence and convexity.

Stage I is now packaged in
`stage1_aligned_incidence_boundary.lean`.  Its
`LiveArcOvertakeStageOneFields` structure is exactly the final live packet
without cyclic order; it proves the u-row/dangerous-base intersection has
cardinality exactly two and reconstructs `LiveArcOvertakeFields` when order is
provided.  The companion
`stage1_one_hit_incidence_countermodel.lean` gives a kernel-checked `Fin 12`
common-provenance shadow with every current incidence consequence and both
center alignments, but exactly one dangerous u-row hit.  This closes the
incidence-only proof plan negatively, not the live Stage-I theorem.

The cap-facing Stage-I route is now split at two sharper kernel boundaries.
`stage1_common_cap_alignment_boundary.lean` proves common-cap alignment or a
named `URowSeparatedCapPlacement`, with an exact K-A-PAIR leaf adapter;
`stage1_common_cap_incidence_countermodel.lean` realizes the separated branch
inside the full current cap/incidence abstraction.  Assuming alignment,
`stage1_common_cap_confinement_boundary.lean` proves confinement or a named
`URowOffDangerousSeparatedPairFields`.  In the latter packet the `uRow` center
is equidistant from two outside points while `p` has unequal distances; the
existing outside-pair uniqueness theorem already rules out equality at `p`.
A second finite shadow realizes failed confinement with dangerous
multiplicity exactly one.  Therefore the next genuine geometry is precisely
an exclusion/classification of those two escape packets into an already
consumed MEC/order obstruction, not another cap-count lemma.

The next geometric pass consumes everything routine in those escape packets.
`stage1_separated_cap_geometry_boundary.lean` classifies separated centers as
either strict interiors of distinct caps or an opposite-Moser endpoint
packet. The endpoint branch now has no cap-cardinality split: the exact
four-point row at the opposite vertex contains two distinct points of the
facing strict cap interior, retains its whole carrier radius filter, and both
outer Moser endpoints separate the pair's distances. A new cross-row
bisector equality is therefore required; more cap-size bookkeeping cannot
remove this branch.
`stage1_separated_pair_classifier_boundary.lean` proves full-shell exactness,
unique common-cap bisector center, and the retained global block placement.
Its smallest checked consumed alternate is three distinct carrier centers on
one perpendicular bisector; the live packet supplies the `uRow` center but no
additional center. `stage1_bisector_producer_boundary.lean` specializes the
two missing centers to the actual critical-shell system: the only missing row
memberships are reciprocal incidence of the escaped pair in the rows sourced
at its two points, plus pairwise distinctness of the two blocker centers and
`uRow.center`. The checked one-call adapter turns those exact fields into
confinement, and any genuinely new bisector center must lie outside the common
cap. Reciprocal incidence without center distinctness forces one of three
center collisions, each upgraded by exactness to equality of complete row
supports. The open geometric frontier is therefore the
distinct-interior/endpoint packet on the alignment side and production of
those reciprocal incidences and center inequalities on the confinement side.

`live_q_c_shared_consumer_boundary.lean` records the corresponding liveData
boundary.  It proves uniformly that all seven LIVE-C center cases have two
distinct `f2` support points outside the dangerous base, removes the
unnecessary selected-`t2`-row premise from the fixed-dangerous same-cap sink,
and extracts the equilateral-star prefix in `center_t2_named`.  No complete
LIVE-Q orbit or LIVE-C helper closes: LIVE-Q lacks a distinct aligned center,
while LIVE-C needs the opposite incidence—two dangerous points of the second
row outside a common cap.

For the special `center_t2_named` branch,
`live_c_t2_named_crossrow_boundary.lean` isolates the next edge exactly.  A
cross-source row centered at a dangerous `D != t2` and containing `t2` would
supply `DA_DX5` automatically from its source point.  Existing comparison
maps instead force center `t2`, so they only reproduce the already-used
equilateral row and cannot provide the dangerous-centered cross-row edge.

The earlier numerical probe
`residual_555_round19_mec_optimizer_report.md` discovered a candidate Stage-II
alternate.  Its scalar half is now proved in
`residual_555_round19_mec_scalar_core.lean`: three necessary
circle-intersection lower bounds in nonnegative half-arc gaps summing to
`pi/6` are incompatible, and any common numerical margin satisfies
`tau < -4/25`.  Direct Lean elaboration passes; all five audited endpoints use
exactly `propext`, `Classical.choice`, and `Quot.sound`.
`residual_555_round19_mec_geometry_lift.lean` now completes the geometry in
both orientation conventions.  Its public theorems show that the five saved
row equalities and the six signs for cyclic `O,A,D,E,C` already contradict
the scalar core; MEC, nonobtuse, and disk hypotheses are not needed.  The
label-generic `FiveRowCircleIntersectionOrderCore`, reflected carrier adapter,
and monotone matcher are now checked.  Deterministic replay banks five-row
cuts at rounds 19 and 20 and advances to round 21.  The optimizer's value
`-0.1701735873` is still
numerical and is not claimed optimal.  Additional blind census rounds are not
a logical prerequisite for either stage.

## cvc5 cross-engine terminal

The released compute lease ran the same seven frozen full-inequality systems
through one sequential, effective-nice-10 cvc5 1.3.3 nonlinear-coverings
process. V1 was aborted when the live audit caught sandbox priority denial;
it wrote no result. V2 passed its priority and SAT/UNSAT smoke gates, then all
seven cases reached the exact statusless timeout diagnostic in 219.217
seconds.

The raw V2 parser labeled those signal exits `ERROR`. The solver-free
`cvc5_pilot_checkpoint.py` validates the immutable raw result and normalizes
only the exact `returncode = -6`, null status, 30--35 second elapsed, and
`cvc5 interrupted by timeout.` shape. Its mutation test rejects diagnostic
drift. Final histogram: 7 `TIMEOUT`, zero SAT candidates, zero UNSAT proposals,
and no mathematical claim.

## Order-fan kernel checkpoint

The blind full-system pilots were solver bottlenecks, so the next experiment
kept the frozen six-interior-point representative but reduced its order data.
The metric, disk, nonobtuse, and cap-side base is SAT. Adding the first seven
cyclic-order inequalities, the fan based at the oriented edge `v2 -> s1`, is
repeatably Z3-UNSAT across seeds 0, 1, and 2. Conservative deletion leaves 15
constraints involving the Moser frame and three support points.

That UNSAT proposal has an independent solver-free proof. The theorem
`Problem97.ATAILForceScratch.orderFanKernel` in `order_fan_kernel.lean`
normalizes the isosceles Moser frame, derives that the two ordered surplus
points lie below the base, compares their opposite-apex chord lengths, and
combines the resulting upper bound with the opposite-cap point's Cauchy lower
bound. The direct Lean check exits zero.

The geometric pattern is narrow: two ordered surplus points are respectively
shared with the two adjacent apex classes, and one member of the second class
lies in the indicated opposite cap. `order_fan_coverage.py` checks all six
simultaneous center relabelings and all 167,782 selected-four order
decorations. Exactly 39 systems in 21 joint classes match; 36 have one matching
relabeling and 3 have two. Thus 167,743 surface systems do not match this
kernel. This is exact combinatorial coverage of the current decision surface,
not geometric inventory coverage of a live leaf.

The analogous first-edge fan was also tried on the other six frozen support
sizes for five seconds each. All six returned `UNKNOWN`. This has no
realizability or impossibility content. The result is therefore a proved
narrow cut and a template for extracting further small order theorems, not a
full-filter producer and not closure of K-A-PAIR.

Reproduction, from the repository root:

```bash
PYTHONPATH=. .venv/bin/python scratch/atail-force/order_fan_minimize.py --timeout 1
PYTHONPATH=. .venv/bin/python scratch/atail-force/order_fan_coverage.py
PYTHONPATH=. .venv/bin/python scratch/atail-force/edge_fan_strata.py
```

Lean validation, from `lean/`:

```bash
lake env lean -M 16384 ../scratch/atail-force/order_fan_kernel.lean
```

No leaf-to-inventory bridge, full exact-radius-filter pair, or main-source
consumer is claimed.

## Complete m=6 edge-fan diagnostic

`m6_edge_fan_scan.py` exhausts the seven S3-representative classes with six
interior points, all 25 representative order decorations, and all nine
oriented polygon edges: 225 bounded edge-fan queries at 250 ms each. The
order-free base histogram was 7 `SAT`, 12 `UNKNOWN`, and 6 `UNSAT`; after an
edge fan was added, the histogram was 26 `SAT`, 155 `UNKNOWN`, and 44 `UNSAT`.
These are solver statuses, not classifications. In particular, many fan hits
inherit an order-free contradiction and no timeout is promoted either way.

The six order-free UNSAT rows are exactly the four decorations of class 2422
and the two decorations of class 2472. Both class-orbit proposals were then
minimized and proved independently; no longer timeout was used to classify
the remaining rows.

## Two order-free cap kernels

For class 2472, conservative deletion reduces the 45-constraint base to eight
hypotheses. `bisector_cap_kernel.lean` proves the resulting theorem
`bisectorCapKernel`: equal-radius data put both the Moser apex and a shared
opposite-cap point on the base perpendicular bisector, while the two strict
cap signs are additive inverses and cannot both be positive.

For class 2422, the solver retains twelve hypotheses. The explicit proof in
`two_circle_cap_kernel.lean` removes one further unused cap inequality and
proves an eleven-hypothesis theorem. The shared `p2` point forces the Moser
apex strictly left of the base midpoint; the `q2` two-circle equations and cap
signs force it strictly right. This proof uses a bounded 800,000-heartbeat
allowance for normalization and no solver, certificate importer, or new
axiom.

The exact simultaneous-S3 union matcher checks all 167,782 decorations:

- `orderFanKernel`: 39 systems / 21 classes;
- `bisectorCapKernel`: 66 systems / 18 classes;
- `twoCircleCapKernel`: 24 systems / 6 classes; and
- union: 129 systems / 45 classes, with no overlap between the three cuts.

Thus 167,653 selected-four systems survive all three checked kernels. The
order-free results are better theorem-bank seeds than the original fan, but
the exact union count rejects continued blind local-kernel mining as a closure
strategy unless a new forcing principle makes one of these patterns
unavoidable. The next primary target is the live full-filter/critical-row
producer.

Reproduction, from the repository root:

```bash
PYTHONPATH=. .venv/bin/python scratch/atail-force/m6_edge_fan_scan.py --timeout-ms 250
PYTHONPATH=. .venv/bin/python scratch/atail-force/m6_base_minimize.py --class-id 2472 --timeout 1
PYTHONPATH=. .venv/bin/python scratch/atail-force/m6_base_minimize.py --class-id 2422 --timeout 1
PYTHONPATH=. .venv/bin/python scratch/atail-force/kernel_union_coverage.py
```

Lean validation, from `lean/`:

```bash
lake env lean -M 16384 ../scratch/atail-force/bisector_cap_kernel.lean
lake env lean -M 16384 ../scratch/atail-force/two_circle_cap_kernel.lean
```

These are exact scalar implications and exact combinatorial decision-surface
counts. They do not establish live-leaf inventory coverage, the full-filter
shared pair, or an on-spine consumer.

## Critical-row metric discriminator

The next finite-shadow experiment strengthened the row vocabulary rather than
continuing selected-four kernel scans. Two saved `CARD-EQ-12` candidates, from the
internal `(4,5,6)` and `(5,5,5)` block-profile labels, each retain one selected
four-point row at every center, pairwise overlap at most two, and an explicit
common cyclic order satisfying every shared-pair separation. The first tuple is
not the closure matrix's labeled-cap tuple order. Both avoid every obstruction
currently returned by `_formalized_metric_core`.

`critical_row_metric_discriminator.py` reports that neither candidate is a
metric equality model according to a trusted exact-arithmetic CAS check.
Singular returns `UNIT` over `QQ` for an eight-row,
24-equality subsystem of the `(4,5,6)` candidate and a seven-row,
20-equality subsystem of the `(5,5,5)` candidate. Subsystem monotonicity then
excludes both full 36-equality systems within the algebraic model. The
Nullstellensatz certificate was not independently replayed. The saved JSON
pins the rows, orders, digests, smoke gates, and epistemic scope.

The subsystems are large rigidity networks, not small recurring kernels. No
generic theorem or Lean certificate is claimed. The practical next target is a
second-center/full-filter producer for the two off-dangerous points already
forced in the retained LIVE-C provenance packet; that would feed the existing
`outsidePair_unique_capCenter` theorem or the direct opposite-apex pair sink.

Reproduction, from the repository root:

```bash
PYTHONPATH=. UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run python scratch/atail-force/critical_row_metric_discriminator.py --check
```

See
`docs/audits/2026-07-13-atail-critical-row-metric-discriminator.md` for the
exact/nonexhaustive boundary and the rejected raw-`msolve` parser path.

## Joint-fiber boundary and blocker-graph gate

`apex_filters/joint_fiber_upper_bound.lean` kernel-checks the exact sink
boundary: every fixed opposite-apex radius pair has at most one realization in
the carrier outside the surplus cap. It also proves that K4 supplies at least
three off-surplus points at a suitable radius from either apex, while the
distance to the other apex is injective on that marginal. Separate K4 counts
therefore cannot yield the desired collision by pigeonhole alone. Full audit:
`docs/audits/2026-07-13-atail-apex-filter-assessment.md`.

The two replayable blocker witnesses make the missing hypothesis explicit.
`blocker_graph/countermodel.py` gives a 12-vertex exact distance-equality model
with a spanning blocker cycle and singleton joint fibers.
`blocker_graph/euclidean_countermodel.py` gives a 33-point integer-coordinate
Euclidean set with global K4, single-deletion criticality, genuine blocker
cycles, and an injective fixed two-center distance map. The latter is
non-convex, so it is not a K-A-PAIR counterexample; it isolates convex/Moser/cap
localization as load-bearing.

Consequently, blocker-cycle length, spanning, or surjectivity is terminal at
this abstraction. The next producer must force an off-surplus exact-shell
overlap of cardinality at least two at the two fixed opposite Moser apices, or
derive `False` directly from an explicitly used convex/cap/critical-row fact.
See `docs/audits/2026-07-13-atail-blocker-graph-assessment.md`.

## Global ordered-cap count boundary

The current Lean outside-pair count contributes only `m+4` distinct pairs for
a cap of size `m`. At card 12 the three-cap lower total is 27, while the pair
capacities total 63 for `(5,5,5)` and 64 for `(4,5,6)`. A common
critical-shell system bounds blocker fibers by four, but it does not supply a
second incidence copy at a blocker center: every global selected four-class
there has the same support as the critical shell.

`global_count_boundary/validator.py --check` pins a strengthened finite shadow
for each profile. Both satisfy the current count, exact abstract K4 rows,
common source-to-blocker provenance, one-sided ordered-cap row bounds,
endpoint one-hit, outside-pair uniqueness, cyclic shared-pair separation, and
a singleton fixed off-surplus joint fiber. The manifest fail-closes Euclidean
coordinates, convexity, strict-cap/MEC geometry, full live fields, exhaustive
placements, and card 11. These are not counterexamples; they terminate the
finite double-count route and require a new real metric/order coupling. Full
audit: `docs/audits/2026-07-13-atail-global-count-boundary.md`.

## Same-cap producer boundary

`same_cap_second_center.lean` kernel-checks a smaller exact closure interface.
The dangerous `p` row supplies two distinct row points outside any indexed cap
containing `p`; independently, the supplied `u` row has center different from
`p` and has at least two support points outside the dangerous base. The file
packages the only new geometric datum as
`DangerousRowSameCapSecondCenter`: a second distinct center in the same cap as
`p`, equidistant from a dangerous-row pair outside that cap.

`DangerousRowSameCapSecondCenter.false` converts that proposition directly to
`CapSelectedRowCounting.outsidePair_unique_capCenter`. No opposite-apex
identification is needed. Direct Lean validation passes, and axiom audits of
the routine extraction and consumer endpoints report only `propext`,
`Classical.choice`, and `Quot.sound`. The proposition remains CONJECTURED; the
checked file isolates it rather than proving it. The target-facing strategy
and card-11 contract are audited in
`docs/audits/2026-07-13-atail-missing-ingredient-strategy.md`.

The checked theorem
`DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity` gives the
smallest current critical-system interface: one source-indexed shell centered
with `p` in a cap, at a center different from `p`, whose support contains two
dangerous points outside that cap. Its proof is routine extraction and radius
transitivity. The unproved part is forcing that multiplicity. A bare map from
dangerous sources into `cap \ {p}` yields a pigeonhole collision only when the
cap has size four and all four dangerous points are outside, so it does not
cover the live card-11/`CARD-EQ-12` profiles uniformly. The companion
`false_of_criticalShell_sameCap_capMultiplicity` is the checked one-call
consumer for exactly that field.

`dangerous_blocker_collapse.lean` proves an additional exact obstruction. The
dangerous selected class is precisely `{q,t1,t2,t3}`, deleting any one of
those four points blocks `p`, and `collapseDangerousBlockers` overrides any
critical-shell system so every dangerous source has `centerAt = p`. Thus the
missing non-`p` center cannot be forced merely by choosing an arbitrary
`hcritical` witness and then choosing one of the dangerous sources. This does
not show that no useful system exists; it sends the producer to a source
outside the dangerous class, an independently proved non-`p` blocker, or a
common-provenance hypothesis that is not invariant under the override.

`outside_source_cap_multiplicity.lean` checks the resulting honest route. The
selected source `u` is outside the dangerous class, and a common critical
system cannot use `p` as its blocker because the dangerous K4 survives
deleting `u`. The supplied `u` row likewise has center different from `p`.
The current binders then give only separate cap witnesses for `p` and that
center, at least two row points outside the dangerous class, and at least two
outside any cap containing the center. The exact open proposition
`URowCapMultiplicityFields` aligns them: one common cap plus two dangerous
support points outside it. The checked sufficient
`URowCommonCapOffDangerousConfinement` puts every off-dangerous `u`-row point
inside the common cap. That confinement is genuine unproved geometry; common
provenance alone does not supply it.

The follow-up geometric audit and bounded exact replay decide this local
shortcut negatively. The exact strictly convex Euclidean `(4,5,6)` relaxed
residual has a common cap and obeys the generic center-cap intersection bound,
but only one dangerous `u`-row support point lies outside that cap. Hence the
two independent complement bounds do not imply `URowCapMultiplicityFields`.
The saved `(5,5,5)` finite shadow independently fails the common-cap conjunct.
Neither artifact is a live counterexample: the Euclidean residual's named
Moser frame is not MEC, global K4 fails at eight centers, and the live
no-M44/full-filter package is absent. The full live implication remains
CONJECTURED. The binder audit also finds that the outer caller's common-system
row provenance is erased by the pair theorem's independent `rows` and
`hcritical` arguments. That interface must be retained before a common-system
argument, but provenance alone proves neither missing conjunct. See
`docs/audits/2026-07-13-atail-urow-cap-multiplicity-geometric-audit.md` and
`urow_cap_multiplicity_falsifier.py --check`.
The residual's omitted MEC field is independently pinned:
`MECStraddlingRowCore` excludes it, and label 10 has positive exact rational
circumdisk power. That core uses only one equality from the `u` row and no
dangerous-count or cap field, so it remains a survivor cut rather than a URow
producer; see `residual_456_mec_gate_analysis.md`.

## Critical-system fiber count and certificate-bank synthesis

`critical_system_fiber_count.lean` packages the exact counting content of one
common `CriticalShellSystem`. Every `centerAt` fiber injects into one locked
four-point support, so `centerFiber_card_le_four` and
`card_le_four_mul_centerImage_card` prove

```text
|A| <= 4 * |image(centerAt)|.
```

The live `9 < |A|` hypothesis therefore forces three blocker centers, and
`12 < |A|` forces four. The strongest generic same-cap consequence requires
`4 * (|A \ cap| + 1) < |A|`; it fails arithmetically at card 12 and, with a
six-point cap complement, does not become available by this raw capacity
argument until card 29. The three audited endpoints elaborate with exactly
`propext`, `Classical.choice`, and `Quot.sound`, and no `sorryAx`.

The exhaustive certificate-bank synthesis is recorded in
`docs/audits/2026-07-13-atail-certificate-bank-generalization-audit.md`. Its
highest-leverage general theorem is an arbitrary-finite-label/row version of
the sibling `u5_gram_cert_checker_sound`: a checked compiler from row
equalities and planar Gram facts to `False`. The existing fixed `Fin 6` / `Fin
8` checker discharged 37,278 of 37,350 archived U5 residual patterns, but it
does not directly accept the current five-row/twelve-label blocker networks.
The proposed generalization is a consumer/compiler, not the missing live
incidence producer. The second reusable abstraction is the four-uniform
critical-shell incidence package (support locking, fiber bound, distinct-center
overlap, and cap pair injection); its card-12 counts remain slack.

## `CARD-EQ-12` same-cap second-center incidence preflight

`second_center_query/query.py --check` pins the first target-specific Q-C
finite shadows. It tests one explicit admitted placement for each `CARD-EQ-12`
profile while retaining the dangerous exact row, five independent supplied
exact rows, an exact selected row at every center, a source-indexed exact
critical-system row at every point, and the current cap/cyclic/pair/Q3
incidence constraints.

Both cases are `SAT_FINITE_SHADOW_ONLY`: `(4,5,6)` has a 29-row witness found
in 19 nodes (digest
`ce24f3818d0b9465ef6afadced8a957065ffb7846cd62d7f1cb52c764850fa47`), and
`(5,5,5)` has a 29-row witness found in 26 nodes (digest
`d1231886198381478c2ae0120c5d444b353e0b003097cc97b10c205c98883a18`). The
independent validator and five unit tests pass.

These are not Euclidean counterexamples. The manifest fail-closes metric
equalities/disequalities, strict convexity, MEC and non-obtuse geometry,
arbitrary bisector hits not carried by an encoded row, full live data,
exhaustive placements, Q-A/Q-E, and card 11. The exact conclusion is only that
row/cap/critical-system incidence does not force a row-witnessed Q-C collision
on these two placements. The next bounded step is an exact metric oracle on
the pinned shadows, not a larger incidence enumeration.

## `CARD-EQ-12` second-center metric oracle

`second_center_metric_oracle/oracle.py --check` rules out both saved incidence
shadows at the weaker equality-only metric layer. Each 29-row witness reduces
to 12 distinct center/support circles and 36 quadratic equalities. With
`point 0 = (0,0)` and `point 1 = (1,0)`, Singular 4.4.1 and msolve 0.10.1 in
forward and reverse variable orders all return `UNIT` over `QQ` for both
profiles. Hence neither fixed normalized complex variety, and therefore
neither fixed normalized real variety, is nonempty.

Bounded deletion retains cross-checked unit subsets of 6 rows / 18 equalities
for `(4,5,6)` and 7 rows / 21 equalities for `(5,5,5)`. Some deletion calls
timed out, so the subsets are not claimed minimal. The independent replay and
four tests pass. The result is trusted exact CAS without a replayed
Nullstellensatz certificate or Lean proof; it covers only the two fixed
placements and excludes card 11. The successor artifacts below add a replayed
certificate, compact Lean consumer, and metric CEGAR loop while preserving
that nonexhaustive scope boundary.

## Five-row metric consumer

The later `(4,5,6)` round-1 CEGAR cut has a complete proof independent of the
oracle verdict. `second_center_metric_certificate/` stores and independently
replays a rational identity

```text
1 = sum_i h_i * g_i
```

for the normalized generators. The compact preferred proof is
`five_row_metric_core.lean`: it proves the eleven scalar equations
inconsistent, transports the result to arbitrary real-plane points, and shows
that the five-row pattern forces distinguished labels `0` and `1` to coincide.
`false_of_five_selectedFourClasses` consumes sixteen explicit support
memberships in five selected K4 rows, while `FiveRowCollisionCore` packages the
same statement through eleven `EdgeClosure` witnesses. Direct elaboration
passes, and every printed axiom set is exactly `propext`, `Classical.choice`,
and `Quot.sound`.

This closes the metric consumer only. Exact audit against twelve indexed
equality-core families finds no reuse for this particular shape.

## Round-64 metric CEGAR and provenance

`second_center_metric_cegar/checkpoint-round64.json` resumes the hash-bound
32-round prefix and reaches 64 rounds per fixed placement. All 128 proposed
full ideals and all 128 learned cuts fully replay as `CROSSCHECKED_UNIT`.
`(4,5,6)` uses 5--8-row cuts and at most 4,644 incidence nodes; `(5,5,5)` uses
5--9-row cuts and at most 4,380 nodes. Both stop at
`STOPPED_ROUND_BUDGET`, not exhaustion, and no nonunit candidate appears.

The first repeated whole-core type occurs in `(5,5,5)` rounds 40 and 62. An
exact role audit identifies it with the existing
`SixPointCircleChainCollisionCore`, so no new metric theorem is needed for
that recurring motif. The named-row replay in `row_origin_audit.json` also
establishes the important negative integration result: 0/64 cuts in either
profile has a supplied-source alias for every retained row. The compact
`(4,5,6)` core uses one row which is both `supplied:u` and `global:1`, plus four
global-only selected rows. The five live `CriticalSourceRows` therefore do not
directly instantiate either consumer.

## Exact `CARD-EQ-12` placement surface

`second_center_placement_census/` independently enumerates every named
placement admitted by the current fixed `CARD-EQ-12` preconditions and quotients by
verified size-preserving carrier automorphisms:

- `(4,5,6)`: 253,302 raw placements and 253,302 representatives;
- `(5,5,5)`: 683,424 raw placements and 113,904 six-element orbits;
- total: 936,726 raw placements and 367,206 representatives.

Burnside counts, group closure, admission invariance, representative
minimality, both saved seeds, deterministic replay, and six tests pass. This is
strictly `EXACT_PLACEMENT_SURFACE_ONLY`: it performs no row-system DFS, metric
realization, target-faithfulness, producer proof, or card-11 analysis.

The closure boundary is now exact. Metric consumers exist; the missing theorem
is an incidence producer from the live selected-K4/cap/order/full-filter or
common critical-row data. It must force the sixteen memberships consumed by
`false_of_five_selectedFourClasses`, the reused six-point-chain family
(including its wrap-order variant), or the global nested-pair memberships.
The audited URow multiplicity route is conditional on new MEC/all-center
coupling and retained common-system provenance, not a primary next theorem. A
blind CAS run over 367,206 representatives is not the next closure step.

## Common-system structural CEGAR and nested-chord consumer

`common_system_metric_probe.py` removes the global-row-at-every-center
assumption from the older fixed-placement CEGAR. For each saved profile it
chooses the five supplied rows and one exact source-indexed row for every point
of a single finite common-system abstraction, enforces same-center exact-row
coupling and Q-C negation, and learns a no-good only from an already formalized
metric core.

The deterministic checkpoint learns five three-row cuts for `(4,5,6)` and
seven for `(5,5,5)`. Four cuts use the existing `ExactOffCircleCore`; eight use
the new production module
`Problem97.Census554.NestedEqualChordCore`. That theorem proves that four
circle points in cyclic order cannot carry two properly nested chords both
equal to the radius. Its target build passes, and its metric theorem, generic
`EdgeClosure` consumer, and reflected consumer print only `propext`,
`Classical.choice`, and `Quot.sound`. The standalone
`nested_equal_chord_producer_adapter.lean` kernel-checks the exact bridge from
three common-system blocker rows plus one cyclic cut to the generic core.

`nested_equal_chord_live_producer.lean` sharpens the live boundary further.
`orderedBlockerRow` proves that any critical blocker row can be enumerated
automatically as `o,a,b,c,d` in cyclic boundary order. Because the live
`FaithfulCarrierPattern` already has global rows centered at `a` and `b`, the
remaining direct producer is only four memberships:

```text
o,d ∈ rowPattern F a
o,c ∈ rowPattern F b.
```

`HasGlobalNestedPairProducer` packages that output and
`false_of_hasGlobalNestedPairProducer` consumes it. Direct elaboration prints
only `propext`, `Classical.choice`, and `Quot.sound`; the four memberships are
open, but no additional cyclic-order theorem or critical-shell sources are.

The exhaustive one-row follow-up
`residual_456_global_row_extension.py` shows that restoring global K4 at a
single missing center does not suffice with the current bank. For centers
4--11, complete locally admissible support enumeration leaves respectively
174, 148, 176, 128, 161, 161, 139, and 139 formalized-core survivors. Every
center has a proper exact equality-ideal survivor in both msolve variable
orders; Singular confirms centers 6--11 and times out for 4--5. This is a
finite/equality-layer negative, not a real convex extension. It directs the
next query to the coupled rows at `a,b` required by
`GlobalNestedPairFields`, or to MEC disk geometry.

The coupled census `residual_456_global_nested_pair_census.py` then finds zero
`GlobalNestedPairFields` witnesses for all twelve sources in the saved
placement. Three blocker patterns fail against locked exact rows. The only
unlocked pattern has 15 locally admissible center-7 candidates containing the
required pair; the existing bank kills six by `DuplicateCenterCore` and nine
by `ExactOffCircleCore`. This is exact for the saved placement/map only. It
shows that global K4 incidence alone does not force the nested producer there;
MEC/cap/full-filter geometry must exclude or reconfigure the placement, or a
different consumer must be used.

The archived pre-subsumption common-system replay accepted 6 kernel-backed
cuts for `(4,5,6)` and 23 for `(5,5,5)`. The current replay accepts 6 and 21,
respectively, after arc-overtake and five-row-intersection subsumption. The
historical bank was `ExactOffCircleCore`, `NestedEqualChordCore`,
`MECStraddlingRowCore`, `SixPointTwoCircleOrderCore`,
`SixPointNestedCenterOrderCore`, `SixPointCircleChainOrderCore`, the
checked-scratch `SixPointCircleChainWrapOrderCore`, and the checked-scratch
`SevenPointSplitBridgeOrderCore`. Archived checkpoint SHA-256:
`861d4a41141a26c0f6a1afb4fefe52156813c6890ad5eb3bc4b3a084d6b30ee9`.

The historical `(4,5,6)` round-5 equality system has an external exact
construction in `Q(sqrt(3),sqrt(K))`. `residual_456_exact_witness.py` certifies
16 support equalities, 32 exact exclusions, 66 distinct pairs, 120
strict-convex inequalities, all cap-arc predicates, nonobtuseness, and the
saved source/blocker no-`q`-free deletion map. An independent exact Z3 QF_NRA
checker returns `UNSAT` for every negated claim. This is external exact
trusted-checker evidence, not a Lean-kernel proof or target-faithful Problem 97
counterexample.

The exact construction fails at two concrete live fields: centers 4--11 have
no fourfold radius class, and labels 7, 10, and 11 lie outside the circumcircle
through the fixed Moser labels 0, 1, and 2. Thus global K4 and MEC are
load-bearing. `common_system_mec_optimizer.py` adds the MEC disk and nonobtuse
constraints and finds no candidate in 16 deterministic starts.

`MECStraddlingRowCore` turns the MEC hint into a production kernel proof. With
`o=0,a=1,p=2,s=3,x=10,y=7`, three residual rows supply
`oa=ap=os=sx=sy`. Actual Moser boundary/disk facts put `x,y` inside the common
circumdisk, nonobtuseness controls the angle at `a`, and four cyclic
orientations place `x,y` on opposite sides of the center ray. The normalized
power identity forces the same determinant to have opposite signs. The generic
metric theorem, `EdgeClosure` core, geometry packets, and both orientation
consumers target-build with only `propext`, `Classical.choice`, and
`Quot.sound`. This excludes the historical round-5 geometric residual without
global K4; it is still a consumer, not a uniform row producer. The current
honest `(4,5,6)` checkpoint is a round-6 four-row `CROSSCHECKED_NONUNIT`
survivor with digest `268f0efa...ba89f9`. A 16-start numerical search finds no
witness, which is discovery evidence rather than a proof.

The `(5,5,5)` replay has a production kernel consumer chain.
`SixPointTwoCircleOrderCore` uses the cyclic subsequence
`A,P,Q,B,D,C = 0,9,11,1,3,2` and only five inherited closures:
`AB=AC`, `AB=AD`, `AB=BC`, `CD=CP`, and `DA=DQ`. Seven strict-order signs
force the contradiction. The generic point theorem and positive/reflected
`EdgeClosure` consumers target-build with only `propext`, `Classical.choice`,
and `Quot.sound`; no exact exclusion or other label is used. Its matcher closes
rounds 7--9. `SixPointNestedCenterOrderCore` maps
`(O,A,D,E,X,C)=(0,1,3,4,5,2)` and closes rounds 14--16.
`SixPointCircleChainOrderCore` maps `(O,A,D,E,C,Y)=(0,1,3,4,2,8)` and closes
round 17 using all five rows, eight closure equalities, and the signs
`OAC,OAE,OAD,CYO`. Both later production consumers and their actual
GeneralCarrier adapters target-build with the same core-only axiom set. The
checked-scratch `SixPointCircleChainWrapOrderCore` uses the same equality graph
in cyclic order `O,Y,A,D,E,C`, with signs `OAC,OAE,OAD,OYA`; its generic
theorem, reflected consumer, and actual GeneralCarrier adapter elaborate with
the same core-only axiom set. Its matcher closes rounds 18 and 19.

Round 20 is not another circle-chain relabeling: it splits the old shared
point into two bridges. The exact analysis in
`residual_555_round20_kernel_analysis.md` extracts seven labels
`(O,A,C,D,E,U,W)=(0,1,2,3,4,6,8)`, nine equalities, and the four cyclic signs
`OAC,OAD,OAE,OEC`. A normalized Euclidean proof derives incompatible triangle
bounds, while an explicit positive-norm realization of the equalities without
the cyclic order proves that the homogeneous U5 Gram-certificate route cannot
close this residual. The generic Lean theorem, reflected `EdgeClosure`
consumer, and actual GeneralCarrier adapter all elaborate with exactly
`propext`, `Classical.choice`, and `Quot.sound`; an independent skeptic audit
finds no `sorry`, `admit`, named axiom, or antecedent gap. Its matcher closed
historical rounds 20--22, with `W=8,9,10`. The archived next five-row survivor
was round 23, digest `d1c0773c...e4e5971`, ending in row
`4:{2,3,5,11}`. Its full
equality ideal is `CROSSCHECKED_NONUNIT`; real feasibility is undecided.

Replay and 18 focused tests pass:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/common_system_metric_probe.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/common_system_residual_optimizer.py --check --starts 16
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/residual_456_exact_witness.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/residual_456_z3_crosscheck.py --check
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/common_system_mec_optimizer.py --check --starts 16
UV_CACHE_DIR=/tmp/uv-cache uv run python -m unittest \
  scratch/atail-force/test_common_system_metric_probe.py
```
