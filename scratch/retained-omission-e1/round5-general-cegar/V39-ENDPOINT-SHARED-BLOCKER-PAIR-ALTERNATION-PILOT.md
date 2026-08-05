# v39 endpoint shared-blocker pair alternation pilot

Date: 2026-08-05

## Sound cut

The Lean theorem
`endpointFresh_sharedBlocker_pair_alternates` gives, for the first apex
`O`, endpoint `C`, endpoint `J`, and a candidate shared blocker `c`,

```text
between O c C  <->  not (between O c J).
```

The v39 pilot therefore adds, for every candidate `(J,c)` that is same-side
in the fixed cyclic order, the Boolean implication

```text
endpoint_j[J] and block[C,c]  ->  False.
```

This is the correct finite encoding of the source theorem. It does not try to
force a same-side placement; that placement is formally impossible.

## Result

Canonical case `fresh_DDD_k0_d2_f1`, with the v38 pinned physical-shell
multiplicity stack and the v37 hypothetical escape producer:

| check | result |
|---|---|
| alternation cuts | 111 |
| Boolean relaxation | SAT |
| Boolean included / excluded | 9048 / 18357 |
| full metric check | UNKNOWN |
| full reason | `canceled` |
| full assertion count | 27405 |

One Boolean model selected `J=7`, shared blocker `c=2`, with `C=0`; this is
an alternating placement and therefore survives the new cut. The model also
retains the exact common-shell shape `[C,K,L,J] = [0,1,6,7]` and a four-point
first-apex row `[0,2,7,13]`, so the cut does not remove the current abstract
survivor family.

## Status and next use

This is a diagnostic result only: the stack forces a hypothetical producer,
and SAT/UNKNOWN cannot close the universal E leaf. The alternation theorem is
now represented as a reusable CEGAR family. The next useful producer must add
an order-sensitive consequence beyond alternation (or consume the source-clean
escape row in an existing retained-omission leaf); same-side C/J placement
should not be pursued as a theorem target.
