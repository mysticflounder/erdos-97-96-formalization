# Math Skeptic Audit: CardGeThirteenExact13ExclusiveApex18

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13ExclusiveApex18.lean`
**Date**: 2026-09-06
**Verdict**: NEEDS WORK
**Claims audited**: 4

## Summary

The raw blocker exclusivity and label/orientation handoff are Lean-formalized.
The generic binomial arithmetic lemma is also Lean-formalized, but the module
does not connect its cardinality hypotheses to the actual packet.  Most
importantly, `ExclusiveApex18SupportPartition` is only a structure describing a
possible witness: there is no constructor, `Nonempty` theorem, or packet-level
proof of its `E_mem`, support identities, or the required cardinalities.
Therefore the actual eighteen-choice occurrence claim is not proved.

## Findings

### F1: Raw blocker exclusivity

- **Location**: target:79–110 (`exclusive_apex_blocker_raw`)
- **Quote**: “The raw apex lies in exactly one of the two blocker supports.”
- **Stated label**: Lean-proven.
- **Evidence present**: the theorem uses `raw_cover`, `pRaw_ne_zraw`, the
  third-row center exclusion, and `raw_disjoint_C0_C1`; focused Lean checking
  succeeds.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The theorem supplies both disjunction directions and excludes
  simultaneous membership by the stored raw disjointness field.

### F2: Eighteen-choice arithmetic

- **Location**: target:113–118 (`exclusiveApex18_choice_count`)
- **Quote**: “The finite two-subset choices contribute `3 * 6 = 18`
  occurrences once the apex has already forced the blocker orientation.”
- **Stated label**: Lean-proven arithmetic conditional.
- **Evidence present**: `Finset.card_powersetCard` plus explicit hypotheses
  `U.card = 4` and `L.card = 3`; the theorem’s axiom probe is
  `[propext, Classical.choice, Quot.sound]`.
- **Actual label**: PROVEN — Lean-formalized conditional only.
- **Verdict**: CLARIFY.
- **Reason**: No theorem in this module supplies those two cardinality
  hypotheses for `ExclusiveApex18Input`.  The arithmetic lemma must not be
  cited as an actual packet-level eighteen-choice result.

### F3: Support-partition witness

- **Location**: target:121–141 (`ExclusiveApex18SupportPartition`)
- **Quote**: “A checked support-partition witness for a later occurrence
  consumer.”
- **Stated label**: Implicitly established by the module.
- **Evidence present**: only a structure declaration containing `ell`, `E`,
  `chosenSupport`, `otherSupport`, `chosen_cases`, `chosen_eq`, `other_eq`,
  and `E_mem`.
- **Actual label**: CONJECTURED/specification.
- **Verdict**: DOWNGRADE TO CONJECTURED.
- **Reason**: There is no `Nonempty (ExclusiveApex18SupportPartition I)`,
  constructor theorem, or packet-level proof of any field.  In particular,
  `E_mem` and the two support identities are assumptions supplied by a future
  caller, not consequences of `I`.  The current source also has no theorem
  proving the intended `Uraw.card = 4` or
  `(Lraw.erase zraw).card = 3` for the actual packet.  Nor does it prove the
  source-incidence split needed for the identities, such as
  `(chosenSupport ∩ (Lraw.erase zraw)).card = 1` and
  `(chosenSupport ∩ Uraw).card = 2`.

### F4: Raw occurrence handoff

- **Location**: target:143–159 (`raw_occurrence_handoff`)
- **Quote**: “The raw occurrence handoff preserves the profile, apex labels,
  and order orientation needed by the downstream source-order adapter.”
- **Stated label**: Lean-proven.
- **Evidence present**: direct projections from
  `X.rawPartition.profile_eq_secondOpposite`, `P.labelMap`, and
  `P.orientation`; focused Lean checking succeeds.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The constructor is fully supplied by existing ingress fields and
  does not depend on the missing support-partition witness.

## Weasel words

The phrase “checked support-partition witness” at target:123 overstates the
evidence.  It should describe a witness schema until a constructor theorem is
added.

## Scope conflation

The generic arithmetic theorem and the actual packet-level occurrence count
must remain separate.  The latter requires a theorem constructing the support
partition and proving the cardinality premises; neither is present.

## Lean sorry graph

The focused check emitted no `sorry` or `admit` diagnostics.  The three public
probes (`exclusive_apex_blocker_raw`, `exclusiveApex18_choice_count`, and
`raw_occurrence_handoff`) each reported only
`[propext, Classical.choice, Quot.sound]`.

## Upgrade drift

The source commit upgraded the blocker XOR and handoff to Lean-proven claims,
which is supported.  It did not provide evidence for upgrading the support
partition or actual 18-choice occurrence from a schema to PROVEN.

## Required before CERTIFIED

Add and compile a theorem of the form
`Nonempty (ExclusiveApex18SupportPartition I)` (or an equivalent packet-level
constructor) whose proof derives the chosen/other support identities and the
cardinality and source-incidence hypotheses for `I`.  Raw cover/disjointness
and card fields alone do not supply that split.  Then apply
`exclusiveApex18_choice_count` to those derived values and re-run the focused
axiom and hygiene audits.  Do not claim actual eighteen-choice occurrence
until that constructor exists.
