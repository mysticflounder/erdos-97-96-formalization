# P97 PIQD post-wave theorem-search gate v1

Status: implemented and fail-closed by
`census/p97_search/phase3_piqd_postwave_gate.py`, with one-wave enforcement in
`census/p97_search/phase3_piqd_theorem_gated_discovery.py`.

## Purpose

PIQD is an incremental SAT engine, not a mathematical clause-entitlement
oracle.  A completed SAT wave may expose a candidate obstruction, but it does
not by itself justify another refinement or solver wave.  Every P97 CEGAR wave
must first search both:

1. the newly captured model and source analysis; and
2. the accumulated history of prior waves and theorem instances.

The search must include the repository Lean corpus and the complete canonical
P97 theorem-bank registry.  The result is recorded as either:

- `reusable-theorem`, bound to a named Lean consumer, a source producer, an
  authenticated source-backed refinement receipt, and the exact successor
  CNF; or
- `no-justified-lift`, which records the completed negative review but does
  **not** authorize another solver wave.

A model-specific blocking clause, raw theorem-search output, solver SAT result,
or exact-cardinality observation does not satisfy this gate.

## Receipt chain

The schema is `p97-piqd-postwave-theorem-search/v1`.  Each receipt binds:

- the exact input DIMACS root;
- the PIQD SAT solve receipt and total model;
- the source-independent analysis of that model;
- the exact theorem-search artifact and its queries;
- all seven files in the canonical P97 theorem-bank registry;
- accumulated-history evidence; and
- the admitted outcome.

After migration, history is an exact same-lane predecessor chain.  Wave `k + 1` must
name the authenticated theorem-search receipt for wave `k`, and its input root
must equal the predecessor's authorized successor root.  The only
`legacy-bootstrap` is the exact-17 lazy lane's wave-48 migration receipt.  It
binds the legacy results index, accumulated-family receipt, and wave-46/47
search logs; any other lane, ordinal, range, or role set fails closed.  This is
a migration boundary, not a claim that the old text logs were already canonical
receipts.

Because the wave-48 bootstrap binds a legacy results index rather than an
immutable predecessor receipt, that index and the canonical bootstrap receipt
must be frozen and committed together before the first successor solve.  Any
later edit invalidates the bootstrap digest and therefore the successor chain;
it must not be repaired in place after wave 49 begins.  Subsequent waves use
immutable predecessor receipts and do not inherit this migration-only seam.

The validator independently checks that:

- all artifact paths are normalized repository-relative files whose complete
  parent chain contains no symlink;
- every file digest matches;
- the input DIMACS dimensions agree with the PIQD session and total model, and
  an independent streaming pass verifies that model against every root clause;
- the solve was live, assumption-free, SAT, and the next dense solve index;
- the authorization exposes that exact PIQD session identity and solve index,
  so a controller cannot consume the receipt from another session or after a
  later solve;
- the source analysis binds the same root and model and verified both;
- the theorem search examined the current wave and accumulated history;
- the complete theorem-bank registry was bound;
- a reusable outcome's refinement receipt has the exact governed
  `checked-source-backed-witness-instance-refinement` status;
- that refinement binds the input root, model, analysis, Lean consumer,
  source producer, exact admitted fragment, and exact successor root;
- the successor clause sequence is exactly the input-root sequence followed by
  the admitted fragment, rather than merely having the expected clause count;
- every source file named by that refinement still has its authenticated hash;
- the admitted fragment is valid standalone DIMACS or a headerless PIQD clause
  journal, preserves the input variable universe, is violated by the captured
  model, and is not already subsumed by any root clause; and
- closure claims remain false.

Receipts are strict canonical JSON.  Duplicate keys, non-standard constants,
unknown keys in the post-wave receipt schema, boolean/integer confusion,
reordered or skipped predecessor waves, hash drift, and unsupported outcome
shapes fail closed.  Referenced artifact schemas may carry additional metadata;
the gate validates every field on which authorization depends.

## Lazy-clause policy

The current exact-17 root is already large.  The post-wave gate therefore
authorizes only the source-backed theorem instance witnessed by the captured
model.  It does not authorize eager expansion of every orbit or every theorem
family.  The intended loop is:

```text
PIQD SAT model
  -> exact source analysis
  -> current-plus-history theorem search
  -> one reusable source-backed instance
  -> clause-admission audit
  -> append exact instance
  -> successor PIQD solve
```

The existing formula-facing clause-admission gate remains mandatory.  It checks
that the clause is well formed, violated by the captured model, and not already
subsumed by the root.  The one-wave controller then checks that PIQD is at the
authorized input root, appends exactly the admitted clauses, verifies the
daemon's exported successor hash, and only then permits one solve.  A
`no-justified-lift` receipt cannot reach append or solve.

The exact predecessor-root scans are linear in the root size.  For exact 17
this currently means streaming roughly 5.9 million clauses to verify the model,
the successor body, and clause admission.  That cost is intentional: it
prevents unsound or redundant refinements while preserving
the lazy policy of admitting only the witnessed theorem instance instead of
eagerly expanding a large theorem family.

The one-wave controller and command-line validator use the authorization
loader, which parses the canonical receipt and traverses this artifact chain
exactly once.  Callers that need the parsed receipt object may instead use the
receipt loader; it still validates before returning.  Tests must not replace a
receipt-returning loader with an authorization-returning mock, because that can
hide an integration type mismatch at the real solve boundary.

The controller treats append as a state transition.  Any append exception,
acknowledged-count mismatch, or exported-successor mismatch terminalizes the
PIQD session before returning an error; no solve is attempted from an uncertain
frontier.

For a legacy session where the authenticated fragment was appended before this
controller took custody, the controller also has a narrowly scoped
preappended-successor path.  It permits no append: the live session id and solve
count must still equal the source solve recorded in the post-wave receipt, and
the exported root must already equal the authenticated successor root.  These
checks make the operation one-shot; after the successor solve increments the
solve count, replaying the same authorization fails closed.

The gate authenticates the recorded theorem-search queries, searched corpus,
complete bank set, result artifact, and reviewer claims.  It does not replay
the semantic search engine itself.  This is an explicit human-attestation seam,
not a kernel proof of search completeness.

## Claim boundary

An authenticated receipt establishes only that a finite CEGAR refinement was
searched, source-backed, and admitted according to this contract.  It does not
establish exact-cardinality coverage, a universal lift, a Lean theorem, a
closed `sorry`, or P97/P96.
