# Card-eleven aligned-P5 research checkpoint

## Target boundary

The terminal statement under review is the aligned-P5 branch of the card-eleven
coordinator:

```lean
theorem false_of_alignedInteriorFrontier
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R) :
    False
```

The production ingress is
`ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual`.
It converts the production residual to
`ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual`, then calls
`ATailUniqueFourCardElevenCertificateScratch.false_of_cardElevenOriginalUniqueFourResidual`.
That coordinator dispatches the `(5,5,4)` branch to
`ATailUniqueFourAlignedP5BoundaryScratch.false_of_alignedInteriorFrontier`.
The source declarations are in
[`CardElevenUniqueFourCertificateIngress`](../../lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificateIngress.lean),
[`Coordinator`](../../lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Coordinator.lean),
and [`AlignedP5Closure`](../../lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4AlignedP5Occurrence/AlignedP5Closure.lean).

This note is a research checkpoint, not a proof-completion claim. The aligned
P5 terminal remains open for native-bank removal. Its production support path
currently has fourteen native classifier leaves: seven direct and seven mirror,
for extras `1, 2, 3, 4, 8, 9, 10`. No Lean edit, build, bank retirement, or full
package-3 closure is claimed here.

## Why this pilot

The aligned P5 route was selected from the historical compact certificate with
27,781 clauses and a 6,350-clause core, compared with 48,605 for P4 and 61,065
for P5. A fresh reuse preflight found no already-completed structural
replacement for this terminal. The current consumer map supersedes stale
source-wiring gap notes, but it does not supply a structural occurrence proof
that avoids the native classifier.

## Fixed Boolean projection

The row-existence ablation is intentionally scoped to the pinned compact
Boolean projection. The script
[`audit_aligned_p5_row_requirements.py`](../../scripts/audit_aligned_p5_row_requirements.py)
authenticates the compact CNF with SHA-256 `081ba956…1267f12f4` and checks all
120 positive seven-literal clauses per center: these are precisely the clauses
requiring at least four selected points among its ten other labels. Each of
the ten single-center drops, centers `1` through `10`, is SAT with the retained
clauses and was independently replayed; the apex-only drop is SAT as well.

These results establish only the behavior of the fixed four-schema Boolean
projection. They do not establish source necessity, global necessity, an
occurrence theorem, or a Euclidean implication. The durable artifact is the
[`row-requirements receipt`](2026-09-06-native-card11-aligned-p5-row-requirements.json).

## Relaxed apex metric check

The companion script
[`audit_aligned_p5_apex_metric.py`](../../scripts/audit_aligned_p5_apex_metric.py)
checks an exact-rational three-apex linear-distance relaxation with 660 strict
Kalmanson inequalities and 495 triangle inequalities. Perturbing `d_0_4` and
`d_8_10` by `1/100` leaves the selected equalities and produces only these
nontrivial complete classes:

\[
R_0=\{3,5,6,7\},\qquad R_4=\{3,5,9,10\},\qquad
R_8=\{0,1,2,4\}.
\]

The other eight centers have singleton classes. The shared pair for centers 0
and 4 is `{3,5}` and is separated. All cap counts and class-circle bounds were
checked, and the minimum Kalmanson gap is `99/100`. The model violates Ptolemy
on quadruple `(0,2,5,6)` by `7/3`.

This is explicitly not a Euclidean model, MEC argument, global K4 model, or
production residual model. It is diagnostic evidence for a stronger metric
route only. The durable artifact is the
[`apex-metric receipt`](2026-09-06-native-card11-aligned-p5-apex-metric.json).

Both receipts retain the solver-run script digest separately from the current
validator digest in `validation`. The check commands below replay the witnesses
against the pinned CNF or regenerated metric query, without invoking a solver:

```bash
uv run python scripts/audit_aligned_p5_row_requirements.py --check docs/audits/2026-09-06-native-card11-aligned-p5-row-requirements.json
uv run python scripts/audit_aligned_p5_apex_metric.py --check --report docs/audits/2026-09-06-native-card11-aligned-p5-apex-metric.json
uv run pytest -q scripts/test_audit_aligned_p5_row_requirements.py
```

## Existing reusable pattern

The metric data suggest the following six-incidence Kalmanson pattern for
`a < b < c < d < e < f`:

\[
row\ a\supseteq\{b,d\},\qquad row\ c\supseteq\{d,f\},\qquad row\ e\supseteq\{b,f\}.
\]

The exact distance-equality consumer already exists as
[`false_of_six_ccw_three_shell_equalities_013_235_415`](../../lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean).
The three selected rows supply its equalities directly. It requires convex
independence, an injective CCW boundary enumeration with the correct image, and
the five displayed strict order relations. Source inspection found no need for
a new metric lemma; no fresh build or axiom audit of this endpoint was performed.

A short paper derivation adds strict Kalmanson inequalities on `(a,b,c,e)`,
`(c,d,e,f)`, and `(a,c,d,f)`. Cancellation gives

\[
d(a,d)+d(c,f)+d(e,b)>d(a,b)+d(c,d)+d(e,f),
\]

while the three selected-row equalities make the two sums equal. The missing
step is a structural proof that the source forces this pattern. A wrapper around the
existing endpoint would not close that gap.

## Completion matrix

| Obligation | Status | Boundary |
|---|---|---|
| Consumer chain and `(5,5,4)` profile | SOURCE AUDIT | Ingress → coordinator → aligned closure; no fresh Lean build |
| Row-existence clause interpretation | CHECKED | Exactly 120 seven-literal clauses require four of ten points |
| Ten single-center and apex-only ablations | PROVEN SAT for the retained Boolean clauses | No necessity claim outside the projection |
| Perturbed three-apex rational metric model | PROVEN SAT for the stated relaxation | No Euclidean, MEC, global-K4, or residual lift |
| Native-leaf replacement | OPEN | Fourteen direct/mirror leaves remain |
| Structural aligned-P5 occurrence producer | OPEN | Required to replace the terminal's native proof |
| Package-3 terminal replacement | OPEN | No native dependency retired |
| Universal P97 closure | OUT OF SCOPE | No all-cardinality claim |

## Next checkpoint

The next research task is either non-apex incidence propagation from the fixed
schemas or a stronger Euclidean constraint such as Ptolemy. Neither route
supports an unconditional smaller-core claim yet. The ten automated tests and
both exact witness replays pass; independent reviewers checked the source map,
Boolean assignments, and rational metric. This validates the diagnostic
checkpoint, not a replacement proof.
