# Saturated FirstNonHit finite-quotient proposal (audit only)

Status: schema/contract proposal, not a solver input and not a proof.

## Semantic arm being quotiented

Let

```text
fiber := actualBlockerFiber H Q.source₁
KQ    := (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell
hSat  := fiber.card = 4 ∧ fiber.image Subtype.val = KQ.support
```

The source-clean consequence is
`freshThird_qRow_saturated_deletions_blocked_at_qCenter`: every point of
`KQ.support` is blocked at the *same* center
`cQ = H.centerAt Q.source₁`.  This is not yet a distinct-center row.

## Explicit finite source map

Use the role type

```text
Role := FiberRole (Fin 4) ⊕ CanonicalRole (Fin 2) ⊕ CandidateRole Unit
```

The quotient must carry explicit maps, not merely Boolean row labels:

```text
qpt       : Fin 4 → ℝ²                 -- a bijective enumeration of KQ.support
qsource   : Fin 4 → CarrierVertex D.A  -- fiber source with qsource i.1 = qpt i
canonical : Fin 2 → CarrierVertex D.A -- C.firstSource, C.secondSource
candidate : Option (CarrierVertex D.A)
```

The `qpt/qsource` bijection is extracted from `hSat` (fiber image and both
sets have cardinality four).  Its required semantic fields are

```text
qpt_in_KQ       : qpt i ∈ KQ.support
qsource_in_fiber: qsource i ∈ fiber
qsource_val     : (qsource i).1 = qpt i
qsource_center  : H.centerAt (qsource i) = cQ
qpt_distinct    : Function.Injective qpt
```

For each role `r`, retain only the Q-row incidence vector
`inc r : Fin 4 → Bool`, the center-equality bit to `cQ`, and (if used) a cap
index in `Fin 3`.  A role's non-Q support points cannot be silently discarded:
if a positive `HasNEquidistantPointsAt 4` fact is represented, the quotient also
needs four explicit witness-point roles and a Lean lift showing they survive
the deletion.

## SAT abstraction versus semantic assertions

The finite SAT layer may assert only propositional consequences such as:

1. `qpt` is a four-point injection and each q-role has center `cQ`.
2. Every Q point is blocked at `cQ` (the saturated deletion theorem).
3. A candidate role, when present, has a center distinct from `cQ`.
4. Distinct exact-four selected rows satisfy `card (inc r) ≤ 2`; this is the
   abstraction of `SelectedFourClass.inter_card_le_two`.
5. Cap indices and circular-order atoms satisfy the finite cap partition/order
   axioms that have separately been proved in Lean.

These atoms are not semantic facts merely because a SAT assignment satisfies
them.  In particular, a SAT model with a candidate `inc` vector of size three
is only a diagnostic witness unless its source map and metric/K4 relations are
lifted to the actual `D.A`.

The saturated arm itself has no candidate role or distinct center. Adding
`candidate` together with `|inc candidate| ≥ 3` is exactly the missing
relocation producer, not a consequence of saturation. Adding both
`|inc candidate| ≥ 3` and the exact-four overlap bound makes the SAT instance
trivially inconsistent and therefore circular.

## Exact Lean consumer

The intended landing theorem is

```text
selectedRow_inter_card_ge_three_of_blocked_deletions
```

at `TwoSourceFreshThirdResidual.lean:2157`, or its wrapper
`exists_selectedRow_overlap_card_ge_three_of_blocked_deletions` at `:2185`.
The required Lean producer data are, for an actual `source`,

```text
centerAt source ≠ centerAt Q.source₁
blocked : Finset ℝ²
3 ≤ blocked.card
blocked ⊆ KQ.support
∀ w ∈ blocked,
  ¬ HasNEquidistantPointsAt 4 (D.A.erase w) (centerAt source)
```

The wrapper then yields the exact existential consumed by
`false_of_freshThird_firstNonHit`, whose final consumer is
`false_of_centerAt_selectedFourClass_inter_card_ge_three`.

## Required lift/coverage contract

For a cardinality-independent UNSAT result to imply the Lean statement, a
source-faithful abstraction theorem must be supplied:

```text
∀ semantic instance M satisfying hSat and the FirstNonHit hypotheses,
  quotient(M) satisfies every SAT clause.
```

This is the sound-abstraction direction (semantic model → finite assignment).
It is enough for UNSAT-to-`False`, but requires every added cap, cyclic-order,
metric, and K4 atom to be a proved Lean consequence.  Conversely, SAT → a
Lean existential requires a separate realization/lift theorem:

```text
∀ finite model X,
  ∃ actual source and blocked set,
    X's source map preserves center inequality, Q membership, and all
    non-survival/K4 obligations.
```

For a universal relocation theorem, finite role coverage is additionally
needed:

```text
∀ s : CarrierVertex D.A,
  ∃ r : Role, signature(s) = r,
```

with invariance of every retained predicate under equal signatures.  No such
coverage or invariance theorem currently exists.  A fixed finite cap index and
the circular order of a fixed finite named set are cardinality-independent,
but they do not determine metric equal-distance classes or the existential K4
witness relation.  K4 witnesses must be explicitly lifted; negative K4 facts
cannot be certified by merely restricting to a finite named carrier because K4
is not downward hereditary.

## Adversarial verdict

The finite role table is a useful SAT abstraction scaffold, but it cannot close
the saturated FirstNonHit arm as currently stated.  Saturation supplies four
same-center blocked deletions only.  Cap/cyclic-order data can be finitely
encoded for a fixed named diagram, while metric/K4 semantics require witness
and negative-obligation contracts.  Without a new source-clean theorem
producing a distinct-center candidate (or a universal finite-signature coverage
and lift theorem), a quotient UNSAT result is heuristic and must not be wired
to the Lean consumer.
