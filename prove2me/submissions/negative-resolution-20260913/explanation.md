Counterexample and complete Lean formalization by Liam Kruer, Jensen Kohlmeyer, and Liam Price, Unit distances in convex polygons (13 September 2026): https://github.com/Leeham06972452/erdos-96-97/blob/0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2/96-97.pdf .

This submission preserves the authors’ complete single-file Lean construction, pinned to upstream commit 0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2, and appends only a Prove2Me adapter prepared by Adam McKenna. Every point in the constructed strictly convex polygon has at least four other points at distance one. The authors prove arbitrarily large fixed minimum unit-distance degree and a superlinear Ω(n log log n) unit-distance count as well.

The solution proves the exact negation of the original mission statement, without importing that theorem or any open platform theorem. Its transitive axiom audit permits only propext, Classical.choice, and Quot.sound. The original affirmative research mission is closed at the owner’s direction.
