# Rigid221 exact-five distinct three-center five-incidence checkpoint

Date: 2026-09-02

## Target

The rank-3 target is
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`.
At source revision `92cb0b1910a50dd2b45583db28d2fd0f0a70db8b`, proof-blueprint places it on
the `Problem97.erdos97_rhs` spine with one admitted body.

The planned progress measure is the lexicographic pair

```text
(missing support-preserving fresh three-center deletion,
 unresolved retained-source / three-row incidence positions).
```

The first coordinate is already zero at this target.

## Reuse preflight

The indexed Lean corpus was searched for consumers of
`RobustApexFiveIncidenceContinuationPacket`, common-deletion packets at several
centers, shared-pair separation, cyclic matching, and ordered Kalmanson row
patterns.

The direct reuse proposal does not apply to the old packet.  That packet
retained only the first missing incidence.  It discarded all positive
incidence tests that led to that position, and it contained no boundary
indexing or cyclic order.  Existing consumers require at least one of:

- the complete eight-incidence tetrahedron surface;
- two distinct common support witnesses for a pair of rows; or
- explicit ordered boundary roles with six or more named memberships.

The old packet supplies none of these in a missing-incidence constructor.  A
source-level producer retaining the positive incidence prefix is therefore
necessary.  The direct claim that the old packet feeds an existing Kalmanson
consumer is refuted.

## Neutral producer

The sharper reduction does not need the test `c₂ ∈ row₁`.  If

```text
c₁ ∈ row₀,  O ∈ row₁,  O ∈ row₂,  c₁ ∈ row₂,
```

then `row₀,row₂` share `a,c₁`, while `row₁,row₂` share `a,O`.  Shared-pair
separation gives

```text
separatedPair O c₂ a c₁
separatedPair c₁ c₂ a O.
```

The pure order theorem `separatedPair_rotated_incompatible` rules out these
two rotated matchings.  Consequently
`RobustApexFourIncidenceContinuation` has only four constructors, each
retaining the positive prefix before its first missing incidence and the
resulting common-deletion packet.

`nonempty_robustApexFourIncidenceContinuationPacket` constructs a carrier
boundary indexing, reruns the four tests on the underlying surface, and
preserves the original support identities.  It does not inspect the older
erased five-way constructor.  No admitted proof is introduced by the
reduction.

Focused verification passed for
`CyclicPairSeparation.lean`,
`RobustApexFourIncidenceCyclicReduction.lean`, and
`Rigid221Closure.lean` under `lake env lean`.  An independent adversarial
source audit found the role mappings, shared memberships, boundary indexing,
four continuation constructors, and imports consistent, with no concrete
defect.  The governed `lake-build` publication check remains the final build
gate for this checkpoint.

## Remaining boundary

The refined final constructor retains three positive cross-incidences; earlier
constructors retain their shorter prefixes.  The obsolete
`secondCenter_not_mem_firstRow` position is removed from the live endpoint.

There is a further circle-level consequence in the last two positions.
Whenever `c₁ ∈ row₀` and `O ∈ row₁`, the two equalities

```text
dist c₂ O = row₂.radius
dist c₂ c₁ = row₂.radius
```

are incompatible.  They would reproduce the same two rotated separations as
the all-positive support branch, but the proof uses the metric equalities
directly and therefore does not assume that either point belongs to the
chosen four-point support.  This is kernel-checked as
`RobustApexFourIncidenceContinuationPacket.secondRow_crossCenter_metric_exclusive`.
In the fourth support position, the positive membership `O ∈ row₂` therefore
upgrades `c₁ ∉ row₂` to exclusion from the full row₂ radius circle.  In the
third position it rules out the simultaneous full-circle hit by `O` and
`c₁`.

No current theorem closes all four remaining common-deletion positions.  The
next proof obligation is a source-entitled consumer of those strictly narrower
packets from the full exact-five and common-deletion context.  Adding a new
admitted consumer, or merely moving the existing admission, would not count as
closure.

## Pro-consult correction and next residual

Pro consult `01M1JEJSNZY1VD0JPJ86W15MX1` completed as conversation message
`#9100`.  Its full report has file id `01M1JHAXEN92QERSEG5SXF3K2F`, size
25,215 bytes, and SHA-256
`747d58dc41add22c3bee228225b6f6f3c15294e8bb2b6ae38337a7ece4efd8db`.
The consult independently confirms that the four-way reduction and metric
exclusion are sound, but finds no current import-acyclic terminal.

The next source-faithful reduction is a second-apex reselection dichotomy.
It is a reduction of the five-incidence arm, not of the bare normal form:
the construction needs the explicit premise
`normalForm.retained ∈ normalForm.secondApexClass.support`, supplied by the
incidence packet's `a_mem_row₂` field and support identity.  Writing `a` for
`normalForm.retained`, `d` for the original deleted source, and `K₂` for the
original second-apex row, either:

1. there is a selected second-apex four-row omitting both `a` and `d`; or
2. the original row and a replacement row are full, disjoint exact-four
   classes at distinct positive radii, with the original row containing `a`
   and omitting `d`, and the replacement containing `d` and omitting `a`.

The first arm is not a terminal: in general it routes to the independent
`false_of_exactFiveDistinct_threeCenter_distinctFresh_physical` obligation.
The second arm is the minimal hard-source-swap residual.  In its fourth
incidence branch, a cap-order transport plus the existing rotated-separation
contradiction forces the replacement row to omit `c₁`.  Two such full
second-apex classes give either at least five points in the second strict cap
interior or an exact two-radius adjacent-cap grid.  The large alternative
implies `|oppCap₂| ≥ 7`; it does not imply carrier cardinality at least fourteen
without a separate `|oppCap₁| ≥ 6` premise.  The grid alternative gives a
strict comparison `dist e d < dist e a`, not a contradiction.

Branches one and two remain wholly open, and branch three remains a
separated-pair/double-omission residual.  Therefore the next decisive check is
a complete hard-source-swap grid order/equality census, run before extensive
cap-order Lean plumbing.  A satisfying order/equality model refutes every
closure using only the retained incidence, cap blocks, circle equalities, and
Kalmanson inequalities; an all-cell UNSAT result must be minimized to a common
certificate before formalization.

The source-swap factorization is now implemented in
`ExactFiveDistinctSecondApexSourceSwap.lean`.  The theorem
`exactFiveDistinct_secondApex_physical_or_hardSourceSwap` proves the stated
dichotomy with the five-incidence membership supplied explicitly.  Its hard
packet records both full selected classes, positive unequal radii, disjoint
supports, both source incidences and omissions, and the global bound that every
positive second-apex selected class has cardinality below five.  The supporting
avoid-two selector and the complete packet compile with focused `lake env lean`;
the module contains no admission.  An independent adversarial audit found no
source-role, cardinality, import-cycle, or statement-strength defect.  The live
target remains unchanged with its one existing admission.

## Hard-source-swap census correction

The first executable census scaffold exposed a source-role error in the
proposed named-cell enumeration.  The three zero-cut separators are

```text
U  = oppositeVertexByIndex surplusIdx,
O  = oppApex1,
c₂ = oppApex2.
```

The blocker `c₁ = H.centerAt retained` is not a triangle apex.  The actual
direct and mirror block orders are respectively

```text
U, oppInterior2, O, surplusInterior, c₂, oppInterior1
U, oppInterior1, c₂, surplusInterior, O, oppInterior2.
```

The present hard packet does not localize `c₁` to one of these three strict
interiors (and does not exclude `c₁ = U`).  It also does not make the
row-local unnamed points globally distinct across the two full second-apex
classes.  Consequently the current 102,960-cell Python enumeration is only a
conditional diagnostic for the collapsed subcase `c₁ = U` with a stronger
global-distinctness assumption.  Its tests and fixed-block validation pass,
and a 200-cell diagnostic prefix reduced to the direct zero form, but no live
PiQD solver run was launched and these results do not classify the source
packet.

The execution order is therefore corrected: first formalize the source-facing
cap/order transport and canonical first-apex row obtained by swapping the
deleted and retained sources; then enumerate all source-entitled placements
of `c₁` and the admissible cross-row alias partitions.  Only that corrected
grid is eligible for the live PiQD census.

The theorem-bank preflight for the cut-bit transport found no exact existing
congruence theorem; its first consumer is the branch-four proof of
`c₁ ∉ replacement.support`, and the first missing antecedent is the cap-block
adapter.  The preflight for the canonical swapped row likewise found the
general constructor `selectedFourClassOfExactFiveErase` but no source-oriented
wrapper; its immediate consumer is the same branch-four replacement omission.
Both searches were made against source revision `b52803f70`.

## Source-facing execution checkpoint

The corrected step 4 is now formalized without changing the admitted target.
`swappedFirstApexClass` canonically erases the retained source from the full
exact-five first-apex class, and
`swappedFirstApexClass_support_eq_insert_deleted_erase_retained` proves that
its support is obtained from the old row by inserting `deleted` and erasing
`retained`.  The zero-cut adapter proves that the retained and deleted sources,
both lying in `oppInterior1`, have the same cut bit across `(oppApex1,
oppApex2)` in both direct and mirror boundary orders.

Combining these facts gives the checked branch-four consequence
`hardSourceSwap_replacement_blocker_not_mem_of_fourth_prefix`: if the old
first-apex row contains the blocker and the blocker/old-second-apex rows both
contain `oppApex1` after their retained incidence, then the hard replacement
second-apex row omits the blocker.  Otherwise the swapped first-apex row and
replacement share `(deleted, blocker)`; cap-side transport changes that to
the separated pair `(retained, blocker)`, which is rotated-incompatible with
the separation from the blocker and old second-apex rows sharing
`(retained, oppApex1)`.

The focused governed build of the new cyclic consumer succeeds.  This closes
the promised branch-four replacement omission, not the whole branch-four
hard source-swap residual: the two-full-class cap split and its exact-grid
consumer remain downstream.

The next cap split is also now checked in
`hardSourceSwap_largeSecondInterior_or_exactAdjacentCapGrid`.  The two full,
distinct-radius second-apex classes force `4 ≤ |oppInterior2|`.  If that
interior has a fifth point, the theorem returns the large-cap arm directly;
if not, the two radius slices each have exactly two interior points and the
existing adjacent-cap distribution theorem packages the exact two-by-two
grid.  This argument is cardinality-free and uses the hard packet's full-class
equalities rather than an exact-twelve hypothesis.  The remaining grid work
is the source-facing naming/placement adapter and the complete alias census.

There is one arithmetic correction to the consult's large-arm discussion.
The exact-five first-apex class already gives `|oppCap1| ≥ 5`; the large arm
gives `|oppInterior2| ≥ 5`, hence `|oppCap2| ≥ 7`, while the surplus cap has
cardinality at least five.  The cap-sum identity therefore yields
`|A| ≥ 14`; no separate `|oppCap1| ≥ 6` premise is needed for fourteen.
This is checked as
`carrier_card_ge_fourteen_of_exactFiveFirstApex_of_largeSecondInterior`.
It is a strict source consequence, though not yet a terminal contradiction.

The theorem-bank preflight for this bound found the existing exact-five
first-cap estimate only behind a private helper, plus public exact-twelve and
both-caps-at-least-six variants, but no reusable theorem with the required
`5 + 5 + 7` hypotheses.  The new public first-cap wrapper and cardinality
bound record that missing source-facing interface.

On the exact-grid arm, `exists_exactGridFourHits_with_source_roles` now names
the adjacent-cap cells without an extra placement assumption.  The old class's
surplus-side hit is `oppApex1`, its first-opposite-side hit is `retained`, and
the replacement's first-opposite-side hit is `deleted`.  Its remaining
surplus-side hit is strict: equality with `oppApex1` would violate the hard
packet's disjoint full-class supports.  Thus the source map used by the next
generator is

```text
old second-apex row:         {O, a, u, v}
replacement second-apex row: {d, e, x, y},  e ∈ surplusInterior,
```

with `u,v,x,y` in the second strict cap interior after choosing the two-point
radius slices.  The theorem-bank preflight found the existing `oppIndex1`
four-hit Kalmanson producer but no direct `oppIndex2` analogue.  The new
`HardSourceSwapExactGridRoles.radialCyclicOrder` reuses that producer without
duplicating its boundary proof: exact-five gives `|oppCap1| ≥ 5`, so the first
opposite cap can validly be re-designated as surplus; its new `oppIndex1` is
the original `oppIndex2`.  The theorem transports the resulting order back to
the original four hits using their singleton grid cells.

The source-facing packet is now exposed as `HardSourceSwapExactGridRoles`, and
`nonempty_hardSourceSwapExactGridRoles_of_not_large` constructs it directly
from the hard packet, the branch-four prefix `oppApex1 ∈ old`, and failure of
the large-interior arm.  This makes the four grid cells, both two-point
interior slices, and all four fixed source identities available to the next
consumer without repeating singleton or `card = 2` extraction.

The metric consumer is source-complete now.
`HardSourceSwapExactGridRoles.source_replacementLeft_dist_deleted_lt_retained`
specializes the constructed radial order and strict Kalmanson to

```text
dist(O,a) + dist(e,d) < dist(O,d) + dist(e,a),
```

then cancels `dist(O,a) = dist(O,d)` from the full first-apex selected class.
The governed target build and proof-blueprint refresh pass.  Axiom audits of
the order theorem and the source metric consequence report only `propext`,
`Classical.choice`, and `Quot.sound`.  An independent adversarial proof audit
certified the cap re-designation, cell transport, and trust boundary.  This
strict inequality strengthens the finite census; it is not yet a terminal
contradiction by itself.

The corrected solver-free alias profiler now enumerates both source regimes
under the audited abstract overlap rules:

```text
c1 = U:     961 profiles
c1 ≠ U:   1,837 profiles
total:    2,798 profiles
```

The radial-order audit exposed five additional source distinctions:
`U ≠ u,v,e,x,y`, since `U` is a cap apex while those roles lie in strict cap
interiors.  Enforcing them removes 4,805 source-incompatible profiles from the
earlier 7,603-profile abstraction.  All 2,798 retained partitions and stable
profile hashes are unique, and the focused Python suite passes all 25 tests.
These counts are exact for the encoded alias rules, not yet a Lean theorem that
those rules exhaust the source.  They contain no cyclic placements, order
cells, metric constraints, or solver verdict, so the live PiQD run remains
unauthorized until these aliases are combined with the source-authorized
cyclic-order cells and the source-to-profile coverage boundary is proved or
explicitly retained as a conditional assumption.
