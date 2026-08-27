# P97 Rigid221 card-18 candidate-packet contract (v1)

**Status: PRE-SOLVER CONTRACT / NO RUN AUTHORIZED.** This specification defines
the first fail-closed, no-solver checkpoint after the W1–W4 large-pair ingress.
It records the three live residual interfaces as finite diagnostic candidate
packets and the validation gates they must pass before any CNF, SMT or PIQD job
is prepared.
It proves no finite ingress, no carrier-size lift and no P97 mathematics.

Lane: `rigid221-card18-sourcefaithful-cegar-20260827`.

Lane base: `aa97ce206cf94be16b1fa4540261f20fa0e828b0`.

Refreshed source head: `2866ed1e153594c4db0fed88544612ca3cd2c723`.

Source SHA-256:
`c5e46308208ac2ae75fdf7e6a21db18fd03825af7f44bed7f3f47ffc630b542b`.

## 1. Objective and claim boundary

The live theorem assumes `18 ≤ D.A.card`; it does not enumerate eighteen
carrier labels and does not assert `D.A.card = 18`. A packet in this schema adds
the exact-cardinality restriction as a diagnostic slice. Consequently:

- `n = 18` is an artificial finite restriction, not a consequence of the live
  theorem;
- ordinary validation establishes only schema and finite relational
  consistency; it does not authenticate that a packet was extracted from Lean;
- source-byte authentication is a separate operation that checks the pinned
  `Rigid221SourceHeavy.lean` digest, not the packet's mathematical truth, its
  imports, or its recorded Git revision;
- SAT is at most a candidate witness for the recorded abstraction;
- UNSAT is at most a result about the recorded finite surface; and
- neither verdict reaches the universal `18 ≤ D.A.card` leaf without a proved
  finite ingress, complete coverage and a general-cardinality lift.

Every packet must therefore record
`full_source_faithful_model = false`, `finite_ingress_proved = false`,
`coverage_lift_proved = false`, and
`evidence_class = "THEOREM_DISCOVERY_ONLY"`. The validator must reject any
stronger label.

## 2. Live frontier

The checked coordinator is
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen`.
The fresh target-rooted kernel spine has exactly three open children and
`Total sorryAx == 3`:

1. `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_card_ge_eighteen_xvDeletion_missingIncidence`;
2. `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_card_ge_eighteen_uDeletion_missingIncidence`;
3. `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_card_ge_eighteen_biSurvival_commonDeletionRectangle`.

The governed downstream build
`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavyCommonDeletion`
completed 11,028 jobs and refreshed the source index and kernel call graph before
this contract was issued.

## 3. Common source interface

Write `Hlate := lateFirstApexSystem R`,
`d := P.jointDeletion.deleted`,
`c := Hlate.centerAt d.1 d.2`, and
`cᵢ := Hlate.centerAt sourceᵢ.1 sourceᵢ.2`.

All three leaves retain the complete live parent context. A finite packet must
name each part rather than replacing it by anonymous incidence variables. Until
a source-to-packet adapter exists, these names are candidate attestations, not
authenticated Lean evidence:

| Packet block | Lean origin | Required content |
|---|---|---|
| `source_boundary` | `ExactFourRigid221PhysicalApexSourceEqUContext` and the source-heavy packet | pinned source revision metadata, theorem names and source digest |
| `carrier` | diagnostic restriction of `D.A` | exactly 18 unique labels; no claim that the live theorem forces equality |
| `roles` | `P`, `packet`, `source₁`, `source₂` | `u`, `v`, `xu`, `xv`, `deleted`, `oppApex2`, both sources, `c`, `c₁`, `c₂`; every reference resolves to the carrier |
| `blocker_v_parent` | `_Q` | an attestation for the full `ExactFourRigid221PentagonBlockerVResidual`, never a substitute anonymous Boolean |
| `live_parent_facts` | `_hcenterV`, `_hcenterDeletedInterior`, `_hcenterDeletedOffClass`, `_hnextRowPhysicalHits` | actual centre identity at `v`, deleted-row centre interior, deleted-row centre off class, and next-row physical class-hit bound `≤ 1` |
| `source_pair` | neutral large-pair producer | both sources outside the `xv` row and distinct actual centres |

The `blocker_v_parent` attestation covers, at minimum, the source facts carried
by `_Q`: `6 ≤ S.oppCap2.card`; carrier membership of `xu` and `xv`; the stated
`xu`, `xv` and deleted-row membership/nonmembership facts; the five-point class
cover; strict-cap-interior facts; `centerAt xv = v`; and the two row/class
restriction facts. A packet may preserve more detail, but may not silently omit
one of these antecedents and still claim this schema.

## 4. Arm matrix

The packet has exactly one arm. Its deletion profile is total on the four
source/deletion pairs; `unknown` is not accepted as survival or failure.

| Arm identifier | At `c₁,c₂` after deleting `u` | At `c₁,c₂` after deleting `xv` | Required consumer packet |
|---|---|---|---|
| `XV_DELETION_MISSING_INCIDENCE` | both fail | both survive | `xv`-deleted exact-three-row packet plus missing five-incidence witness |
| `U_DELETION_MISSING_INCIDENCE` | both survive | both fail | `u`-deleted exact-three-row packet plus missing five-incidence witness |
| `BI_SURVIVAL_COMMON_DELETION_RECTANGLE` | both survive | both survive | common-deletion packets for both `q = u` and `q = xv` |

The three profiles are pairwise disjoint. A validator must reject a packet that
mixes fields from two arms or supplies the wrong survival matrix.

## 5. Crossed-arm contract

For a crossed arm, let `q` be the surviving deletion endpoint and `common` the
other endpoint. The packet must carry the concrete four-label supports of the
three claimed exact `q`-deleted row classes `C₁`, `C₂`, `CO`. The checker
derives `q`-exclusion, common-endpoint membership, both source memberships, and
all consumer incidences directly from those supports. Row class/type names and
Lean origins remain unattested until an adapter constructs the packet.

It must evaluate all five consumer incidences in fixed order:

1. `c₁ ∈ BOq`;
2. `S.oppApex2 ∈ K₁.support`;
3. `c₂ ∈ K₁.support`;
4. `S.oppApex2 ∈ K₂.support`;
5. `c₁ ∈ K₂.support`.

The values are computed Boolean memberships, not caller-supplied statuses. The
missing-incidence leaf requires at least one computed `false`; absent or
unresolved support data fails validation and never counts as non-incidence. The
all-`true` conjunction belongs to the checked tetrahedron consumer and must be
rejected by this packet schema.

## 6. Bi-survival contract

The bi-survival arm must carry exactly two nonempty
`CommonDeletionTwoCenterPacket` summaries, keyed by `q = u` and `q = xv`.
Each summary contains two concrete four-label supports. The checker derives
deletion and row-centre exclusion plus support overlap from those supports; it
also checks the common pair of distinct centres and that the actual blocker
centre for `q` differs from each row centre. It does **not** require either
`sourceᵢ` to lie in its packet row: `CommonDeletionTwoCenterPacket` contains no
such field. The remaining Lean survival, geometry and origin claims are
candidate attestations pending a source adapter. Each summary retains:

- both actual centre-membership facts and their inequality;
- survival of both sources after deleting its `q`;
- actual-blocker avoidance;
- both exact `q`-deleted four-point selected rows; and
- selected-row overlap at most two.

A single endpoint packet, duplicate endpoint packets, or an endpoint other
than `u`/`xv` is rejected. The bi-survival arm carries no crossed
missing-incidence record.

## 7. Row-origin and guard audit

The first implementation must keep this table auditable in code and tests:

| Object class | Source origin | Finite representation | Materialization guard |
|---|---|---|---|
| named carrier roles | `P` and the source-heavy packet | carrier label references | intrinsic; no arm guard |
| BlockerV parent facts | `_Q` | individually named attestations | intrinsic; no arm guard |
| source pair and centres | neutral large-pair producer | two source records plus actual-centre labels | intrinsic after producer; no consumer guard |
| deletion outcomes | producer profile split | total four-cell survival matrix | exactly the selected arm |
| exact three rows | crossed-row producers | three claimed row records with concrete four-label supports | crossed arm only |
| five incidences | tetrahedron consumer boundary | five memberships computed from those supports | crossed arm only |
| common-deletion summaries | bi-survival rectangle producer | two endpoint-keyed summaries with concrete supports | bi-survival arm only |

Consumer selection is not a row-origin guard. Intrinsic objects must not be
hidden behind the arm that later consumes them, and materialized arm objects
must not appear without their producer guard.

## 8. First checkpoint acceptance tests

This checkpoint invokes no solver and imports no PIQD client. It passes only if
focused tests demonstrate:

1. one hand fixture for each arm validates;
2. parse/serialize/parse is deterministic and its SHA-256 is stable;
3. the three deletion profiles are disjoint;
4. malformed carrier size, duplicate labels and dangling role references fail;
5. missing or extra keys fail;
6. wrong deletion outcomes fail;
7. crossed support tampering, deletion membership, missing common/source
   membership, and an all-true incidence conjunction fail;
8. incomplete or duplicate bi-survival endpoint summaries, deletion or
   row-centre membership, actual-blocker/row-centre aliasing, or support overlap
   above two fail;
9. source-byte authentication succeeds only at the pinned file digest and
   rejects a missing, relocated or changed source file; and
10. any promotion, proof, full-model, finite-ingress or lift overclaim fails.

The validator is a contract checker, not an encoder correctness proof. Passing
these tests authorizes an adversarial schema review, not a SAT run.

Checkpoint result (2026-08-27): the focused packet suite passes 33 tests and
Ruff passes on the implementation and tests. An independent source/Lean
crosswalk review gave **GO** only for committing this explicitly no-solver
candidate schema. It confirmed that crossed incidences and common-deletion
support facts are computed from concrete supports and that byte authentication
targets the pinned `Rigid221SourceHeavy.lean`. It separately kept solver and
source-faithful admission **BLOCKED** because the parent, provenance, survival,
geometry, origin and dependency/import claims are not proof-bearing.

## 9. Solver-launch gate

Before the status can change to `CANARY AUTHORIZED`, a separate review must
approve:

- a concrete source-to-packet adapter or a plainly labelled external candidate
  producer; source-file hashing alone is not such an adapter;
- authenticated dependency/import closure adequate for every admitted source
  claim, not merely the leaf module's byte digest;
- an object-by-object origin/representation/guard audit;
- the exact hard-clause admission record for each of the three arms;
- an independently checked encode/decode readback;
- a known-answer smoke instance;
- a fresh Class-C schema and output namespace;
- a `worktree-run-manifest/v1` under
  `scratch/runs/rigid221-card18-sourcefaithful-cegar-20260827/<run-id>/`; and
- explicit timeout and terminal statuses, with `UNKNOWN` failing closed.

The first authorized solver work, if those gates pass, is one bounded
single-worker canary per arm. Broad exact-17 waves, incidence-only `n=18`
extensions, cross-arm banks and universal closure claims remain prohibited.
