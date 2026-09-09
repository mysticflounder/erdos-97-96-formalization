<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Exact-ten transfer note

The source theorem `Problem97.FiniteN10Closure` already rules out the
four-equidistant-points property for a convex-independent ten-point carrier.
Its proof constructs the source project's counterexample-data packet, derives
the exact `(5,4,4)` cap profile, supplies the checked full-distance-class input,
and closes through the exact-ten Proposition E endpoint.

The Prove2Me work is to port that proof and its public dependencies into the
mission vocabulary. The final public proof should import the proved exact-nine
node rather than conceal or duplicate that dependency. No proof is included in
this packet.

The source theorem inherits `Lean.ofReduceBool` and `Lean.trustCompiler`.
Server acceptance of this trust boundary is currently untested.
