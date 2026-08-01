# Exact-11 G3 production-ingress audit

Audited 2026-07-30 after the focused production replay build.

## Production replay status

- Endpoint:
  `ExactFiveCommonShellV7G3Replay.startUnsatisfiable`.
- The frozen checker formula uses `PosFin 96419`.
- The generated namespace is unique to this ingress.
- The aggregate `.olean` exists and is newer than its source.
- The replay source contains no `sorry`, `axiom`, `unsafe`,
  `implemented_by`, or `extern`.
- Its transitive axioms are `propext`, `Classical.choice`,
  `Lean.ofReduceBool`, `Lean.trustCompiler`, and `Quot.sound`.

This is compiler-trusted, source-clean certificate replay. It is not yet an
exact-11 closure theorem.

## Minimal semantic imports

```lean
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3SelectorSemantics
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.OccurrenceCore
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Compose
```

`OccurrenceCore` is needed for `allOccurrenceClauses_sat`; selector semantics
does not import it transitively.

## Strongest existing semantic producers

- `exists_livePrefixPacket` produces the canonical packet, source-indexed
  shadow, `CubeOk`, and cyclic alternation.
- `CanonicalPacket.shellCasePrefixFamily_sat` proves the structured retained
  prefix under `inheritedTailValuation`.
- `CanonicalPacket.allOccurrenceClauses_sat` proves the 190,080 cyclic
  occurrence clauses under the Prop-valued `sourceVal`.
- `CanonicalPacket.g3SelectorValuation`, selector totality, and guarded-clause
  combinators cover the three G3 selector cases.

No existing root-reachable theorem joins those interfaces to the exact frozen
273,017-clause checker core.

## Remaining semantic obligations

1. Split `P.shellCase`; route the three non-`s2_o0` cases through `G3Case` and
   route `s2_o0` separately.
2. Prove all 272,902 retained common clauses under one valuation, including
   agreement with the inherited-tail and cyclic-occurrence semantics.
3. Prove the selected guarded payloads: 36, 37, or 41 clauses depending on the
   G3 route. Unselected guarded payloads already close through the selector.
4. Complete `s2_o0`; its long Lean replay is still running.

## Remaining checker glue

1. Establish a Lean-native exact identity for the 273,017 frozen core clauses.
   The external signed-literal-multiset map is provenance, not a Lean theorem
   of formula identity.
2. Extend the semantic valuation by setting fresh variable `96418` to true.
   The added checker clause is a positive unit, not a tautology.
3. Bridge signed-DIMACS Bool clause satisfaction to `Entails.eval` over
   `PosFin 96419`.
4. Apply `startUnsatisfiable`, discharge the existing exact-five frontier
   leaf, rebuild `FiniteN11`, and run a transitive axiom audit.

The existing exact-five frontier theorem remains the correct final public
wrapper. Importing unrelated P4/P5 replay modules merely to reuse checker
helpers would add large cross-lane dependencies, so the adapter should stay
small and local.

