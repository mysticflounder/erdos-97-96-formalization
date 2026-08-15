# Ingress contract

## Inherited exact scope

This round inherits the complete incidence and metric ledger from
`../INGRESS-CONTRACT.md`.  In particular it retains:

- exactly 17 carrier points and cap profile `(8,6,6)`;
- the direct crossed constructor only;
- the exact P, Pρ, C-source, and Q rows and crossed omissions;
- exact first-cap D44 slices equal to P/Pρ up to swapping;
- canonical-source separation from both multi-point D44 slices;
- carrier-wide K4 witnesses, actual-blocker row locking, and minimality
  incidence constraints; and
- one shared coordinate pair per carrier point in the metric stage.

Nothing is imported from a six-center or V2 schema.  The two deletion
constructors and reversed crossed constructor remain out of scope.

## New source-fidelity cut

The new source theorem is
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned`
in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean`.
It proves, for either aligned canonical source `c`,

```text
SelectedClass A firstApex (dist firstApex c) ∩ strictFirstCap = {c}.
```

The aligned consumer packet instantiates this theorem separately at its first
and second canonical sources.  Consequently, if the chosen four-point K4
support at the first apex contains either source, every other point of that
support must lie outside the strict first cap.  `incidence_round.py` encodes
this implication for both sources, every possible first-apex index, and every
carrier point before solving.

This direction is sound for a chosen K4 support: membership of the source makes
the support's common radius exactly `dist firstApex source`, and the singleton
theorem then excludes every distinct strict-cap member.  No converse is used.

## Validation and controls

- The parent structural validator checks roles, exact rows, Q row, cap
  composition, blockers, K4/minimality, rich slices, and crossed orientation.
- The v2 validator independently recomputes the first apex, its K4 support,
  the strict first cap, and the singleton overlap for both sources.
- The prior assignment must be rejected specifically because its support
  contains `c_first = 0` together with strict-cap point `10`.
- Tiny SAT and malformed-UNSAT artifacts smoke-test both Z3 and cvc5 wrappers.
- Metric malformed controls contradict boundary orientation, a K4 equality,
  D44 radius distinctness, and a source singleton.

## Deliberate omissions

The encoder still lacks a complete extraction from all original P97 and
`CriticalShellSystem` hypotheses, including all anonymous deletion packets and
all minimality consequences.  It also lacks constructor coverage, assignment
coverage, cardinality coverage, and a general-cardinality lift.  Thus:

- SAT is only a model of the encoded packet, not a P97 counterexample;
- UNSAT rejects only this bounded packet or fixed assignment, not the live
  universal residual; and
- solver evidence is not a kernel-checked Lean theorem.
