# Rigid221 bi-survival canonical rows v1 review

**Review result: SOURCE, CUSTODY, AND HYGIENE GO; PROMOTION PENDING GLOBAL BLUEPRINT RECOVERY.**

Date: 2026-08-28

Base revision: `7cf1e60bde589fe27c246c0edbc7ad20e96d6db3`

Lane: `rigid221-bi-survival-canonical-rows-v1-20260828`

## Scope

This review covers `BiSurvivalCanonicalRows.lean`, the strengthened BI residual input in
`Rigid221SourceHeavy.lean`, its live coordinator call, route documentation, and the additive Card18
custody refresh required by the final source bytes.

The checkpoint does not prove the BI residual false. It proves and retains two fixed-center
cross-deletion canonical-row relations and four endpoint omissions while leaving the pre-existing
BI `sorry` visible on the publication spine.

## Author-side source and kernel checks

- The lower module imports only `PhysicalSecondApexCommonDeletion.lean`; it does not import the live
  closure.
- The producer uses the forward direction of
  `cross_deletion_survives_iff_not_mem_selected_support` four times and the first/second packet-row
  identification theorems twice each.
- `lake-build Erdos9796Proof.P97.ATail.BiSurvivalCanonicalRows` passed 8,096 jobs.
- The final governed `Rigid221SourceHeavy` build passed 10,875 jobs.
- The governed `Rigid221Card18Aggregate` build passed 10,888 jobs.
- A current-fingerprint graph walk from `Problem97.erdos97_rhs` reaches the structure, producer,
  immediate BI theorem, and live caller. All 36 nodes in the caller subtree are fresh. The official
  global spine cache cannot currently certify that result because 36 unrelated duplicate-name rows
  keep the repository-wide reference check stale; see the independent-review finding below.
- The producer's axiom closure is exactly `propext`, `Classical.choice`, and `Quot.sound`.
- The BI leaf's closure is those three core axioms plus its pre-existing `sorryAx`.
- A source scan found no `sorry`, custom axiom, `native_decide`, native reduction, unsafe/partial
  implementation, external hook, or solver/certificate path in the new module.

## Source custody

Final source rows before custody publication:

| Path | Bytes | SHA-256 |
| --- | ---: | --- |
| `lean/Erdos9796Proof/P97/ATail/BiSurvivalCanonicalRows.lean` | 4,268 | `702cf6d717119f809258207cf3397ef3e4583155536df836b935a68b31d94af8` |
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean` | 882,784 | `a4a906aa240101bad39424450e08f70161f8923d9d261f3892fad19685324c29` |

Historical labeled/crossed custody v1/v2 and predicate coverage v1-v4 remain immutable. The new
labeled and crossed custody v3 receipts attest unchanged 26- and 27-module tuples, with only the
final `Rigid221SourceHeavy.lean` row changed from v2. Coverage v5 preserves all 188 candidate rows
and refreshes only 37 custody digests across its 38 source rows.

Focused validation passes 121 custody-v3 tests and 10 coverage-v5 tests. The governed runner replays
v1-v4 with 131 passed and 348 skipped, passes 131 live v3/v5 tests, and completes the 10,888-job
aggregate build. An independent final-byte audit also caught and then cleared a mutable-cache
regression in the first v5 draft; the published design caches only immutable canonical payloads and
returns fresh public row copies.

## Frontier accounting

The W1-W4 measure is refined with the number of fixed centers lacking certified cross-deletion
canonical-row alignment. The BI child moves from `(0, 0, 1, 2)` to `(0, 0, 1, 0)`, with constructor
fan-out one and the same BI leaf still open. This is an interface/tractability reduction, not a
claim that the headline theorem or BI child is proved.

## Independent review

The independent `canonical_rows_adversarial_review` returned GO on source semantics and found no
source amendment. It checked the two packets, four row-to-shell identifications, two direct
cross-view support equalities, four endpoint omissions, the producer applications, import
direction, live coordinator, axiom closures, and frontier accounting.

It returned NO-GO for promotion because `proof-blueprint refs --check` reports 36 stale symbols.
A separate read-only diagnosis localized all 36 outside this lane: 35 names collide with unbuilt
copies under `scratch/exact17-child32-audit-v5`, while `main` collides with a skipped
`ErasedNativeEvalGate` export. The lane's declarations and caller have current fingerprints, and a
rooted graph walk reaches them, but the tool cannot refresh its official spine cache until those
foreign duplicate declarations are resolved. This review therefore records local reachability,
not an official proof-blueprint publication certificate.

## Remaining gates

1. recover the repository-wide proof-blueprint reference/spine cache before promotion.

Exact-path staged hygiene passes with no foreign staged path.
