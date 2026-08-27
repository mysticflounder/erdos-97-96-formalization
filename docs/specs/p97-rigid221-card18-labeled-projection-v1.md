# P97 Rigid221 card-18 labeled projection contract (v1)

**Status: LEAN LABELED PROJECTION COMPLETE / NO SERIALIZER OR SOLVER AUTHORIZED.**

Lane: `rigid221-card18-labeled-projection-20260827`.

Lane base: `503cab0d03e1365e520912e3666902d8dabec31c`.

## 1. Purpose

`Rigid221Card18FiniteDataExport` unwraps the crossed row witnesses and
bi-survival packets into `Type`, but it does not identify the named source
objects or their finite supports inside `Fin 18`. This checkpoint adds that
Lean-internal labeled view and an arm-indexed deletion profile.

The output remains a noncomputable dependent Lean value. It is not external
bytes, an executable serializer, a source-faithful Python packet, a solver
encoding, or a canary authorization.

## 2. Reuse preflight

The bounded theorem-bank search at source revision
`503cab0d03e1365e520912e3666902d8dabec31c` found
`ExactTwelveRigid221Ingress.FrozenRoleLabeling` and the exact-twelve
`labelsOf` lemmas as the closest prior construction. The immediate consumer is
this checkpoint's card-18 role/support projection.

`FrozenRoleLabeling` is not directly reusable: it is fixed to `Fin 12`, pins a
different role vocabulary, and requires `FaithfulCarrierPattern` plus the
exact-twelve off-class residual. Those are the first missing antecedents, not
facts carried by the card-18 source alternative. Its construction pattern is
reused, while the already-checked card-18 `pointOf`, `labelsOf`, membership,
and cardinality lemmas are used directly. No theorem-bank circularity was
found.

## 3. Named role labels

For each `Rigid221ExactCardEighteenSource`, the projection defines labels for
all eleven names used by the candidate schema:

- `u`, `v`, `xu`, `xv`, and the joint-deletion point;
- the second opposite apex;
- the two neutral-producer sources;
- the center selected at the joint-deletion point; and
- the two actual centers selected at the neutral-producer sources.

Every label is obtained by applying the source's stored
`CarrierVertex D.A ≃ Fin 18` equivalence to a proved carrier member. The record
retains point equalities showing what each label denotes. Distinctness is
exported only where it follows from the typed source. In particular, the two
actual-center labels and the two source labels are distinct. This checkpoint
must not import the Python candidate validator's stronger role inequalities as
assumptions.

## 4. Labeled supports

Every exported support is the card-18 `labelsOf` image of the exact geometric
support carried by the finite-data alternative. Each labeled four-support
retains:

- its geometric support and proof that the support lies in `D.A`;
- equality between its label set and `labelsOf` of that support; and
- exact label cardinality four.

The crossed arms expose the selected supports `K₁`, `K₂`, and `BO` for their
source-exact deletion point. Their labeled facts preserve the deletion-point
exclusion, common-member memberships, and the two source memberships already
present in `U5QDeletedK4Class` and the source row facts.

The bi-survival arm exposes `B₁` and `B₂` from both the `q = u` and `q = xv`
`CommonDeletionTwoCenterPacket`s. It preserves label cardinality four,
deletion-point exclusion, and the label-level overlap bound at most two for
each packet. The overlap proof must first establish that `labelsOf` commutes
with intersection, then transfer the geometric intersection cardinality; plain
cardinality preservation of the two supports is insufficient.

No caller-chosen label name, support order, membership Boolean, or proof
attestation enters this projection.

## 5. Arm and deletion profile

The finite profile uses a closed Lean outcome type with values corresponding
to `SURVIVES` and `FAILS`. It records the four cells

```text
(u, actual_center_1)   (u, actual_center_2)
(xv, actual_center_1)  (xv, actual_center_2)
```

and is derived only by pattern matching the three source constructors:

- xv-deletion crossed: `FAILS, FAILS, SURVIVES, SURVIVES`;
- u-deletion crossed: `SURVIVES, SURVIVES, FAILS, FAILS`;
- bi-survival: `SURVIVES` in all four cells.

The labeled alternative remains three-constructor and retains the original
finite-data value in every arm, so the finite profile cannot select an arm
independently of the Lean source constructor.

## 6. Explicitly unavailable predicates

This checkpoint does not project:

- real coordinates or radii to an executable numeric representation;
- equality between row radii beyond the propositions in the nested source
  objects;
- cyclic order or a complete finite cap/interior table;
- the full selected-row, K4, and minimal-deletion predicate surface;
- canonical external bytes or a Lean/Python decode/reconstruction theorem; or
- a hard-clause admission decision for any solver predicate.

These omissions must remain explicit in the later predicate-coverage manifest.
No absent predicate may be replaced by `attested: true`.

## 7. Acceptance gates

This checkpoint is complete only after:

1. the governed target build of `Rigid221Card18LabeledProjection` succeeds;
2. the conversion's declaration-level axiom report contains no `sorryAx` and
   no native or external evidence;
3. independent review checks every role origin, support source, membership,
   cardinality, overlap proof, profile cell, and constructor association;
4. the lane's staged hygiene check reports no blocking issue; and
5. the exact owned and durable paths are committed and pushed.

Passing these gates authorizes a custody re-mine rooted at the labeled
projection and design of a predicate-coverage manifest. It does not authorize
Python source-faithful serialization or a solver canary. `CANARY AUTHORIZED`
remains false.

## 8. Checkpoint evidence (2026-08-27)

- the governed target build completed all 11,030 jobs;
- `proof-blueprint axioms` on
  `rigid221ExactCardEighteenDataAlternativeToLabeled` reported only `propext`,
  `Classical.choice`, and `Quot.sound`;
- the declaration-level receipt records no `sorryAx` and no native or external
  evidence;
- the overlap transfer explicitly proves that `labelsOf` commutes with
  intersection before transporting the two geometric bounds; and
- independent field-by-field review is **GO** for all eleven role origins,
  labeled support provenance, crossed and bi facts, profile ordering, and
  constructor association.

The next checkpoint must re-mine and freeze source custody with this labeled
projection as its root. No serializer or solver authority is implied here.
