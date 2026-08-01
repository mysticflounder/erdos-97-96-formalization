# P97 counterexample search -- Phase 3 specification

Version 0.1, 2026-07-28.  This is the soundness contract for SAT-backed
per-cell generation over the Phase-1/2 census core.  It implements the
Phase-3 item in `scratch/p97-search-lane/HANDOFF-2026-07-28.md`.

The immediate deliverable is a fail-closed SAT generator with gate-scale
enumeration and a combined cap+blocker iterator mode.  A production
`n >= 9` coverage claim is explicitly out of scope until the gates below
pass and a bounded run actually reaches a DRAT-checked terminal UNSAT.

## 1. Claims and trust boundary

There are three distinct outcomes.

- `PARTIAL`: at least one decoded model was processed, but the model limit or
  an external interruption occurred before terminal UNSAT.  This is candidate
  generation only.  A solver timeout or solver `UNKNOWN` remains `UNKNOWN`,
  even after earlier valid models, because it is not a controlled enumeration
  boundary.
- `COMPLETE`: every raw labelled semantic assignment satisfying the emitted
  CNF was decoded and processed, and the final CNF obtained by adding one
  exact semantic blocking clause per decoded assignment was UNSAT with a
  `drat-trim`-verified proof.  Completeness is relative to the exact cell CNF
  and its audited clauses.
- `UNKNOWN`: the solver returned neither SAT nor DRAT-verified UNSAT, a model
  failed decoding/revalidation, or an artifact was missing or inconsistent.
  No non-existence claim may be published.

Canonical banking is deduplication only.  It is not the enumeration proof.
The first implementation blocks raw semantic assignments, not canonical
orbits.  Orbit blocking is forbidden until a separate proof and independent
tiny-scale partition gate show that every blocked assignment is related by
an automorphism preserving the full combined annotation.

SAT models are structural candidates, not geometric realizations.  A numeric
realization failure never prunes a model.  A counterexample claim requires
exact coordinates and independent exact checks of distinctness, strict convex
position, and the K_k equal-distance property.

## 2. Cell scope

The SAT generator accepts `Cell(k, n, profile, exact=True)` only.

- FRAMELESS cells encode exact shell systems and R-CIRC2.
- Profiled cells require the existing `Cell` conditions `k = 4`, `n > 9`,
  and a valid closed-cap profile.  They encode a cap annotation.
- A profiled Phase-3 search intended for Theorem C range coverage also
  encodes a total B1 blocker annotation.  This requires the combined
  cap+blocker mode in sections 3 and 4.

Exact-k is a reduction at the shell level: from a class of size at least k
one may select k witnesses.  It is not a license to shrink an already chosen
blocker annotation arbitrarily, since B1 can be destroyed by shrinking.
Theorem C instead supplies the exact-four witness system and its B1 annotation
in the minimal-counterexample argument.  Accordingly:

- a FRAMELESS exact cell is complete only for exact shell systems;
- a blocker-annotated exact cell is complete only for B1-annotatable exact
  shell systems;
- unconditional finite-range closure is obtained only by composing complete
  coverage with Theorem C.  Per-cell claims remain annotation-conditional.

Cap annotations are a complete frame for convex K4 configurations at `n > 9`
by the already audited frame theorem.  The annotation data by itself does not
encode convex geometry or any relationship between caps and shells beyond
the clauses of an explicitly admitted rule.

## 3. Combined annotations and exact canonicalization

`AnnotatedNode(node, blocker, caps)` with both fields non-`None` is the
`"cap+blocker-annotated"` mode.

The current Phase-2 canonicalizer is sufficient when at most one annotation
is present, but not for the combined mode: minimizing the blocker and cap
parts under different node automorphisms forgets their relative alignment.
Before the iterator accepts combined objects, `canonical_annotated` must take
one joint minimum:

1. compute the canonical node form and all node labelings `sigma` attaining
   it (`canonical_perms`);
2. for each single `sigma`, transport the blocker map;
3. for that same `sigma`, transport the cap annotation under every cap-index
   permutation `tau in S3`;
4. minimize the pair `(transported_blocker, transported_cap)` jointly.

When either annotation is absent, this definition must reproduce the existing
single-annotation canonical form.

The iterator must:

- classify the new mode explicitly;
- require a cap-bearing mode for a profiled cell and reject every cap-bearing
  mode from a FRAMELESS cell;
- apply annotated-node rules whenever a blocker is present;
- add `"blocker-annotated"` to published hypotheses whenever a blocker is
  present;
- use the joint canonical form for banking;
- reject a generator that mixes object modes within one cell run.

No rule admission changes in Phase 3.

## 4. Semantic SAT variables

For labels `p,q,d in {0,...,n-1}`:

- `s[p,q]`: `q in S[p]`.  Allocate only for `p != q`; the diagonal is
  definitionally false.
- `b[x,d]` in blocker mode: `c(x) = d`.  Allocate only for `x != d`.
- `f[x,i]` in cap mode, for non-Moser `x` and `i in {0,1,2}`:
  `f(x) = i`.
- profile-selector variables may be used to assign the sorted profile's
  three strict sizes to cap indices.  They are auxiliary, not semantic.

For cap mode the first implementation fixes `M = {0,1,2}`.  This is a
sound labelled symmetry choice: every three-element Moser set can be sent to
that set by a label permutation.  It does not fix the cap-index order.
For a closed profile `(h0,h1,h2)`, the strict cap sizes are
`(h0-2,h1-2,h2-2)` as a multiset.  The encoding must allow every distinct
permutation of those three values across cap indices.

The semantic assignment used by model blocking consists of all `s`, all `b`
when present, and all `f` when present.  Auxiliary counter and selector
variables are omitted from blocking clauses.

## 5. Hard clauses

Every emitted clause block carries one of these tags in code and in the
manifest.

- `(S-D1)`: no diagonal `s[p,p]` variable exists.
- `(S-EXACT)`: for every p, exactly k of `s[p,q]`, `q != p`, are true.
- `(S-CIRC2)`: for every distinct centers `p < q` and every three-element
  label set `{a,b,c}`, forbid all six memberships
  `s[p,a],s[p,b],s[p,c],s[q,a],s[q,b],s[q,c]`.  Terms equal to a center
  are definitionally false and may make the clause tautological; emit only
  nontrivial instances.  This is exactly R-CIRC2.
- `(B-TOTAL)`: for every x, exactly one `b[x,d]`, `d != x`, is true.
- `(B-MEM)`: `b[x,d] -> s[d,x]`.  This is exactly B1.
- `(CAP-TOTAL)`: for every `x notin M`, exactly one `f[x,i]` is true.
- `(CAP-PROFILE)`: the three strict fiber sizes form the multiset
  `(h0-2,h1-2,h2-2)`.

R-FIBER4 emits no additional hard clause: it is derived from `(B-MEM)` and
exact shells, and remains a defensive decoded-model check.

R-CAPGE4 emits no model clause after `Cell` validation; a profiled cell whose
profile contains a part below four is pruned at the cell/rule layer, not
silently strengthened by the SAT encoder.

R-P1, R-P2, R-P3, and R-P4 are cut-matrix-domain rules.  There is currently
no certified producer mapping a shell assignment or cap partition to the
same-distance C2-read matrix required by those rules.  Phase 3 must not emit
their forbidden-pattern clauses.  Adding them requires a new spec revision
that states and gates that producer's semantics contract.

No convexity, distance transitivity, exact-five, minimality, no-M44, or
finite-universe clause may be inferred merely from the node data.

## 6. Solver loop and artifacts

Use CaDiCaL with a finite timeout for each call.

For each SAT result:

1. decode semantic variables;
2. construct `Node`, `BlockerAnnotation`, `CapAnnotation`, and
   `AnnotatedNode` through their validating constructors;
3. independently verify exact row sizes, R-CIRC2, cell/profile match, B1,
   and the expected semantic truth value of every blocking literal;
4. feed the object through `iterate_cell` and its canonical bank;
5. append one raw-model JSONL record;
6. add the clause negating that complete semantic assignment.

If any validation fails, stop with `UNKNOWN`.  Never skip the model.

If the configured model limit is reached after a valid model, stop
`PARTIAL`.  If CaDiCaL times out or reports unknown, stop `UNKNOWN`.  If it
reports UNSAT, save the DRAT proof, verify it with `drat-trim` against the
final CNF, and publish `COMPLETE` only on checker success.

Each run directory contains:

- `manifest.json`: cell, mode, clause tags/counts, semantic variable count,
  total variable/clause counts, solver/checker versions, timeout, model
  limit, rule-bank hash, status, raw/canonical counts, and artifact hashes;
- `base.cnf`;
- `models.jsonl`;
- `bank.jsonl`;
- `terminal.cnf` and `terminal.drat` only when terminal UNSAT is attempted;
- `terminal.drat.check` or an equivalent bounded checker log.

Artifacts are written atomically.  A resumed run must verify the manifest,
CNF hash, and every prior model/blocking clause before continuing.

## 7. Mandatory gates

All Phase-1 and Phase-2 controls remain mandatory after any edit under
`census/p97_search/`.

- `G-P1-REGRESS`, `G-P2-REGRESS`: both existing control scripts pass.
- `G-CANON-JOINT-INVAR`: random combined annotations agree under random
  label permutations; include a node with nontrivial automorphisms.
- `G-CANON-JOINT-EXACT`: at tiny scale, joint canonical equality agrees
  with independent brute-force combined-annotation isomorphism.  This
  prevents over-merging that invariance alone cannot detect.
- `G-ITER-COMBINED`: a satisfiable `n=10,k=4,profile=(4,4,5)` combined
  annotation is admitted, banks OPEN, and publishes both frame hypotheses
  and `"blocker-annotated"`.  Use cyclic shells
  `S[p] = p + {1,2,3,5} mod 10`, a valid cyclic blocker choice, and strict
  cap fibers of sizes `(2,2,3)`.
- `G-SAT-K3-SEED`: constrain the SAT encoding to S-K3-9's exact shell
  assignment; CaDiCaL returns SAT and decoding reproduces that node.
- `G-SAT-COMBINED`: constrain the combined encoding to the preceding
  n=10 fixture; SAT and decoding reproduce all three semantic components.
- `G-SAT-CARD-UNSAT`: force k+1 members in one exact-k row; UNSAT and
  DRAT verified.
- `G-SAT-CIRC2-UNSAT`: force a three-point intersection for two centers;
  UNSAT and DRAT verified.
- `G-SAT-B1-UNSAT`: force `b[x,d]` and `not s[d,x]`; UNSAT and DRAT
  verified.
- `G-SAT-PROFILE-UNSAT`: force a cap fiber size outside every permutation
  of the requested profile; UNSAT and DRAT verified.
- `G-SAT-TINY-COMPLETE`: enumerate an independently brute-forceable exact
  FRAMELESS cell, compare the full raw semantic assignment set in both
  directions, then DRAT-verify the terminal UNSAT.
- `G-FAIL-CLOSED`: injected solver unknown, malformed model, missing DRAT,
  and failed `drat-trim` each produce `UNKNOWN`, never `COMPLETE`.
- `G-RESUME-TAMPER`: resume a verified `PARTIAL` tiny run to `COMPLETE`,
  then confirm that altered base-CNF and model artifacts are rejected.
- `G-ATOMIC-INTERRUPT`: interrupt only after a valid decoded model and verify
  that the atomically published `PARTIAL` artifacts can be revalidated.

Known satisfiable fixtures are mandatory before trusting an UNSAT result.
Every UNSAT gate is proof-checked, not accepted from solver exit status.

## 8. First production sequence

After every gate passes:

1. run S-K3-9 as a constrained end-to-end positive control;
2. run a small unconstrained FRAMELESS exact cell to exercise model
   enumeration and terminal certification;
3. run bounded, explicitly `PARTIAL` exploratory enumeration at
   `(k,n)=(3,9)` and at the first k=4 cell;
4. only then schedule complete profiled+blocker cells for `k=4,n>9`.

The `n=9,k=4` case is FRAMELESS and belongs to the separate D9 theorem lane;
Phase 3 does not duplicate that formalization.  The first profiled K4 size is
`n=10`, whose only profile is `(4,4,5)`.

The realization arm consumes OPEN model records.  Its initial interface is
JSONL input plus result values `EXACT_REALIZED`, `PROVED_INFEASIBLE`, or
`UNRESOLVED`.  Only the first two may change bank status, and each requires
an independently checkable certificate.  Numeric probes attach diagnostics
while leaving status OPEN.

## 9. Acceptance criterion for a finite range

A claimed range `[10,N]` is computationally covered only if, for every
`n` in the range and every `profile in profiles_for(n,4)`:

1. the combined cell run is `COMPLETE`;
2. every terminal UNSAT proof checks;
3. every decoded model was passed through the current admitted rule bank;
4. every OPEN canonical survivor has either a proved infeasibility
   certificate or remains explicitly OPEN;
5. the frame theorem and Theorem C composition used for the final claim are
   kernel-checked at the consumer.

Thus complete enumeration alone is not non-existence when OPEN survivors
remain.  It is a complete survivor census.  Exact realization of any survivor
is instead a counterexample candidate and takes priority for direct checking.
