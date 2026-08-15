# Adversarial audit: current-order weighted probe

Audit scope: `probe.py`, its `analysis.json`, the pinned Child43 custody
artifacts, the cross-wave metadata, `census/atail_force/producer_bank.py`, and
the exact-seventeen weighted source bridge.  No solver, PIQD request, Lean
build, or implementation edit was performed.

## Verdict

**BLOCK for promotion to a source-valid Lean occurrence or CNF bank.**  The
finite replay and the two finite Python cancellation witnesses pass their
bounded checks, but the probe's `SOURCE-VALID` classification is stronger than
the evidence it records.  It is a useful discovery result, not a completed
source bridge.

## Custody and replay

The probe authenticates the initial bytes of the Child43 model, final, and CNF
at `probe.py:133-140`, delegates model/final binding to Child43's
`validate_custody`, and independently streams all `5,848,592` CNF clauses at
`probe.py:77-108`.  The recorded hashes, job, variable count, clause count,
and SAT result agree with the pinned artifacts.  The manifest's pinned SHA is
carried through the final record, but the probe does not open and hash the
manifest itself.

The selector blocker from the initial audit is closed.  The refreshed probe
explicitly checks the `next_centers` and `selected_orders` assignment bits and
requires `[0]` and `[1]` (`probe.py:141-148`), while also comparing the imported
Child43 order with the pinned `ORDER`.  The refreshed `analysis.json` records
that binding as authenticated.  The DIMACS parser still does not independently
reject out-of-range literals, malformed header arity, or trailing non-DIMACS
text; the exact pinned CNF hash makes those parser weaknesses non-exploitable
without changing the authenticated file, but they remain gaps in the
purported independent parser.

## 4,760 terms and equality certificates

The enumeration at `probe.py:159-170` is exactly
`C(17,4) * 2 = 4,760`, covering the two named forms with weight exactly `1`.
It is complete for those unit terms, and reports two zero-delta terms.  It is
not complete for positive weighted combinations: a cancellation involving
multiple nonzero-delta terms is outside the search.  The equality closure is
computed from all 17 decoded rows, and the producer checker constructs a
pairing/path certificate for each accepted term (`producer_bank.py:1325-1425`);
those are valid finite Python checks.

The two recorded forward witnesses are:

* positions `(1,2,4,13)`, labels `(6,8,10,5)`, `adjacentSides`, weight 1;
* positions `(8,11,12,16)`, labels `(2,3,4,14)`, `innerOuter`, weight 1.

An independent bounded enumeration under the reversed order also finds the
corresponding reversed terms `(14,4,3,2)` (`innerOuter`) and `(5,10,8,6)`
(`adjacentSides`).  However, the probe calls
`certify_weighted_kalmanson_cancellation` only for the two forward terms at
`probe.py:172-190`; it neither stores nor checks the reflected certificates,
choices, or reflected hit coverage needed by the exact-seventeen bridge.

## Source-validity and novelty

`producer_bank.py:1429-1455` labels the record with a Lean consumer, but
`_require_weighted_kalmanson_cancellation_consumer` is only a source-text
fragment check (`producer_bank.py:776-797`).  No Lean
`WeightedKalmansonCancellationData.check` or source theorem is invoked.  The
probe therefore proves a finite equality/path witness, not the universal
`SourceRealization` implication.  In particular, `analysis.json`'s
`SOURCE-VALID`/“PROVEN” wording must be downgraded to finite,
source-shaped/producer-checked evidence.

The Child38--42 parent bank is authenticated by the imported Child43 miner and
contains 632 oriented supports.  Both new supports are reported as neither
exactly present nor strictly subsumed, so the *finite support novelty* result
passes.  The cross-wave metadata is hash-pinned and reports 358 source-valid
records, but this probe only counts records and tests for a family string at
`probe.py:192-219`; it does not reconstruct or independently validate those
records.  Novelty therefore does not establish a new Lean theorem or a
complete cross-wave source classification.

## Required Lean translation

The exact bridge is
`BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean:37-46,124-130`.
An accepted occurrence must provide `hits`, separate `forwardChoices` and
`reverseChoices`, and separate weighted data records, then prove both data
checks and forward/reflected support coverage.  The source theorem at
`:175-219` selects the matching orientation and calls the generic consumer;
the Python textual consumer check is not a substitute.

For the first witness, the positional forward hit set extracted from the
paths is
`{(2,1),(2,13),(13,4),(13,1),(1,13),(1,4)}`.  For the second it is
`{(11,12),(11,16),(8,16),(8,5),(5,8),(5,12),(12,5),(12,8)}`.
These must be converted into exact `Hit`/`RowChoice Label` values under the
named order.  The reflected data must additionally be constructed from the
two reversed terms above, with its own pairings and paths, and the
`Fin.rev`-reflected coverage must be proved.  Finally, the four guarded
clauses (two named orders times two orientations) and a kernel-checked
`WeightedSourceOccurrence.check = true` are required before
`sourceAssign_weightedOccurrenceClause` can be used.

## Promotion gate

Keep `analysis.json` as a finite discovery artifact.  Do not promote either
candidate until the manifest is independently opened/hashed, both forward and
reflected weighted data pass the Lean-shaped
checks, and the exact-seventeen `WeightedSourceOccurrence` is constructed and
kernel-checked.  The current evidence is sufficient to prioritize these two
supports, but not to publish them as source-valid clauses.

## Delta conclusion

The explicit selector binding removes one custody blocker, but does not change
the promotion verdict.  In the current checkout the only concrete
`WeightedSourceOccurrence` implementation visible is the generic bridge
`BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean`; no concrete bank
instantiating these two candidates is yet available to audit.  The remaining
blockers are the missing reflected Lean certificates/coverage, the absence of
a kernel-checked occurrence and four guarded clauses, the source-text-only
producer check, and the un-opened manifest pin.  The `analysis.json` claim
that finite producer certification plus consumer metadata is “PROVEN” remains
unsound even after selector hardening.
