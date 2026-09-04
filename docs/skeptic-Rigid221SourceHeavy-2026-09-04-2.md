# Math Skeptic Audit: Rigid221SourceHeavy source reductions

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 14

## Summary

The nine source-clean declarations added in this working-tree revision are
type-checked reductions, not closure of the Rigid221 frontier.  Their direct
source proofs contain no placeholder, and the prior focused axiom probes for
the added helpers reported only the standard core axioms
`propext`, `Classical.choice`, and `Quot.sound`.  Five terminal declarations
remain `sorry`-backed, including the exact-twelve next-row-only-hit leaf.  The
exact-twelve leaf additionally lacks the finite placement and
`DimacsUnsatisfiable` antecedents required by the available terminal
consumers, so it must remain an open obligation.

## Findings

### F1: Deleted-blocker cardinality reductions

- **Location**: `Rigid221SourceHeavy.lean:4311`, `:4507`, `:4576`
- **Quote**: “The deleted-blocker pentagon cannot stop at the exact-six boundary.”
- **Stated label**: implicit PROVEN, as theorem declarations
- **Evidence present**: compiling Lean declarations; source proof bodies are not `sorry`
- **Actual label**: PROVEN (Lean-formalized) for the stated hypotheses
- **Verdict**: OK
- **Reason**: The exact-six contradiction is used to derive the lower bound;
  the exact-seven normal form is separately stated and checked.  These results
  do not close the later geometric leaf.

### F2: Deleted-blocker `v`-center split

- **Location**: `Rigid221SourceHeavy.lean:4919`
- **Quote**: “The deleted-blocker branch exposes the next `v`-row center as three surviving arms.”
- **Stated label**: implicit PROVEN
- **Evidence present**: compiling Lean declaration and the source-clean helper chain
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The declaration performs a checked class/off-class split and
  retains its named hypotheses in each arm.

### F3: Card-seven off-class center exclusion

- **Location**: `Rigid221SourceHeavy.lean:4961`
- **Quote**: “In the card-seven normal form, an off-class center on the `v` row cannot be one of the five strict-interior points.”
- **Stated label**: implicit PROVEN
- **Evidence present**: compiling Lean declaration and source-clean support-transfer proof
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The proof uses equal-center support transfer and the retained
  `xv` omission from the `xu` row; it does not assert the full terminal.

### F4: Erased-class `xu`-center localization

- **Location**: `Rigid221SourceHeavy.lean:14062`
- **Quote**: “An `xu`-row center in the erased physical-class slice can only be the remaining named source `v`.”
- **Stated label**: implicit PROVEN
- **Evidence present**: compiling Lean declaration and the five-point class cover
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The class split eliminates the erased point and the named row
  collisions using explicit support and center facts.

### F5: Next-row exact-row export

- **Location**: `Rigid221SourceHeavy.lean:17509`
- **Quote**: “The `nextRowOnlyHit` arm exports an exact four-point row after deleting `u`.”
- **Stated label**: implicit PROVEN
- **Evidence present**: compiling Lean declaration
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The declaration translates the three membership/non-membership
  assumptions into an exact four-point support statement.

### F6: Interior next-row center split

- **Location**: `Rigid221SourceHeavy.lean:17560`
- **Quote**: “Under the exact four-point interior normal form, an interior next-row center is either `u` or `xv`.”
- **Stated label**: implicit PROVEN
- **Evidence present**: compiling Lean declaration
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The stated finite interior set is case-split directly and the
  center cases are returned with their interior membership.

### F7: Named-triple intersection normalization

- **Location**: `Rigid221SourceHeavy.lean:17630`
- **Quote**: “The exact next-row arm has one named physical-class hit, namely `xu`.”
- **Stated label**: implicit PROVEN
- **Evidence present**: compiling Lean declaration
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: Finset extensionality derives precisely the singleton intersection
  from the three supplied support facts.  This is a normalization lemma, not
  an unsatisfiability result.

### F8: Remaining terminal placeholders

- **Location**: `Rigid221SourceHeavy.lean:5111`, `:19128`, `:19178`, `:19755`, `:19918`
- **Quote**: `:= by sorry`
- **Stated label**: terminal theorem declarations, implicitly liable to be read as PROVEN
- **Evidence present**: source scan finds five remaining `sorry` placeholders
- **Actual label**: CONJECTURED / open Lean obligations
- **Verdict**: DOWNGRADE TO CONJECTURED
- **Reason**: Compilation of a `sorry`-backed declaration supplies statement
  feedback only; it does not establish its conclusion.

### F9: Exact-twelve next-row leaf lacks terminal evidence

- **Location**: `Rigid221SourceHeavy.lean:19133`
- **Quote**: `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_nextRowOnlyHit`
- **Stated label**: terminal closure, implicitly PROVEN by its `False` result
- **Evidence present**: only the source geometric hypotheses and the three-point next-row hit pattern
- **Actual label**: CONJECTURED / open Lean obligation
- **Verdict**: DOWNGRADE TO CONJECTURED
- **Reason**: The available finite consumers require explicit placement/row
  realization, a concrete encoding, and a `DimacsUnsatisfiable` certificate.
  The current hypotheses do not provide exhaustive coverage of those finite
  jobs.  No sound proof may manufacture that missing certificate.

## Weasel words

No new proof-context weasel words were found in the added declarations.

## Scope conflation

The source-clean reductions are local consequences.  They must not be
described as closing the deleted-blocker or exact-twelve branches.

## Lean sorry graph

The five locations in F8 remain reachable open obligations in this source.
The added helper probes performed before this audit found only standard core
axioms and no `sorryAx`; no terminal promotion is inferred from those probes.

## Upgrade drift

No conjecture was upgraded to a closed terminal in this revision.  The added
declarations narrow residual freedom, while the terminal claims remain open.

## Required before CERTIFIED

Supply and verify the missing finite placement/realization coverage and
certificate ingress for the exact-twelve leaf, then replace each relevant
`sorry` with a proof whose transitive axiom closure is independently audited.
