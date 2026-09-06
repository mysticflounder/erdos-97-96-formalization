# Math Skeptic Audit: Exact-five global source cut

**Target**: `docs/audits/2026-09-06-exactfive-global-source-cut.md` (entire note), and §3b of `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md`
**Date**: 2026-09-06
**Verdict**: CERTIFIED
**Claims audited**: 11 major claims, enumerated below

## Summary

The intermediate theorem has a complete pen-and-paper proof under its stated
hypotheses. The radial lemma, old-center aliases, nonrobust-center cover,
arbitrary-subset cut, and pointwise reselection all pass. Certification concerns
these paper deductions and their stated scope. It is not a new Lean compilation,
kernel trust audit, physical closure, or termination result.

The source paragraph now identifies the strict-fresh witness that makes U
proper, and explicitly names the exact-five and unique-radius fields needed
for the O alias. These resolve the two custody clarifications raised during
the audit. No mathematical downgrade remains.

## Findings

### F1: The original support cut is nonempty and proper

- **Location**: target note:39–47.
- **Quote**: "This witness makes U proper in A; E makes U nonempty."
- **Stated label**: Mathematical deduction.
- **Evidence present**: The strict-fresh source omits E.erase deleted, differs
  from deleted, and omits B and L. The positive five-point E is contained in U.
- **Actual label**: PROVEN, pen-and-paper from the listed source data.
- **Verdict**: OK.
- **Reason**: A point outside E.erase deleted that differs from deleted lies
  outside E. It consequently witnesses A ∖ U nonempty. The separate estimate
  |U| ≤ 12 follows from the 5,4,4 row sizes and the retained point in E ∩ B;
  that estimate is not being used with |A| > 9 to prove properness.

Source custody was checked against
`ExactFiveDistinctThreeCenterContinuation.lean:64` (normal form and support
identities), `ThreeCenterCommonDeletion.lean:51` (three omitted rows), and
`FrontierLiveClosure/Rigid221Closure.lean:1638` (fresh ≠ deleted).
These paths are under `lean/Erdos9796Proof/P97/ATail/`.

### F2: The source authenticates at least three interior anchors

- **Location**: target note:49–53.
- **Quote**: "The inspected source provides at least three interior members, including q,w, not full containment of E."
- **Stated label**: Source qualification.
- **Evidence present**: `firstApex_cardFive_interior_card_ge_three` states the
  lower bound 3; the residual carries an interior pair.
- **Actual label**: PROVEN source-reading statement about those fields.
- **Verdict**: OK.
- **Reason**: The inspected theorem in
  `CardElevenUniqueFourCertificate/Support/UniqueRowProducer/card_five_interior_survivor_pair.lean:89`
  states an intersection-cardinality lower bound, not full containment. The
  corrected proof never requires full containment. No fresh trust claim about
  the theorem's complete dependency graph is made.

### F3: Minimality supplies an outside center and a minimal deletion

- **Location**: target note:65–75, Lemma 1.
- **Quote**: "global minimality supplies z in A ∖ U and a nonempty J ⊆ U"
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: The proof applies minimality to A ∖ U, then minimizes
  deletion cardinality at the resulting center.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: A ∖ U is a smaller nonempty convex-independent carrier. Failure
  of its global K4 gives a center belonging to it. The deletion family is
  finite and contains U, while the empty deletion cannot destroy ambient K4.
  Removing any member from a minimum-cardinality deletion restores K4.

### F4: The radial formula describes every rich ambient radius

- **Location**: target note:77–94, Lemma 2.
- **Quote**: "Λ is exactly the set of rich radii"
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: The one-point restoration argument and the partition
  Cρ = (Cρ ∖ J) ∪ (Cρ ∩ J).
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: Restoring s changes only its radius class. At that radius failure
  before restoration and success after it force precisely three surviving
  points. Every radius represented in J therefore becomes an ambient rich
  radius with |Cρ| = 3 + |Cρ ∩ J|. A rich radius absent from J would survive
  the whole deletion, contradicting its failure. All these radii are positive
  because z lies outside J.

### F5: A deletion with at least two members has a robust ambient center

- **Location**: target note:80–99, Lemma 2 and its consequence.
- **Quote**: "If |J| ≥ 2, z is robust."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: The exhaustive split according to whether two members
  of J share a radius.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: A repeated radius gives at least five ambient points on one
  class. Without a repeated radius, at least two disjoint ambient four-classes
  exist. In either case one deletion leaves K4 at z. For singleton J, F4 gives
  exactly one rich class with exactly four members. Criticality in the
  restored carrier is correctly distinguished from ambient criticality.

### F6: Both stated old-center aliases satisfy the deletion conclusion

- **Location**: target note:101–108, alias check.
- **Quote**: "If O is outside U, it permits z = O and any two distinct E members as J"
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: Actual retained-endpoint criticality for b; exact size
  five and unique rich radius for O.
- **Actual label**: PROVEN, pen-and-paper, with the displayed outside-U conditions.
- **Verdict**: OK.
- **Reason**: The retained endpoint belongs to U; deleting it kills K4 at b,
  and restoring it restores ambient K4. At O, deleting two E members leaves
  three at its sole rich radius, and no other class can become rich by
  deletion. Either restoration leaves four. One deletion cannot suffice, so
  this pair also satisfies minimum cardinality at O. The separate source
  fields `class_card_eq_five` and `unique_fourClass_radius` appear in
  `FirstApexUniqueRadiusResidual.lean:155–163`. Robustness alone would not
  justify this alias. These are conditional admissible witnesses, not claims
  that either outside-U condition has been proved for every residual.

### F7: Every nonrobust center has a unique critical four-class

- **Location**: target note:112–122, Lemma 3.
- **Quote**: "Every member of Kc is critical for c."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: A killing singleton must belong to every ambient rich
  class; different-radius classes are disjoint.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: Global K4 supplies a rich class. The killing singleton rules out
  two rich radii and rules out a class of size at least five. Deleting any
  member of the resulting four-class leaves only three there and cannot
  increase any other class. Positive radius also separates center and source.

### F8: The unique four-classes cover the whole carrier

- **Location**: target note:124–128, Lemma 3.
- **Quote**: "Thus the classes Kc, c ∈ N, cover A."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: Minimality applied independently to A ∖ {x} for every x.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: These erased sets are nonempty because |A| > 9. Their failing
  centers are nonrobust and belong to the erased carrier. Each removed x must
  lie in that center's unique four-class, since otherwise it would survive.
  The union bound gives |A| ≤ 4|N| without requiring disjoint classes.

### F9: The nonrobust-center cut produces the claimed actual crossing row

- **Location**: target note:130–143, theorem; active plan §3b:286–292.
- **Quote**: "Therefore some c ∈ X and t ∈ Kc satisfy t ∉ X."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: F7–F8 and global cardinal minimality.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: |N| ≥ 3, so removing the two distinct blocker centers leaves a
  nonempty X. The robust carrier center O witnesses properness. If every Kc
  stayed in X, X would inherit convex independence and global K4, contradicting
  its smaller cardinality. The escaping center is outside {bq,bw,O,V}; its
  escaped class member is robust or belongs to {bq,bw}. F7 supplies actual
  criticality. `CounterexampleData.Minimal` in
  `P97/U1TwoShortCapReduction.lean:158` explicitly quantifies over arbitrary
  nonempty convex K4 carriers. Its application is not restricted to a
  canonical blocker or one-point deletion.

### F10: Pointwise reselection preserves a total critical-shell system

- **Location**: target note:145–151.
- **Quote**: "leaving every other source's choice fixed"
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: The new full four-class contains t, has positive radius,
  and loses every K4 witness at c after deleting t.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: Those data supply a valid critical row at t. Defining H′(t) with
  that row and retaining H elsewhere preserves each pointwise obligation.
  No claim asserts that H(t) previously differed from c. If t is a consumed
  source, its old choice can change; dependent state is explicitly excluded
  from this preservation claim. The inspected `CriticalShellSystem.overrideAt`
  in `P97/U1CarrierInjection.lean:1356` has the matching interface.

### F11: The note and plan keep physical closure open

- **Location**: target note:153–182; active plan §3b:294–300.
- **Quote**: "no contradiction or terminal reduction is claimed."
- **Stated label**: CONJECTURED / open for the missing geometric obligations.
- **Evidence present**: The theorem supplies no cap location, strict freshness
  relative to U, q,w pair incidence, dependent-state transport, or decrease.
- **Actual label**: CONJECTURED / open for those proposed next steps.
- **Verdict**: OK.
- **Reason**: The completion matrix consistently separates paper deductions
  from missing physical consumers. An additional blocker means a center
  distinct from the four designated centers; it need not be absent from the
  previous system's range. Plan §3b neither strengthens the theorem nor
  treats its crossing source as a strict-fresh physical source.

## Weasel words

No unjustified WLOG, omitted symmetry argument, or conclusory phrase replaces
a proof step in the audited deductions. The old-center aliases retain their
explicit conditional hypotheses. The cardinal and geometric scopes remain
separate.

## Scope conflation

None remains. The source-interior correction, ambient-versus-restored
criticality distinction, paper-versus-Lean evidence distinction, and
pointwise-versus-dependent-state distinction are explicit. The historical
27-point control is used only for context; none of its empirical properties
is an antecedent of the new proof.

## Lean sorry graph

No new compilation or transitive axiom audit was performed or required for
these self-contained paper proofs. Source statements and structures were
inspected to check hypothesis custody. The physical `False` theorem inspected
in `FrontierLiveClosure/Rigid221Closure.lean:1650` still ends with `sorry`,
consistent with the note's open physical target. This report does not promote
that declaration or certify its dependencies.

## Upgrade drift

The new PROVEN labels have explicit paper proofs in the note. Plan §3b cites
them as paper results and retains the physical admission. The retained Pro
response's SHA-256 was recomputed and matches the hash printed in the note;
the response remains external research input rather than proof authority.

## Required before CERTIFIED

Nothing further for the paper claims and scope audited here. Applying a
physical consumer, claiming a Lean-formalized result, or claiming termination
would require its own missing mathematics and validation.
