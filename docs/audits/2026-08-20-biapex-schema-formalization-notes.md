# Bi-apex schema formalization notes (2026-08-20)

Scope: reuse preflight, dedup resolution, and first formalization for the
schemas of `docs/exact-twelve-biapex-schemas-2026-08-20.md` (at the time
of writing that file and its companion
`docs/pentagon-circumfan-schemas-2026-08-19.md` are present in the tree
but not yet committed by their author).  Labels per repository policy.

## Dedup results (reuse preflight per candidate)

**S2 (apex witness budget) — content already in Lean.**
`selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers`
(`lean/Erdos9796Proof/P97/ATail/ThirdCenterCommonPair.lean:144`) is the
general statement: two centers equidistant from a pair saturate
`Dumitrescu.perpBisector_apex_bound`, so any third center's selected
class meets the pair in at most one point.  S2 is the instantiation
`c₀ := apex` (apex equidistance is one line from the common-radius
pinning).  Per the no-wrapper rule this is recorded as a dedup, not
reproved.  The doc's `{{NEEDS-BANK-DEDUP}}` flag on S2 resolves to:
duplicate, consume the existing theorem.

**S4 (fiber trace bound) — already instantiated.**
`criticalShell_inter_frontierRadiusClass_card_le_two`
(`FirstApexCriticalFiberRow`) and
`firstFiber_globalRow_inter_firstShell_card_le_two`
(`TwoSourceRetainedMinimalCore`) are first-apex (Γ₁) trace bounds; the
`{{NEEDS-LEAN}}`/`{{NEEDS-BANK-DEDUP}}` flags on S4 resolve to: present,
no new bank.

**K0/K1 (half-plane, no antipodal pair) — already in Lean.**
`exists_strict_separating_vector_of_convexIndep_cocircular` and
`strict_separating_vector_no_antipodal_pair`
(`lean/Erdos9796Proof/P97/ATail/ConvexCocircularHalfPlane.lean`).

## S2 empirical check against the live model space

EMPIRICAL, exhaustive over the stated sets.  S2's class-pair Boolean
budget (class C = {0,3,6,8,9}, apex label 1, at most one non-apex host
per pair) tested against the v26 artifacts:

- authenticated v26 survivor: 0 violations (S2 would not remove it);
- 300 enumerated projected models
  (`docs/exact12-v26-projected-model-space-2026-08-20.md`): **99 of 300
  violate** (100 violating pairs total).

S2 is the first constraint family found that prunes the live projected
space, and it is membership-vocabulary — outside the orientation-family
refutation of 2026-08-20.  Installing it as CNF clauses requires the
physical bridge (pair-in-row implies center equidistance), which holds
in the physical-radius leaf but is deliberately absent from the
source-faithful candidate surface; a bank would need the metric
provenance A5.17 names.

## S1 formalization (new Lean)

New module `lean/Erdos9796Proof/P97/ATail/CocircularEquidistantWitness.lean`:
the K2(2)/S1(1) mid-angle identity in vector form (no angle coordinates)
plus S1(3) uniqueness.

- `vsub_eq_smul_chordResultant_of_dist_eq` — branch-free dichotomy
  `z - P = ± (ρ/‖u‖) • u`, `u = (p-P)+(q-P)`;
- `vsub_eq_radius_smul_chordResultant_of_separating_vector` — the strict
  half-plane witness selects the positive branch (exact mid-angle
  position);
- `equidistant_classPoint_unique_of_convexIndep` — at most one class
  point equidistant from a given class pair, on a convex-independent
  carrier (consumes the K0/K1 producer).

Intended consumer: deletion-arm trace-table pruning for the exact-twelve
`pentagonOffClassBlocker` missing-incidence leaves (biapex doc §4.2).
No `sorry` introduced; the obligation frontier is unchanged.

S1(2) is now also formalized, in the same module, without any angle
coordinate system: the angular betweenness is expressed through the
standard area form (`Problem97.stdOrientation`).

- `areaForm_sign_split_of_equidistant_witness` — the witness strictly
  separates its pair in the angular order about the apex: the two area
  forms have opposite signs, by the three-line bilinearity computation
  `ω(pd, zd)·ω(qd, zd) = −s²·ω(pd, qd)²` with `s > 0` and nondegeneracy
  from `inner_sq_add_areaForm_sq`;
- `not_equidistant_classPoint_of_consecutive_of_convexIndep` — a class
  pair that no class point strictly separates (a consecutive pair in the
  class order) admits no on-class equidistant witness.

Both are axiom-clean (`[propext, Classical.choice, Quot.sound]`), zero
warnings.  This is the exact statement family the S1 replay used
empirically: the replay's betweenness test is the discrete shadow of
`areaForm_sign_split_of_equidistant_witness`.

## S1 replay against the live model space (step 4.2 of the biapex doc)

EMPIRICAL, conditional on the physical bridge (a selected row is a radius
class about its center — the proved `support_eq_radius` idiom in the
leaf, intended semantics of the encoding, but not yet a kernel-checked
chain from the CNF survivor to geometry).  Script:
`scratch/rigid221-sourceheavy-anchor/core-pair/replay_s1_class_order.py`.

The class order about the apex is linear (K1) and equals the boundary
order cut at the apex; restricting the 48 deck orders to
C = {0, 3, 6, 8, 9} and cutting at label 1 yields exactly two linear
class orders up to reversal, (t,u,xv,xu,v) and (t,xu,xv,u,v) — derived
from the deck by the script, not asserted.  S1 forces an on-class center
hosting a class pair to lie strictly between the pair in that order.

Results:

- **The authenticated v26 survivor violates S1 under both class
  orders**: its row at v = 3, supp(3) = {0, 5, 7, 9}, contains the class
  pair {t = 0, xu = 9}, and v is the final point of both orders.  Under
  the physical bridge the v26 survivor is geometrically unrealizable —
  the first constraint of any kind found that removes it.
- Enumerated sample: 291/300 violate S1 under every deck-consistent
  class order; 99/300 violate S2; **7/300 survive both** (models
  227, 228, 232, 233, 296, 297, 300 of the 2026-08-20 sample).  The
  seven share identical rows at centers 0, 1, 2, 6, 7, 8, 9, 10 and
  differ only at centers 3, 4, 5, 11.

Consequence: a physically-bridged S1+S2 membership family is the
strongest measured lever on this cell — it removes the authenticated
survivor (which no orientation family could touch) and cuts the sampled
space 300 → 7.  Building it as a bank requires the A5.17 metric
provenance chain (class membership, apex identity, and the class-order
disjunction as certificate data).  That is a new-kind bank and a goal
decision.

## Physically-bridged cut interface (2026-08-20, follow-up)

New module
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactTwelveRigid221PhysicalClassWitnessBridge.lean`:
the Lean prerequisites of the S1+S2 physically-bridged membership family,
formalized against the frozen exact-twelve label vocabulary.

Contents:

- `physicalClassLabels dLabel vLabel` — the five class labels
  `{6, 8, 9, d, v}` at one `(d, v)` placement (the labels are
  placement-dependent; the measured cell uses `d = 0`, `v = 3`).
- `PhysicalClassRadius pointOf dLabel vLabel ρ` — the bridged class
  hypothesis: the five class labels lie at one positive radius from the
  second-apex label `1`.  This hypothesis is genuinely additional
  certificate provenance: `Realizes` alone never yields the label-9 class
  membership, because `xu` is erased from the pinned apex row.
- `witnessSameSideAll48` + `FrozenBoundaryOrder.witnessSameSideAt` — the
  decidable all-48-orders check that a class witness never strictly
  separates a class pair about the apex, with the canonical-order transfer
  bridge (reusing
  `exists_orderIso_canonicalBoundaryOrder_of_frozenBlocks`).
- `false_of_hostedClassPair_of_witnessSameSide` — the S1 refutation
  kernel: `Realizes` gives the witness equidistance,
  `areaForm_sign_split_of_equidistant_witness` gives opposite signed
  areas about the apex, and the same-side order fact gives equal strict
  signs via `signedArea2_eq_stdOrientation_areaForm` — contradiction.
  No angle coordinates and no explicit class-order object are needed;
  the two-class-order disjunction of the replay is subsumed by the
  triple-orientation transfer.
- `false_of_classPair_two_hosts` — the S2 refutation kernel: the apex and
  two hosting centers are three distinct carrier points equidistant from
  one class pair, contradicting `Dumitrescu.perpBisector_apex_bound`.
- `FrozenRoleLabeling.physicalClassRadius` — the leaf-level producer:
  under a frozen role labeling of the pentagon-off-class residual, the
  five class labels satisfy `PhysicalClassRadius` at radius `P.rho`
  (memberships from `packet.physical_class`, `P.huClass`, `P.hvClass`).
  This is the exact bridge from cube rows to `SelectedClass` radius rows
  the empirical S1/S2 replays were conditional on.
- `PhysicalClassPositiveNogood dLabel vLabel` with
  `PhysicalClassCutData` (`witness`/`budget`) and the checked constructor
  `PhysicalClassPositiveNogood.ofCut` — the proof-carrying certificate
  interface extending `SourceOrderPositiveNogood` by the class-radius
  hypothesis.

Not yet built here: the terminal CNF assembly (a
`terminal…Dimacs`-style formula variant whose consumer discharges the
class hypothesis via `FrozenRoleLabeling.physicalClassRadius`) and the
generated bank family over the admissible cuts.  Those are the remaining
"bank family + CNF clauses" steps.

Validation of the checkpoint (2026-08-20):

- module builds green with zero warnings; axiom closure of the two
  kernels, the leaf producer, the order bridge, and `ofCut` is exactly
  `[propext, Classical.choice, Quot.sound]`;
- EMPIRICALLY VERIFIED, exhaustive over the stated sets: the decidable
  `witnessSameSideAll48` agrees with an independent Python oracle over
  the deck (`source_boundary_orders()`) on all 60 ordered class triples
  of `{0, 3, 6, 8, 9}` (28 admissible / 32 not).  The landmark triples
  behave as the replay predicts: `(z, p, q) = (3, 0, 9)` is admissible
  (the cut that removes the authenticated v26 survivor), while
  `(8, 6, 9)` is rejected (xv is a legitimate mid-angle host between u
  and xu);
- the placement identity is pinned: arm cell 6 is
  `placement_index = 1`, `(d, v) = (0, 3)`, arm `u_q`
  (`arm_cells()[6]` of `census/card_head/exact12_next_row_arm_cell_run.py`).

## Terminal consumer extension and cut-count measurement (2026-08-20)

`ExactTwelveRigid221FullMembershipPrefixTerminalConsumer.lean` (bank-pinned;
edit followed by the documented re-mine + refreeze) gains the class-extended
terminal interface:

- `terminalFullMembershipNamedDeletionArmPhysicalClassDimacs` — the one-arm
  terminal formula with a physically-bridged class-cut suffix appended after
  the source-order bank;
- `false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank` — the
  consumer: identical to the v26 interface plus the `PhysicalClassRadius`
  hypothesis of the arm's `(d, v)` placement, discharged at the leaf by
  `FrozenRoleLabeling.physicalClassRadius`.  Class-bank clauses ride the
  existing `learnedClause` encoding (full candidate rows), so no new CNF
  variables are introduced.

Measured expansion over the frozen cell-6 candidate surface
(EMPIRICAL, exhaustive): the 14 admissible S1 combos expand to **290
full-row unit cuts** (landmark combos `(3, {0,9})`: 35 rows; three combos
at `z = 0` have zero candidate rows hosting the pair — already excluded by
the candidate filter).  The S2 full-row expansion is 292,466 clauses and is
NOT viable through the certificate path; installing S2 needs a
definition-variable family layer.  Sample evidence puts S2's marginal value
beyond S1 at 2 of 300 models, so the S1-only bank is the proposed first
installation.

Refreeze closure (2026-08-21): the documented narrowed-chain refreeze ran
over the tree at `2d8e8d16` (contains this consumer edit `b4eb4b71` and
the A7 checkpoint `97a6f503`) and produced **zero pin rewrites** — every
recomputed manifest sha matched the frozen pins, and the `--verify` walk
reported `CHAIN VERIFY COMPLETE` (13 banks).  No bank's kernel-mined
`LEAN_DEPENDENCY_MODULES` set reaches the edited modules, so the
stale-pins flag in the `b4eb4b71` commit message is resolved with no pin
commit.  The one genuinely stale pin is the v26 validator/canary Lean-file
tuple, which pins this consumer file; the planned v27 freeze resolves it.
