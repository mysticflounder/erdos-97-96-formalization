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
