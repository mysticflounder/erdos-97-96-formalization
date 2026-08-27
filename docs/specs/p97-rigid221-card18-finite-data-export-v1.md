# P97 Rigid221 card-18 finite-data Lean export contract (v1)

**Status: LEAN DATA EXPORT COMPLETE / NO SERIALIZER OR SOLVER AUTHORIZED.**

Lane: `rigid221-card18-finite-data-export-20260827`.

Lane base: `6f0b198eec6792156578d1725f5d97040317af0c`.

## 1. Purpose

The preceding source-export checkpoint proves a source-faithful three-arm
alternative, but its crossed witnesses are existential propositions and its
bi-survival packets are wrapped in `Nonempty`. Those proof-erased values cannot
be serialized directly. This checkpoint adds a Lean `Type`-valued projection
whose constructors retain the same witnesses as data.

This is an internal Lean representation boundary. It does not create JSON,
CNF, SMT, PIQD input, a solver run, a model, a certificate, or a
general-cardinality lift.

## 2. Exact-cardinality and label boundary

The export remains conditional on the source record's explicit
`D.A.card = 18` field. It defines:

- `Label := Fin 18`;
- an explicit noncomputable point map `pointOf : Fin 18 → ℝ²`, obtained by
  applying the inverse of the stored equivalence
  `CarrierVertex D.A ≃ Fin 18` and then taking the subtype value; and
- `labelsOf` for finite subsets of the ambient carrier, together with checked
  membership and cardinality lemmas. The cardinality lemma must require the
  geometric subset hypothesis `T ⊆ D.A`.

The conversion must not derive equality from the live residual's weaker bound
`18 ≤ D.A.card`. The labeling is a finite Lean view of the exact-cardinality
source, not yet an external wire encoding.

## 3. Type-valued arm data

The output is a disjoint three-constructor datatype corresponding exactly to
the committed source alternative.

### Crossed arms

Each crossed constructor retains its original common source and deletion
profile plus direct values

```lean
C₁ C₂ CO : U5QDeletedK4Class ...
```

for the same three source-exact rows as the source arm. It also retains the
source arm's membership witnesses and the exact `BO.card = 4` witness.

The `xv` arm uses the single-point deletion `D.A.erase source.packet.xv`
(`q = xv`) and the two actual neutral-source centres; the `u` arm uses
`D.A.erase source.P.u.1` (`q = u`) and the same two centres. Exact deletion points,
selected rows, centres, membership facts, and row-cardinality facts remain in
the dependent Lean types. The export may choose witnesses from the committed
existentials, but may not synthesize unrelated replacement rows.

### Bi-survival arm

The bi-survival constructor retains direct, unwrapped values for both committed
`CommonDeletionTwoCenterPacket`s: the `q = u` packet and the `q = xv` packet.
The packets continue to carry the source-exact deletions, centres, rows,
supports, deletion-survival witnesses, blocker-centre separation, and
overlap-at-most-two facts already checked by their Lean types.

## 4. Conversion theorem

A noncomputable conversion takes an already-existing value of
`Rigid221ExactCardEighteenAlternative` and maps it to the new data alternative.
`Classical.choose`, `Classical.choose_spec`, and `Classical.choice` are allowed
only to unwrap witnesses already present in the source value.

The conversion must:

- cover all three source constructors;
- preserve the common source and each arm's deletion profile;
- take every direct witness from the corresponding source existential or
  `Nonempty` field;
- avoid the source existence theorem and every open `False` leaf; and
- compile without `sorry`, `admit`, added axioms, or native/external evidence.

## 5. What this checkpoint does not serialize

The finite label view does not by itself provide an audited external
serializer. In particular, this checkpoint intentionally does not project:

- real coordinates or radii into an executable numeric representation;
- cyclic-order and cap-membership predicates into a complete finite table;
- role-pinned labels for every named source object;
- a checked table of every K4/minimality consequence that a solver may use; or
- canonical JSON bytes with encode/decode readback and source-manifest binding.

Nested records and dependent types remain source evidence inside Lean. A later
serializer must enumerate and check every predicate admitted to a solver; it
may not replace them with caller-supplied Boolean attestations.

## 6. Acceptance gates

This checkpoint is complete only after:

1. the governed target build of `Rigid221Card18FiniteDataExport` succeeds;
2. a declaration-level axiom audit of the conversion records no `sorryAx` and
   no unapproved external/native evidence;
3. an independent audit confirms witness provenance, constructor coverage,
   exact deletion/type preservation, and the absence of an open-leaf detour;
4. the lane's staged hygiene check reports no blocking issue; and
5. the exact owned and durable paths are committed and pushed.

Passing these gates authorizes source-derived finite projections and design of
a pure finite abstraction. It does not require or authorize serialization of
the noncomputable source witness. Search remains blocked until Lean defines a
decidable finite `Valid` surface, proves the source-to-abstraction theorem, and
establishes the checked correspondence for any finite search or certificate.

## 7. Checkpoint evidence (2026-08-27)

- the governed target build completed all 11,029 jobs;
- `proof-blueprint axioms` on
  `rigid221ExactCardEighteenAlternativeToData` reported only `propext`,
  `Classical.choice`, and `Quot.sound`;
- the declaration-level receipt records no `sorryAx` and no native or external
  evidence;
- independent field-by-field review is **GO** for constructor coverage,
  witness provenance, exact deletion/centre/support types, and the label/card
  lemmas; and
- the lane hygiene report has zero lane-specific issues; the shared worktree's
  unrelated dirty paths remain foreign to this checkpoint.

The next admissible steps are separately governed predicate coverage followed
by a pure finite abstraction and source-to-abstraction theorem. External
serialization and a solver canary remain unauthorized; `CANARY AUTHORIZED`
remains false.
