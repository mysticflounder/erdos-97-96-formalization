# Finite lower-card product-box decision plan

Date: 2026-07-19

## Decision

Finish card ten by **certified parallel cube-and-conquer on the frozen pruned
CNF**.  Do not spend another long budget on the same monolithic CaDiCaL call.
If a cube is SAT, exact-replay its model and resume CEGAR only inside the
surviving cube, preferably with a persistent incremental CaDiCaL instance.
If every cube is UNSAT, certify both the cube cover and every cube proof.

Card eleven is not presently a plausible blind literal-CEGAR completion on
one 24-core host.  It is plausible only conditionally:

1. a constructive odd-card counterexample can be obtained from the card-twelve
   family and exactly replayed; or
2. card ten demonstrates that a small certified cube frontier plus persistent
   learned clauses controls the outer search, and the same machinery is
   combined with symmetry breaking or generalized cuts.

This plan decides only the finite product-box abstraction.  Even a complete
card-ten/card-eleven certificate still needs the finite theorem's Lean
encoding and its on-spine cardinality adapter before it closes a source
`sorry`.  The cardinality-uniform product-box theorem is refuted from card
twelve and must not be inferred from lower-card UNSAT results.

## Frozen card-ten state

The artifact to decide is:

```text
/tmp/p97-product-antichain-n10-piqd-pruned.cnf
```

Its audited metadata is:

- SHA-256
  `d3e6c0283b779d02b07abf99c1469c64862d7231c7bf2ed1b5e322550ec2218c`;
- 90 Boolean row-incidence variables;
- 51,554 verified append-only comparable-pair certificates;
- 33,768 inclusion-minimal learned cuts emitted;
- 3,962 permanent structural clauses;
- 37,730 total clauses.

piqd/CaDiCaL returned `UNKNOWN` after 600.015 seconds on this exact CNF.
That is neither SAT nor UNSAT.  The preceding iteration's unpruned
51,420-clause map was still SAT in 50.778 seconds, so the current hardness is
consistent with a near-terminal map but does not prove that the pruned map is
UNSAT.

Cards eight and nine are already externally DRAT-closed and replayed.  Card
ten is therefore the only current finite CNF frontier for this driver.

## Bounded card-ten profile

A read-only `march_cu` profile of the frozen CNF at static depth eight took
4.23 seconds and emitted 233 filtered cubes of length five through eight
(mean 7.93).  The march diagnostic reports the 256-leaf tree before its
`-l 1024` filtering step; the emitted 233 lines, not the diagnostic count,
are the artifact that must be independently cover-checked.

Seventeen distinct emitted cubes were sampled: cubes 1 through 9 and a
stratified sample at 30, 60, 90, 120, 150, 180, 210, and 233.  Independent
CaDiCaL calls classified all seventeen `UNSAT`; observed wall times were zero
through five seconds.  This is encouraging but is not coverage and says
nothing about the unsampled hard tail.

A single sequential CaDiCaL 3.0.0 `p inccnf` run over all 233 cubes remained
`UNKNOWN` at a 55-second global cap.  Thus assumption-based sequential cube
reuse did not immediately finish the map.  Parallel per-cube solving is the
better first trial; a few hard cubes can then be isolated and resplit.

## Method comparison

| Method | What it preserves | Current evidence | Certification path | Decision |
|---|---|---|---|---|
| Longer one-shot CaDiCaL | Exact current CNF | Already `UNKNOWN` at 600 s | One DRAT if it eventually returns UNSAT | Do not repeat first |
| Persistent incremental CaDiCaL | Exact monotone cut additions and learned clauses | Current piqd jobs restart CaDiCaL and discard learning; sequential 233-cube `inccnf` was still unknown at 55 s | Discovery models replay exactly; rerun final frozen cubes for DRAT | Use after a SAT cube/refinement, not as the first terminal-CNF action |
| Parallel cube-and-conquer | Exact frozen CNF, no encoding change | 233 depth-eight cubes; 17/17 sampled UNSAT in at most 5 s | DRAT-check cube cover and every UNSAT cube | **First choice for card ten** |
| Dihedral symmetry breaking | Counterexample existence modulo cyclic rotation/reflection | At most a factor 20 at card ten; not yet encoded/audited | Verify lex-leader encoding and prove every orbit has a representative | Add only if a hard cube tail persists |
| Full cut-orbit expansion | Sound cuts but much larger CNF | 39,266-cut profile occupied 36,897 dihedral orbits; full orbit closure would have produced 737,500 cuts | Exact but bloated | Reject |
| Direct exact LRA | Stronger metric formulation with exact arithmetic | Card-ten portfolios returned external UNSAT in 227--320 s; no imported certificate | Requires a checked SMT/Farkas proof stack not presently available | Cross-check only, not the least-risk closure route |

### Incremental CaDiCaL assumptions

The CEGAR map grows monotonically: every refinement permanently adds a sound
blocking clause.  A persistent CaDiCaL API session can therefore retain its
learned clauses across refinements.  Cube literals should be supplied as
assumptions; new product-box cuts should normally be permanent clauses.

Do not introduce activation literals merely to delete every newly subsumed
cut.  Start the session from the 33,768-cut minimal antichain and inclusion-
minimize each new batch before insertion.  Cross-batch subsumption was tiny in
the measured run compared with same-batch subsumption, so retaining an
occasional now-redundant permanent clause is the lower-risk tradeoff.

Incremental solving is chiefly a discovery accelerator.  Assumption-scoped
proof logging is more delicate than a standalone DRAT.  Once the final bank
is frozen, regenerate standalone cube CNFs and produce ordinary independently
checked DRAT proofs.

### Symmetry breaking

The relevant symmetry is the dihedral action on the complete row table, not
eager expansion of every learned cut.  A full-table lex-leader against the
nineteen nonidentity card-ten rotations/reflections removes at most a factor
twenty of table copies.

This restriction is sound for the mathematical counterexample search because
the base conditions and absence of a comparable pair are dihedrally
invariant, while every banked cut is a globally sound sufficient condition
for comparability.  Nevertheless, a restricted-CNF UNSAT certificate proves
the original claim only together with a checked orbit-representative lemma.
The lex comparator also introduces auxiliary clauses and can hurt SAT
propagation.  It should be A/B tested on the hard cube tail, not added to the
canonical certificate run without its own verifier.

### Direct exact LRA

The integrated local-Kalmanson solver has already given external exact-Z3
`UNSAT` at card ten for multiple connectivity encodings.  This is strong
independent evidence that card ten should close, but it has no DRAT-like proof
artifact and no imported checker.  Re-running it does not improve the trust
boundary.  A new proof-producing SMT/Farkas stack is more engineering and
proof risk than deciding the existing 90-variable CNF.

At card eleven, 22 exact-LRA portfolios all timed out at 600 seconds,
including stronger versions with connectivity omitted.  Direct LRA is
therefore not the recommended card-eleven escalation.

## Card-ten execution protocol

### Gate 1: freeze and replay

1. Preserve the 51,554-certificate checkpoint, frozen CNF, and their hashes.
2. Replay every certificate and deterministically reconstruct the 33,768-cut
   inclusion-minimal antichain.
3. Reconstruct the 37,730-clause CNF and require the pinned SHA-256 above.
4. Do not mutate this artifact during the first cube decision.

### Gate 2: certify the cube cover

1. Generate a depth-eight cube file with an explicit cube cap.
2. Parse only emitted `a ... 0` lines; reject out-of-range variables,
   duplicate literals, and internally contradictory cubes.
3. Independently prove that the cubes cover all assignments.  For cubes
   `Q_i = AND(l in Q_i)`, build the negated-cover CNF
   `AND_i OR(l in Q_i) (not l)` and obtain a DRAT-checked UNSAT result.
   This removes `march_cu` from the trusted completion boundary.
4. Pin the ordered cube list and its digest.

Overlap between cubes is harmless.  A missing region is not harmless, so the
cover proof is mandatory even though the march decision tree is expected to
be complete.

### Gate 3: parallel solve

1. Dispatch the 233 cubes across at most 24 workers with a bounded first-pass
   timeout.
2. For each cube, solve the frozen base CNF plus the cube literals.
3. On `UNSAT`, save and check the cube's DRAT proof.
4. On `SAT`, verify the full signed assignment against every base clause and
   cube literal, decode and re-run the row-table verifier, then stop the
   coverage claim and refine that candidate.
5. Treat every timeout as `UNKNOWN`; never count it as a closed cube.

If only a small hard tail remains, resplit those cubes and separately certify
that each child cover equals its parent.  This concentrates compute without
re-solving the already closed majority.

### Gate 4A: all cubes UNSAT

Publish finite card-ten coverage only after:

- the cube-cover DRAT verifies;
- every cube DRAT verifies against its exact cube CNF;
- a manifest pins the base CNF, cube list, all proofs, and verifier versions;
- an independent replay checks that the proof bundle composes to base-CNF
  UNSAT.

A monolithic DRAT is optional.  The bundle is sufficient if its composition
checker is part of the publication gate.

### Gate 4B: a cube is SAT

1. Run the existing exact inner comparable-pair search on the replayed table.
2. Exact-replay every proposed certificate and inclusion-minimize the batch.
3. Add only new minimal cuts to a persistent solver for that cube, retaining
   learned clauses.
4. If the cube becomes UNSAT, freeze and certify it, then continue with the
   remaining cube frontier.
5. If the inner search exhausts the full `4^10` product with no comparable
   pair, persist the exact replay: that is a finite abstract counterexample,
   not a Problem 97 counterexample.

The original depth-eight cover remains valid after new global cuts because it
covers the Boolean variable space independently of the clause set.

## Card-eleven plausibility

Blind card-eleven literal CEGAR has a severe outer-space jump:

- 110 variables instead of 90;
- 7,458 permanent CNF clauses instead of 3,962;
- `4^11 = 4,194,304` assignments per full inner replay, only four times card
  ten and therefore not the main concern;
- before pair-alternation/connectivity pruning, the row-table choice count
  changes from `binom(9,4)^10` to `binom(10,4)^11`, a factor of approximately
  34,730.

The raw ratio is not a runtime prediction, because the structural clauses
prune heavily.  It does show why the extra card is mainly an outer-enumeration
problem.  A dihedral lex leader gives at most a factor 22 and cannot by itself
offset that growth.  The 22 exact-LRA card-eleven timeouts provide independent
evidence that this is not just a weakness of the Boolean outer solver.

Accordingly:

1. **First search constructively for SAT.**  Try deleting/repairing one role
   in the exact card-twelve counterfamily or derive a genuine odd-card family.
   Any candidate must pass the complete row, alternation, connectivity, and
   full-product replay.  A SAT hit decides the abstract card-eleven question
   much more cheaply than an UNSAT census.
2. **Do not start blind card-eleven CEGAR until card ten's cube protocol is
   proven.**  Reuse the certified cover/refinement machinery, not the current
   sequence of fresh one-shot jobs.
3. **Require one extra reduction before promising UNSAT closure:** a verified
   lex-leader, a lift of whole card-ten cut schemas to card eleven, or an
   empirical card-eleven cube frontier with a small hard tail.
4. **Use remote compute only on a certified frontier.**  Parallelizing an
   unbounded literal CEGAR loop would spend cores rediscovering models without
   establishing coverage.

With those conditions, card eleven is a reasonable research computation.  It
is not currently a tractable, schedulable finite closure in the same sense as
the 233-cube card-ten decision.

## Stop conditions

- `SAT` plus exact full-product replay: stop; the finite product-box theorem is
  false at that card.
- All certified cubes `UNSAT`: finite Boolean coverage complete for the frozen
  bank.
- Any cube `UNKNOWN`: unresolved; resplit or change solver, but do not publish.
- Any model/certificate/cover replay failure: encoding failure; invalidate the
  affected run.
- Card-ten certificate complete but no Lean adapter: computational lane
  complete, source proof still open.
