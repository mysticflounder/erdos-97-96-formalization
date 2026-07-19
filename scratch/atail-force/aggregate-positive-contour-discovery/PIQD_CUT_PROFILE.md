# piqd product-box CEGAR cut profile

Date: 2026-07-19

This is a read-only profile of the live card-ten product-box CEGAR run.  The
profile did not signal the driver, the piqd daemon, or either solver process.
It inspected atomic checkpoints and sampled the Python process.  All claims
below are about the encoded finite card-ten search, not a Lean theorem and not
a proof of the uniform product-box statement.

## Checkpoints measured

The first piqd run resumed the 42-iteration / 10,752-cut Z3 bank and used
1,024 cuts per batch.  Its last atomic checkpoint has:

- 70 iterations and 39,266 exactly replayable cut certificates;
- 90 outer variables;
- 3,962 permanent row-cardinality, pair-alternation, and strong-connectivity
  CNF clauses;
- terminal `INNER_UNKNOWN` with Z3 reason `canceled` after the final inner
  batch had added 866 verified cuts.  The checkpoint does not establish why
  Z3 reported cancellation.

The subsequent 4,096-cut pilot resumed that checkpoint.  Its first new
checkpoint, iteration 71, has 43,362 verified cuts.  The outer call used
43,228 clauses and took 99.231 seconds end-to-end, of which CaDiCaL reported
98.825 seconds.  The iteration produced the full requested 4,096 cuts and
reached `BATCH_LIMIT`.

## Where time goes

The bottleneck changes as the cut bank grows.

Between the iteration-60 and iteration-68 checkpoints, elapsed run time grew
from 250.499 to 416.623 seconds.  The eight outer calls account for 59.948 of
those 166.124 seconds (36.1%).  The remaining 106.177 seconds include the
inner query, exact certificate construction/replay, and checkpointing, or
13.272 seconds per iteration.

A five-second, 10-millisecond process sample taken during an inner batch found
351 of 411 main-thread samples (85.4%) inside
`Z3_solver_check_assumptions`.  The stack was dominated by Z3's linear
arithmetic bound propagation.  This matches the source: the inner problem is
Boolean/cardinality data, but target-count equality and interval-profile
comparison are expressed with arithmetic `Sum (If ... 1 0)` terms.

At the larger bank, the outer call itself becomes dominant and highly
variable:

| iteration | learned cuts before call | clauses | CaDiCaL wall |
|---:|---:|---:|---:|
| 63 | 31,232 | 35,194 | 7.065 s |
| 68 | 36,352 | 40,314 | 23.625 s |
| 69 | 37,376 | 41,338 | 85.644 s |
| 71 | 39,266 | 43,228 | 98.825 s |

The curve is not monotone because each call asks for a different SAT model,
but the 85--99 second calls show that the outer CaDiCaL call is now the
per-iteration bottleneck.  Merely increasing the solver wall budget does not
address it.

Checkpoint serialization is not dominant.  A 43,918,347-byte checkpoint
round trip took 0.158 seconds to parse, 0.156 seconds to serialize, and 0.006
seconds to write on this host (0.320 seconds total).  The driver's additional
hashing has not been separately timed, so this is a lower bound for its full
checkpoint overhead.

## Cut duplication and orbit structure

Exact support deduplication is working: the 39,266-cut checkpoint has zero
literal duplicate supports.

Dihedral canonicalization is not the useful next optimization.  Under the 20
rotations/reflections of the card-ten cyclic order, the bank has:

- 36,897 distinct dihedral support orbits;
- only 2,369 supports beyond one representative per orbit;
- median and 90th-percentile bank occupancy of one support per orbit;
- no fully populated orbit, with maximum occupancy 16;
- a full orbit union of 737,500 supports, of which the bank contains only
  5.324%.

Thus eagerly adding every dihedral image would inflate this bank by about
18.8x.  It may reduce symmetry-related outer models, but the current bank is
not spending most of its work rediscovering literal dihedral copies.  Full
orbit closure is not justified by these data.

Inclusion subsumption is the large redundancy:

- 11,836 of 39,266 supports (30.15%) strictly contain another banked support;
- only 27,430 supports are inclusion-minimal;
- 11,694 redundant supports are superseded within the same inner batch;
- 142 are superseded by a smaller support discovered in a later batch;
- zero supports are superseded by a smaller support from a prior batch.

The last zero is an encoding sanity check.  A current outer table cannot
contain a support already blocked by a prior smaller cut.  Same-batch
redundancy is possible because all pair supports are collected before the
batch is added to the outer map.

The 4,096-cut pilot amplified this effect.  It grew the certificate bank by
4,096, but the inclusion-minimal bank grew by only 2,023:

| checkpoint | all cuts | inclusion-minimal cuts | redundant cuts |
|---|---:|---:|---:|
| iteration 70 | 39,266 | 27,430 | 11,836 |
| iteration 71 | 43,362 | 29,453 | 13,909 |

## Safe optimization: emit the inclusion-minimal cut antichain

For support sets `A ⊂ B`, the outer clauses are

```text
C_A = OR {not m_a | a in A}
C_B = OR {not m_b | b in B}.
```

`C_A` logically implies `C_B`.  Therefore removing `C_B` while retaining
`C_A` leaves the outer formula equivalent.  This is a propositional
subsumption step; it does not depend on the mathematical interpretation of a
cut.

The replay-safe implementation is:

1. continue to fail-closed verify every proposed cut certificate;
2. keep the full append-only certificate/discovery log if audit history is
   desired;
3. deterministically compute the inclusion-minimal support antichain before
   rendering the piqd DIMACS;
4. emit clauses only for that active antichain;
5. for every omitted support, record or assert the retained strict subset that
   subsumes it;
6. on resume, replay all certificates first and reconstruct the same active
   antichain; then run the existing complete-model CNF replay.

At iteration 70 this changes the next outer formula from
`3,962 + 39,266 = 43,228` clauses to
`3,962 + 27,430 = 31,392` clauses, a 27.39% reduction of the complete CNF and
a 30.15% reduction of its learned-cut block.  At iteration 71 it would reduce
47,324 clauses to 33,415 (29.39%).  This directly attacks the cost that has
grown to 85--99 seconds per outer SAT call.

Batch-local minimization before banking is also exact and avoids serializing
many cuts that add no logical force.  Global minimization at DIMACS render is
still needed because 142 older cuts were superseded by later discoveries.

Acceptance gates for this optimization should be:

- exact certificate replay unchanged;
- a checked witness that every dropped clause is subsumed by a retained
  clause;
- identical SAT/UNSAT results on the known card-eight and card-nine smoke
  instances;
- complete replay of every returned SAT model against the compacted CNF;
- a fresh DRAT check if a compacted terminal CNF becomes UNSAT.

## Secondary inner-query result

An auxiliary exact pseudo-Boolean rewrite replaced every arithmetic
count/profile constraint by the corresponding signed `PbEq`/`PbGe`
constraint and continued to pass the existing `verify_pair` replay on every
returned pair.  On one exact iteration-68 row:

| requested supports | current arithmetic inner | PB rewrite | speedup |
|---:|---:|---:|---:|
| 64 | 0.546 s | 0.110 s | 4.97x |
| 1,024 | 12.915 s | 8.376 s | 1.54x |

This is promising because it removes the observed linear-arithmetic hot path,
but it is only a one-row performance measurement.  The rewrite has not yet
been exhaustively equivalence-tested over the known small-n surfaces, so it is
not the primary recommendation.  Promote it only after an encoding-equivalence
gate and the existing exact pair replay.

## Epistemic limits

- Timing measurements are host-, row-, and solver-state-specific.  They
  establish current bottlenecks, not asymptotic complexity.
- Subsumption and dihedral counts are exact for the named atomic checkpoint
  files as parsed by `profile_product_cut_bank.py`.
- The clause-subsumption equivalence is exact propositional reasoning.
- SAT models remain externally generated candidates and must keep passing the
  existing complete clause/row replay.
- An eventual piqd/CaDiCaL `UNSAT` is external finite evidence until its CNF
  encoding is audited and its proof is checked.  It does not by itself close a
  Lean `sorry` or establish the uniform card-`>= 8` theorem.

Reproduction helpers:

- `profile_product_cut_bank.py` computes support-size, dihedral-orbit, and
  inclusion-subsumption statistics from an atomic checkpoint.
- `profile_product_inner_pb.py` performs the arithmetic-versus-PB benchmark on
  a complete piqd model while exact-replaying every produced pair.
