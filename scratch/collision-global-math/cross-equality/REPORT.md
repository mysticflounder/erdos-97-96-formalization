# Cross-equality geometry audit

Verdict: none of the four cross equalities

- `b₀ = u`,
- `b₀ = v`,
- `b₁ = p`, or
- `b₁ = q`

is impossible from the two ordered equal-bisector triples, disjointness of
the source pairs, and `b₀ ≠ b₁`, even after retaining a common external apex,
two distinct apex radii, and strict convexity of the full point set.

The exact rational countermodel is in `CrossEqualityCountermodel.lean`.
Its strict-convex counterclockwise order is

```text
a=(1,15/4), p=(0,1), u=b₀=(1,0), q=(2,1), b₁=(3,11/4), v=(4,6).
```

The squared-distance identities are

```text
d(a,p)^2 = d(a,q)^2 = 137/16,
d(a,u)^2 = d(a,v)^2 = 225/16,
d(b₀,p)^2 = d(b₀,q)^2 = 2,
d(b₁,u)^2 = d(b₁,v)^2 = 185/16.
```

Thus the two source pairs are disjoint and occupy distinct common-apex
radii, both blockers lie strictly between their corresponding source
endpoints in the cap's linear order, and `b₀ = u` while `b₀ ≠ b₁`.
The Lean certificate checks all 20 positive orientations for the displayed
six-point order, not just consecutive turns.

The same configuration covers all four labels:

1. as displayed, `b₀ = u`;
2. swap the second row's endpoint names to obtain `b₀ = v`;
3. swap the two rows to obtain `b₁ = p`;
4. then swap the new first row's endpoint names to obtain `b₁ = q`.

Consequently, no CGN/Kalmanson lemma valid under only the stated hypotheses
can exclude a cross equality.  A live terminal must use additional global
deletion, shell-support, blocker-provenance, or tri-apex data.

## Existing-lemma check

The narrow production search found:

- `CGN.CGN6e5_exists_indexedWitness_of_twoApices`, which produces a cap
  witness strictly between the endpoints when two distinct equidistant
  centers see the same pair;
- `CGN.CGN6e6_unique_indexedWitness`, which makes that witness unique for
  one fixed endpoint pair; and
- `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`,
  whose contradiction requires two centers to share both later support
  vertices in one increasing quadruple.

The cross-equality model violates none of those conclusions: each source
pair has its own unique between-source blocker, and the two rows have
disjoint support pairs.  Identifying one row's blocker with an endpoint of
the other row does not create the shared-late-pair incidence required by the
Kalmanson consumer.
