# Rigid221 S0 coupled-two-row computational decision specification v1

**Date:** 2026-08-29  
**Revision:** source-faithfulness and worktree-hygiene repair, 2026-08-29  
**Primary target:** the source-faithful singleton branch `S0` inside the current high-risk `Rigid221` minimal-core obligation.  
**Purpose:** determine whether the *coupled* rigid source row and opposite row already force a contradiction, or produce an exact source-faithful witness showing which additional hypotheses are genuinely necessary.

## 0. Executive assignment

Work against a pinned checkout of

```text
https://github.com/mysticflounder/erdos-97-96-formalization
```

Record

```bash
git rev-parse HEAD
```

in every output. Start from these current declarations and mechanically expand their actual hypotheses before encoding anything:

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean

false_of_exactFourMutualOmissionRigid221_minimalCore
exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
ExactFourMutualOmissionRigid221GlobalDeletion
ExactFourMutualOmissionSourceContext
ExactFourMutualOmissionJointDeletion
```

Also trace the exact semantics of:

```text
CriticalShellSystem.selectedAt
CriticalShellSystem.centerAt
CriticalShellSystem.no_qfree_at
cross_deletion_survives_iff_not_mem_selected_support
SurplusCapPacket
CounterexampleData
ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
```

The first decision problem is:

> Is the exact, source-entitled **S0 coupled-two-row residual** satisfiable as Euclidean strict-convex geometry when all hypotheses inherited from the singleton caller are retained?

Do **not** begin by encoding the entire P97 counterexample surface. Use the layered CEGAR plan below. A SAT witness at a weaker layer refutes only that proposed proof layer, not the Lean theorem. An UNSAT result is useful only if it is exact and its load-bearing constraints can be extracted as a human-readable geometric lemma.

---

## 1. Source-manifest deliverable comes first

Before solver work, create:

```text
s0-source-constraint-manifest.md
```

For every encoded condition, record:

| ID | Lean field/theorem | file:line | exact mathematical statement | layer | encoded? |
|---|---|---:|---|---:|---|

Do not infer fields from comments or prior prose. Expand the structures and theorem arguments at the pinned commit.

The manifest must explicitly distinguish:

1. hypotheses present in the current generic `minimalCore` theorem;
2. stronger provenance produced by `exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class`;
3. consequences already proved in the repository;
4. new experimental assumptions added only for a search layer.

Any condition in category 4 must be visibly tagged `EXPERIMENTAL`; it may not be used to claim the source branch is impossible.

---

## 2. Canonical S0 role names

Use these mathematical names in the model, mapping them exactly to the pinned Lean objects:

```text
A      finite carrier
O      physical second apex / center of the exact physical class
rho    positive physical radius
C      SelectedClass A O rho, with |C| = 5
u      contextual source; S0 is restricted by the explicit equality u = source
xu     the unique other point of the u/source physical trace
v      opposite rigid source
xv     the unique other point of the v physical trace
delta  jointDeletion.deleted, the fifth physical point
cu     beta(u) = centerAt(u), the center of the source row Ku
cv     beta(v) = centerAt(v), the center of the opposite row Kv
Ku     support(selectedAt u)
Kv     support(selectedAt v)
J      strict interior of the second cap
other  retained contextual peer
q      R.interior_q
w      R.interior_w
```

Let `Hlate := lateFirstApexSystem R` and define exactly:

```text
cu := Hlate.centerAt u.1 u.2
cv := Hlate.centerAt v.1 v.2
Ku := (Hlate.selectedAt u.1 u.2).toCriticalFourShell.support
Kv := (Hlate.selectedAt v.1 v.2).toCriticalFourShell.support
```

### 2.1 Mandatory S0 branch gate

`ExactFourMutualOmissionSourceContext.u_eq_source_or_not_mem_source_row` supplies a disjunction, not an unconditional equality. This specification encodes only the explicit cell

```text
S0: u = source.
```

The other arm is a separate residual cell:

```text
S1: u ≠ source AND
    u ∉ (Hlate.selectedAt source.1 source.2).toCriticalFourShell.support.
```

S1 is outside this specification. It must not be silently discarded, merged into S0, or used to justify any S0 consequence.

Require

```text
q = R.interior_q
w = R.interior_w
q ≠ w
```

and retain the exact first-apex class/interior memberships supplied by the pinned residual. Do not assign `q` or `w` arbitrary carrier roles.

Concretely, the manifest must record

```text
q,w ∈ SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1.
```

In S0, derive rather than assume the normal form

```text
Iu := Ku ∩ C = {u, xu}
Iv := Kv ∩ C = {v, xv}
C = {u, xu, delta, v, xv}
Iu ∩ Iv = ∅
```

All five physical points must be distinct.

The source-faithful singleton provenance to retain includes, subject to confirmation by the source manifest:

```text
globalDeletion.center = cu
globalDeletion.deleted = {u}
cu ∈ A \ C
cu ≠ O
Ku is the actual selected row sourced by u = source
Kv is the actual selected row sourced by v
u ∈ Ku
v ∈ Kv
v ∉ Ku
other ∉ Ku
u ∉ Kv
source_survives_q_or_w
```

Expand `source_mem_outside : source ∈ outsideFirstApexFiber R` using the actual first-apex blocker fiber from the pinned source, including the anchor blocker and the blocker-equality predicate defining that fiber. Retain `centerAt(other)` explicitly together with `other ≠ source`, the class/interior memberships of `other`, `other ∉ Ku`, and

```text
Hlate.centerAt source.1 source.2 ≠ Hlate.centerAt other.1 other.2.
```

Translate `source_survives_q_or_w` through the checked survival/support equivalence into the exact disjunction

```text
q ∉ Ku  OR  w ∉ Ku.
```

Both disjuncts may hold. This translation is valid in S0 because `source = u` and `Ku` is the actual source-indexed selected support.

Retain every additional actual field of `ExactFourMutualOmissionSourceContext` and `ExactFourMutualOmissionJointDeletion`; do not replace them by this abbreviated list.

---

## 3. Discrete case enumeration

Enumerate discrete cells before nonlinear solving. Quotient only by symmetries that are proved to preserve the complete encoded packet.

### 3.1 Mandatory S0 subcases

Run separately:

```text
S0-I:  xu ∈ J
S0-N:  xu ∉ J
```

In `S0-N`, do **not** interpret `xu ∉ J` as “xu is a cap endpoint” or “xu is outside the closed cap.” Those conclusions are not presently justified.

### 3.2 Contextual-peer placement

After using

```text
other ∈ C
other ≠ u
other ∉ Ku
Ku ∩ C = {u,xu},
```

enumerate every still-legal value of `other` rather than selecting one silently. In the expected five-point normal form, this should reduce to a subset of

```text
{delta, v, xv},
```

but the manifest must certify the reduction.

### 3.3 Survival disjunction

Run both cells:

```text
Q-OMIT: q ∉ Ku
W-OMIT: w ∉ Ku
```

Allow both to hold. Their identities are fixed as `q = R.interior_q` and `w = R.interior_w`; do not add further identifications with other named roles unless the pinned source proves them.

### 3.4 Center/equality cells

Enumerate all center-role equalities still allowed by the source. In particular:

- `cu ∉ C` is known in the source-faithful singleton branch;
- do not assume `cv ∈ C` or `cv ∉ C` unless derived;
- do not assume `cu`, `cv`, or the blocker of `other` are pairwise distinct unless a checked field/theorem gives it;
- all row centers are carrier points and are absent from their own supports.

### 3.5 Cyclic-order cells

Enumerate all cyclic orders of the named points compatible with:

- strict convexity;
- the closed cap being a contiguous boundary chain;
- exact source/context cap memberships;
- the physical five points lying on the circle centered at `O`;
- all checked order/betweenness lemmas available at the pinned commit.

Do not assume:

- adjacency of named cap points;
- a fixed cap cardinality;
- that all physical points lie in the closed second cap;
- the angular order of the physical points without either encoding it as a case or deriving it from strict convexity and the repository’s cocircular-half-plane theorem.

Use dihedral symmetry only after fixing which cap orientation, source labels, and `q/w` labels are preserved.

### 3.6 Per-layer omission ledger

Every cell manifest must carry an omission ledger. Include one row for each named deletion `delta`, `u`, `v`, `q`, `w`, and each deletion occurring in a nested packet. Record:

```text
deleted role
exact ambient set
erased point
surviving support(s)
blocking or survival statement
source field / packet field / EXPERIMENTAL
encoded at this layer? yes/no
```

Use explicit `none` or `not encoded at this layer` entries. Absence from the ledger never means that an omission or survival fact was encoded.

---

## 4. Polynomial geometry encoding

Prefer a quantifier-free nonlinear-real encoding with rational coefficients.

### 4.1 Normalization

When valid for the full cell, normalize

```text
O = (0,0)
rho = 1
```

and fix one rotational degree of freedom. Reflection may be quotiented only together with the corresponding reversal of the cap/boundary order.

Avoid trigonometric functions in the exact solver. Represent every point `p` by coordinates `(px,py)` and use squared distances and orientation determinants.

### 4.2 Physical class

For every `p ∈ C`, impose

```text
||p - O||^2 = 1.
```

For the finite model `A`, exactness of `C = SelectedClass A O 1` requires

```text
||z - O||^2 ≠ 1
```

for every `z ∈ A \ C`.

### 4.3 Actual source and opposite selected rows

`Ku` and `Kv` are the complete supports of the actual `Hlate.selectedAt` shells. Do not replace either one by an anonymous four-point circle. Auxiliary coordinate labels for otherwise unnamed support vertices are allowed only after the cell manifest identifies them as members of the actual selected support.

For each row encode:

- support cardinality four and support contained in `D.A`;
- its source point in the support;
- its actual `centerAt` point in `D.A` and excluded from its support;
- one positive radius shared by every support point;
- exclusion of every other modeled carrier point from that radius class; and
- the corresponding `Hlate.no_qfree_at` deletion obstruction.

In particular require:

```text
cu = Hlate.centerAt u.1 u.2
cv = Hlate.centerAt v.1 v.2
u ∈ Ku, cu ∈ A, cu ∉ Ku
v ∈ Kv, cv ∈ A, cv ∉ Kv
Ku ∩ C = {u,xu}
Kv ∩ C = {v,xv}
v ∉ Ku
u ∉ Kv
other ∉ Ku
cu ≠ cv.
```

Do not assume `Ku` and `Kv` are disjoint off the physical circle. Distinct circles may share zero, one, or two support points unless a checked source field excludes the intersection.

### 4.4 Singleton blocking at both actual row centers

Encode both critical-shell deletion obstructions:

```text
¬ HasNEquidistantPointsAt 4 (A \ {u}) cu
¬ HasNEquidistantPointsAt 4 (A \ {v}) cv.
```

For a bounded finite model, every squared-distance fiber from `cu` in `A \ {u}` and from `cv` in `A \ {v}` must have size at most three. Exactness of `Ku` and `Kv` alone is insufficient because another radius at either center might still contain four carrier points.

Encode each blocking condition by either:

1. enumerating all four-subsets of the appropriate erased carrier and forbidding four equal squared distances; or
2. constructing the complete radius-class partition at the center and bounding every class by three.

### 4.5 Strict convexity

Every modeled carrier point must be a vertex of one strictly convex polygon in the chosen cyclic order.

An accepted exact certificate is:

```text
orient(P_i, P_{i+1}, P_j) > 0
```

for every oriented hull edge and every nonincident carrier point `P_j`, after choosing global CCW order. Checking only consecutive triple turns is not sufficient by itself.

### 4.6 Cap semantics

Encode the closed second cap as an actual contiguous interval of the global boundary enumeration and encode its strict interior exactly. Do not replace cap membership by an arbitrary half-plane unless the relevant Lean definition/theorem proves that equivalence.

At minimum the source manifest is expected to include:

```text
u ∈ J
other ∈ J
|(Ku ∩ C) ∩ J| ≤ 2
```

plus the exact `source_mem_outside`, `other_mem_interior`, and any endpoint/exterior fields of the context.

### 4.7 Actual blocker/source entitlement

At every layer that includes an actual row sourced by `x`, enforce:

```text
x belongs to its selected support;
beta(x) is the support’s center;
beta(x) is a carrier point;
beta(x) is not in that support;
deleting x blocks beta(x), when supplied by the critical-shell system.
```

Do not model a row merely as an anonymous circle if the source packet identifies its source and actual blocker.

### 4.8 Operational expansion of joint deletion

At L3, `ExactFourMutualOmissionJointDeletion` may not be represented by a single opaque Boolean. Either encode every field below or attach a Lean-checked reduction, at the pinned commit, that names every omitted field and proves it redundant for the encoded question.

Encode the outer packet fields:

```text
deleted
deleted_mem_class
deleted_ne_u
deleted_ne_v
deleted_not_mem_uRow
deleted_not_mem_vRow
blockers_ne
uPacket
vPacket
```

Expand each `CommonDeletionTwoCenterPacket` into:

```text
q_mem_A
center₁_mem_A
center₂_mem_A
centers_ne
survives₁
survives₂
actual_blocker_ne_center₁
actual_blocker_ne_center₂
B₁
B₂
row₁
row₂
B₁_card
B₂_card
overlap_le_two
```

For each nested `U5QDeletedK4Class` row, encode its support inside the appropriate erased skeleton, deleted-point omission, positive radius, lower cardinality bound, and every equal-distance equation. Combine this with `B₁_card` or `B₂_card` to obtain an exact four-row. Record the actual blocker of `delta` and all packet-supplied inequalities against `cu`, `cv`, and `O = S.oppApex2`.

The source manifest must map every item to its exact Lean field. “Packet present” is not a sufficient encoding.

### 4.9 Operational expansion of global deletion

`ExactFourMutualOmissionRigid221GlobalDeletion` is also not an opaque witness. Its manifest entry must account for:

```text
rigid
center
deleted
center_mem_remaining
deleted_nonempty
deleted_subset_class
deleted_card_le_five
blocked
restores
geometry
```

In the singleton S0 producer, additionally retain the checked identifications and caller obligations

```text
globalDeletion.center = cu
globalDeletion.deleted = {u}
globalDeletion.center ≠ O
MinimalDeletionCore A globalDeletion.deleted globalDeletion.center.
```

Expand `MinimalDeletionCore` into its `shellAt` family of `CriticalSelectedFourClass` witnesses and `supports_pairwise_disjoint`; do not encode it as an uninterpreted Boolean. For singleton deletion the pairwise-disjoint field may simplify, but that simplification must be recorded as a checked reduction rather than silently dropped.

L1 and L2 may omit `restores`, `geometry`, and `MinimalDeletionCore` only if their omission ledgers say so explicitly. L3 must encode the full global-deletion packet and the separate theorem-level `MinimalDeletionCore` requirement, or provide a Lean-checked reduction for each omitted field.

---

## 5. Layered CEGAR program

Run the following layers in order. Stop after each substantive result and checkpoint it.

### Layer L1 — coupled two-row Euclidean core

Encode only:

- strict convex carrier containing all named L1 points;
- exact physical five-circle `C`;
- rigid traces `{u,xu}` and `{v,xv}`;
- source row centered at `cu ∈ A\C`;
- opposite row centered at `cv`;
- mutual omission;
- exact row supports;
- singleton blocking at both `cu` and `cv`;
- only the cap memberships needed to define S0-I or S0-N.

Map the L1 singleton data to the global-deletion packet explicitly:

```text
globalDeletion.rigid              := the derived 2+2+1 normal form
globalDeletion.center             := cu
globalDeletion.deleted            := {u}
globalDeletion.center_mem_remaining := cu ∈ A \ C
globalDeletion.deleted_nonempty   := {u}.Nonempty
globalDeletion.deleted_subset_class := {u} ⊆ C
globalDeletion.deleted_card_le_five := |{u}| ≤ 5
globalDeletion.blocked            := no K4 in A \ {u} at cu
```

The apparently trivial singleton consequences still belong in the manifest and exact verifier. L2 inherits this mapping. Only `globalDeletion.restores`, `globalDeletion.geometry`, and the separate theorem-level `MinimalDeletionCore` remain omitted from L1/L2 unless explicitly activated.

**Question:** does adding the second rigid row already destroy the exact single-row rejection witness?

A SAT result must be rationalized and exactly verified. It refutes the proposed “coupled two-row alone closes S0” route.

The L1 omission ledger must explicitly mark at least the following as not encoded: `12 ≤ |A|`, the full `CounterexampleData` surface, `ExactFourPostCardElevenRobustSurface`, the five-class hypotheses, the complete source context, both common-deletion packets, `globalDeletion.restores`, `globalDeletion.geometry`, and the theorem-level `MinimalDeletionCore`. Calling L1 “source-entitled” refers only to the row and global-deletion fields actually mapped in the manifest.

### Layer L2 — complete source context

Add every field of `ExactFourMutualOmissionSourceContext`: `source_mem_class`, `source_mem_interior`, `source_mem_outside`, `source_cross_card_le_two`, `other_ne_source`, `other_mem_class`, `other_mem_interior`, `other_not_mem_source_row`, `source_other_blockers_ne`, `source_survives_q_or_w`, `source_mem_u_row`, `v_not_mem_source_row`, and the selected S0 arm of `u_eq_source_or_not_mem_source_row`.

The cell manifest must also include the exact `q/w` identities, memberships, inequality, survival disjunct, and every actual blocker center used by these fields.

L2 still omits `globalDeletion.restores`, `globalDeletion.geometry`, and the theorem-level `MinimalDeletionCore` unless the cell explicitly activates them. Record each omission; L2 is the complete *source-context* layer, not yet the complete singleton-caller packet.

**Question:** is the complete contextual singleton S0 packet locally realizable without the full robust surface?

### Layer L3 — joint-deletion and named robust-surface consequences

Add the complete joint-deletion expansion in §4.8, the complete global-deletion and `MinimalDeletionCore` expansion in §4.9, and every *named-point consequence* of `ExactFourPostCardElevenRobustSurface` used by the current caller. Include all actual selected rows and deletion-survival statements for named roles.

Do not add arbitrary consequences of the robust surface; map each one to a theorem in the manifest.

### Layer L4 — bounded full-structure search

Only after L1–L3 are understood, attempt a bounded full model of the relevant `CounterexampleData` and critical-shell surface, starting at `|A|=12` and increasing as resources permit.

This layer must encode the existential K4 condition at every carrier center and all other structure fields needed by the actual theorem. A witness at this layer would be a serious refutation candidate and must be replayed against Lean-level definitions. Failure to find one at finitely many cardinalities proves nothing about the unbounded theorem.

---

## 6. Recommended computational architecture

A two-stage solver is preferred.

### 6.1 Discrete SAT/CP stage

Use SAT, CP-SAT, or explicit enumeration for:

- role equalities;
- support incidence;
- cap interval and cyclic order;
- `other` placement;
- q/w disjunct;
- overlap pattern of `Ku` and `Kv`;
- which exact row hypotheses are active.

Output one cell manifest per surviving discrete assignment.

### 6.2 Nonlinear-real stage

For each cell, use one or more of:

- Z3 `nlsat` over exact rational polynomial constraints;
- Mathematica `Resolve`/`Reduce` with `Reals`;
- Maple `RegularChains`/CAD;
- dReal for discovery and pruning, followed by exact certification;
- Sage/SymPy plus numerical optimization for witness discovery, followed by exact rational or algebraic reconstruction.

Numerical failure or timeout is `UNKNOWN`, never `UNSAT`.

For witness discovery, rational parametrization of the unit circle is encouraged:

```text
((1-t^2)/(1+t^2), 2t/(1+t^2)).
```

All final verification must use exact rationals or exact real-algebraic numbers.

---

## 7. Required outputs

The promoted specification lives under `docs/specs/`; runtime solver artifacts do not. Before running a layer, assign a dedicated execution lane, create its checkpoint, and declare one exact generated root:

```text
scratch/runs/<execution-lane-id>/<run-id>/
```

Every generated root must contain a `run_manifest.json` using `worktree-run-manifest/v1`. Its `base_head` must equal the execution lane checkpoint’s `base_head`; the commit actually executed belongs in the run record and result table.

Put solver inputs, solver streams, complete logs, caches, numerical discovery outputs, and reproducible intermediate files only under that governed run root. Promote only authenticated manifests, receipts, exact certificates, reviewed reports, verifier source, and other replay-critical evidence. Do not commit bulk logs merely to checkpoint progress.

The documentation-repair lane for this specification is `.codex/worktree-checkpoints/rigid221-s0-spec-repair-20260829.json`; it owns this document and intentionally declares no generated root. A computational run must use its own lane checkpoint.

### 7.1 Source and model manifests

```text
s0-source-constraint-manifest.md
s0-role-and-cell-enumeration.json
s0-polynomial-model.md
```

The JSON must include:

```text
lane_id
base_head
executed_commit
run_id
layer
cell_id
role equalities
cyclic order
cap endpoints/interior
support sets
active source constraints
experimental constraints
per-layer omission ledger
```

### 7.2 Solver inputs and result table

```text
solver/*.smt2
solver/*.py or *.sage or *.wl
results.csv
```

`results.csv` columns:

```text
commit, layer, cell_id, solver, status, wall_seconds,
exact_witness, certificate, notes
```

Statuses are only:

```text
SAT_EXACT
SAT_APPROX_ONLY
UNSAT_EXACT
UNKNOWN_TIMEOUT
UNKNOWN_NUMERICAL
ENCODING_BLOCKED
```

### 7.3 Exact SAT witness package

For every `SAT_EXACT` cell, provide:

```text
witness-<cell>.json
verify-witness-<cell>.py   # or .sage
verify-witness-<cell>.txt
```

Witness coordinates must use either normalized rational records `num/den` with `den > 0`, or exact real-algebraic records containing a defining polynomial and an isolating interval. Decimal floats and tolerance windows are never exact witness representations. The verifier must parse the representation independently and check every active manifest constraint before assigning `SAT_EXACT`.

The verifier must check exactly:

1. all point inequalities/distinctness;
2. global strict convexity by all edge half-planes;
3. physical-class exactness;
4. both row equal-distance equations and exactness;
5. support-source and center exclusions;
6. mutual omissions;
7. singleton blocking at both `cu` and `cv`;
8. cap interval/interior semantics;
9. every source-manifest constraint active in that layer;
10. absence of unintended equal-radius classes relevant to the layer.

An approximate plot is useful but not evidence.

### 7.4 Exact UNSAT package

For every `UNSAT_EXACT` cell, provide:

```text
unsat-<cell>-input.*
unsat-<cell>-log.txt
unsat-<cell>-minimal-constraints.md
unsat-<cell>-proof-extraction.md
```

The key deliverable is not the word `unsat`; it is a small geometric consequence suitable for prose and Lean. Examples of acceptable extracted forms are:

```text
specified order + equal-distance relations imply orient(a,b,c) ≤ 0;
required radial interval is empty;
a named point must lie both inside and outside the cap interval;
two distinct actual centers are forced equal;
an exact four-class necessarily acquires a fifth point.
```

For CAD/quantifier-elimination, retain the exact input, projection factors or equivalent notebook output, and the sign conditions identifying the impossible cell inside the governed run root. For Z3 `nlsat`, retain the SMT2 and complete runtime log there, then independently derive the minimal algebraic contradiction; do not rely on an opaque solver verdict as the final mathematical proof. Promote the reviewed contradiction/certificate, not the bulk solver stream.

---

## 8. Non-negotiable soundness rules

1. **No adjacency assumptions.** Named cap points may have unnamed carrier vertices between them.
2. **No exact cap cardinality assumption.** S0 is not a cap-nine branch.
3. **No exact carrier-cardinality assumption.** The current theorem has `12 ≤ |A|`, not `|A|=12`.
4. **No endpoint inference from `xu ∉ J`.** Treat closed-cap membership separately.
5. **No guessed role identifications.** Fix `q = R.interior_q` and `w = R.interior_w`; enumerate only additional coincidences with `other` or other named roles that remain source-legal. Enumerate center equalities from checked source possibilities.
6. **No anonymous replacement of actual rows.** Preserve source entitlement and blocker identity whenever supplied.
7. **No forced off-row disjointness.** Allow legal intersections of `Ku` and `Kv`.
8. **No tolerance-based exactness claims.** Equal radius and strict orientation claims must be exact in the final witness.
9. **No finite-search overclaim.** Bounded UNSAT does not prove the unbounded Lean theorem.
10. **No local-witness overclaim.** A model omitting `CounterexampleData` or the robust surface refutes only the encoded proof route.
11. **Checkpoint after every layer or new exact witness.** Preserve runtime logs under the governed run root. Promote only authenticated durable evidence, and never treat a solver log as a proof.

---

## 9. Priority questions to answer

Return answers in this order:

1. Is L1-S0-I SAT or UNSAT?
2. Is L1-S0-N SAT or UNSAT?
3. Which second-row constraint first distinguishes L1 from the existing exact single-row S0 witness?
4. After adding the complete source context, do `other` and the q/w omission eliminate every L1 witness?
5. If L2 is SAT, which source-level hypothesis absent from L2 is the first one that kills the model in L3?
6. If an UNSAT layer is found, what is the smallest exact inequality/incidence lemma that explains it?
7. If every named-point layer is SAT, provide the strongest exact witness and a gap list identifying precisely which full-structure hypotheses remain unmodeled.

---

## 10. Acceptance criteria

The assignment is complete when one of the following is delivered.

### Outcome A — exact route refutation

An exact rational or real-algebraic strictly convex witness satisfying all L2 or L3 constraints, with a complete exact verifier. The report must say exactly which proposed S0 closure route it refutes and which source hypotheses remain absent.

### Outcome B — exact computational closure kernel

An exact UNSAT result for a source-faithful layer, together with a minimal constraint subset and a human-readable algebraic/geometric contradiction suitable for conversion into a prose theorem and then Lean.

### Outcome C — full theorem refutation candidate

A bounded exact model satisfying the fully expanded `CounterexampleData` and every hypothesis of the current S0 theorem. This must be accompanied by a Lean-facing reconstruction plan. A merely local or approximate witness does not qualify.

### Outcome D — principled inconclusive report

All scripts, cells, exact partial witnesses, timeouts, and the precise source constraints that prevent a complete encoding. `No witness found` alone is not an acceptable report.

---

## 11. Starting point from the previous audit

Label the prior wedge artifact `UNCERTIFIED_WEDGE`. It is an exploratory discovery input suggesting that the following single-row implication may be false:

```text
one strict-cap physical pair
+ strict-cap row center
+ exact cap trace
+ singleton blocking
⇒ the entire source circle lies in the cap wedge.
```

The artifact manually assigns cap sets and does not yet certify the repository’s actual cap construction. It is not an exact cap regression until an independent verifier checks:

```text
CapTriple construction
CapTriple.arc_membership
OnArcOpposite orientation signs
Moser endpoint identities
capInteriorByIndex endpoint removal and interior construction
```

Until those checks pass, the artifact cannot support a closure, route-refutation, `SAT_EXACT`, or geometric-realization claim. It may be used only as a numerical/discovery seed.

The exploratory inputs are:

```text
rigid221-minimalcore-high-risk-audit-checkpoint-05-2026-08-29.md
rigid221-minimalcore-s0-direct-wedge-rejection-witness-2026-08-29.py
rigid221-minimalcore-s0-direct-wedge-rejection-witness-2026-08-29.txt
```

The first new deliverable must either:

1. certify the old geometry against all cap obligations above and then extend it with a legal opposite pair `{v,xv}` and its actual row `Kv`; or
2. construct an independent source-faithful L1 witness/obstruction without relying on the uncertified cap assignments.

In either case, the computation must genuinely add the opposite actual row and source provenance. Reproducing the old coordinate assignment without cap certification is not progress.
