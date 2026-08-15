# Child46 triangle-support schema audit

Date: 2026-08-14. Read-only; no Lean build, solver, network, Git mutation, or
Rigid221 access.

## Evidence and bounded enumeration

The authenticated source-semantic replay packet is
`scratch/exact17-child46-production-8205802e/source-semantic-replay.json`,
SHA-256 `cf7b74eaa4983852f9894995e77fbdef56fdc857dc1961b187d41df194904cbd`.
It binds source-model digest
`95fe79edcde4d26de2c388fd314d3834d4884081ebb6d00ef9c355ba0e305896`, parent
`e74795bf5dcf5748e9872bf37f115c8d6237d0f3b0332d065a711bcbfc8aabe5`, root
`106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2`, and
replay `afaf274986af34314f41fe38f0f048eed965e0477ad16dd9c42d32670d66297c`.
The packet deliberately marks its metric mine `DEFERRED`; the producer-bank
enumeration and exact source-model replay are therefore evidence, not Lean
promotion.

Re-enumerating the exact 17 source rows with the checked
`enumerate_two_kalmanson_cancellations` interface gave 120 records in the
selected orientation. The 69 distinct row-step support sets agree with the
reported mine; 50 are subset-minimal and 25 are the minimum three-row / six-hit
supports. Each of those 25 has two checked core records. The 25 split into 20
with disjoint center and endpoint sets and 5 with exactly one center/endpoint
overlap. The 25 supports are pairwise distinct even under the 17-cycle
dihedral relabelings. Their 50 core records have varied path-length signatures
and Kalmanson form pairs, so the six-hit incidence shape does not determine a
common quad/permutation/path certificate.

## Lean candidates and reuse preflight

The one bounded Lean-corpus reuse preflight was run for the concrete candidate
“a source-valid exact-seventeen three-row/two-orientation triangle occurrence
schema with checked weighted cancellation paths and a guarded source clause.”
It found the existing generic route:

- `GenericRowNogoodCertificate.WeightedKalmansonCancellationData` and
  `false_of_weightedKalmansonCancellationData_of_check` (module
  `.../FrontierLiveClosure/GenericRowNogoodCertificate.lean`, lines 621--730)
  are cardinality-generic and prove the geometric contradiction from positive
  row incidences plus checked cancellation data.
- `WeightedSourceOccurrence` and `WeightedSourceOccurrence.check` in
  `BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean` lines 37--46 and
  124--130 package forward/reflected choices, hit coverage, and the two checked
  certificates.
- `sourceAssign_weightedOccurrenceClause`, lines 202--219, is the immediate
  source-CNF consumer. It is already the desired parametric theorem over any
  checked occurrence; `weightedOccurrenceClause` supplies the guarded clause.

The first missing antecedent for the 25 mined supports is not geometric
soundness of the generic theorem: it is Lean-authenticated, exact
forward/reverse `WeightedKalmansonCancellationData` and hit-coverage records
for each support. A triangle incidence predicate alone cannot synthesize those
quads, forms, permutations, or equality paths. Treating the predicate as the
certificate would be circular/unsound.

The active Child46 module already follows this schema: it imports the source
bridge and uses nine ground `WeightedSourceOccurrence`s (lines 391--418), then
proves the finite bridge and extended-CNF source theorem (lines 420--449).
The module currently imports FortyFifth plus the source bridge; the bridge
imports the generic cancellation consumer and Sixteenth support machinery.

## Classification and recommendation

- Existing generic weighted theorem/schema: **PROVEN**, conditional on its
  explicit `check` and positive-row hypotheses.
- The 25 exact support shapes and producer-bank records: **EMPIRICAL**
  (offline exact replay/producer checks; no Lean theorem for these 25 was
  inspected or built).
- A new compact triangle-only generator theorem: **CONJECTURED / not
  established**. No matching declaration appeared in the one preflight, and
  the exact core/path diversity defeats a fixed template.

Recommendation: **(a) reuse the existing Lean theorem schema plus a finite
ground bridge**. This is stronger and safer than a raw 25-clause dump, but the
bridge must retain the 25 exact occurrence records (and their checked
forward/reverse certificates). Do not claim that “20 disjoint + 5 overlap” is
itself a source-valid parametric proof or replace the checked path data with a
triangle predicate. If a new Lean bridge cannot be authored and checked, fall
back to (b) producer-audited ground supports; do not use (c), since the generic
source-valid consumer already supplies a non-circular promotion route.

## Reuse-preflight provenance

The preflight was performed against the Lean corpus at repository revision
`fe72b36f793f9133526bff5769ed4450d6a862db` (2026-08-14 21:16 PDT). No source
files were edited. `WeightedSourceBridge.lean` and the replay packet are
currently untracked concurrent artifacts; their observed hashes are recorded
above for the packet and below for source navigation:

- `BlockerVExactSeventeenFortySixthModelRefinements.lean`:
  `b8d285ac9b85821ac7634103d9fa8fe9588747c0a57659a28e6e1dee4a9ae127`
- `BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean`:
  `7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92`
- `FrontierLiveClosure/GenericRowNogoodCertificate.lean`:
  `7abfcb6e3d0982dc504a29b3771cb634873d995724fd8c87f4811e412b39e84d`
- `census/atail_force/producer_bank.py`:
  `d1a13526ecf8786e716fc6bb36954c53f0e7787d771b6cadaf0f30a84e76f820`
