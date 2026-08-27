# P97 Rigid221 card-18 predicate coverage contract (v3)

**Status: ALL PREDICATE-COVERAGE V3 PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-predicate-coverage-v3-20260827`.

Lane base: `2d6eb3ef92ea381990c12b2633a7bfd015e28174`.

## 1. Purpose and immutable baseline

Coverage v3 records only the finite facts newly emitted by
`Rigid221Card18LabeledEnrichment`. It does not revisit the historical Python
packet design, extend the source-witness serializer ladder, or authorize a
solver.

The complete v2 module and durable v2 artifact are immutable inputs:

- v2 module: 59,747 bytes, SHA-256
  `77ecf6d56ebe69ef74f219c9c0904992e2e631fbae769cef9cfd690837341fc2`;
- v2 artifact: 143,311 bytes, file SHA-256
  `889d0f496baeefc4eb053370b45a04f88353d1180a2b52f26da37136b71d083e`;
- v2 body self-hash:
  `6e7770b29b15da91faa9b7648779a22c28e403a825263ffabdb0cdf0f1f89114`.

The v2 universes remain the semantic baseline: 188 candidate predicates and
37 Lean source rows. V3 may add exactly one source row and may update exactly
the twelve candidate rows listed below. It may not silently absorb later file
or declaration changes.

## 2. New live binding

The new source binding is

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  Rigid221Card18LabeledEnrichment.lean
```

at lane-base commit `2d6eb3ef92ea381990c12b2633a7bfd015e28174`.
The file is 18,989 bytes with SHA-256
`62e2d79bb56e7f87c7b5aa56398485fc547033ba369a2affe50fc8698b8b1bec`.

Fresh live attestation must bind the common enrichment structure and
constructor, the bi-survival enrichment structure and constructor, and the
constructor-total conversion from the crossed-incidence alternative. A file
hash by itself is not declaration evidence.

There is deliberately no enrichment custody receipt or source manifest. The
fixed binding therefore declares `custody_status` as
`NONE_LIVE_SOURCE_BINDING_ONLY`.

## 3. Source-universe delta

V3 adds exactly one source row:

```text
enrichment.labeled_finite_data
```

Its status is `LABEL_DATA_AVAILABLE`. It is noncomputable, non-executable,
and nonblocking. It denotes only the finite labels, labeled supports,
memberships, nonmemberships, exact finite identities, and cardinality bounds
stored by the enrichment declarations.

The historical source-row schema requires a field named `custody_digest`.
For this one row that field is schema compatibility only: it contains the
domain-separated SHA-256
`ece9e242bdeaf9a0b3feb550bf125440df4020e2e7c07c4e834878ddeb59088c`
of the literal no-custody live-binding domain plus the frozen module digest.
It is deliberately unequal to the module SHA-256 and is not a custody
manifest, authentication receipt, or source-entitlement claim. Validation and
a focused test enforce all three distinctions.

All 37 v2 source rows remain structurally unchanged and in the same order.
The v3 source universe therefore has exactly 38 rows.

The new row must not be conflated with the Prop-only geometric parents
`parent.blocker_v_residual`, `source.live_parent_facts`,
`source.neutral_origin`, or `bi.common_deletion_packet`.

## 4. Exact twelve-row candidate delta

Exactly these candidate IDs change from
`PROP_AVAILABLE_NOT_EMITTED` to `LABEL_DATA_AVAILABLE`:

```text
q.huXvRow
source_pair.source_1.outside_xv_row
source_pair.source_2.outside_xv_row
role.source_1.not_alias_u_or_xv
role.source_2.not_alias_u_or_xv
role.physical_five.all_distinct
live.deleted_center.not_in_opposite_class
live.next_row_physical_hits.le1
bi.u.actual_blocker_ne_center.1
bi.u.actual_blocker_ne_center.2
bi.xv.actual_blocker_ne_center.1
bi.xv.actual_blocker_ne_center.2
```

For these rows, the only permitted field changes are
`lean_coverage_status` and the minimum `lean_source_ids` update that binds the
derived status to `enrichment.labeled_finite_data`. Every other field of these
rows remains frozen. The other 176 candidate rows must be structurally
identical to v2.

The two source-pair non-alias rows are finite consequences of the labeled
selected-`xv` support containing `u` and `xv` while excluding the two source
labels. The physical-five distinctness bundle is a finite consequence of the
exact labeled five-role identity together with cardinality five. These are not
new caller-supplied inequalities.

The four blocker-separation rows are backed by explicit label fields and
inequalities in the bi enrichment. The deletion-`u` blocker is the `xv` role;
the deletion-`xv` blocker is the `v` role. V3 must not assert that the latter
is distinct from `v`.

## 5. Rows that do not upgrade

The actual-blocker role and source-role rows were already labeled in v2 and
do not change. The following remain Prop-only or otherwise unchanged:

- `q.hclassFive` and the other geometric `q.*` attestations;
- `live.center_v_eq_deleted`;
- `live.deleted_center.in_opposite_cap_interior`;
- carrier cardinality and the source-pair actual-center links;
- bi center, row-cardinality, and geometric common-deletion fields not emitted
  as labeled finite data.

Completing these historical packet rows is not a prerequisite for a sound
finite over-approximation theorem.

## 6. Admission boundary

Every candidate `source_entitled` flag remains false. Every
`hard_clause_admission` flag remains false, and `hard_clause_count` remains
zero. Global proof, equivalence, serializer, solver, and canary admission all
remain false.

In particular, v3 does not claim:

- a canonical serialization of a geometric source witness;
- Python/Lean packet equivalence;
- a `Valid`-to-formula or formula-to-CNF correspondence;
- a model, UNSAT result, checked certificate, or contradiction theorem; or
- a lift from exact cardinality eighteen to the live lower-bound branch.

## 7. Validation and acceptance gates

The v3 implementation must:

1. strictly parse duplicate-free canonical JSON and reject non-finite numeric
   constants;
2. re-attest the immutable v2 baseline and the new enrichment source through
   no-follow descriptor reads;
3. freeze hashes for the full candidate universe, full source universe,
   exact twelve-row delta, source-row delta, declaration anchors, and complete
   configuration;
4. reject any additional candidate or source-row change;
5. validate every closed admission field and exact summary count;
6. round-trip the durable artifact byte-identically and freshly attest it;
7. pass focused tests plus all predecessor coverage/custody suites;
8. pass formatting, lint, independent semantic review, and exact-path staged
   hygiene.

Passing these gates records provenance only. It does not enable an external
search.

## 8. Checkpoint evidence

On 2026-08-27:

- the v3 implementation is 68,892 bytes with SHA-256
  `0f892acee8e0d6f1e39c985b55cecaf848aa906130cb223eae42b0ee1e15b668`;
- the durable canonical artifact is 153,018 bytes with file SHA-256
  `6b909aa48ec05cb32735c81ecd6f0fe6bd820b7fb126b7e3c1700b162905d501`
  and body self-hash
  `818ab7814ac6ab9d926aee756b2e782e57d5138a3f3abadfaa6359e14389e9d9`;
- fresh parse, canonical re-encoding, immutable-v2 validation, no-follow live
  binding, and full artifact reconstruction all pass byte-identically;
- the candidate universe is 188 rows, with 176 structurally unchanged and 12
  changed only in coverage status and required source binding;
- the source universe is 38 rows, with all 37 v2 rows unchanged and one
  no-custody enrichment row;
- source statuses are 15 labeled, 16 Prop-only, and seven absent;
- the candidate-row hash is
  `93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e`;
- the source-row hash is
  `cec1d8d443070eed81e50baec5ea2c83a861f9e0427879f5aa67473d03dc7f7e`;
- the twelve-ID delta hash is
  `cf567de6d9978c9ab1e074e8498585a9ab6ea8273c998eed612a9db57c10aead`;
- the 35-anchor enrichment hash is
  `c88b936c54cd51fd0faad25a564a23165b263d8cb18b05d1191609ebda957010`;
- the frozen configuration hash is
  `2c85fb76c85513297fc64766ff3a6d6043deb9576044faf7581278e24be91ba9`;
- the focused v3 suite passes 10 tests, the full six-suite predecessor
  regression passes 315 tests, and Ruff lint/format checks are clean; and
- independent semantic review returned **GO** after the no-custody sentinel
  correction, and final canonical/live artifact readback also returned
  **GO**. Exact-path staged hygiene then passed with zero lane issues and no
  blocking staged path.

## 9. Next boundary

The next proof-facing commit defines the pure constructor-indexed
`Rigid221Card18AbstractPacket`, its decidable `Valid` predicate, and
`source_to_abstract_packet`. The new enrichment facts should enter that finite
surface directly. A solver remains blocked until a later checked
correspondence and certificate path exists.
