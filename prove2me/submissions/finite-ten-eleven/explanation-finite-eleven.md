<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Exact-eleven transfer note

The source theorem `Problem97.FiniteN11Closure` already rules out the
four-equidistant-points property for a convex-independent eleven-point carrier.
Its smaller-carrier argument invokes `Problem97.FiniteN10Closure`; its remaining
branches use the source project's removable-vertex and authenticated finite-bank
endpoints.

The Prove2Me work is to port this proof only after the public exact-ten node is
proved, preserving the visible dependency chain from exact nine through exact
ten to exact eleven. No proof is included in this packet.

The source theorem inherits `Lean.ofReduceBool` and `Lean.trustCompiler`.
Server acceptance of this trust boundary is currently untested.
