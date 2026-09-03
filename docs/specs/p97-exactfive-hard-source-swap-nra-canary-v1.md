# Exact-five hard-source-swap fixed-order QF_NRA canary

This lane is a bounded diagnostic for profile 1697, whose authenticated
source profile digest is `59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e`.
It tests the two rank orders already returned by the linear order census:

* Z3: `c000,c003,c004,c002,c006,c001,c010,c009,c005,c008,c007`;
* cvc5: `c000,c003,c004,c002,c006,c001,c007,c009,c010,c008,c005`.

Each query is QF_NRA with one real x/y pair per quotient class.  The first
two classes are gauged to `(0,0)` and `(1,0)`.  Every increasing triple has a
strictly positive signed-area determinant.  The four source rows are encoded
as squared Euclidean distance equalities; the c2 old/replacement squared
radii are disequal; and the source-backed strict inequality is encoded as
`d(e,d)^2 < d(e,a)^2`.  No abstract distance variables and no separate
Kalmanson assertions occur in this canary.

The positive and negative controls pin four points to a hand-checkable convex
quadrilateral and to a non-convex order, respectively.  Controls are sent
through the same source-semantic PIQD adapter and are replayed with exact
rationals.

Results are fixed-order diagnostics only.  They do not establish source
realizability, alias-profile exhaustiveness, elimination of all orders, a
Lean consumer, promotion, or a theorem.  The runner records a
checkpoint-bound, source-digest-pinned `run_manifest.json` and an immutable
self-hashed launch record.  It uses fresh sequential Z3 and cvc5 sessions
inside each adapter query; the two fixed-order queries may run in a bounded
pool of at most 20 workers.  Existing complete adapter trees are replayed and
checked byte-for-byte before resume; incomplete trees fail closed without
resubmission.  The terminal record carries the run-manifest, launch, and
per-query result hashes and is create-once/self-hashed.  SAT requires both the
adapter's exact-rational replay and PIQD's daemon `model_replay` outcome
`SATISFIED`.  Solver execution is intentionally separate from this
implementation lane and must go through PIQD.
