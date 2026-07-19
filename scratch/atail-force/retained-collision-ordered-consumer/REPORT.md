# Retained-collision ordered-consumer audit

Date: 2026-07-17

Status: **KERNEL-CHECKED ROUTE CORRECTION. EVERY RETAINED COLLISION HAS A
FIRST-APEX `RowHit`, BUT THE PROPOSED SIX-ROLE ORDER
`O,A,X,J,C,K` IS IMPOSSIBLE FOR THAT COLLISION. THE ORDERED TERMINAL CANNOT
CLOSE THIS SELECTOR ARM. NO PRODUCTION `sorry` IS CLOSED.**

## Question

Start from the new production selector's collision arm

```lean
Q : ATailCriticalFiberRetainedRadiusSelector.RetainedRadiusCollision
      (R := R)
```

and an actual first-apex row hit for `Q.fiber`. Can the full parent geometry,
minimality, and `R.noM44` produce the two fields isolated by the earlier
ordered audit?

```text
K in (H.selectedAt J).support
cyclic subsequence O,A,X,J,C,K
```

Here `C,K` are the two collision sources, `A` is their common actual blocker,
`O` is the retained first apex, and `X = H.centerAt J`.

## Required bank preflight

Before introducing the scratch packet, this lane checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including its
  sibling `p97-rvol` and cyclic-separation sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered retained-radius
blockers, cross-deletion failure, six-point cyclic order, shared-pair
separation, alternating two-circle rows, and Kalmanson consumers.

The closest existing declarations are:

- `cross_deletion_survives_iff_not_mem_selected_support`, which characterizes
  the requested cross membership but does not produce it;
- `RetainedRadiusCollision.alternates_between_firstApex_and_commonBlocker`,
  which supplies the mandatory order constraint used below;
- `SurplusCOMPGBank.btw_sep`, its generic geometric source; and
- the existing Kalmanson consumers, which consume named same-arc orderings but
  do not change the mandatory alternation of a two-center shared pair.

No theorem-bank candidate produces the requested two fields. More
importantly, the second field is incompatible with the selector's own
collision invariant.

## Kernel-checked result

`RetainedCollisionOrderedConsumer.lean` first proves

```lean
nonempty_rowHit_of_retainedCollision
```

so the collision arm is never blocked on the old `BothOff` alternative. Both
actual collision sources lie in the retained first-apex radius class, and the
production `nonempty_outcome` therefore supplies a genuine `RowHit`.

The scratch structure

```lean
RetainedCollisionOrderedRowHitFields Q hit
```

then records the exact old target:

- an orientation `C,K` of the actual collision fiber;
- the row hit with hit source `C`;
- the cross membership `K in selectedAt(J)`;
- a global injective CCW boundary; and
- the six indices with `O < A < X < J < C < K`.

The theorem

```lean
RetainedCollisionOrderedRowHitFields.false
```

kernel-checks `False`, but the important point is what it does **not** use:
the proof never consumes `K_mem_J_shell`, the row-hit memberships, minimality,
MEC/cap facts, or `noM44`.

The proof is the four-role separation forced by the retained collision:

```text
dist O C = dist O K
dist A C = dist A K
C != K

therefore

btw O A C  iff  not btw O A K.
```

Thus exactly one of `C,K` lies strictly between `O,A` in any linear cut.
But `O < A < X < J < C < K` puts both `C` and `K` outside that interval. This
contradicts the checked `btw_sep` theorem.

## Consequence for the two requested fields

The two fields do not form a viable producer target on the retained-collision
arm:

1. **Cross membership remains a real, unproved incidence.** The earlier
   equivalence with cross-deletion failure at `J`'s actual blocker remains
   exact. Neither the collision fiber's deletion-critical facts at `A` nor
   global minimality transports that failure to `X = centerAt(J)`.
2. **The six-role order is refuted, not merely unproved.** It contradicts the
   equal-distance relations already carried by every retained collision.

Adding cap, MEC, minimality, or `noM44` hypotheses cannot repair the second
field. Any proof of it from the full parent would already be a proof that the
retained-collision arm is empty; routing through the ordered constructor would
only disguise that direct contradiction.

## Route correction

The production `CriticalFiberClosingCore.ordered` theorem is a valid generic
consumer for a critical fiber whose sources are not both known to lie on the
retained first-apex radius. It is **not** a valid target for the collision
chosen by `nonempty_retainedRadiusBlockerOutcome`.

The collision arm now needs one of:

1. the existing same-cap terminal, if cap geometry places a source-faithful
   second center and both collision sources in its complement; or
2. a new direct consumer whose boundary normal form respects the mandatory
   alternation, for example one of the two orientations
   `O,C,A,K` / `O,K,A,C`, with any additional `J,X` roles classified relative
   to those four fixed roles; or
3. a direct `False` theorem from stronger cap/MEC/full-filter information,
   without manufacturing the impossible old order.

The narrowest next audit is therefore an **alternation-compatible consumer
match**, not another attempt to prove `O,A,X,J,C,K`.

## Validation

The owned Lean file elaborates directly against the current production
imports. Its three printed declarations close over exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, custom axiom, `native_decide`, or unsafe code in
the owned lane. No production file or plan document was edited.
