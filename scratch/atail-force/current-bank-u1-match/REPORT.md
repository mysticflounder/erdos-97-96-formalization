# Current-bank match to `u1TwoLargeCapObstruction`

Status: theorem-discovery analysis only.  No live producer is proved here.

## Pinned input and replay

`analyze.py` reads the refreshed, current-bank-clean 23-survivor
fixed-`(5,5,5)`, card-12
finite-shadow checkpoint
`formalized_core_shards_after_current_bank_checkpoint.json`, pinned
at SHA-256
`5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a`.
It computes the full equality closure of every selected-row shadow and tests
every injective assignment of five labels to the roles `(a,c,d,e,f)` in the
banked metric contradiction
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`.

Reproduce both checkpoints with:

```bash
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/current-bank-u1-match/analyze.py --check
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/current-bank-u1-match/role_audit.py --check
```

## Exact result

None of the 23 saved shadows already contains all seven hypotheses.  Sixteen
shadows are one equality short and seven are two equalities short.  Looking at
all minimum assignments, rather than only the lexicographically first one,
gives the useful preferred split:

- shards `0,5,8,20,22`: missing only `h4`,
  `dist d c = dist d f`;
- the other eleven one-edge shards: admit an assignment missing only `h5`,
  `dist f a = dist f d`;
- shards `1,2,4,6,12,18,19`: admit an assignment missing exactly `h5` and `h7`,
  where `h7` is `dist e a = dist e c`.

For every preferred `h4` occurrence and all eighteen preferred `h5`
occurrences, the left endpoint is already in the selected exact four-row at
the equality's center and the right endpoint is outside that row.  Thus the
uniform missing content is a cross-incidence/row-extension producer.  The six
`h7` occurrences are not uniform at the selected-row level: three have only
the left endpoint in the row, two have neither endpoint in the row, and one
has only the right endpoint in the row.

The cap-role triples vary substantially.  Therefore this checkpoint does not
support a fixed-label cap-order lemma; any producer must use a structural role
(for example descent history plus global critical-shell incidence), not one
hard-coded cap position.

## Rigor boundary

The banked five-point theorem is a source-proved Euclidean metric
contradiction, but its sibling module is not currently import-reachable from
this project.  Porting that consumer is mechanical once a producer supplies
the missing equalities.  This audit does **not** prove that the fixed card-12
placement covers the live K-A-PAIR hypotheses, does not derive `h4`, `h5`, or
`h7`, and does not turn the finite-shadow survivors into Euclidean models.
