<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Statement and trust provenance

The packet is pinned to source revision
`ff13d98d92694d0e460549031049f08357ff6150`.

| Prove2Me target | Existing source declaration | Source statement abbreviation |
|---|---|---|
| `Erdos9796Mission.finite_ten_exclusion` | `Problem97.FiniteN10Closure` in `lean/Erdos9796Proof/P97/FiniteN10.lean` | `Problem97.FiniteN10ClosureStatement` in `P97/Foundation.lean` |
| `Erdos9796Mission.finite_eleven_exclusion` | `Problem97.FiniteN11Closure` in `lean/Erdos9796Proof/P97/FiniteN11.lean` | `Problem97.FiniteN11ClosureStatement` in `P97/Foundation.lean` |

The source abbreviations expand respectively to

```lean
∀ A : Finset ℝ², A.card = 10 → Problem97.ConvexIndep A →
  ¬ HasNEquidistantProperty 4 A

∀ A : Finset ℝ², A.card = 11 → Problem97.ConvexIndep A →
  ¬ HasNEquidistantProperty 4 A
```

The mission nodes use `Plane := EuclideanSpace ℝ (Fin 2)`, the coerced set
form `ConvexIndep (A : Set Plane)`, and the mission-local copy of
`HasNEquidistantProperty`. A transfer must compile an explicit adapter or
direct reduction in the Prove2Me environment; the statement-only nodes do not
themselves verify that adapter.

The cardinalities, universal quantifier, convex-independence hypothesis,
equidistance parameter `4`, and negated conclusion are preserved exactly. The
exact-ten source is downstream of the exact-nine endpoint, and the exact-eleven
source invokes exact ten. The intended public dependency order is therefore

```text
n = 9 → n = 10 → n = 11.
```

The source-project audits document both headline closures as containing exactly
`propext`, `Classical.choice`, `Quot.sound`, `Lean.ofReduceBool`, and
`Lean.trustCompiler`, with no `sorryAx` and no custom axiom. This establishes
source closure under the project's approved native/compiler trust tier; it does
not establish that Prove2Me accepts that tier. The port must report the compiler
trust cost and test server acceptance before either target is marked proved.
