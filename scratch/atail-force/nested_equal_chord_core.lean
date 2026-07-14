/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.NestedEqualChordCore

/-!
# Nested equal-chord obstruction isolated by the common-system CEGAR

Five points occur in cyclic order `o,a,b,c,d`.  The four points `a,b,c,d`
lie on the circle centered at `o`, while the nested chords `a-d` and `b-c`
both have the circle's radius.  Strict convex orientations are incompatible
with those equalities.

This scratch theorem is the proof-local kernel for the `(4,5,6)` common-system
residual.  It uses only the three metric rows centered at `o`, `a`, and `b`.
-/

#print axioms Problem97.Census554.NestedEqualChordCore.metric_orientation_incompatibility
#print axioms Problem97.Census554.NestedEqualChordCore.false_of_core
#print axioms Problem97.Census554.NestedEqualChordCore.false_of_core_of_neg
