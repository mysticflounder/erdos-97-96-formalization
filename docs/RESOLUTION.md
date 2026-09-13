# Resolution of Erdős Problems 96 and 97

**Both problems are solved negatively. Resolution and project closure recorded
13 September 2026.**

The source is Liam Kruer, Jensen Kohlmeyer, and Liam Price’s *Unit distances in convex polygons*
[KKP2026](#references). The project accepts this construction as its resolution.
The authors' Lean source and the exact mission adapters were checked locally,
independently reviewed for source and statement fidelity, and accepted by Prove2Me.

## Mathematical result

For a finite strictly convex planar point set P, let u(P) count unordered
unit-distance pairs and let δ₁(P) be the minimum number of unit-distance
neighbours at any vertex. Write U_c(n) for the maximum possible u(P) over
strictly convex n-point sets. All logarithms in the following bound are base two.

Theorem 1.1 of [KKP2026](references/kruer-kohlmeyer-price-2026.md) states that
there are absolute constants C and n₀ such that, for every n ≥ n₀, there is
such a set P with n points satisfying

> min{δ₁(P), u(P)/n} ≥ ¼ log log n − C log log log n.

Consequently, Corollary 1.2 gives:

- **Problem 96:** U_c(n) = Ω(n log log n), so the proposed O(n) upper bound is false.
- **Problem 97:** taking k = 4 gives a polygon where every vertex has four unit-distance neighbours, refuting the proposed vertex property.
- **General fixed-k version:** for every integer k ≥ 1 and every sufficiently large n, every vertex can have at least k unit-distance neighbours.

The common distance is one at every vertex. Corollary 4.4 also gives the
explicit upper bound 3432·2^36036 on the number of vertices needed for a
Problem 97 counterexample. This is a cardinality bound for an existence
construction, not a coordinate list or a minimality claim.

## Verification and exact statements

The source revision is
`0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2`. The
[pinned source manifest](../prove2me/submissions/negative-resolution-20260913/provenance.json)
authenticates the manuscript, original Lean file, and environment files.

| Original mission target | Platform result | Accepted disproof submission |
| --- | --- | --- |
| [Problem 96](https://prove2.me/theorems/8ade9b04-8ed3-4b0a-a948-9a5df9f1c637) | Disproved | `d9629b77-2ade-4d49-a684-b8af3636a0b7` |
| [Problem 97](https://prove2.me/theorems/4ec1c9bf-88ad-4632-aa55-375d24e19335) | Disproved | `efea2a37-8532-4e61-b3d1-eb63b71ee7ae` |
| [Problem 97 ∧ Problem 96](https://prove2.me/theorems/a6bf5110-b91e-4a2c-9d03-8b51a8a9e6ad) | Disproved | `9ceb235a-d2c2-44a3-948b-9ec4a4119f72` |

The Problem 97 adapter directly uses the authors' `Proof.erdos_97_false`.
The Problem 96 adapter proves that the mission and source definitions count
the same unordered unit-distance pairs, transports the count sets and their
suprema, and then applies `Proof.erdos_96_false`. The combined target is
refuted using its Problem 97 conjunct; Problem 96 has its own separate disproof.

The complete source and final adapters passed Lean 4.33.1 checks with Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`. The final consumers' axiom closures
are exactly `propext`, `Classical.choice`, and `Quot.sound`. The upstream
custom audit elaborator was omitted from upload copies because Prove2Me does
not support custom elaborators; all construction proof declarations were
preserved, and the full local audit remains recorded.

See the [local checks](../prove2me/submissions/negative-resolution-20260913/verification.json),
[independent transfer audit](../prove2me/submissions/negative-resolution-20260913/audit.json),
and [final platform readbacks](../prove2me/submissions/negative-resolution-20260913/closure-receipt.json).
The verification consists of source-transfer review, exact statement matching,
and kernel/server checks.
All credit for the counterexample and upstream formalization belongs to
Kruer, Kohlmeyer, and Price; Adam McKenna prepared the platform adapters.

## Disposition of the earlier project

The original affirmative development under `lean/` remains historical and
unfinished, including its recorded `sorry` obligations. Its proved supporting
lemmas and conditional reductions retain their stated scope. Neither the
old positive proof spine nor its generated obligation counts are relabelled
as a completed proof of the affirmative conjectures.

The owner closed the project; eight open platform tasks were retired, five
milestone notices were updated, and a public closure announcement was posted.
See [CLOSED.md](../CLOSED.md) and the [submission packet](../prove2me/submissions/negative-resolution-20260913/README.md).
No new affirmative proof or solver lanes are authorized. Reopening requires
Adam's explicit direction. Dated research records and generated snapshots
remain historical evidence.

## References

**[KKP2026]** Liam Kruer, Jensen Kohlmeyer, and Liam Price. *Unit distances in convex polygons*. 2026. GitHub manuscript, revision `0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2`.
[Source revision](https://github.com/Leeham06972452/erdos-96-97/tree/0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2).

The [reference record](references/kruer-kohlmeyer-price-2026.md) verifies the
author order, title, year, and theorem/corollary locators against the retained
[local PDF](references/kruer-kohlmeyer-price-2026.pdf) and source text.
Machine-readable citation data are in the [registry](references/references.json)
and [BibTeX entry](references/kruer-kohlmeyer-price-2026.bib). No DOI, arXiv
identifier, or journal venue is asserted.
