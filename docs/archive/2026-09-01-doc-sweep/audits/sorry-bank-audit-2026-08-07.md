# Sorry-bank audit — 2026-08-07

## Result

No direct theorem-bank closer was found for any of the 30 production `sorry`
declarations outside the explicit active proof lanes at the audit snapshot.
Four leaves have genuinely relevant new source-level infrastructure, but each
still lacks a source-facing producer or finite-coverage bridge:

1. Two exact-12 `Rigid221SourceHeavy` leaves are helped by the committed
   `ExactTwelveRigid221PlacementTransport` adapter.
2. Two TriApex endpoint-equality leaves have matching five-role Kalmanson
   contradiction consumers in `EndpointFreshFiveRoleKalmanson`.

The other 26 declarations have no new hypothesis-applicable bank hit.  The
three `FidelityCheck` sorries are deliberate interface mirrors and were not
counted as independent proof targets.

## Scope and ownership

The report-only analyzer found 40 production source sorries under
`FrontierLiveClosure`, plus three fidelity-harness endpoints.  Ten production
declarations were excluded because the shared ownership record places them in
active proof lanes: the FreshThird family (six), the two Rank-Four exact-17
SourceHeavy children, and the two PairedGrid children.  This left 30 audited
declarations:

| family | audited | direct closers | useful new help |
|---|---:|---:|---:|
| `Rigid221Closure` | 6 | 0 | 0 |
| `Rigid221Placement` | 5 | 0 | 0 |
| `Rigid221SourceHeavy` | 6 | 0 | 2 |
| `TriApexEndpointRetainedOmission` | 7 | 0 | 2 |
| TwoSource Canonical/FirstFiber | 3 | 0 | 0 |
| `TwoDeletionCollision` | 3 | 0 | 0 |
| **total** | **30** | **0** | **4** |

The shared convo also showed concurrent read-only audits of some families,
notably the TriApex endpoint family.  Those audit lanes were treated as
coordination/duplication signals, not as claims to production proof ownership.

## Useful new declarations

### Exact-12 placement transport: material help for two SourceHeavy leaves

Commit `f33e2b40` adds
`ExactTwelveRigid221PlacementTransport.lean`.  Its committed declarations prove
the 42-element ordered `(deleted,v)` placement domain, row-pattern relabeling,
and preservation of the frozen role labeling under an admissible relabeling.
This removes part of the placement bookkeeping for:

* `...exactTwelve...commonDeletion_missingIncidence` (`sorry` near line 13643);
* `...exactTwelve...nextRowOnlyHit` (`sorry` near line 13693).

It does not close either declaration.  `Rigid221SourceHeavy` does not import
the adapter, and no theorem materializes either residual predicate as a frozen
row/certificate instance.  Checked orbit coverage and a contradiction for all
representative cells are also missing.

The worktree currently contains untracked concurrent files implementing a
42-to-21 orbit cover and normalized safe-cube ingress.  They are active work,
not committed theorem-bank declarations, and are therefore not counted as
available results in this audit.

### Five-role Kalmanson terminals: material help for two TriApex leaves

Commit `25271543` added the source-level consumers

* `EndpointFreshFiveRoleKalmanson.false_of_firstCenterEqFreshSource_of_crossHit_of_placement`;
* `EndpointFreshFiveRoleKalmanson.false_of_secondCenterEqFirstSource_of_crossHit_of_placement`.

They match the metric terminal needed by the TriApex equality leaves ending in
`firstCenterEqFreshSource` and `secondCenterEqFirstSource` (sorries near lines
3416 and 3538).  Each still requires an eight-case five-point CCW placement
packet.  The live leaf supplies the endpoint equality and shell hit, but no
placement producer, and its module does not currently import this bank.  The
first missing bridge is therefore a source-faithful placement theorem; after
that, these consumers look like real terminal proofs rather than merely
thematic analogues.

## Important non-hits

* Exact-15/16 BlockerV and exact-17 Kalmanson C--G are real contradiction
  consumers, but they consume the separate EqU/four-row finite-placement
  packet.  None of the audited interfaces produces that packet.
* Exact-12 ordered cuts are individual fixed-pattern consumers; they do not
  provide universal source ingress or exhaustive retained-pattern coverage.
* The FirstFiber crossed-three-row Kalmanson candidate is blocked more strongly
  than a missing import: the live packet contains negative common/opposite-row
  incidence where the consumer needs positive shared support.
* The B1 leaf still lacks a producer for its global three-way terminal
  disjunction.  Existing B1 theorems consume one disjunct; they do not produce
  the disjunction.
* The two remaining common-deletion leaves have only survival/omission
  translations.  No theorem rules out blocker coincidence or a bidirectional
  survival square from their exact hypotheses.
* Downstream aggregate theorems that call one of these sorries were rejected as
  circular, and source theorems with unresolved transitive `sorryAx` were not
  treated as bank closure.

## Coordination and evidence level

The audit was coordinated in `#erdos-97-96-formalization` through convo
messages 3471--3473.  Proof-blueprint session `019fdf9c` is anchored at
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`, under the
configured open target `Problem97.erdos97_rhs`.

This was a read-only source/import/provenance audit.  No production Lean file
was edited and no new build or transitive `#print axioms` audit was run.  A
source-clean declaration or prior green build is treated here as a candidate
consumer/producer, not as closure of an audited leaf.

Family reports:

* `rigid221-closure-bank.md`
* `rigid221-placement-bank.md`
* `rigid221-sourceheavy-bank.md`
* `triapex-bank.md`
* `twosource-bank.md`
* `twodeletion-bank.md`
