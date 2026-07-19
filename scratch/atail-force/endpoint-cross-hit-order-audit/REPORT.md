# Endpoint cross-hit order audit

Date: 2026-07-17

Status: **PG136/Lemma 184 DOES NOT CLOSE THE ENDPOINT CROSS-HIT BRANCH. THE
CURRENT CONSTRUCTORS DO NOT EVEN PRODUCE ITS COARSE SIX-ROLE ORDER. IF THAT
ORDER IS ADDED, BOTH SURVIVING NESTED ORDERS ARE EXACTLY RATIONALLY
REALIZABLE. A PAIR-PRESERVING FIRST-APEX FOUR-SUBPACKET GIVES A BETTER
EXHAUSTIVE PROGRESS PACKET, BUT NO EXISTING TERMINAL. THE ACTIVE ROBUST
PRODUCER MUST RETAIN THE BI-APEX RESIDUAL, NOT ERASE IT TO THE FIRST-APEX
PARENT. NO PRODUCTION FILE OR PROOF WAS CHANGED OR BUILT.**

## Bank and source preflight

Before looking for another local order contradiction, this audit checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered fixed-anchor
companions, three isosceles equalities in cyclic order, nested equal-radius
rows, and endpoint cross hits.  The closest reusable results are the existing
ordered cross-row consumers, the retained-collision different-pair consumers,
the six-point order cores, and the `/opt/nfs` Lemma 184 itself.  None consumes
either surviving PG136 tail from the live endpoint constructor.

The authoritative external statements used here are:

- `/opt/nfs/verified-results.md`, Lemma 184 and Proposition 195; and
- `/opt/nfs/possible-new-geometry.md`, PG136 and PG147.

## Exact role map

On

```text
matchingEndpointCriticalFiber
  -> EndpointFreshCrossOrCommonDeletion.crossHit
```

the roles used by `critical-fiber-producer-push` are

```text
O = S.oppApex1
A = H.centerAt W.first = H.centerAt W.next
X = H.centerAt J
C,K = W.first,W.next in the orientation selected by the O-row hit
J = a fresh point of that O-row
```

The three equalities are

```text
OJ = OC,   AC = AK,   XJ = XK.
```

They map to Lemma 184's first form as

```text
ledger:   D  P  Q  Z  A  B
endpoint: O  A  X  K  C  J.
```

Hence the coarse restricted order

```text
O, A, X, perm(K,C,J)
```

forces `J` strictly between `K,C`, leaving exactly

```text
O,A,X,K,J,C
O,A,X,C,J,K.
```

The formerly requested order `O,A,X,J,C,K` is one of the four orders Lemma
184 rules out.  It must not remain the target placement.

## What production actually localizes

The endpoint path supplies much less order data than that coarse order:

- `W.first,W.second` lie in the strict interior of `oppIndex1` and on the
  retained `O`-radius;
- `W.next` lies either in the strict `oppIndex1` interior or the strict
  `oppIndex2` interior;
- the endpoint fiber identifies its two sources with `W.first,W.next`;
- `J` is only a selected O-row point distinct from the two endpoint sources
  and from `W.second`;
- `A` and `X` are carrier blockers, but neither has a retained cap index.

In particular, the constructors do not locate `J`, `A`, or `X` in cap blocks
and do not establish `O,A,X,perm(K,C,J)`.  They also do not supply every
six-role distinctness needed by Lemma 184: for example, `A = X` is not split
away by `EndpointFreshFirstApexRowSource`.  Any faithful adapter must first
handle blocker/source degeneracies and then establish the coarse order.

## Both nested tails are locally realizable

`check_nested_models.py` gives one exact rational strict-convex realization
of each surviving order.  It checks with `fractions.Fraction` arithmetic:

- all six points are distinct;
- all twenty increasing triples have one strict orientation;
- `OJ = OC`, `AC = AK`, and `XJ = XK` at squared-distance level; and
- the tail `K,J,C` (or its reverse) is strictly nonacute at `J`.

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/endpoint-cross-hit-order-audit/check_nested_models.py
```

The minimum absolute orientation margins are `1/30` and `17/1458`; the
strict cap-chain inner products are `-41/15` and `-16/225`.  These are local
regressions, not `CounterexampleData` instances, but they are decisive for
the proposed local consumer: strict convexity, the three live equalities, and
even the local obtuse-chain inequality do not refute either PG136 survivor.

## Audit of the pair-preserving four-subpacket correction

The arbitrary fresh-`J` selection is structurally overweak.  A better
uniform construction is available directly from the current parent:

1. use
   `FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four`
   on `{W.first,W.second}` inside the retained O-radius class;
2. package the resulting set as a selected O-row `T`;
3. retain the two points of `T \ {W.first,W.second}` instead of choosing one
   anonymous `J`; and
4. split the actual critical row at each residual point.

This fixes the endpoint orientation `C=W.first`, keeps the middle source, and
gives an honest exhaustive progress surface:

### A. `W.next` belongs to `T`

Then both endpoint-fiber sources `W.first,W.next` lie on the retained
O-radius and have the same actual blocker.  The endpoint fiber therefore
packages directly as the existing `RetainedRadiusCollision`.  That is useful
normalization but is explicitly nonterminal: its local different-pair/order
surface has exact rational survivors.

### B. `W.next` does not belong to `T`

Both residual points are genuinely distinct from `W.first,W.second,W.next`.
For either residual source `J`:

- if `W.next` is absent from `selectedAt J`, first-apex robustness and
  `cross_deletion_survives_iff_not_mem_selected_support` construct the same
  `CommonDeletionTwoCenterPacket` as the current endpoint continuation;
- if it is present, the row gives one source-faithful cross hit
  `XJ = X W.next`.

Thus any miss gives a concrete new common-deletion edge.  Only the double-hit
case remains, and it retains two O-radius companions and both actual rows.
This is a materially better packet than one arbitrary `J`, but it is not a
current contradiction.  `/opt/nfs` Proposition 195/PG147 independently
shows that even two- and three-row monotone fixed-outsider companion ladders
have exact rational strict-convex local realizations.  A fourth exact target,
full critical-shell support, or parent-level cap/MEC coupling is still needed.

The adjacent-cap one-hit bounds refine `T` only as follows: because
`W.first,W.second` already occupy the first opposite-cap interior, at most
the two complement points lie outside it, with at most one in each adjacent
closed cap.  This supplies block labels when both escape, but no existing
terminal consumes those labels together with the two cross hits.

## Why this is not the source-return terminal

The pair-preserving subpacket superficially resembles
`nonempty_sourceReturnRadiusOutcome`, but it cannot instantiate either of its
constructors:

- `RetainedSourceReturnJointDeletion` and
  `RetainedSourceReturnExactFourPartition` both require
  `W.next = W.first`, whereas the endpoint fiber stores
  `W.next != W.first`;
- the source-return proof uses that equality to turn
  `W.next_not_mem_second_shell` into
  `W.first_not_mem_second_shell`; that disjoint-root fact is unavailable here;
- a four-point subpacket partition is not an exact partition of the complete
  retained radius class unless its cardinality is separately proved to be
  four.

Even after adding the missing cross-omission needed for a two-shell split,
the outcomes would only be a joint-deletion packet or a subpacket-local
two-by-two partition.  The former is a known nonterminal, and the latter is
strictly weaker than the existing exact-four U5 ingress.

## Smallest honest next theorem

The best next producer is the pair-preserving classification, not a theorem
claiming that PG136 nesting is false.  It must be indexed by the live
bi-apex object

```lean
B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R
```

rather than by `R` alone.  The old proposed surface

```lean
nonempty_criticalFiberClosingCore R
```

forgets `B.secondApex_robust` before reaching the only unresolved double-hit
branch.  First-apex robustness is recoverable from `B.firstApex_robust`, so
the pair-preserving classification can perform all of the analysis above
without discarding the second robust apex.  Its terminal-looking residual
should be named mathematically along these lines:

```text
endpointPairInRetainedRow
  or freshCommonDeletion
  or twoFreshEndpointCrossHits
```

where the last branch retains `T`, both residual sources, both actual blocker
centers and shells, the adjacent-cap location split, and the ambient
`B : FrontierBiApexRobustResidual R`.  A compatible top-level theorem shape
would therefore be

```lean
nonempty_criticalFiberClosingCore_of_biApexRobust
    (B : FrontierBiApexRobustResidual R) :
    Nonempty (CriticalFiberClosingCore R)
```

only if the second-apex robustness actually proves one of the existing core
constructors.  The more honest intermediate result is the B-indexed progress
sum above; a direct `False` theorem indexed by `B` is preferable if the
double-hit consumer closes without naturally constructing a current core.
The immediate new consumer must use one fact absent from the exact local
models:

- a full-support fourth target shared or ordered across the two actual rows;
- a cap/MEC localization forcing an order outside the two PG136 tails;
- a third deletion-critical row which saturates a common pair; or
- the retained second-apex robustness to turn the new common-deletion or
  double-hit packet into a bi-apex contradiction.

Without one of those additions, “`J` lies between `C,K`” and the double-hit
companion packet are both nonterminal.
