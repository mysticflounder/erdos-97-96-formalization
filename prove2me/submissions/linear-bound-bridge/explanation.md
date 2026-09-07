Assume Problem 97: every nonempty finite convex-independent planar set has a vertex without four equidistant neighbours. We prove that each such set A determines at most 3|A| unordered unit-distance pairs, and consequently the extremal unit-distance count is O(n).

The proof repeatedly deletes a vertex of unit degree at most three. Problem 97 supplies that vertex: if every vertex had at least four unit-distance neighbours, radius one would witness the forbidden four-equidistant property everywhere. Deletion preserves convex independence because the convex hull of a subset is contained in the convex hull of the original set.

Every unordered unit-distance pair in A either survives deletion of p or contains p. Pairs containing p are images of unit-distance neighbours under q ↦ {p,q}; their number is at most the number of those neighbours. Thus deleting p removes at most three pairs. Strong induction on |A| gives the bound 3|A|, with the empty set as the base case. The Lean proof works directly with the mission's symmetric-square representation of unordered pairs.

For each n, every value in the set defining the extremal count is at most 3n. Its supremum is therefore at most 3n; if that set is empty, its natural-number supremum is zero. Casting this bound to the reals gives the stated O(n) estimate with constant three.

Problem 97 remains an explicit hypothesis throughout. This proves the conditional bridge; it does not prove Problem 97 or the unconditional Problem 96 statement.
