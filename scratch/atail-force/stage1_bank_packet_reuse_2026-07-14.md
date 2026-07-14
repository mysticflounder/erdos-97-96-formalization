# ATAIL Stage-I theorem-bank packet reuse audit

Date: 2026-07-14

## Verdict

No theorem in the three required external registries directly closes either
surviving Stage-I separated-cap packet.  The useful bank result is instead a
strict reduction of the producer target: two common-distance equalities at
the live `u`-row center are enough for an immediate contradiction.

The reduction has been recorded in
`scratch/atail-force/stage1_three_dangerous_equidistant_sink.lean`.  Its
preferred live-facing interface is

```lean
false_of_fixedTriple_secondCenter_q_t1_t3_equalities
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hpc : p ≠ c)
    (hcq1 : dist c q = dist c t1)
    (hcq3 : dist c q = dist c t3) : False
```

and its exact-shell membership specialization asks only for `q`, `t1`, and
`t3` in `rows.uRow.selected.toCriticalFourShell.support`.  The companion
`t1,t2,t3` form is also retained.

This is a **PROVEN REDUCTION FROM A CURRENT KERNEL THEOREM**, not a proof of
either equality.  The complete scratch instantiation now passes a focused
direct-file check with only the standard core axiom closure.  The current cap
packets and common critical-system provenance produce neither equality, so no
live `sorry` is closed by the bank audit alone.

## Required preflight

The following registries were inspected before proposing the new interface:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The p97-rvol census contains 2,148 general-n candidate instances, including
500 source-level contradiction consumers absent here by normalized shape.
The dominant reusable families are the 96 U5 class-level incidence families,
88 metric-point kernels, and 112 scalar-algebra kernels.  The legacy archives
contain 285 and 297 bounded-local/general-n candidates respectively, but no
theorem quantified by an ambient `n`.

Indexed `nthdegree docs search --lean` searches covered separated cap
interiors, opposite endpoints, exact critical shells, common support,
equidistant centers, perpendicular bisectors, and three centers sharing a
bisector.  They returned the candidates audited below, but no hidden
placement/equality producer.  This is an exhaustive claim about the exact
registry declarations and the named searches, not a mathematical claim that
no future composition of lemmas can prove the producer.

## Exact Stage-I packet surface checked

The sharp geometry boundary has exactly two outputs.

`URowDistinctInteriorCapPlacement` is

```lean
∃ kp kc,
  p ∈ capInteriorByIndex kp ∧
  rows.uRow.center ∈ capInteriorByIndex kc ∧
  kp ≠ kc
```

`URowOppositeEndpointInteriorPairFields` has two symmetric arms.  In the
first, `rows.uRow.center` is in the facing cap interior and `p` is its
opposite Moser vertex; there are distinct `x,y` in both the dangerous exact
four-point support and that cap interior, with equal distance from `p`, exact
full-filter equality for the dangerous shell, and unequal distances from
each named outer endpoint.  In the second, `p` is in the facing cap interior
and `rows.uRow.center` is its opposite Moser vertex; the same fields hold with
`x,y` in the exact `u`-row support and distances centered at
`rows.uRow.center`.  Neither arm mentions `q,t1,t3` membership in the
`u`-row support.

The pair-classifier boundary's strongest positive packet,
`URowOutsidePairUniqueCapBisectorFields`, is exactly the following after
abbreviating
`rows.uRow.selected.toCriticalFourShell.support` as `rows.uRow.support`:

```lean
∃ k z w,
  p ∈ capByIndex k ∧
  rows.uRow.center ∈ capByIndex k ∧
  rows.uRow.center ≠ p ∧ z ≠ w ∧
  z ∈ rows.uRow.support ∧ w ∈ rows.uRow.support ∧
  z ∉ {q,t1,t2,t3} ∧ z ∉ capByIndex k ∧ w ∉ capByIndex k ∧
  dist rows.uRow.center z = dist rows.uRow.center w ∧
  A.filter (fun x => dist rows.uRow.center x =
    dist rows.uRow.center z) = rows.uRow.support ∧
  ∀ a, a ∈ capByIndex k →
    (dist a z = dist a w ↔ a = rows.uRow.center)
```

Thus the exact positive output is uniqueness of a cap-local bisector plus
full-shell exactness.  It does not create another bisector center or any
intersection with the dangerous support.

## Best reusable theorem

The load-bearing declaration is already present in the current tree:

```lean
-- lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:129
theorem Problem97.eq_of_equidistant_three_noncollinear
    {a b c x y : ℝ²}
    (harea : signedArea2 a b c ≠ 0)
    (hxab : dist x a = dist x b)
    (hxac : dist x a = dist x c)
    (hyab : dist y a = dist y b)
    (hyac : dist y a = dist y c) : x = y
```

It is import-reachable on the Stage-I surface through
`U3ToU5DangerousTriple -> U5GlobalIncidenceBasic`; no sibling import or stale
olean is needed.  Its audited kernel closure is exactly

```text
propext, Classical.choice, Quot.sound
```

There is no circularity: the theorem is an elementary radical-axis argument
and does not depend on K-A-PAIR, the separated-cap packets, or any live
closure theorem.

### Preferred label map

Set

```text
a = q, b = t1, c = t3, x = p, y = rows.uRow.center.
```

`hfixed` supplies the two equalities at `p`, positivity of the common radius,
and pairwise distinctness of `q,t1,t3`; hence
`MEC.signedArea2_ne_zero_of_three_dist_eq` supplies nonzero signed area.  The
antecedent `URowSeparatedCapPlacement` supplies
`p ≠ rows.uRow.center`: equality would turn either of its two cap memberships
into the forbidden common-cap witness.  The only missing hypotheses are
therefore

```text
dist rows.uRow.center q = dist rows.uRow.center t1
dist rows.uRow.center q = dist rows.uRow.center t3.
```

This map avoids using `t2`, whose common-system blocker fiber is already
pinned at `p`.  The alternate `t1,t2,t3` map has the same two-equality shape.

## Other current-tree consumers

| Declaration | Current path | Exact input/output shape | Import and trust | Exact missing input / disposition |
|---|---|---|---|---|
| `CapSelectedRowCounting.outsidePair_unique_capCenter` | `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:283` | `ConvexIndep A`, a `StrictCapOrder`, two ordered positions `r < s`, two distinct carrier points outside the cap image, and equal distances at both cap centers imply `False`. | Already imported by the Stage-I cap/confinement chain; core three axioms; no circular dependency. | Already consumed by the confinement boundary.  The surviving packet proves equality at the `u`-row center and **inequality** at `p`, so the second-center equality is absent. |
| `Dumitrescu.perpBisector_apex_bound` | `lean/Erdos9796Proof/P97/Dumitrescu/L1.lean:128` | `ConvexIndep A`, `a,b ∈ A`, and `a ≠ b` imply `(A.filter (fun c => dist c a = dist c b)).card ≤ 2`. | Directly imported by the pair-classifier boundary; core three axioms; no circular dependency. | The endpoint packet supplies one center.  Two further pairwise-distinct carrier centers and their pair equalities remain unproduced. |
| `SelectedFourClass.inter_card_le_two` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:479` | For selected four-classes `Kx`, `Ky` at `x ≠ y`, `(Kx.support ∩ Ky.support).card ≤ 2`. | Imported through `U1Depth5Prefix`; core three axioms; no circular dependency. | Gives a contradiction once three common support members are produced, but that is stronger than the raw two-equality target. |
| `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two` | `lean/Erdos9796Proof/P97/RemovableVertexAxiom/PinnedSurplusGeneralM.lean:68` | A positive-radius selected class of cardinality at least four at `oppositeVertexByIndex i` meets `capInteriorByIndex i` in at least two points. | Directly imported by the separated-cap geometry boundary; core three axioms; no circular dependency. | Already used to build the sharp endpoint packet; it supplies no second center. |
| `capInterior_pair_dist_ne_rightOuter_of_selectedClass` and left analogue | `lean/Erdos9796Proof/P97/SurplusM44Packet.lean:3088,3146` | Two distinct points in the facing cap interior and the same opposite-endpoint selected class have unequal distances to the named outer endpoint. | Imported through the surplus packet chain; core three axioms; no circular dependency. | These have the opposite polarity from the desired bisector producer and eliminate the two most obvious candidate centers. |

All declarations in this table were previously audited with only the three
standard core axioms.  None depends on a live closure `sorry`.

## Sibling p97-rvol results

The closest direct contradiction is
`Problem97.u5_common_bisector_triple_incompatibility` at
`lean/RVOL/P97/U5GlobalIncidenceKernels.lean:146`.  It consumes a
`U5QDeletedK4Class` whose support contains `p,t1,t2,t3`.  That is a stronger
producer hypothesis than the two equalities above, and the module is not in
the current Stage-I import closure.  Its elementary underlying uniqueness
theorem is already available here, so porting the wrapper gives no reduction.

The 18 unimported U1 source-unit consumers at ordinals
`2,12,40,47,88,136,169,206` and the five-point
`u1TwoLargeCapObstruction` similarly consume already-classified row-slot or
seven-equality patterns.  They do not classify the current separated packet
into one of those patterns.

Two apparent sibling leads are rejected more strongly:

- `U1ShortShellPruning.long_apex_shell_card_le_two` assumes `D.IsM44` and an
  unproduced adjacent-cap distance bound, while the live surface assumes
  `hNoM44`.
- `U2NonSurplusSqueeze.surplusEscape_pinnedFamily_false` is marked
  `source-proved` by the declaration-local miner, but its body calls
  `surplusEscape_pinnedFamily_sep_false`, whose source is `sorry`.  It is not
  an admissible kernel-clean result, even before its incompatible `D.IsM44`
  hypothesis is considered.

The large sibling C5D3B surface is also excluded from the proof basis: the
bank audit records that a fresh build fails because its CGN extension
duplicates declarations now in the canonical dependency.  Its old oleans are
stale and its candidate closures have not been freshly re-audited.

## Legacy archive result

Both legacy registries contain exactly one semantically close declaration:

```text
Problem97.three_common_equidistant_centers_eq
  erdos/97: lean/N9Geometry.lean:19096
  erdos-general-theorem/97: lean/N9Geometry.lean:19309
```

Each is archive-reachable and source-proved, but neither archive module is in
the current import graph.  The current
`eq_of_equidistant_three_noncollinear` theorem is stronger for this use: it
needs only two pair equalities at each center rather than six equal-radius
equalities with named radii.  Porting the legacy theorem would therefore add
no capability.

The remaining legacy contradiction consumers are fixed-nine Radon or scalar
cell certificates.  None takes the Stage-I cap/critical-row packet or produces
one of the missing cross-center equalities.

## Validation status

After the unrelated shared Lake build completed, the current durable source
was checked directly and exited 0.  The check covered the minimal
`t1,t2,t3` theorem, the preferred `q,t1,t3` theorem, and both exact `u`-row
membership corollaries.  Every printed endpoint has exactly

```text
propext, Classical.choice, Quot.sound
```

The bisector boundary has stronger existing evidence.  The current source
hash below predates
`scratch/atail-force/stage1_bisector_producer_assessment_2026-07-13.md`, whose
validation section explicitly records a dependency-order whole-file check and
lists `supportCollision_of_mutualCriticalSourceIncidence` among the checked
core-three endpoints.  The live closure matrix independently records the same
`CHECKED-SCRATCH` status.  Therefore that exact edited bisector source is
**DOCUMENTED CHECKED**.  Only the redundant fresh recheck requested from this
lane remains pending behind the shared build gate; it is not needed to rescue
an otherwise unchecked theorem.

Source-level hygiene found no declaration-level `axiom`, `sorry`, `admit`, or
`native_decide` token.  Closeout SHA-256 values are:

```text
b7b6b50fa9eb69880cc64dbcefb53d945170740123a0a3b34e1acd17d602d8bb
  scratch/atail-force/stage1_three_dangerous_equidistant_sink.lean
d762e374c46a00293dfa9cbf01e55346941e8e73a5792f6a222a7aa25c912504
  scratch/atail-force/stage1_bisector_producer_boundary.lean
```

These hashes identify the exact sources discussed here.  The sink is now
freshly full-file checked.  The bisector source remains documented checked by
its own assessment; no redundant rerun was needed.  Any edit requires new
hashes and a fresh check.  Consolidated record:
`stage1_scratch_validation_2026-07-14.md`.

## Epistemic ledger

- **CHECKED-SCRATCH:** every stated consumer implication and the exact
  two-equality label map in the complete durable sink module, with core-only
  axiom closures.
- **PROVEN within the registry/search scope:** no declaration directly accepts
  either sharp Stage-I packet and returns `False`.
- **NOT PRODUCED:** either `u`-row equality in the preferred interface, or the
  stronger three support memberships.
- **NOT CLAIMED:** independence of the producer from the full Euclidean
  K-A-PAIR hypotheses, or semantic exhaustiveness over all possible theorem
  compositions.
- **CONJECTURED:** a global critical-row/full-filter coupling forces one of the
  exact producer interfaces.
