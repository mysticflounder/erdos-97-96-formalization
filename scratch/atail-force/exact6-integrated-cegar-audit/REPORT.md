# Exact-six integrated CEGAR adversarial audit

Status: **the local Farkas cut and strict-positivity normalization are
mathematically sound, but the positivity patch does not strengthen the
translation-invariant linear shadow and the driver is not yet a publication
certificate.**  No live Lean `sorry` is closed by this audit.

This audit targets
`scratch/atail-force/exact6-integrated-milp/exact_cegar.py`.  It does not edit
that owner-controlled directory.  The independent checker in this directory
does not import the producer, the MILP model, or the structural encoder.
The initial audited producer snapshot had SHA-256
`c679980086f571073c52629321c82275c7a6f086e2732ab82604a0ba208d845a`;
the strict-positivity correction was audited separately below.
The final corrected driver snapshot audited for that section had SHA-256
`009f2c0556c655187a36238401c1bda31b555771dd9530def6973b298dc40a07`.

## Sound parts

For a cyclic quadruple `a < b < c < d`, the producer uses the two strict
Kalmanson inequalities in the form

```text
d(a,c) + d(b,d) - d(a,b) - d(c,d) >= 1
d(a,c) + d(b,d) - d(a,d) - d(b,c) >= 1.
```

Replacing strict positive slack by a common lower bound of one is sound here:
there are finitely many strict inequalities, and a positive rescaling of all
distances preserves row/shell equalities and nonnegativity.  Selected-row and
second-apex shell constraints are homogeneous equalities.  A nonnegative
combination of inequality rows, arbitrary combination of equality rows, zero
coefficient vector, and positive total strict right-hand side is therefore a
valid contradiction.

The emitted Boolean clause also has the right polarity.  An unconditioned cut
is the negation of all row memberships used by its equality rows.  If a shell
equality is used, the clause additionally negates the *exact* five-point shell
assignment: negative shell literals for its five points and positive shell
literals for every other shell variable.  Thus it blocks only the assignment
under which every equality in the exact cancellation is available.

Pure-membership seed cuts are transportable between role orbits.  Their
antecedents mention only fixed cyclic labels and selected-row memberships; no
role-orbit premise is used in the metric cancellation.

## Strict-positivity correction

The corrected oracle asserts both

```text
d(i,j) >= 1
KalmansonSlack(a,b,c,d) >= 1.
```

This is exactly equivalent to *strict* pair-distance positivity plus strict
Kalmanson inequalities on the homogeneous row/shell surface.  In the forward
direction the normalized inequalities are strict.  Conversely, there are
only finitely many positive pair distances and positive Kalmanson slacks, so
one common positive rescaling makes their joint minimum at least one while
preserving every row and shell equality.

However, this correction does **not** eliminate a boundary survivor of the old
`d(i,j) >= 0` oracle.  Every Kalmanson row and every row/shell equality has
coefficient sum zero.  Therefore replacing every distance by `d(i,j) + C`
preserves all those expressions.  Any nonnegative SAT table, including one
with zero distances, becomes a `d(i,j) >= 1` SAT table after adding one.

The dual statement is equally sharp: a nonnegative combination of
`positive_i_j` vectors has positive coefficient sum unless every multiplier
is zero, whereas all Kalmanson and equality vectors have coefficient sum zero.
Consequently no zero-vector Farkas cut on this surface can use a nonzero
`positive_i_j` multiplier.  The producer's vector and right-hand side for
`positive_i_j >= 1` are correct, but these rows should never occur in a
derived cut.  The first corrected ten-cut probe confirms this: all ten exact
cuts replay independently and contain zero positive-distance constraints.
Two subsequent 1,000-cut strict-positive recovery runs confirm the invariant
again: all 2,000 cuts replay independently, 63 are shell-conditioned, and none
uses a positive-distance row.  Their ledger is
`strict-positive-recovery-replay.json` (SHA-256
`2739c21e1d30bde8b971cbc8bb623889dd842aeb9dbd1c7d99f9639278a0894d`).

Thus an old zero-distance table is not itself a strict-positive witness and is
not a Euclidean counterexample.  Nevertheless its existence implies a
strict-positive **abstract Kalmanson-shadow** witness by translation.  That
translated witness is still not a Euclidean/MEC realization and cannot by
itself refute the geometric parent theorem.

## Publication blockers

1. **Seed artifacts are trusted, not replayed.**  `seed_clause` accepts the
   JSON boolean `exact_replay_valid` and decoded names.  It does not replay the
   sparse exact dual, check that lower-bound marginals equal the named true
   memberships, or validate the decoded inequalities.  A changed or tampered
   JSON file can therefore inject an arbitrary hard clause into the final CNF.

2. **The cut verifier is correlated with the producer.**  Both dual
   reconstruction and `verify_exact_cut` use the same `vector` parser.  A bug
   in that parser is invisible to the in-process replay.  The in-process
   verifier also does not require Kalmanson indices to be in cyclic order, does
   not check label ranges, and does not check that the endpoints of every used
   shell equality belong to `conditioned_shell`.  Generated records currently
   follow those conditions, but the bank-loading boundary does not enforce
   them independently.

3. **DRAT proves only the formula it is given.**  The terminal CaDiCaL and
   `drat-trim` gate can prove that the structural CNF plus seed/cut clauses is
   propositionally UNSAT.  It does not prove that any hard seed/cut clause is
   mathematically valid, that the solved CNF is a faithful rebuild of the
   recorded encoder and bank, or that the structural encoder represents the
   Lean parent surface.  A substring test for `"s VERIFIED"` should also be
   replaced by an exact output-line test.

4. **ALIVE now persists, but producer-side replay is not independent.**  The
   corrected driver writes `alive.json`, a run identity manifest, and uses an
   output-directory lock.  Those changes repair the earlier crash-on-SAT and
   basic resume drift.  The producer's ALIVE payload itself checks only its
   own Z3 model's `d(i,j) >= 1` conditions; it does not independently substitute
   the exact rational table into every Kalmanson inequality, row equality,
   shell equality, and named structural condition.  The checker in this audit
   now performs that independent replay.  No corrected ALIVE artifact existed
   at this checkpoint, so that path is implemented but has not yet received a
   real artifact acceptance result.

5. **There is no terminal package verifier yet.**  A publishable endpoint
   needs a separate script/process that (a) independently replays every seed
   and derived cut, (b) rebuilds the structural CNF and appends exactly those
   clauses, (c) byte-compares or hashes that reconstruction against the solved
   terminal CNF, and (d) invokes `drat-trim` on the exact CNF/proof pair.  It
   must reject incomplete banks, changed seeds, duplicate IDs, partial JSONL
   tails, and any non-verified terminal status.

## Independent checker

`verify_exact_cegar.py` independently checks:

- strict Kalmanson index order and label domains;
- the sign of every inequality multiplier;
- exact rational/integer vector cancellation;
- exact row-membership antecedents;
- exact-five shell conditioning and shell-equality endpoints;
- strict positive-distance constraints and their exact right-hand-side
  contribution;
- pure-membership seed dual stationarity and objective zero from decoded
  guarded-row/Kalmanson rows; and
- canonical, complete JSONL records with hashes; and
- an ALIVE artifact's complete exact rational distance table, all strict
  Kalmanson slacks, selected-row and shell equalities, cap/order constraints,
  role orbit, critical blocker packet, and strong connectivity.

Its positive verdict is deliberately named
`INDEPENDENT_EXACT_LOCAL_CUT_REPLAY_PASS`: it certifies local cut soundness,
not structural coverage, DRAT completion, or live Lean closure.

On the first bounded seven-orbit run, the independent checker replayed all
seven pure-membership seeds and all 7,000 derived cuts (1,000 per orbit),
including 152 shell-conditioned cuts.  Every exact local cancellation passed.
The immutable snapshot hashes and per-orbit counts are recorded in
`replay.json` (SHA-256
`f1b7d7feefff141c0d6512168e6786b2068374215b315e53bf5d37eff5ed4df4`).
The checker also accepted a fresh producer smoke cut generated from the
four-point endpoint/middle-pair Kalmanson contradiction, and its negative
self-test rejected a Kalmanson name whose indices were not in cyclic order.

All seven CEGAR runs stopped at `CEGAR_LIMIT` with 1,000 cuts.  None reached
structural UNSAT, so there is currently no terminal CNF/DRAT artifact to
publish or independently verify.

The verifier self-test also includes an explicit four-label boundary table
with zero side distances and its translate by one.  Both have the same strict
Kalmanson slacks, while only the translated table meets `d(i,j) >= 1`.  This is
the regression gate against treating the positivity patch as a new closure
constraint.

The corrected ten-cut probe has its own immutable replay ledger in
`strict-positive-replay.json` (SHA-256
`d291c34b6d8976afc9ec6c2feeeedb7017cd23f0ffca7e7e311f5e0db549da1a`).

## Required gate before relying on terminal UNSAT

Treat the current run as exact theorem-discovery/coverage work until all of the
following are present:

1. producer-side fail-closed `ALIVE`, `UNKNOWN`, and `LIMIT` handling plus a
   pinned resume manifest and lock (implemented in the corrected driver, still
   requiring package-level replay);
2. an immutable seed and derived-bank manifest;
3. a passing independent local-cut replay;
4. a byte-identical terminal CNF reconstruction;
5. an exact-line `drat-trim` verification of the terminal proof; and
6. a Lean consumer or kernel-checked finite certificate that connects the
   certified n=14 surface to the actual parent theorem.

Even a complete seven-orbit terminal package proves only the corrected finite
n=14 abstraction.  The parent theorem remains blocked until the finite role
coverage/cardinality lift and its Lean-facing producer are supplied.
