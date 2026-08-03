# Six-point forward rule: production integration map

Date: 2026-08-01
Status: read-only source audit; no production edit or executable verification

## Decision

The scratch rule is sound to promote after the live journal is frozen, provided
production preserves all three parts of its antecedent:

1. the replayed union of the six positive memberships used by every selected
   witness;
2. an exactly minimized set of positive cap facts; and
3. forward-order coverage for all 24 orders of every full Phase-3 cap annotation
   compatible with those retained facts.

The exact Lean consumer is
`Problem97.TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities`
(`lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean:223-283`).
It accepts six strictly increasing CCW boundary indices and the four equalities
`BA=BC`, `BA=BD`, `FA=FD`, `FA=FE`.  Thus the direct SAT facts are exactly
`s[B,A], s[B,C], s[B,D], s[F,A], s[F,D], s[F,E]`.  The theorem gives no reverse
orientation.  `Phase3MetricCertificateBank.lean:7,20-22` imports the theorem but
explicitly supplies neither Phase-3 coverage nor P97 closure.  The required
theorem-bank registry searches found no sibling/legacy duplicate; indexed Lean
search found this local declaration as the exact match.

## Production code changes

### 1. Mathematical rule helper

Promote only the mathematical/deterministic core of
`scratch/p97-distinct-distance-lane/sixpoint-forward-rule-prototype-20260801/sixpoint_forward_rule.py`.
The natural production home is `census/p97_search/phase3_ordered_metric_rules.py`,
which already owns ordered Lean-consumer identities and strict build/replay
records.  Add a distinct six-point schema/rule rather than extending the
rhombus schema:

- schema `p97-phase3-ordered-two-triple-row-six-point-forward-rule-v1`;
- rule id `two-triple-row-six-point-forward`;
- stage `equality-two-triple-row-six-point-forward-exhaustive`;
- roles `(A,B,C,D,E,F)` and allowed orientations exactly `("forward",)`;
- exact Lean module/source/theorem and a Python-only trust statement.

Port the prototype's cyclic-offset predicate, not a fixed linear-position test
and not the current forward-or-reverse five-point predicate.  For each supplied
order choose the lexicographically first role tuple and emit its exact six
memberships.  Strict replay must recompute roles and memberships rather than
trust the record.  Do not import the scratch file into production.

### 2. Self-contained outer certificate and replay

Add dedicated constants and functions beside the existing cap-order families in
`census/p97_search/phase3_structural_cegar.py`:

- `SIX_POINT_FORWARD_CERTIFICATE_SCHEMA` (production `v1`, not the prototype
  schema), dynamic origin, bootstrap origin, stage, Lean identity, and trust
  boundary;
- builder/replayer/clause functions;
- the dynamic origin in `DYNAMIC_CLASSIFIED_ORIGINS`.

The production certificate must contain, with a strict exact field set:

- schema/version, `n`, rule/stage/orientation and exact Lean metadata;
- all ten validated `exact=False`, four-support `source_rows` and their hash;
- the seven-fact source cap annotation;
- retained cap facts and minimization method/counts;
- compatible-annotation count and `24 * count` order count;
- every `{annotation, order_id, order, roles, six memberships, witness hash}`;
- coverage stream hash;
- sorted/deduplicated membership union, membership/literal counts;
- trust text and outer payload hash.

`source_rows` is a required production addition.  The prototype replay receives
rows out of band, but a bootstrapped learned record deliberately has
`semantic_assignment=None`; without stored authenticated rows, bootstrap replay
is not self-contained.  Dynamic load must additionally regenerate the complete
certificate from the record's decoded semantic assignment and compare exact
equality, following `_load_learned`'s current cap-order pattern.

Replay must rebuild the certificate from `source_rows` plus the stored source
annotation and reject unknown fields.  In particular it must not trust stored
roles, membership union, counts, theorem identity, orientation, hashes, or
minimization claims.

### 3. Exact cap/order minimization

Reuse `_all_phase3_cap_annotations` and `_cap_orders_from_facts`; there are 630
full annotations and exactly 24 within-fiber orders per annotation, with no
reflection quotient.  Keep these gates explicit:

1. validate the source seven cap facts and cover all its 24 orders;
2. enumerate retained subsets by `(cardinality, lexicographic tuple)`;
3. for every full annotation extending a candidate subset, cover all 24 orders
   by a forward witness;
4. select the first passing subset and recompute the entire coverage stream.

The learned membership antecedent is the union of the six replayed memberships
over all selected witnesses in that final stream.  It is not necessarily six
literals (the prototype fixture has 24).  Do not use `_clause_for_rows`: adding
both complete four-support rows is sound but loses the validated projection.
Use `_clause_for_memberships` (with generalized error text) and append only the
retained positive `f` literals.  Validate that the resulting clause is false on
the source assignment.  Do not independently delete memberships from the union
unless a second exhaustive coverage minimizer proves the deletion sound.

### 4. Driver dispatch and accounting

In `_commit_sat_classification`, run the new rule after the unordered structural
detector returns `None` and before the current five-point cap-order rule.  That
is the only placement that allows the new rule to replace the historical
five-point hits instead of being shadowed by the existing first-match dispatch.
Bind this exact priority in `_base_configuration()["detector"]`.

Wire the new family through every existing family dispatch surface:

- `_bootstrap_certificates`: schema dictionaries, replay/clause branch,
  source-origin/stage checks, duplicate checks, emitted bootstrap records,
  ordered-family iteration, source/kept counters and summary fields;
- `_load_learned`: accepted origins, bootstrap flag, replay/clause branch,
  dynamic regeneration and assignment-falsity check;
- `_manifest`: bootstrap/dynamic family sets, aggregate cap-order counts,
  family counts, stage histograms, structural/Lean/survivor trust prose;
- `_classification_count_cache`, learned-limit handling, stale cube replay and
  status/help prose via the new dynamic origin.

While touching manifest accounting, include the existing shared-pair bootstrap
origin in `bootstrap_count` (`phase3_structural_cegar.py:5909-5918` currently
omits it), and populate the no-bootstrap defaults for Kalmanson and shared-pair
as well as the new family (`:6967-6986` currently omits those family keys).

The existing bootstrap antichain is partitioned by certificate schema
(`:4916-4938`).  A new schema will therefore not subsume a longer five-point
clause across families.  For actual post-freeze replacement, minimize one
common ordered-certificate clause stream by `(length, clause, schema,
canonical-certificate-bytes)`, while retaining per-schema source/kept counters.
Keeping separate buckets is sound but preserves avoidable old clauses and does
not realize the intended cut replacement.

## Version and frozen-journal boundary

This is a dynamic rule-admission change, not a base-CNF or semantic-variable
change.  Therefore:

- amend `census/p97_search/PHASE3-SPEC.md` to a new post-freeze revision and
  replace the line-101 prohibition with the exact rule, coverage, replay and
  trust contract;
- bump the structural-driver manifest/learned/survivor schemas (legacy `v1` to
  `v2`, projected-static `v2` to `v3`) so changed admission semantics cannot be
  mistaken for the old artifact format;
- do **not** change `sat_generate.SPEC_VERSION`,
  `PROJECTED_STATIC_SPEC_VERSION`, or either semantic assignment schema: the
  variables, hard clauses and base CNF are unchanged;
- a fresh output namespace is mandatory.  Never append to or resume the frozen
  projected-static-v2 journal.

There is one deliberate compatibility decision to implement.  After the output
learned schema becomes projected-static-v3, `_bootstrap_certificates` line 4604
will reject the frozen v2 source before inner replay.  Keep `_load_learned`
strictly v3, but let bootstrap accept one explicitly named, hash-pinned v2
**source** schema, authenticate its complete outer record hash chain first,
replay its old inner certificates, and re-emit fresh v3 bootstrap records.  Do
not merely relabel old JSON.  If historical assignments are to be reclassified
into the new six-point family, use a separate deterministic migration step that
validates each v2 envelope and semantic assignment, builds the new certificate,
and emits a new hash chain; ordinary bootstrap currently preserves certificates
and cannot infer this new family.

## Source-hash effects

Current read-only hashes observed during this audit:

| Source | SHA-256 |
|---|---|
| `phase3_structural_cegar.py` | `8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d` |
| `sat_generate.py` | `5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817` |
| `TwoTripleRowSixPointEuclideanObstruction.lean` | `91bc2d5e71d3ecc7cc57634853913d7c88382cb8a8784549cb6bd1da62a79a62` |
| scratch prototype | `26f1c9d7e06bd1c2179efad390b58f0868325aa8cb8886af2e7dcefb552f8e38` |

The driver hashes itself, so any integration edit already changes
`configuration.dependency_sha256` and makes old resume fail with a configuration
mismatch.  Also add the six-point Lean source and `PHASE3-SPEC.md` to
`_dependency_hashes`; if a new helper module is created instead of extending
the already-hashed ordered-rules module, hash that helper too.  The base-CNF
hash and `sat_generate.py` hash should remain unchanged.  The frozen bootstrap
file SHA remains pinned separately in `configuration.bootstrap_results`.

## Required tests before admission

Extend `census/p97_search/tests/test_phase3_structural_cegar.py` and the ordered
rule tests with:

- forward wraparound acceptance and fixed-linear regression;
- reverse-only rejection and no reflection quotient;
- exactly 24 orders per full annotation and exhaustive compatible-completion
  coverage after minimization;
- deterministic cardinality-then-lexicographic retained facts;
- exact membership projection, union across role-changing witnesses, and clause
  falsity on the source assignment (including absence of unused fourth row
  members);
- rejection of a missing order, altered annotation/order/roles/membership union,
  source-row, theorem/orientation/trust text, payload hash, and extra field;
- dynamic origin/stage/classification, detector priority, manifest counters,
  learned-limit advancement, stale-cube handling, load and resume replay;
- mixed-family bootstrap, cross-schema subsumption, authenticated v2-to-v3
  bootstrap migration, and rejection of rehashed outer-envelope/semantic
  tampering;
- old-manifest resume rejection and exact dependency set containing the Lean
  theorem and revised spec;
- unchanged projected-static base-CNF configuration and counts in
  `test_sat_generate_projected_static_v2.py`.

The scratch report records 7/7 focused prototype tests and a fixture minimizing
seven `f` facts to four while covering 3 annotations / 72 orders.  Those are
prototype evidence only; they do not replace the production dispatch,
bootstrap, manifest, resume, or source-hash tests above.

## Main risks

1. **Unsound reversal:** accepting reverse cyclic order has no named Lean
   consumer here.
2. **Incomplete order universe:** checking the source annotation's 24 orders
   but not every completion of retained facts makes cap minimization unsound.
3. **Non-self-contained bootstrap:** omitting source rows works only for the
   prototype caller and cannot authenticate assignment-free bootstrap records.
4. **Under-bound clause:** learning six facts from one witness instead of the
   union over all replayed witnesses permits uncovered assignments.
5. **Silent journal drift:** retaining old schemas or appending to the frozen
   chain obscures the changed first-match detector semantics.
6. **False closure language:** the generic Lean theorem is kernel-banked, but
   concrete Python Phase-3 ingress and universal order coverage remain outside
   Lean; this admits a checked CEGAR cut, not a Problem 97 closure theorem.

Verification limit: source inspection, indexed theorem search, theorem-bank
registry search, nthdegree recall, and read-only SHA-256 computation.  No Lean,
Lake, SAT/CEGAR, solver, generator, test command, process signal, or production
source edit was performed.
