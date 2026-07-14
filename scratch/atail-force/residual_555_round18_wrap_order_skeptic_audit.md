# Skeptic audit: `(5,5,5)` round-18 wrap-order core

## Verdict

**PASS / CERTIFIED for the bounded consumer.**  The pinned residual map,
equality closure, cyclic-order signs, and scalar contradiction passed an
independent exact audit.  Fresh elaboration then checked the current metric
core, both orientation consumers, and the GeneralCarrier adapter.  All six
printed endpoint axiom sets are exactly `propext`, `Classical.choice`, and
`Quot.sound`, with no `sorryAx`.  The integrated matcher replay closes rounds
18 and 19 and stops honestly at a new uncovered round-20 residual.

This certifies the wrap-order theorem and its application to the two bounded
CEGAR cuts.  It does not produce the pattern uniformly from the live ATAIL
hypotheses and does not close the round-20 survivor.

## Scope audited

- saved common-system metric CEGAR checkpoint
  `scratch/atail-force/common_system_metric_probe.json`;
- conjectural reduction
  `scratch/atail-force/residual_555_round18_wrap_order_analysis.md`;
- draft metric/core theorem
  `scratch/atail-force/six_point_circle_chain_wrap_order_core.lean`;
- the round-18 GeneralCarrier adapter, once written;
- production definitions and the round-17 comparison implementation in
  `Census554/GeneralCarrierBridge.lean` and
  `Census554/SixPointCircleChainOrderCore.lean`.

## Theorem-bank preflight

The registries required by `AGENTS.md` were searched before assessing a new
kernel: `docs/general-n-certificate-bank-mining-2026-07-09.md`, the concise and
JSON `p97-rvol`, legacy `erdos/97`, and older `erdos-general-theorem/97`
inventories, plus multiple `nthdegree docs search --lean` queries for the
six-point circle-chain, wrap order, signed-area, and equal-distance forms.
The closest banked result is the production
`SixPointCircleChainOrderCore`, whose cyclic order is `O,A,D,E,C,Y` and whose
fourth sign is `C,Y,O`.  It does not apply to the saved order
`O,Y,A,D,E,C`; neither the forward nor reversed old matcher finds a core.
No exact pre-existing wrap-order consumer was found.

## Exact residual and equality closure

The checkpoint pins round 18 by assignment digest
`5dac7824ce5ab4dd7c6f18e2fb3c88306d64dc2cefe1bce2d3d696b8ad4e49f8`,
with rows

```text
0:{1,2,3,4}  1:{0,2,6,7}  2:{3,8,9,10}
3:{1,4,5,6}  4:{1,2,9,11}
```

and cyclic order

```text
(0,9,10,11,1,3,4,5,2,6,7,8).
```

Under

```text
(O,Y,A,D,E,C) = (0,9,1,3,4,2),
```

the rows directly give

```text
OA = OC = OD = OE       (row 0)
OA = AC                 (row 1 plus edge reversal)
DA = DE                 (row 3)
EA = EC = EY            (row 4)
CD = CY                 (row 2).
```

Independent replay through the exact row-equality closure confirms all eight
comparisons.  This part is **EMPIRICALLY VERIFIED by exact finite
computation** and is also transparent by inspection; it does not depend on a
CAS feasibility verdict.

The six mapped labels occur in the saved order exactly as
`O,Y,A,D,E,C`.  Consequently `OAC`, `OAE`, `OAD`, and `OYA` all have the same
cyclic direction.  In the repository's `BoundaryIndexing` convention their
signed areas are negative, so the actual adapter must call the reflected
consumer `false_of_core_of_neg`.  The positive metric theorem may equivalently
normalize these four signs as positive.

## Independent scalar audit

Normalize `O=(0,0)` and `A=(1,0)`.  The first three positive signs select

```text
C = (1/2,h),              h^2 = 3/4, h > 0,
E = (h,1/2),
D = (t(1/2+h),t(h-1/2)),  t^2 = 1/2, t > 0.
```

There is no suppressed branch here: the other intersections at the `E` and
`D` stages are the normalized anchor `O`, and the strict `OAE` and `OAD`
signs exclude them.

Write `Y=(r,g)`.  The two remaining circle equations reduce exactly to

```text
f = r^2 + g^2 - 2hr - g + 2h - 1 = 0,
k = r^2 + g^2 - r - 2hg + 2t - 1 = 0.
```

Subtracting gives

```text
(2h-1)(r-g) = 2(h-t).
```

Using `h^2=3/4` yields

```text
r = g - 2ht + h - t + 3/2.
```

Substitution in `f`, followed only by `h^2=3/4` and `t^2=1/2`, gives

```text
P(g) = -4g^2 + (8ht+4t-4)g + (12ht-8h+6t-5) = 0.
```

An independent exact Sympy reduction verifies `P=-2f` modulo those two square
relations and the displayed formula for `r`.  It also verifies that the
different polynomial recorded in the earlier conjectural analysis lies in
the same defining ideal; the discrepancy is a change of ideal representative,
not a mathematical conflict.

The coefficient signs are exact:

1. `h>1/2` and `t>1/2`, hence `8ht+4t-4>0`.
2. `59/84<t<5/6`, both consequences of `t^2=1/2` and `t>0`.
3. Thus `2/3<t`, and both `4h(3t-2)` and `5-6t` are positive.
4. Their squared gap is

   ```text
   (5-6t)^2 - (4h(3t-2))^2 = 84t-59 > 0.
   ```

   Hence `4h(3t-2)<5-6t`, which is exactly
   `12ht-8h+6t-5<0`.

Finally, `signedArea2 O Y A>0` is `g<0`.  Therefore the quadratic term,
linear term, and constant term of `P(g)` are each strictly negative, contrary
to `P(g)=0`.  Numerically, only as a sanity check, the two algebraic roots for
the positive `h,t` branch have `g approximately 0.83036` and
`g approximately 0.10149`; neither satisfies the wrap sign.

This independently establishes the scalar argument as **ALGEBRAICALLY
VERIFIED**; the fresh Lean gate below upgrades the stated theorem to
**PROVEN**.  The numerical values are not used as evidence for the theorem.

## Distinctness and interface audit

- The scalar theorem needs only `O != A` in addition to the strict signs.
  The signs themselves rule out all degeneracies used by the normalization.
- A GeneralCarrier adapter should derive `O != A` from the strict cyclic index
  chain.  The six saved labels are distinct, and a proper six-index cyclic
  predicate makes that distinctness explicit.
- `FaithfulCarrierPattern` supplies only realized row equalities.  The cyclic
  signs come separately from a `BoundaryIndexing` of a convex-independent
  carrier.  No exact-off-circle or source-row provenance is needed by this
  particular consumer.
- Conversely, the live proof still needs a producer for the five named rows
  and their cyclic placement.  A generic `FiveRowSupportData` adapter is a
  consumer interface, not that producer.

The completed adapter source passes the line-by-line audit:

- lines 30--52 define precisely the six cyclic rotations of
  `O,Y,A,D,E,C` and derive exactly `OAC,OAE,OAD,OYA`;
- lines 125--177 construct the reused equality core, with every membership
  assigned to its correct center row and the sole reversal in `OA=AC` made
  explicit;
- lines 181--193 use `false_of_core_of_neg`, which is the correct consumer for
  the repository's negative boundary signed-area convention.

No additional distinctness, exact-off-circle, or hidden source-provenance
hypothesis appears in this source.  The completed elaboration gate below
independently validates this source-level assessment.

## Claim classification

| Claim | Classification after this audit |
|---|---|
| checkpoint digest, rows, and saved order | EMPIRICALLY VERIFIED from the hash-bound exact artifact |
| eight equality closures for the displayed map | EMPIRICALLY VERIFIED by exact finite closure; transparent direct derivation |
| four triples share the saved cyclic direction | EMPIRICALLY VERIFIED by exact order replay |
| normalized scalar contradiction | PROVEN in Lean; also ALGEBRAICALLY VERIFIED independently |
| current Lean theorem and reflected consumer | PROVEN; fresh elaboration, core-only axiom closure |
| round-18 GeneralCarrier adapter | PROVEN; fresh elaboration, core-only axiom closure |
| round-18 and round-19 residuals are rejected by this matcher | EMPIRICALLY VERIFIED by deterministic hash-bound replay, backed by the proved consumer |
| uniform `CARD-GE-12` or live ATAIL producer | CONJECTURED and not supplied by this kernel |

## Completed validation gate

The out-of-tree scratch modules were checked through the repository's narrow
direct-Lean exception with the standard 16 GiB cap:

- core clean elaboration: exit `0`, no warnings;
- adapter elaboration: exit `0`, no warnings;
- textual scan: no `sorry`, `admit`, or declared `axiom`;
- `normalized_wrap_order_incompatible`,
  `metric_orientation_incompatibility`, `false_of_core`, and
  `false_of_core_of_neg`: each exactly
  `[propext, Classical.choice, Quot.sound]`;
- `FiveRowSupportData.toCore` and
  `false_of_five_rows_and_cyclic_subsequence`: the same exact axiom set.

The deterministic matcher uses the transitive equality closure and enumerates
six distinct labels in cyclic order `O,Y,A,D,E,C`.  Independent replay passed:

```text
15 focused unit tests: OK
common_system_metric_probe.py --check: OK
```

The replay accepts the exact round-18 five-row cut with `Y=9`, then the
round-19 analogue with `Y=10`.  It deliberately finds neither forward nor
reversed wrap-order core at round 20.  The new honest endpoint is

```text
round: 20
assignment digest: cf430fcdcb5a0f3747822381083882cdc3900f225fb86d32c7807f5704c02a67
rows: 0:{1,2,3,4}, 1:{0,2,6,7}, 2:{3,8,9,10},
      3:{1,4,5,6}, 4:{1,7,8,11}
status: CROSSCHECKED_NONUNIT; real feasibility undecided
```

The result must remain labeled as a bounded `CARD-EQ-12` consumer.  It does
not by itself change the cardinal threshold or close the live producer.
