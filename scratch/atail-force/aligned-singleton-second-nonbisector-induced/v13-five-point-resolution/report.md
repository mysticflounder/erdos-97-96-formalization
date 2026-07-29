# v13 five-point QF_NRA resolution

- Terminal status: `ALL_15_SAT_EXACT_RATIONAL_WITNESSES`
- Cases: 15 SAT, 0 UNSAT, 0 UNKNOWN.
- Evidence: exact rational coordinates; every strict orientation and pairwise-distance margin is positive in Fraction arithmetic; the coordinate-pinned formula replays SAT in fresh Z3 and cvc5.
- Trust boundary: these are directly checkable exact SAT witnesses for the recorded QF_NRA formulas, not Lean/kernel proofs and not universal consequences beyond the hash-pinned v13 input.

## Four byte-distinct formula witnesses

| formula | kind | representative | parameters | min orientation | min dist2 | replay |
|---|---:|---|---|---:|---:|---|
| `2c5cb772688f` | B | `q0-1-5-10-18` | `2/17, 30/17, -1/8` | `1171096/22644505` | `16/293` | Z3 `SAT`, cvc5 `SAT` |
| `a74b4a8d74ad` | A | `q0-1-2-5-18` | `7/16, 26/15, -3/7` | `81342/1593869` | `2713/54961` | Z3 `SAT`, cvc5 `SAT` |
| `c5737d432513` | C | `q0-1-2-13-18` | `9/19, 16/19, -5/18` | `51832/215333` | `35378/136357` | Z3 `SAT`, cvc5 `SAT` |
| `fd2ccd143f82` | C | `q0-1-2-16-18` | `9/19, 16/19, -5/18` | `51832/215333` | `35378/136357` | Z3 `SAT`, cvc5 `SAT` |

The parameterizations use rational points on a circle; exact coordinates are in `resolution.json` and are asserted explicitly in each listed `.rational-witness.smt2` file.

## Per-case verdicts

| case | source equalities | formula | status | witness |
|---|---|---|---|---|
| `q0-1-2-16-18` | `4,5,8,19` | `fd2ccd143f82` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-16-18.rational-witness.smt2` |
| `q0-1-10-16-18` | `4,5,13,19` | `fd2ccd143f82` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-16-18.rational-witness.smt2` |
| `q0-1-11-16-18` | `4,5,14,19` | `fd2ccd143f82` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-16-18.rational-witness.smt2` |
| `q0-1-2-5-18` | `0,5,8` | `a74b4a8d74ad` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-5-18.rational-witness.smt2` |
| `q0-1-2-7-18` | `1,5,8` | `a74b4a8d74ad` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-5-18.rational-witness.smt2` |
| `q0-1-2-13-18` | `3,5,8` | `c5737d432513` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-13-18.rational-witness.smt2` |
| `q0-1-2-14-18` | `2,5,8` | `a74b4a8d74ad` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-5-18.rational-witness.smt2` |
| `q0-1-5-10-18` | `0,5,13` | `2c5cb772688f` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-5-10-18.rational-witness.smt2` |
| `q0-1-5-11-18` | `0,5,14` | `2c5cb772688f` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-5-10-18.rational-witness.smt2` |
| `q0-1-7-10-18` | `1,5,13` | `2c5cb772688f` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-5-10-18.rational-witness.smt2` |
| `q0-1-7-11-18` | `1,5,14` | `2c5cb772688f` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-5-10-18.rational-witness.smt2` |
| `q0-1-10-13-18` | `3,5,13` | `c5737d432513` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-13-18.rational-witness.smt2` |
| `q0-1-10-14-18` | `2,5,13` | `a74b4a8d74ad` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-5-18.rational-witness.smt2` |
| `q0-1-11-13-18` | `3,5,14` | `c5737d432513` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-13-18.rational-witness.smt2` |
| `q0-1-11-14-18` | `2,5,14` | `a74b4a8d74ad` | `SAT_EXACT_RATIONAL_WITNESS` | `q0-1-2-5-18.rational-witness.smt2` |

## Replay

Run both commands on each of the four `*.rational-witness.smt2` files:

```bash
z3 -smt2 <witness.smt2>
cvc5 --lang smt2 --nl-cov <witness.smt2>
```

Each command must print exactly `sat`.
