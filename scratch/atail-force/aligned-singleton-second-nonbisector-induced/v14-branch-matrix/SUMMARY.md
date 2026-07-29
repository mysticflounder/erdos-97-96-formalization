# v14 local branch matrix

Fresh, no-resume runs of `../cegar.py` with the checked-in v14 defaults made
explicit in `run_matrix.sh`:

- outer timeout: 60,000 ms
- inner timeout: 60,000 ms
- wall timeout: 600 s
- maximum iterations: 256
- maximum cuts: 4,096
- direct-cut batch: 256
- core shrink: 16 checks at 5,000 ms
- checkpoint validation timeout: 60,000 ms
- random seed: 0 (script default)

The script self-test passed before the matrix run.

| Branch | Terminal status | Cuts | Named occurrences | Survivor classes | Elapsed |
|---|---:|---:|---:|---:|---:|
| local / critical / new | `CUT_BUDGET` | 4,096 | 33 | none emitted | 26.149 s |
| local / robust / reuse-second | `UNKNOWN_FAIL_CLOSED` (outer timeout) | 0 | 165 | none emitted | 63.732 s |
| local / robust / new | `UNKNOWN_FAIL_CLOSED` (outer timeout) | 0 | 165 | none emitted | 63.785 s |

The critical/new cut bank consists of 4,081 direct four-point Kalmanson cuts,
13 direct five-point Euclidean cuts, and 2 direct sparse six-point Euclidean
cuts. Both robust runs stopped on the first outer call.

All process exit codes were zero and all stderr logs were empty. For every
branch, the result JSON and checkpoint agree on branch metadata, cut count, and
implementation SHA-256. Their recorded implementation hash matches the current
`cegar.py`:

`b09301016aabdb65a97eade8b3a38a043bca009feb69de31a235c739dfd0c7a7`

Artifact SHA-256 values:

| Artifact | SHA-256 |
|---|---|
| `local-critical-new.json` | `cf7b5213750cfe4c7c1de2f419d13982b11e828de5d6f52841201480f5bc24ef` |
| `local-critical-new.checkpoint.json` | `967e51963bbcad9a788aced593988fdf4b185b46f77189f1da07cd7b88099611` |
| `local-robust-reuse-second.json` | `a120bbe9e873392cab22964482a29ed0b694824f69e38d09f9b6d4653f4a98dc` |
| `local-robust-reuse-second.checkpoint.json` | `da88f2d294710e016a8a8f65520232f1c713858661d60ac9f18e6ce26bdefe9f` |
| `local-robust-new.json` | `0cb8427cb58485d01b75a95cfc40f695ecb144822fbc602efc1bfbcb11e3b93e` |
| `local-robust-new.checkpoint.json` | `ba4761b19e1d34f3ee5dc1d246d9d030993654ce70f4d455185e1395321e997f` |

## Scope and trust

Every result is explicitly `INDUCED_NECESSARY_CONDITION_ONLY`. The original
snapshot is frozen before fresh witnesses are generated, witness-producing
quantified projections do not recurse over generated witnesses, and exact-four
exclusions range over all named occurrences. The encoding also leaves opaque
carrier points outside the frozen snapshot, recursive deletion robustness for
generated witnesses, exact rich-class cardinality, full minimal unique-four
cover, global K4 outside the selected tier/original centers, cap-cardinality
witnesses, and `noM44`.

The robust branches create four fresh survival roles for each of the 33
original roles, hence 165 named occurrences. This is a deliberate relaxed
projection, not an invalid role configuration. Solver evidence here is neither
a Lean theorem nor a Euclidean-coordinate realization.
