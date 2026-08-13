# FreshThird FirstNonHit: direct source-clean closure

## Role

Act as a senior research mathematician and Lean proof architect. Resolve the
single FreshThird FirstNonHit residual described below, or give a rigorous
reason that its current interface must be refactored before it can be closed.

This is not a request for a broad survey of the repository, another local case
split, or a fixed-cardinality experiment. The desired result is one
cardinality-independent mathematical argument with an exact, source-clean Lean
landing.

Use the current checkout as authoritative. Names and line numbers below are
navigation aids; inspect the live declarations and their complete surrounding
section before relying on them.

## Exact live residual

The current load-bearing declaration is in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`:

```lean
theorem false_of_freshThird_firstNonHit
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    False := by
  sorry
```

The compatibility theorem
`exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three` is declared
after this theorem and is already proved by `False.elim` from the direct
residual. It is not the open anchor.

### Crucial logical correction

The compatibility existential is not a weaker positive producer. Under the ambient
`CriticalShellSystem` hypotheses it is already impossible: selected four-point
classes at unequal centers intersect in at most two points. Consequently, for
these fixed hypotheses,

```text
the displayed existential  <->  False.
```

The forward implication is the existing clean two-circle consumer; the reverse
implication is `False.elim`. The source has therefore already been refactored
to the truthful declaration order: the direct `False` theorem is the sole open
anchor, and the existential follows from it. Prove the live theorem itself.
Do not introduce another `*_core` theorem with an equivalent placeholder, and
do not reverse the dependency back toward the existential.

## Exact ingress that must be respected

Audit the full definitions rather than reasoning from their names:

- `FreshThirdBlockerFiber`, in `BlockerMultiplicityGeometry.lean`;
- `FreshThirdCapSourceNonHit`, in `TwoSourceFreshThirdFiber.lean`, with its two
  constructors `.sameBlocker` and `.sourceRowOmission`;
- `FreshThirdCapSourceInteraction`, in `TwoSourceFreshThirdFiber.lean`, with
  its four constructors `.sameBlocker`, `.sourceRowOmission`,
  `.distinctBlockersDifferentCaps`, and
  `.sameCapWithInternalFiberSource`;
- `FreshThirdCrossRowHit` and `FreshThirdCrossRowResidual`;
- `FreshThirdAcyclicCanonicalConsumerPacket`, in
  `TwoSourceFreshThirdRetainedProducer.lean`.

The last definition is the disjunction

```lean
FreshThirdAlignedRetainedConsumerPacket C ∨
  Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ).
```

The common-radius witness in the right arm is not definitionally tied to the
live surface `C`. Do not transport facts between them without an explicit
source theorem.

The proof must cover all `2 × 4` combinations of the NonHit and second-source
interaction constructors, or replace that split with a valid uniform
argument.

## Facts already established

Treat these as audited constraints, not suggestions to rediscover:

1. The two named canonical source rows do not furnish the target witness.
   The clean helpers
   `freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two` and
   `freshThirdCapSourceInteraction_centerEq_or_inter_card_le_two` show that
   each named row either has the same center as the `Q.source₁` row or has a
   distinct center and overlap at most two.

2. The exact blocked-deletion formulation is already formalized by
   `exists_blockedDeletionTriple_iff_exists_selectedRow_overlap_card_ge_three`.
   For `target := Q.source₁`, it asks for an actual carrier source `s` with a
   different center and a three-element subset of the Q row whose three
   deletions are all blocked at `H.centerAt s`. This is exactly equivalent to
   the impossible three-overlap packet. It is a landing contract, not a source
   theorem.

3. In the hardest `.sameBlocker × .sameBlocker` projection, the four named
   sources may saturate one actual-blocker fiber and one exact four-point row.
   The clean bound `actualBlockerFiber_card_le_four` is then sharp rather than
   contradictory; source aliases only create more slack.

4. Current minimal-deletion facts do not synchronize three blocked deletions
   at one distinct actual center. Current deletion-fan and repeated-blocker-cap
   facts do not synchronize the endpoint row's cap, its outside points, and
   the repeated blocker cap.

5. Existing cap-order and Kalmanson packets do not create the missing positive
   Q-row incidence. Producing `FreshThirdSameCapCrossRowAlignment` from the
   present NonHit data would already amount to proving the contradiction.

6. Existing fixed-`n`, exact-17, incidence-shadow, and frozen-coordinate runs
   have rejected individual proposals or produced satisfiable abstractions.
   None is a finite-to-universal reduction, a full Euclidean P97
   counterexample, or a proof of this residual.

7. The symbolic four-bit Q-support quotient discussed in
   `docs/computational-closure-plan-2026-07-28.md`, §13.24.1.13, is currently
   `NO-RUN`: it lacks a source-clean ingress/lift relating every arbitrary-cardinality
   live instance to the quotient. Do not infer that ingress from an eventual
   quotient UNSAT result.

Relevant prior diagnostics include:

- `scratch/p97-consumer-first/freshthird_firstnonhit_global_blocker_quotient_v1/`;
- `scratch/p97-consumer-first/freshthird_firstnonhit_fo_v2_explicit_model/`;
- plan §§13.24.1.10–13.24.1.13.

These artifacts constrain duplicate work but are not proof premises.

## Resolution task

Resolve the residual through one of the following outcomes, in priority order.

### Outcome A: direct proof

Give a complete mathematical proof of
`false_of_freshThird_firstNonHit` from exactly the live hypotheses. State
every nontrivial intermediate theorem with an exact Lean-compatible signature
and identify its immediate clean consumer.

A successful proof may land through any genuinely derived source-clean
terminal, including:

- a distinct actual center whose selected row contains at least three points
  of the Q row;
- two `FreshThirdCrossRowHit` witnesses with unequal centers, consumed by
  `false_of_two_freshThirdCrossRowHits_distinctCenters`;
- a genuinely derived `FreshThirdSameCapCrossRowAlignment`, consumed by
  `false_of_freshThird_sameCapCrossRowAlignment`;
- a different existing metric, cap-order, blocker-fiber, or minimality
  contradiction whose complete antecedents follow from the live ingress.

Do not force the proof into the three-overlap formulation if a shorter direct
contradiction exists.

### Outcome B: rigorous interface refutation

If the direct theorem does not follow from the currently exported interface,
prove that claim precisely. Provide one of:

1. a full source-faithful Euclidean configuration satisfying every ambient and
   explicit hypothesis of the residual, which would refute the theorem itself;
   or
2. a formal model of a clearly identified abstract interface showing that a
   proposed inference does not follow from the exported fields.

Outcome B.2 is only an API/refactor result. Label it
`INTERFACE-INSUFFICIENT`, not a P97 counterexample and not a refutation of the
full mathematical theorem. State exactly which genuine geometric or global
source fact the abstraction omits.

Then propose the weakest source-entitled theorem or structure-field change
that would make a clean terminal reachable. It must be materially weaker or
more structural than merely restating `False`, the three-overlap existential,
or the equivalent blocked-deletion triple.

### Outcome C: justified unbounded solver contract

If a solver is the right next tool, first give the Lean ingress theorem needed
to make the computation universal. The encoding must use symbolic
multiplicities or another genuinely unbounded representation; it may not use a
hidden `MAXN`, `Fin 17`, exact cardinality, or an assumed bounded core.

For a four-bit Q-support quotient, specify and justify both directions needed
for promotion:

1. every live arbitrary-cardinality instance induces a quotient model; and
2. the quotient clauses retain enough source information that quotient UNSAT
   yields one named Lean terminal.

If either direction cannot be proved, the quotient remains `NO-RUN`. Say so
rather than proposing a larger search.

For an authorized CEGAR wave:

- map every clause to an exact source theorem or structure field;
- include known-SAT and malformed-UNSAT controls;
- use exact readback and independent solvers where applicable;
- minimize any UNSAT core and distinguish source clauses from derived clauses;
- mine only that wave's new data for a general theorem afterward;
- search the Lean corpus again only when the mine produces one concrete new
  theorem candidate or the reuse-search key materially changes;
- treat SAT as an abstraction survivor unless an independently validated full
  Euclidean/source model has actually been constructed.

## Forbidden routes

The proof or recommendation must not use any of the following circular or
scope-invalid steps:

- the current
  `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`;
- recursive or downstream use of `false_of_freshThird_firstNonHit` itself;
- `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`;
- `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`;
- `false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius`;
- any common-radius or normalized helper whose transitive dependency graph
  returns to this FirstNonHit residual;
- any downstream theorem carrying `sorryAx` through another open FreshThird
  terminal;
- an assumed cap-wide alignment, blocker-cap synchronization, endpoint
  exclusion, row equality, cyclic order, or deletion obstruction not present in
  the live hypotheses;
- a fixed-cardinality UNSAT result promoted without a proved bounded-core or
  general-cardinality lift;
- an incidence shadow presented as a Euclidean counterexample;
- a new `sorry`, `admit`, axiom, unsafe escape, or an equivalent stronger
  placeholder;
- further residual fan-out unless a child is closed in the same result or a
  strict, documented frontier measure decreases.

## Required response format

Begin with exactly one verdict:

- `PROVEN` — a complete source-clean proof is supplied;
- `REFUTED` — a full model of all live hypotheses is supplied;
- `INTERFACE-INSUFFICIENT` — a precise abstract interface model blocks the
  current route, with the missing source theorem identified;
- `OPEN` — neither proof nor adequate model is supplied.

Then provide:

1. **Exact theorem statement.** Give the direct-False Lean signature you prove
   or the exact minimal theorem/refactor you recommend.
2. **Mathematical argument.** No omitted constructor arms or phrases such as
   "the remaining cases are similar" without a shared lemma.
3. **Constructor ledger.** Account for both NonHit constructors, all four
   interaction constructors, and both ingress arms.
4. **Provenance ledger.** For every imported fact, give its declaration and
   source file; mark facts as clean, open, or circular.
5. **Circularity audit.** Demonstrate that no dependency reaches the active
   direct theorem, its compatibility existential, or another sorry-bearing
   residual.
6. **Lean landing plan.** Give declaration order, imports, and a proof skeleton
   precise enough to implement without inventing hypotheses.
7. **Computational contract, if used.** Give variables, clauses, source map,
   unbounded ingress/lift, controls, exact validation, and the named Lean
   consumer.
8. **Plan delta.** State the exact update needed in
   `docs/computational-closure-plan-2026-07-28.md`.

Do not spend the response on a general theorem-bank survey. One bounded reuse
preflight is appropriate only after you have a concrete candidate theorem and
its immediate consumer.

## Acceptance criteria

A result may be called `PROVEN` only if all of the following hold:

- the proof uses the original arbitrary-cardinality hypotheses;
- every constructor and ingress arm is covered;
- no added premise is hidden in an adapter;
- the Lean declaration typechecks under Lean 4.27;
- a transitive axiom audit contains no `sorryAx` or unapproved proof escape;
- the compatibility existential remains derived from the proved direct theorem rather
  than vice versa;
- the direct consumer remains wired into the live proof spine;
- the authoritative computational closure plan is updated to match the actual
  proof or blocker.

If you cannot meet these criteria, return the strongest honest non-closure
result and the single next theorem that would most reduce the frontier.
