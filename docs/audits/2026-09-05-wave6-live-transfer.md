# Wave-6 affine transfer to live P97 branches

Date: 2026-09-05. Scope: source audit and one finite row-table calculation.
No Lean edits, fresh Lean build, solver run, or proof promotion occurred.

## Outcome

The reusable geometric kernel already exists. None of the three audited live
branches has an identified source-to-kernel producer. This is a bounded audit
finding, not a theorem excluding such a producer.

The broader affine relation bank rejects one retained exact-13 completion that
has no nine-hit motif. That completion was already rejected by a Kalmanson cut;
this supplies an alternate rejection, not a new closed cell or a P97 proof.

## Existing consumers and missing premises

| Branch | Available input | First missing implication for this transfer |
| --- | --- | --- |
| Exact-13 | Variable positional rows and existential global rows | Source hypotheses force a concrete affine contradiction packet, rather than just one model admitting it |
| B1 card-six | Canonical interior/order data; equal distances within each row | Cross-row incidences, required distinctness, and radius identifications for a concrete packet |
| Exact-five physical | Fresh double-hit row has radius below the original first-apex radius | Either a different affine packet or further source geometry; the radius-drop contradiction separately needs a lower bound on the fresh radius |

Audited source entry points:

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`,
  `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen` and
  `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:1911`
  and `B1CardSixCanonicalAdjacent.lean:213` in that directory (B1 audit snapshot
  HEAD `601e9ad7b`; line numbers may move in the shared worktree).
- `lean/Erdos9796Proof/P97/ATail/ExactFiveDistinctPhysicalFreshRowRadiusDrop.lean`,
  `actualFreshBlocker_radius_lt_of_contains_interiorPair` and
  `false_of_actualFreshBlocker_contains_interiorPair_of_radius_ge`.

`AffineNineHitCircleKernel.lean`, in the frontier directory, already declares
`equal_radius_two_circle_opposite_sum`, `false_of_nine_hit_affine_pattern`, and
`false_of_nine_selected_four_classes_affine_pattern`. The selected-row adapter
requires rows at A,C,E containing respectively {B,C,D,E}, {A,B,D}, {A,D}.
Its seven explicit inequalities, together with exclusion of each row's own
center, force five distinct labels. The audit found no downstream call to this
adapter. These are source observations, not a fresh transitive-axiom audit.

Two rows sharing two points do not alone provide the equal-radius kernel's
four equal lengths. In the exact-five double-hit child, the radius-drop result
actually separates the fresh radius from the original radius.

## Finite affine certificate

EMPIRICALLY VERIFIED, on exactly the row table retained in the companion JSON:
14 rows on 13 labels generate 36 undirected-edge equality components, eight
distinct normalized rhombus relations, zero nine-hit motifs, and a collision
certificate for labels 0 and 2. The source model path, SHA-256, and decoded
rows are retained in that JSON. The checker uses integer arithmetic only.

Write p_i for the plane point carrying label i. Each relation below is zero
under the table's row equalities, because its positive pair and negative pair
have four cross-edges in one equality component:

    R1 = -p0 - p2 + p7 + p10
    R2 = -p0 + p3 - p6 + p7
    R3 = -p0 + p3 + p7 - p10
    R5 = -p2 + p6 - p7 + p10
    R6 = -p3 + p6 - p7 + p10

The checked integer identity is

    -R1 + 2 R2 + R3 - R5 + 3 R6 = -2 p0 + 2 p2.

Thus any distinct planar realization of this particular table would violate
the equal-radius two-circle identity: it would require p0 = p2. This is a
conditional geometric consequence of the finite certificate, not evidence
that every completion of the source branch has such a certificate.

Replay from the repository root:

```bash
uv run python scripts/verify_wave6_live_affine_sample.py
```

The checker validates the retained table and integer certificate, not its
derivation from Lean source hypotheses. It is not a generic soundness or
coverage proof. The original completion's prior Kalmanson rejection is recorded
in `docs/audits/2026-09-05-cardge13-exact13-conic-resume.md`.

## Next experiment

HEURISTIC recommendation: apply the full equality-closed affine relation test
to completions that survive the current exact-13 cuts, retaining a small
collision/collinearity certificate with its supporting row atoms. Measure
whether it rejects anything the current cuts leave alive before building a
new formal consumer. Zero nine-hit motifs is not a reason to skip this test.

For B1 and exact-five, producing source-forced incidences remains the relevant
mathematical work. Re-certifying n10/n11 would not supply those premises.
