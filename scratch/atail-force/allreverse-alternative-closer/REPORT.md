# Exact-five all-reverse alternative closer audit

Date: 2026-07-18

Status: **THE MINIMAL METRIC PRODUCER CONTRACT AND ONE ADDITIONAL
UNCONDITIONAL FULL-PARENT CONSEQUENCE ARE KERNEL-CHECKED. ARBITRARY-RADIUS
CAPTURE IS EXACTLY THE EXISTING FIRST-APEX CO-RADIAL TERMINAL. INDEPENDENTLY,
THE CONTINUATION PLUS THE ALL-REVERSE PERMUTATION PRODUCES ONE DELETION THAT
PRESERVES K4 AT BOTH APICES AND TWO DISTINCT ACTUAL BLOCKERS. NO REGISTERED
CONSUMER TURNS THAT FOUR-CENTER PACKET INTO `False`, SO NO SOURCE `sorry` IS
CLOSED.**

This lane owns only
`scratch/atail-force/allreverse-alternative-closer/`. It did not edit
production Lean, shared closure documents, proof-blueprint state,
`ShellCurvature`, `SurplusM44`, protected card-five/555/654 files, or git
state.

## Required theorem-bank preflight

Before deriving a new incidence or metric target, this lane checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered exact-five all-reverse transitions,
first-apex co-radial reverse pairs, common-radius three-row cycles, and
same-cap outside-pair contradictions. The only immediate terminal recovered
was the current production theorem

```lean
false_of_transitionReverseOutsidePair_coRadial_firstApex
```

and its full-parent wrapper in `ParentExactFiveAssembler`. No banked theorem
produces the missing co-radial occurrence from the current full parent.

## Kernel-checked normalization

The owned file `AnyRadiusCapture.lean` defines

```lean
FirstApexAnyRadiusTransitionReversePairCapture A :=
  exists q radius,
    (transitionReverseOutsidePair A.transition q inter
      SelectedClass D.A S.oppApex1 radius).card = 2
```

Unlike `FirstApexNamedRowTransitionReversePairOccurrence`, this conclusion
does not require the pair to lie in `A.firstApexRoles.retainedRow` or
`A.firstApexRoles.doubleRow`. It chooses a first-apex radius only after the
reverse pair is known.

The file proves:

```lean
theorem firstApexAnyRadiusCapture_iff_coRadialOccurrence ... :
  FirstApexAnyRadiusTransitionReversePairCapture A <->
    FirstApexCoRadialTransitionReversePairOccurrence A
```

The forward direction uses production exact-two cardinality to recover the
two reverse-pair points from the two-hit intersection. Membership in one
`SelectedClass` gives their equal first-apex distances.

The reverse direction starts with the two distinct co-radial reverse-pair
points, chooses their common distance as `radius`, proves both points lie in
the corresponding ambient `SelectedClass`, and uses the production
two-point cardinality to identify the whole reverse pair with that
intersection.

The file also proves the factorization

```lean
FirstApexNamedRowTransitionReversePairOccurrence A
  -> FirstApexAnyRadiusTransitionReversePairCapture A
```

and the direct terminal

```lean
FirstApexAnyRadiusTransitionReversePairCapture A -> False.
```

Therefore the exact implication chain is

```text
named T0/T1 containment
  -> arbitrary first-apex radius two-hit capture
  <-> first-apex co-radial occurrence
  -> false_of_transitionReverseOutsidePair_coRadial_firstApex
  -> False.
```

This establishes that named-row containment is not the minimal producer
contract. It does **not** prove that the two propositions are logically
inequivalent on realizable full-parent packets; no such strictness claim is
needed or made.

## Why this does not yet close the all-reverse arm

The new theorem is a normal-form equivalence and terminal adapter. It does
not derive the capture from `A : FullParentExactFiveAllReverseData ...`.
Current source supplies no positive incidence between any reverse outside
pair and any first-apex radius class.

The strongest audited weaker routes remain blocked at their stated trust
boundaries:

1. The exact rational strict-Kalmanson bank has 990 stored survivors in
   which all three reverse outside pairs are non-co-radial from
   `S.oppApex1`; all eight strict direction profiles occur. This refutes a
   linear Kalmanson producer, not a Euclidean/MEC/full-parent theorem.
2. The exact finite unequal-radius parent-marginal fixture makes all three
   reverse pairs cross the `retainedRow`/`doubleRow` partition. Even complete
   containment in their union is therefore insufficient. The fixture is not
   a Euclidean or full-parent countermodel.
3. `FirstApexShellRolePacket` supplies two actual selected rows but no
   source-indexed link from their supports to a transition reverse pair.
   Its equal-radius arm gives a large ambient class; its unequal-radius arm
   gives two disjoint selected supports. Neither arm forces a reverse-pair
   hit.
4. The shared physical-cap order indexes transition sources and blockers,
   not the reverse outside targets in a first-apex radius class. Its
   straddling fields alone cannot construct the capture.
5. Retained-radius blocker collision/matching packets provide anonymous
   first-apex co-radial sources or an injective blocker map, but do not place
   both sources into one transition reverse outside pair.

Thus the unconditional all-reverse conclusion remains **OPEN**. Any proof of
the arbitrary-radius capture must visibly use full-parent force absent from
those regressions: the shared source-indexed critical map and deletion
semantics, `R.minimal`, `R.noM44`, MEC geometry, or another aggregate coupling
that retains the complete `L/F0/R/B` packet.

## Kernel-checked continuation/cycle force

The owned file `ContinuationFourCenterDeletion.lean` proves a genuinely new
consequence of the full all-reverse packet:

```lean
theorem nonempty_fullParentAllReverseContinuationFourCenterDeletion
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    Nonempty (FullParentAllReverseContinuationFourCenterDeletion A)
```

The packet chooses a transition predecessor of `continuation.first` and
records that deleting `continuation.first` preserves K4 at:

1. `S.oppApex1`;
2. `S.oppApex2`;
3. the actual blocker of `continuation.unusedRow.unused.point`; and
4. the actual blocker of the transition predecessor.

The two actual blockers are distinct, and each differs from both apices.
The proof uses actual full-parent force rather than a marginal abstraction:

- global all-reverse membership makes the transition successor injective;
- finiteness makes it surjective, so `continuation.first` has a predecessor
  and that predecessor has a predecessor;
- the exact successor-row/cap intersection theorem shows that the unused
  cap point cannot lie in the predecessor row, because it is outside the
  complete physical radius class;
- equal actual blockers would force equality of their exact selected
  supports, placing the unused source in the predecessor row and
  contradicting that omission;
- bi-apex robustness supplies the two apex survivals, the continuation
  supplies its blocker survival, and the transition supplies the
  predecessor-blocker survival.

This is not merely a repackaging of arbitrary-radius capture: it is an
unconditional theorem from `A`. It still does not imply
`FirstApexCoRadialTransitionReversePairOccurrence A` with any theorem now in
the production import closure or required theorem banks. The relevant
consumer audits require additional cross-support incidence, a common outside
pair, or a direct aggregate four-center contradiction retaining
`L`, `R.minimal`, and `R.noM44`.

The production `exists_third_commonDeletionSource` theorem does not bridge
this gap. Its third source is in the complete physical radius class but is
not proved to lie in the strict physical cap interior, so it need not be a
vertex of the three-cycle. Even in the branch where it is a cycle vertex,
its current conclusion adds another deletion surviving at the physical apex
and unused blocker; it does not put a complete transition reverse outside
pair into one first-apex radius class.

Therefore the continuation/cycle result is a rigorous reduction of the
remaining aggregate producer problem, not a terminal closer.

## Recommended parent-facing correction

The exact-five dispatcher should accept the existing
`FirstApexCoRadialTransitionReversePairOccurrence A`, or equivalently the
arbitrary-radius capture above, as its mathematical all-reverse producer
slot. Production now does this directly; named-row containment is only a
sufficient adapter.

The retained first-apex rows should remain available inside
`FullParentExactFiveAllReverseData`; they are evidence a proof may use, not a
required shape of the final occurrence. This allows a late favorable
critical-system, full-fiber, MEC, or minimality argument to produce a
co-radial reverse pair at any first-apex radius without first identifying it
with `retainedRow` or `doubleRow`.

`AnyRadiusCapture.lean` should remain scratch. Its main theorem is an exact
normal-form equivalence with the production co-radial occurrence, and the
dispatcher already consumes that production proposition directly. Promoting
the alias and adapters would add API surface without reducing the open
producer.

## Validation

From the Lake root `lean/`, the lane ran the authorized deliberate
single-file check:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/allreverse-alternative-closer/AnyRadiusCapture.lean

lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/allreverse-alternative-closer/ContinuationFourCenterDeletion.lean
```

Both exit zero with no Lean warnings. The four explicit axiom queries report
exactly:

```text
propext
Classical.choice
Quot.sound
```

The checked file contains no `sorry`, `admit`, custom axiom, `native_decide`,
or unsafe declaration. No Lake target build, production edit, blueprint
mutation, or git operation was performed.

## Epistemic ledger

| Claim | Status |
|---|---|
| arbitrary-radius capture iff co-radial occurrence | **PROVEN / KERNEL-CHECKED** |
| named-row occurrence implies arbitrary-radius capture | **PROVEN / KERNEL-CHECKED** |
| arbitrary-radius capture implies `False` | **PROVEN / KERNEL-CHECKED** |
| full `A` produces the continuation four-center deletion packet | **PROVEN / KERNEL-CHECKED** |
| the four-center packet implies co-radial occurrence or `False` | **OPEN; NO REGISTERED CONSUMER FOUND** |
| the third common-deletion source is necessarily on the strict-interior cycle | **NOT PROVED BY ITS PRODUCTION STATEMENT** |
| full `A` unconditionally produces arbitrary-radius capture | **OPEN** |
| linear Kalmanson data alone produces it | **REFUTED WITH EXACT RATIONAL MODELS IN THAT ABSTRACTION** |
| named T0/T1 finite marginals alone produce it | **REFUTED WITH AN EXACT FINITE FIXTURE IN THAT ABSTRACTION** |
| any reported fixture is a full Euclidean counterexample | **NOT CLAIMED** |
| production `sorry` closed by this lane | **NONE** |
