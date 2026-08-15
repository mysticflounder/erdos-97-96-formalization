# P97 theorem-bank freshness/delta evidence (2026-08-07)

## Frozen canonical registries

The three sibling JSON registries are unchanged since commit `7c3fa141`
(`2026-07-09T20:21:29-07:00`, “land the legacy-shard retirement + general-n
mining package”):

* `certificates/p97_rvol_general_n_mining.json`: 2,148 candidate declarations
  (128,841 lines; file mtime 2026-07-09T20:00:19 -0700).
* `certificates/erdos97_legacy_general_n_mining.json`: 285 candidates (14,549
  lines; same commit, file mtime 2026-07-09T23:24:07 -0700).
* `certificates/erdos_general_theorem_p97_mining.json`: 297 candidates (15,140
  lines; same commit, file mtime 2026-07-09T22:04:14 -0700).

Their companion markdown summaries have the same frozen census provenance,
except `docs/general-n-certificate-bank-mining-2026-07-09.md`, whose latest
content commit is `9548724d` (`2026-08-07T05:43:10-07:00`). That document
explicitly records post-frozen-census live-bank additions; it is a report,
not a regenerated sibling JSON registry.

## Corpus freshness

`nthdegree docs stats --corpus erdos-97-96-formalization-lean` on 2026-08-07
reported 12,493 chunks (6,047 theorem, 3,567 def, 118 lemma, 229 abbrev,
1,654 module, 429 structure, 88 inductive, 342 field, 10 example, 9 unknown;
metadata count 12,496). It was ingested at `2026-08-08T04:22:51Z` from
source commit `9cddbaee` (`2026-08-07T21:20:58-07:00`). The worktree HEAD is
`2f99e274` (`2026-08-07T21:28:09-07:00`), so the corpus is stale by the later
`2f99e274` commit. No build or re-ingest was run (audit is read-only).

## Genuine source deltas after the Round-6 comprehensive bank audit

The latest matching prior memory is Round-6, 2026-08-03: recursive registry
scans found no `FreshThird`, non-hit, equal-center, exact-four, or
endpoint-omission declaration in the three JSON banks. The following are
actual source additions after that baseline, not registry metadata hits.

### Exact-fifteen BlockerV / three-equality bank

Commit `375a963d` (`2026-08-06T17:24:44-07:00`, “bank exact-fifteen BlockerV
four-row obstruction”) added
`lean/Erdos9796Proof/P97/ATail/BlockerVExactFifteenFourRowCoverage.lean`.
Its public coverage declarations are `exists_metricMotif_of_pairwiseSeparated`
(line 267), `false_of_pairwiseSeparated_realizedRows` (505),
`false_of_positionEmbedding_realizedRows` (720), and
`false_of_positionEmbedding_membershipRows` (739). The same commit added
three general cyclic metric consumers to
`KalmansonThreeEqualitySchemas.lean`: 
`false_of_six_ccw_three_shell_equalities_140_250_354` (741),
`false_of_five_ccw_three_shell_equalities_043_140_203` (814), and
`false_of_five_ccw_three_shell_equalities_103_243_340` (885).

### Exact-sixteen BlockerV / four-equality bank

Commit `9548724d` (`2026-08-07T05:43:10-07:00`, “close exact-16 BlockerV
residual”) added
`lean/Erdos9796Proof/P97/ATail/BlockerVExactSixteenFourRowCoverage.lean`.
The public coverage declarations are `metricObstructionOccurs_of_pairwiseSeparated`
(246), `false_of_pairwiseSeparated_realizedRows` (524),
`false_of_positionEmbedding_realizedRows` (593), and
`false_of_positionEmbedding_membershipRows` (611). It also added the four
cardinality-independent A/B Kalmanson consumers to
`KalmansonFourEqualitySchemas.lean`: A increasing/decreasing (lines 72/108)
and B increasing/decreasing (144/178), with selected-row adapters added in
the same file.

### Exact-seventeen Kalmanson schema family

Commit `37771f43` (`2026-08-07T09:57:30-07:00`, “Bank Rigid221 selected-row
Kalmanson schemas”) added schemas C–F in
`lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean`: C (five
shell equalities), D (six-shell), E (five-shell), and F (six-shell), each with
increasing/decreasing consumers and selected-row adapters (public declaration
blocks begin at lines 213, 373, 506, and 634 respectively).

Commit `2106a964` (`2026-08-07T10:23:42-07:00`, “Bank exact-17 Kalmanson
schema G”) added schema G in the same file: increasing/decreasing consumers
(lines 786/812) and selected-row adapters (842/877).

### Other exact-cardinality/frontier additions (not sibling general-n JSON)

Commit `9cddbaee` (`2026-08-07T21:20:58-07:00`, “Replay exact-12 ordered v4
cuts in Lean”) added ten `FrontierLiveClosure/ExactTwelveRigid221*.lean`
modules. They contain finite ordered-cut ingress/coverage declarations, but
are not part of the three canonical sibling theorem-bank registries.

The later HEAD commit `2f99e274` (`2026-08-07T21:28:09-07:00`, “Bank exact-17
cap reductions and isolate cap-nine frontier”) modifies
`FrontierLiveClosure/Rigid221SourceHeavy.lean` with exact-17 finite boundary
order/cut declarations. These are source/frontier declarations, not additions
to the canonical JSON banks; the corpus freshness footer therefore does not
cover them.

## Scope conclusion

The canonical JSON registries themselves have no post-2026-07-09 declaration
delta. The genuine post-Round-6 source delta is the exact-15/16 BlockerV
coverage plus Kalmanson three-equality A/B and four-equality C–G families,
with exact-12/exact-17 finite frontier modules separate from the registries.
This audit makes no claim that any listed declaration applies to an individual
live `sorry`.
