# Negative resolution and project closure — 13 September 2026

The project owner directed closure following **Unit distances in convex
polygons**, by **Liam Kruer, Jensen Kohlmeyer, and Liam Price**. All credit for
the construction and its upstream Lean formalization belongs to those authors.
Adam McKenna prepared the platform adapters and administrative closure.

The construction gives strictly convex point sets with Ω(n log log n)
unordered unit-distance pairs and arbitrarily large fixed minimum
unit-distance degree. These are negative resolutions of Problems 96 and 97,
including the general fixed-k version of Problem 97.

- [Pinned upstream repository](https://github.com/Leeham06972452/erdos-96-97/tree/0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2)
- [Manuscript](upstream/96-97.pdf), [original Lean source](upstream/Erdos9697Complete.lean), and [source hashes](provenance.json)
- [Public mission](https://prove2.me/missions/Erd%C5%91s%20Problems%2097%20and%2096%3A%20Convex%20Point%20Sets%20and%20Unit%20Distances)

**Status: all three disproof submissions ACCEPTED; both individual statements
and the combined mission goal are Disproved.**

## Exact-statement submissions

| Target | Prove2Me theorem ID | Receipt |
| --- | --- | --- |
| [Problem 97](https://prove2.me/theorems/4ec1c9bf-88ad-4632-aa55-375d24e19335) | `4ec1c9bf-88ad-4632-aa55-375d24e19335` | [receipt.json](receipt.json) |
| [Combined original goal](https://prove2.me/theorems/a6bf5110-b91e-4a2c-9d03-8b51a8a9e6ad) | `a6bf5110-b91e-4a2c-9d03-8b51a8a9e6ad` | [extra-receipt.json](extra-receipt.json) |
| [Problem 96](https://prove2.me/theorems/8ade9b04-8ed3-4b0a-a948-9a5df9f1c637) | `8ade9b04-8ed3-4b0a-a948-9a5df9f1c637` | [p96-receipt.json](p96-receipt.json) |

Each upload proves the negation of its original statement with
`proof_type = "disprove"`; no target theorem or open platform theorem is
imported. The combined goal is refuted using the Problem 97 counterexample.
Problem 96 receives a separate adapter for the mission's unordered-pair
counting definition.

The upstream proof declarations are preserved. The platform forbids the
authors' custom axiom-audit elaborator, so its final audit block is omitted
from upload copies. The complete original source and its successful local
audit are retained. The first rejected attempt is recorded in
[receipt-rejected-audit.json](receipt-rejected-audit.json); that rejection was
an unsupported-command error.

The checks use Lean 4.33.1 and Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`. See
[local checks](verification.json) and [independent transfer audit](audit.json)
for exact file hashes and axiom results. Only `propext`, `Classical.choice`,
and `Quot.sound` are permitted. This is a source-transfer and kernel audit;
it is not a separate prose re-proof of the paper.

## Closure

The closure is published and read back: eight historical open tasks retired,
five milestone notices updated, and a public closure announcement posted.

[closure-receipt.json](closure-receipt.json) records live theorem states,
the mission notice, discussion announcement, and retirement readbacks.
Retirement hides historical open work items from discovery while preserving
their source, proof status, and existing imports. Proved supporting lemmas
remain available. Administrative retirement does not label each historical
lemma false.

The project agent channel was notified to stop positive-conjecture work,
solver waves, and swarm dispatches. The repository entry points carry the
[owner's closure instruction](../../../CLOSED.md). New research requires
explicit reopening by Adam.

The plans can be replayed with `tools/prove2me_submit.py apply`; successful
receipt entries are reused. After all three original theorem pages report
`Disproved`, `upload.py close` publishes and verifies the administrative
closure. Credentials stay outside the repository and are never copied into
the receipts.
