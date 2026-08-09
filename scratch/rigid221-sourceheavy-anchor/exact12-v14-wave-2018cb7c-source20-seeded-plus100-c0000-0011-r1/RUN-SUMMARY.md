# Exact-12 v14 source20 seeded plus-100 wave

This bounded twelve-cell continuation replayed the authenticated 9,050-record
source20 seed set and permitted at most 100 additional refinements per cell.
The live detector contract was
`2db45953b026644ab591ffaa021d8fc6d2f3567d5578f2e64bca22ca191cac95`.
The source20 migration receipt is committed at `911c2906` and identifies the
detector-source commit as `2018cb7c`.

The wave retained 10,070 journal records, adding 1,020 records to the seed set.
Nine cells reached the iteration limit. Cells 0, 3, and 11 stopped at
diagnostic ordered-coverage survivors. Those survivors were not part of the
source20 detector contract used by this campaign.

| Cell | Status | Records | New records | Discovery | Terminal record SHA-256 |
| ---: | --- | ---: | ---: | --- | --- |
| 0 | `STRUCTURALLY_UNRESOLVED` | 723 | 23 | `SAT` | `42602a9e31fec85bd803031f9ba82e1e94b6409e6ae860940df0f5e2cb326e20` |
| 1 | `ITERATION_LIMIT` | 1,151 | 100 | `SAT` | `4419ca94ee42596d5b79d42aaff007c4ce0d92d6ee2a86679edcae4e5d4919a1` |
| 2 | `ITERATION_LIMIT` | 723 | 100 | `SAT` | `f87fe6208ebf0bab0f6b32a671cb38df79aa80be24b4a80773a7eb48d291dd3e` |
| 3 | `STRUCTURALLY_UNRESOLVED` | 784 | 84 | `SAT` | `a3bb4cc69f1bc4a77bec41dac6c0a13afd065e1d59915d0f47feccc6f9538911` |
| 4 | `ITERATION_LIMIT` | 1,104 | 100 | `SAT` | `221dc2da9058bb5a5b4fefdf8ed07ac004665b39a4417353a77d90538d345caa` |
| 5 | `ITERATION_LIMIT` | 780 | 100 | `SAT` | `19d10cfc60dbdf1805aec1976cecc01bc93c04190a363e3ed0efdd4aa75b0c91` |
| 6 | `ITERATION_LIMIT` | 800 | 100 | `SAT` | `b56f5674cbb40a13d779ef8698cbc0b4f0146ec3b7dd8d38304916a21ad1c9ea` |
| 7 | `ITERATION_LIMIT` | 800 | 100 | `SAT` | `452950b8b0736126f712e04072107e3bea04d39966df03dadf1ea5c1d5d49b69` |
| 8 | `ITERATION_LIMIT` | 771 | 100 | `SAT` | `ffbd9e968c6d25b906e2f90e58294fc75094b1bb407bcb53991ec45fd19bc00c` |
| 9 | `ITERATION_LIMIT` | 742 | 100 | `SAT` | `193ebbd2612f4e6ef4cec46777659004b8b1d4f79dcf53f768fb52ce94adcfe1` |
| 10 | `ITERATION_LIMIT` | 1,019 | 100 | `SAT` | `b02b60fea4743b951bef3e407419c02e08a97c642f38c61c5f4b8908b7a48ec1` |
| 11 | `STRUCTURALLY_UNRESOLVED` | 673 | 13 | `SAT` | `4f68bf47c8b8e54a6de1622f3c6c4e792b3533ec46461df5800b02f33cff8bb7` |

Every final output reports `terminal_proof_verified = false`. No cell produced
terminal UNSAT, a terminal CNF or proof, all-cell coverage, a universal
exact-12 lift, or closure of the anchored live theorem.

## Post-wave source23 promotion

The three diagnostic survivors subsequently yielded source-clean positive
cuts. They are appended at proof-backed bank indices 20--22 without reordering
the source20 prefix:

| Cell | Lean source SHA-256 | Learned clause |
| ---: | --- | --- |
| 0 | `35bd114b428c3d6e3f349443ba83cab627e83290c6a8291f86d56f30b3f22498` | `(-396, -612, -1262, -2343, -2747)` |
| 3 | `bbfcd74889fe70e290acc3fcffe76d37488ba2ec51803f99a58e49229e722b0e` | `(-299, -611, -2918)` |
| 11 | `f12a1d2abdfa0fbd48f5077e5fbfe3c44a922e3ed657095a02f7d8739a2e20da` | `(-55, -223, -609, -1920, -2918)` |

The source23 ordered-coverage source SHA-256 is
`c0add1ac9c0fd7e9947970228195aedba44acd38d6a3db366b2fec4bcec57646`.
The complete source23 detector-contract manifest SHA-256 is
`4e7e20ea36f9bba8b5f7557a9542483bbbdbf3c8fcfb3c882423e4952441cb61`.
All three Lean files passed direct one-file elaboration. The focused Python
checks passed 11 ordered-coverage tests, 7 source-order-bank tests, and 7
ordered-cut-adapter tests; Ruff is clean. These cuts strengthen the next finite
campaign only. They do not retroactively change the source20 wave verdicts or
establish terminal/universal closure.
