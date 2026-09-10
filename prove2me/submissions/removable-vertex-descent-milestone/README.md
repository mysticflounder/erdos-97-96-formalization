<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Removable-vertex descent milestone

This packet updates the existing Prove2Me milestone
`Descent: a minimal counterexample with more than nine vertices has a removable vertex`.
It reuses theorem node `f03cf49e-3e3e-4cea-80fe-666a52629f3f`, whose Lean name is
`Erdos9796Mission.minimal_counterexample_removable`; it does not create a second theorem.

The milestone now identifies its formal contract with the platform rendering of the
repository theorem `Problem97.RemovableVertexOfLarge`, whose statement is named
`Problem97.RemovableVertexOfLargeStatement`. For a nonempty finite set `A` in convex
position, with `HasNEquidistantProperty 4 A`, `9 < A.card`, and the strong-induction
hypothesis excluding every smaller counterexample, the theorem produces a point `x`
with `IsRemovableVertex A x`. Unfolding that predicate gives `x ∈ A` and
`HasNEquidistantProperty 4 (A.erase x)`, which is exactly the existing platform
statement.

This is the large-cardinality descent engine. Erasing a removable vertex lowers the
cardinality while preserving nonemptiness, convex independence, and the four-equidistant
property. The resulting smaller counterexample contradicts the strong-induction
hypothesis. Once this theorem is proved, the counting lower bound and the `n = 9` closure
complete the positive Problem 97 induction.

The update was applied to the live mission on 2026-09-09. It reconciled theorem node
`f03cf49e-3e3e-4cea-80fe-666a52629f3f` and updated milestone
`e0085905-edbd-4e77-801f-cc348f53b3a8` in place. The theorem node and milestone remain
**Open**. The source declaration has no local
`sorry` or named axiom, but its non-`IsM44` branch transitively reaches
`ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap`, whose closure includes
`sorryAx`. Its pinned-surplus branch also uses native/compiler trust through finite
certificate banks. Accordingly this packet contains no `[[proof]]` entry and makes no
core-clean or completion claim.

The counting route elsewhere in the mission retains its Dumitrescu attribution. This
descent reduction is this project's formalization and is not attributed wholesale to
Dumitrescu.

Validate locally from the repository root with:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/removable-vertex-descent-milestone/plan.toml
```

The receipt records plan digest
`8bc5be386e480c980c31f3f9497ea7662780115ba8b0f631644c69ec356f641d`.
