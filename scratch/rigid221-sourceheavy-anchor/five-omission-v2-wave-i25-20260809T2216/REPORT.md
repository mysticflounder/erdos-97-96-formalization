# Exact-12 five-omission structural CEGAR wave, 2026-08-09

## Classification

This is an authenticated finite theorem-mining wave. It is **not** a terminal
bank, all-shard coverage result, universal producer, or Lean closure.

- Shards: deleted labels `0` through `11`.
- Budget: 25 new iterations per shard, 12 shards concurrently.
- Result: 12 authenticated `ITERATION_LIMIT` summaries.
- Learned records: 300 total, 25 per shard.
- Terminal DRAT-verified UNSAT shards: 0.
- Authenticated structural survivors: 0.
- Replay failures or tamper buckets: 0.

Every summary rechecked the journal, source manifests, tool manifest, exact CNF,
and same-labeling boundary. Every record was an
`equality-duplicate-center` certificate with a `centers + triple` core.

## Learned-clause distribution

| Clause length | Count |
| ---: | ---: |
| 4 | 12 |
| 5 | 12 |
| 6 | 125 |
| 7 | 62 |
| 8 | 88 |
| 9 | 1 |

## Boundary-role distribution

For this table, `D` is the deleted label, `B` the selected blocker, `C` one of
the five selected centers that omit `D`, and `O` any of the other five labels.
The two duplicate centers had these unordered role signatures:

| Pair | Count |
| --- | ---: |
| `CO` | 78 |
| `BC` | 66 |
| `CC` | 66 |
| `BO` | 30 |
| `CD` | 27 |
| `BD` | 15 |
| `OO` | 10 |
| `DO` | 8 |

Thus the wave did not confine every core center to the named boundary roles;
126 of 300 cores contain at least one `O` center. The highest-frequency joint
pair/triple signatures were `CC/OOO` (43), `CO/COO` (27), `BC/COO` (25),
`CO/DOO` (21), `BC/OOO` (20), and `CD/OOO` (19).

## Contracts

- Formula contract SHA-256:
  `475162d945dc3db607a62bfd3f040763d434ed61e72e6a4de67d2638daaac4a4`
- Detector contract SHA-256:
  `a0f1be0e49b9dd95accc7ae464ca6cd7b09fa8941cbc4df63f349b5d42d1cc04`
- Tool contract SHA-256:
  `8eff13d62929ba693dc7cc136fb535baceefef53d5f5d1c6e3cfa48bd2479131`

Per-shard summaries and journals retain the base/current formula hashes,
terminal record hash, journal and discovery-CNF hashes, and per-record record,
certificate, proof, nogood, cube, boundary, and assignment hashes.

## Post-wave theorem gate

The generic geometric consumer is already formalized:
`ExactTwelveCarrierIngress.labeledRowPattern_inter_card_le_two` proves that two
distinct relabeled selected rows overlap in at most two labels. The existing
`DuplicateCenterNogood` checker and
`positivelyMatches_of_learnedClause_false` bridge already turn a falsified,
encodable learned clause into the corresponding semantic contradiction.

The remaining promotion gap is therefore computational ingress, not a new
two-circle theorem: this five-omission formula needs a checked terminal
CNF/bank adapter (and a terminal authenticated UNSAT artifact). Until that
adapter and artifact exist, these 300 cuts remain theorem-mining evidence only.
