# P7 hard-shard persistent-discovery A/B canary

Date: 2026-08-03

Status: completed; production promotion **closed**.

This is a performance/discovery canary only. It is not a new mathematical
certificate, a replay of the frozen v2 run, or closure of the P97 search.

## Contract exercised

The benchmark compared the existing fresh subprocess CaDiCaL discovery arm
with the P7 persistent IPASIR CaDiCaL discovery arm in separate workers and
fresh run directories. Both arms used the same authenticated projected-static
v3 configuration, depth-5 shard units, current-hash prefix bank, two-model
checkpoint cap, and 120-second solver timeout. The persistent arm used:

```text
library: /Users/adam/cadical/build/libcadical.so
CaDiCaL: 3.0.0
library sha256: 115744ffabb4375dd43add0fc2846242bc23e822f05b15f5cc3cff4788cb29b6
```

The persistent arm retained the fresh proof-producing subprocess and DRAT
checker for terminal UNSAT. No terminal result was accepted from the
incremental solver alone.

## Provenance repair

The historical prefix bank was correctly rejected by the v3 loader because
its producer-script hash was stale. I did not bypass that check. I rebuilt the
same pinned 24,666-record source prefix in a new namespace with the current
producer. The rebuilt bank has:

```text
bank root sha256:    645a4092854d445134c1ca691f94add287da0a69886d5cac69ef5c32afbcdd01
source prefix sha256: 7f31d598bcf42083a99f0af20abb9b461c015e32acab8ff58984c139544c8ab9
source records:      24666
kept antichain:      13534
```

The failed stale-bank namespace and an earlier misconfigured subprocess-only
“persistent” attempt are preserved as diagnostics and are excluded from the
comparison.

## Measurements

| family | subprocess | persistent | persistent/subprocess | RSS ratio | terminal result |
| --- | ---: | ---: | ---: | ---: | --- |
| shell:4 | 10.551 models/h | 15.361 models/h | 1.456x | 1.002x | both checkpoint after 2 models |
| frontier:12 | 0 models/h | 0 models/h | n/a | 1.000x | both `SHARD_STRUCTURAL_UNSAT_VERIFIED`, 71,853 clauses, DRAT verified |
| shared:24 | 0 models/h | 0 models/h | n/a | 1.000x | both `SHARD_STRUCTURAL_UNSAT_VERIFIED`, 71,853 clauses, DRAT verified |

All three pairs agreed on status and counts. The two terminal families agreed
on the terminal clause count and exercised the fresh DRAT path. The persistent
shell arm recorded two discovery solves and one formula rebuild; the terminal
families recorded one discovery solve and one rebuild each.

The authenticated raw report and benchmark manifest are at:

- `scratch/p97-distinct-distance-lane/p7-canary-20260803/hard-shard-ab/report.json`
- `scratch/p97-distinct-distance-lane/p7-canary-20260803/hard-shard-ab/benchmark-manifest.json`

The report hashes are:

```text
report:   63dc4583712d937e4e9848f1de0826eeb665c99bd4b9f7c1a1b5304f54e3a34d
manifest: b23cf8553df0848fa5dea1345d64ae5fa6739276a015fbe766a6d29770c70fdb
```

The raw report was emitted just before the status-label refinement in the
benchmark code. Its authenticated booleans record `terminal_gate_pass: true`
and `family_pass_count: 0`; its older string label says
`P7_PROMOTION_CLOSED_TERMINAL_GATE_INCOMPLETE`. The code now distinguishes
that case as the performance-gate failure recorded below. The raw JSON is left
unchanged so its published hash remains valid.

## Gate decision

The P7 promotion contract requires at least two of three representative
families to achieve a persistent-over-subprocess throughput ratio of at least
1.5x, with RSS no worse than 1.25x, and requires terminal status agreement.
The terminal agreement and RSS portions passed. The performance portion did
not: only one family produced discovery models, and its measured ratio was
1.455826x, just below the 1.5x threshold. Therefore the result is:

```text
P7_PROMOTION_CLOSED_PERFORMANCE_GATE_INCOMPLETE
```

This is a failed promotion experiment, not evidence against correctness of
the persistent adapter. The next exact move is a calibrated SAT-family
throughput canary: choose two additional representative families that are
known to reach the bounded SAT-discovery path, run the same authenticated
three-family gate with a larger fixed model cap, and keep production opt-in
closed until the two-of-three threshold is met. If the larger sample remains
below 1.5x, retain the adapter as an experimental discovery backend and focus
on reducing loader/CNF startup costs before another promotion attempt.
