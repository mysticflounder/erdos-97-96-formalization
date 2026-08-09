# Exact-12 v14 source18 seeded plus-100 wave

This bounded twelve-cell continuation replayed the authenticated source18 seed
journals and permitted at most 100 additional refinements per cell.  The live
detector contract was
`225c4c1e72403df2be1905eb5bcc9439764f093d375e3dbd35fad319d90ea817`.

The wave finished with 9,050 retained journal records.  Ten cells reached the
iteration limit.  Cells 4 and 9 stopped at diagnostic ordered-coverage
survivors; those survivors subsequently yielded source-clean Lean positive
cuts, but those new cuts were not part of this source18 campaign.

| Cell | Status | Records | Discovery | Terminal record SHA-256 |
| ---: | --- | ---: | --- | --- |
| 0 | `ITERATION_LIMIT` | 700 | `SAT` | `e547c7c796f0cc1eb920448af6367ac8b052bd64f27feccfba5217787919555a` |
| 1 | `ITERATION_LIMIT` | 1,051 | `SAT` | `5127b3af82ea334150c0b412d0f78081c1811e267a7107062a5aec4e55722292` |
| 2 | `ITERATION_LIMIT` | 623 | `SAT` | `65dfef877356d261599f06c708bf2d787b4731567695aad2dc9912edffa2eb6d` |
| 3 | `ITERATION_LIMIT` | 700 | `SAT` | `dc37970f479225fcbca60bbac729f8a613ede18040201d0d759a9f7b7295e634` |
| 4 | `STRUCTURALLY_UNRESOLVED` | 1,004 | `SAT` | `80626a97f332e595694b154a216bb3f957123f35bb8e0fa5d3f102ad2b15b5be` |
| 5 | `ITERATION_LIMIT` | 680 | `SAT` | `e62165e773e329c94c79f0e0d7934e3697dad1a0d9fcf56f0a961898ff858723` |
| 6 | `ITERATION_LIMIT` | 700 | `SAT` | `b9fd14c4a36782d9519f03af7575126d67b74debdf913e3e2337c40e06bd7abd` |
| 7 | `ITERATION_LIMIT` | 700 | `SAT` | `122ae935513337ecb229f0229cc7699a0f3036f6ba7fcd78a0e648dced1e92d9` |
| 8 | `ITERATION_LIMIT` | 671 | `SAT` | `0d118d2eefb9be1253c0dd5813f7badda53ced8effdb1603dd7b79d57a029f66` |
| 9 | `STRUCTURALLY_UNRESOLVED` | 642 | `SAT` | `f4f709f630dc1bad852d27667a467e73ff531e9f31462e5715c83d59f0824bba` |
| 10 | `ITERATION_LIMIT` | 919 | `SAT` | `e96f435d3f5213e131e1a9e15da7ed366daf92a490d2af71442c85134fc6592c` |
| 11 | `ITERATION_LIMIT` | 660 | `SAT` | `9652cd0ff41d1cffe6db05056e4d4b8f163370275c2691119c185c7708bd704e` |

No cell produced terminal UNSAT, a verified terminal proof, all-cell coverage,
a universal exact-12 lift, or closure of the anchored live theorem.
