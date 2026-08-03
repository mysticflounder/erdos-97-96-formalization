# V19 21-bit projection census

Date: 2026-08-02

## Headline

The 21 observed-varying literals described one small local basin, not the
whole Boolean master.  At the authenticated 313-record prefix, the master plus
156 completed v19 blockers had exactly four models inside the observed
804-literal invariant cube, but it also had a SAT model outside that cube.

The production worker subsequently rejected those four remaining local models
at iterations 156--159.  Iteration 160 left the cube and introduced two new
varying literals, `block_13_11` and `block_13_4`.  Thus projected closure of the
original 21-bit basin was cheap and is complete, but it is not closure of the
v19 case.

## Authenticated snapshot

- Journal prefix: records `000000.json` through `000312.json`.
- Record count: 313.
- Head SHA-256:
  `2b11e68d7e7b208a98500d80ab6188dc4ad580547086f5cf404ebebf904c1c62`.
- Proposals: 157; completed outcomes: 156; pending proposals: one.
- Every completed outcome was `unsat` and carried a reconstructed full
  825-literal blocker.  No generalized blocker occurred.
- Frozen raw formula SHA-256:
  `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`.
- Reconstructed Boolean master SHA-256:
  `2e2b3a53116bdfaefd76956a6c3e6de095283f54fe017383dae795b53fa5d915`.
- Master assertions: 22,338; semantic Booleans: 825.
- V18 static theorem-sound cuts: 15,684; descriptor SHA-256:
  `0b6a64872273b44b656089f384128267beeca2d8c83382c4431f8b34fde673d7`.
- Dynamic prepass cuts: zero.

The analysis authenticated the journal sequence, hash chain, payload hashes,
assignment hashes, formula identity, exact semantic universe, projected-core
hashes, and reconstruction of every blocker before querying the master.

## Result A: models outside the observed cube

`master + all 156 completed blockers + not(observed invariant cube)` is SAT
(one-thread Z3, 0.87 seconds).

This remains true after any later blocker generated from a model inside that
cube: a full-assignment blocking clause is satisfied by every assignment that
differs on an invariant literal.  Therefore the 804 observed invariants were
sampling invariants, not consequences of the master.

## Result B: exact census inside the cube

Conditioned on the observed 804 literals, exhaustive model blocking finished
in 25.9 seconds and found exactly four models after the first 156 dynamic
blockers.  All four have Hamming weight ten on the 21 projected bits.  Seventeen
of the 21 bits are fixed; the remaining four form two independent orientations:

```text
block_12_3 = not block_12_4
block_6_10 = not block_6_11
```

All four combinations occur.  The sorted-model-mask SHA-256 is
`789954f8dcd6142af7bea52176811835b8fff468498b99fdf21761faea1b7ed2`.
The worker proposed exactly these four models at iterations 156--159 and
rejected each.  Its iteration-160 proposal differs from iteration zero on 12
literals and flips the previously invariant pair
`(block_13_11, block_13_4)` from `(false, true)` to `(true, false)`.

## Result C: feasibility of exhaustive projected closure

- Exhausting one fixed 804-literal basin is realistic; this basin needed four
  more checks after the snapshot.
- Exhausting the global master by the current dynamic rule is not presently a
  realistic closure strategy.  Every theory-UNSAT outcome learns only one
  complete 825-bit assignment.  The worker immediately opened another basin,
  and the observed projection grew from 21 to 23 bits.
- The coarse 21-bit upper bound before using master structure was
  `2^21 - 156 = 2,096,996` assignments.  At the observed approximately
  18 seconds per theory check, literal point-by-point exhaustion of that bound
  would be about 437 single-core days.  The actual first basin was much smaller,
  but there is no authenticated bound here on the number of later basins.

The operational conclusion is to keep the worker as a model generator, but to
mine a smaller theorem-sound core or a cross-basin static constraint.  Full
assignment blockers alone do not demonstrate convergence.

## Reproduction

Analysis source:
`v19_21bit_projection_census.py`, SHA-256
`e70fad5180d5a9ce11833b848d571489c48af6f3c81fdf35985247f801d170db`.

```bash
cd scratch/retained-omission-e1/round5-general-cegar
uv run python -m py_compile v19_21bit_projection_census.py
nice -n 10 uv run python v19_21bit_projection_census.py \
  --journal artifacts-v19-production1/20260802T153331.017335Z-case-pid34172/fresh_DDD_k0_d2_f1/assignment-journal-v19 \
  --records 313 \
  --head 2b11e68d7e7b208a98500d80ab6188dc4ad580547086f5cf404ebebf904c1c62 \
  --max-models 100000 --deadline-seconds 300 --timeout-ms 30000
```

The analysis used one Z3 thread in one `nice -n 10` process.  It did not launch,
pause, alter, or replace a production worker.

## Source identities

```text
round5_cegar_v12.py  8da7127a36dafdbce667edcd44ebef0db62eb2245ad832f373817c4bc28df1c9
round5_cegar_v16.py  b4643c3ae82046dc4497eadbb3c34d10c59ceaf17b015fa5d1bb678f24085c3d
round5_cegar_v17.py  64b4523db0e823b088f4670f7c224fe8ef6501f95d367acfd05207e6d13f3c25
round5_cegar_v18.py  d538401eb80bbe2ba84e2a0a50d1ab5be6cc5458a2a5788a9b13f5c89ba5489d
round5_cegar_v19.py  779ef3fbe2e03b89bd7fe8d3ddaefc61fd569bb29cba9785eeed398c06ec688a
schema_v19.json       ae4a36255888b9eb78f17462da9a1c78428fdfef25ec6c6ae78ea2829ef55cb9
```

## Trust status

This is authenticated external solver evidence about the reconstructed v19
Boolean/QF-LRA encoding.  The static-cut admission metadata is checked and the
journal/blocker identities are hash-authenticated, but the Z3 SAT/UNSAT results
are not proof-carrying certificates and are not kernel-checked Lean theorems.
There is no terminal v19 result artifact at this snapshot.  Nothing here closes
the retained-omission leaf or P97.
