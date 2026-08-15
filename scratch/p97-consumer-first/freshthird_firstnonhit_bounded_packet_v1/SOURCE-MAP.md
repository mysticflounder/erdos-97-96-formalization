# Source map

All line references below are to exact commit
`604b7d4b2089068920fd5afdcef3dd1cca4b4dbd`, not to the moving worktree.

## Primary ingress and consumer

| Source | Lines | Encoded consequence |
|---|---:|---|
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean` | 1577-1585 | Declares the output a bounded named-data projection, explicitly not an induced subcarrier. |
| same | 1585-1631 | `V` is nonempty, lies in exact Q support, has card at most four, blocks K4 after deletion, and supplies a shared-radius pair or a minimal deletion core. |
| same | 1562-1569 | The proof itself exhibits the Q-row center as an element of `D.A \ KQ.support`; therefore “outside Q support” cannot be strengthened to “different from Q center.” |
| same | 2354-2375 | The still-open consumer requires an arbitrary carrier source with different center and Q-support intersection cardinality at least three. |

The exact primary-source blob is
`d40b0da82303775206ad5236595b690337e0b21a`.

## Row inputs

| Source | Lines | Encoded consequence |
|---|---:|---|
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean` | 1980-2042 | Second interaction cases: equal center/support; omission of q0 or q1; or different-center exact overlap `{q0,q1}` in either cap arm. |
| same | 2068-2087 | First non-hit cases: equal center/support or omission of q0/q1 with deletion survival. |
| same | 2089-2118 | Omission survival entails that the row center differs from the Q-row center. |
| `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean` | 70-111 | Q has two distinct source labels and each source lies on the other source's selected shell. |

The exact source blobs are respectively
`42781b87ddb49612015cb861b9ef0cc1fdd7e98e` and
`d76c51a25da83d21ca50741a3e8fe4b871a3c936`.

## Exact shell and core fields

| Source | Lines | Encoded consequence |
|---|---:|---|
| `lean/Erdos9796Proof/P97/U1CarrierInjection.lean` | 638-652 | Every critical shell is its full ambient radius class, has exactly four points, and contains its source label. |
| `lean/Erdos9796Proof/P97/ATail/MinimalDeletionCore.lean` | 31-43 | Each active deletion label has a critical selected four-class at the common center; distinct labels' full supports are pairwise disjoint. |

The exact blobs are `2580da141de10b8fd754cc41d11d282f77482e7b` for the
first file and `e990d9f3f55030562099218f0bdc219f7b724395` for the
second.

## Projection losses

The following source facts are intentionally not encoded: real coordinates,
distance equations, positivity, ambient membership beyond named incidence,
cap geometry, `hingress` geometry, identities of outside-support shell points,
deletion-restoration K4 witnesses, and every unnamed `H.selectedAt` row.

These losses are one-way weakening.  They are why a SAT result cannot be
lifted to a P97 counterexample and why even an UNSAT result would need a
finite-coverage audit before use in Lean.
