# Two-off-live failure classification

## Outcome

The failure of the two-off-live antecedent is now classified exactly in
kernel-checked Lean. It does **not** close the common-deletion branch.

Write

```text
L = {q, t1, t2, t3}
S = deletedCriticalSupport C
B = C.B₂.
```

For the live packet, `C.B₁ = L`. The available exact facts are:

```text
|B| = 4
|B ∩ L| ≤ 2
|B ∩ S| ≤ 2
|S| = 4
deleted ∈ S
deleted ∉ B.
```

If

```text
¬ 2 ≤ |(((C.B₁ ∪ C.B₂) \ S) \ L)|
```

then `TwoOffLiveFailureClassification.lean` proves exactly one of the
following three profiles.

### F1: one live overlap

```text
|B ∩ L| = 1
|B ∩ S| = 2
|B ∩ L ∩ S| = 0

live-only       = 1
support-only    = 2
outside both    = 1
|S \ B|         = 2
deleted ∈ S \ B.
```

Thus the second row is partitioned as

```text
1 live-only + 2 support-only + 1 outside.
```

### F2: two-live exact cover

```text
|B ∩ L| = 2
|B ∩ S| = 2
|B ∩ L ∩ S| = 0

live-only       = 2
support-only    = 2
outside both    = 0
B ⊆ L ∪ S
|S \ B|         = 2
deleted ∈ S \ B.
```

This is the sharp exact-cover residual:

```text
B = 2 live-only points + 2 support-only points.
```

### F3: two live overlaps and one outside point

The common fields are

```text
|B ∩ L| = 2
outside both = 1
deleted ∈ S \ B.
```

There are exactly two subprofiles:

```text
F3a:
  |B ∩ S|      = 1
  both         = 0
  live-only    = 2
  support-only = 1
  |S \ B|      = 3

F3b:
  |B ∩ S|      = 2
  both         = 1
  live-only    = 1
  support-only = 1
  |S \ B|      = 2.
```

The nominal `|B ∩ L| = 0` branch is impossible. These four exact cell
patterns, grouped into the three profiles above, exhaust failure.

For the concrete live-row packet from
`LiveCommonDeletionExpansion.lean`, the specialization is:

```lean
twoOffLive_failure_trichotomy C
  (commonDeletion_firstRow_eq_liveBase C) hfail
```

The generic theorem takes the first-row equality as an input so its checked
dependency surface stops at `CommonDeletionCriticalExpansion`.

## Bank match

No profile supplies the hypotheses of an existing U5 `False` consumer.

| Profile | Closest bank shape | First missing antecedent |
|---|---|---|
| F1 | same-side-terminal two-off-row theorems | A `C5D3BSameSideTerminalPacket` or another producer locating the one live-only, two support-only, and one outside point in the named MEC/cap sectors. The profile itself has only one off-live fresh point. |
| F2 | sibling `two_two` / `two_full` audit profiles | A `U5QAllowedAuditSupport` with both relevant centers in its named audit-center set, plus identification of `L` and `S` with the theorem's row-off and row-circle carriers. Anonymous `2+2` coverage is not that packet. |
| F3a | two-live selected-row profiles | A second off-live source or a named cap/order placement of the two live-only points and the unique support-only point. |
| F3b | q-critical/exact/q-critical incidence consumers | Identification of the unique three-way common point with a named dangerous-triple/apex role, together with the required q-critical classes and their prescribed incidences at the other centers. |

In particular:

- `U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two` is already
  consumed in the proof of `|B ∩ S| ≤ 2`; saturation of that inequality is
  not a contradiction.
- `U5QCriticalTripleClass.two_triple_points_incompatibility` and the
  q-critical chain/bridge incompatibilities require q-critical classes
  centered at named dangerous-triple points. The profiles contain no such
  class producer.
- sibling
  `qAllowedSelected_no_common_carrier_two_offCarrier` requires two selected
  classes sharing one carrier point and the same two distinct off-carrier
  points. Here there is at most one point of `B` outside `L ∪ S`, and no
  second selected class containing a common off pair.
- the sibling `C5D3B.qAllowedSelected_two_two_*` and
  `qAllowedSelected_two_full_*` families require the full
  `C5D3BSameSideTerminalPacket`, `U5QAllowedAuditSupport`, audit-center
  membership, and row/cap labels. None follows from a
  `CommonDeletionTwoCenterPacket`.
- the short-cap two-off consumers with `D.IsM44`, minimality, and U3
  saturation are the wrong hypothesis surface for this parent lane.

The theorem-bank search therefore confirms the general registry warning:
the banks contain many terminal incompatibility consumers, but no theorem
classifying this arbitrary common-deletion packet into one of their named
incidence packets.

## Exact next producer targets

The remaining mathematical input must do at least one of the following:

1. produce a second off-live source from another retained row or from the
   parent history, thereby restoring the already-checked two-off-live
   successor/second-center-alignment theorem;
2. attach MEC/cap-order roles to the four cells above, especially the F2
   exact cover, strongly enough to construct a same-side-terminal or bounded
   U5 audit packet; or
3. in F3b, identify the unique point in all three supports and produce the
   neighboring q-critical classes required by a banked chain/bridge
   incompatibility.

Pure support-cardinality refinement cannot close these residuals: the
classification has exhausted everything implied by the three four-point
supports and their pairwise intersection bounds.

## Kernel-checked declarations

`TwoOffLiveFailureClassification.lean` proves:

- `bothCell_card_add_liveOnlyCell_card`;
- `bothCell_card_add_supportOnlyCell_card`;
- `fourCell_card_sum`;
- `outsideBothCell_eq_iterated_sdiff`;
- `deletedCriticalSupport_card_eq_four`;
- `deleted_mem_deletedCriticalSupport`;
- `deleted_not_mem_secondRow`;
- `secondRow_inter_deletedCriticalSupport_card_le_two`;
- `secondRow_inter_firstRow_card_le_two`; and
- `twoOffLive_failure_trichotomy`.

Every printed project-facing declaration reports only:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` dependency.

## Theorem-bank preflight

The required registries were searched before writing the classifier:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered two-off-live failure,
dangerous-row intersection, common deletion, deleted critical support,
two-two/full audit profiles, and U5 q-critical incidence consumers.

## Validation

The three source-independent scratch prerequisites were compiled to
`/tmp/p97-r-two-off-live-oleans`, followed by
`CommonDeletionCriticalExpansion.lean` and the new file. The final deliberate
single-file scratch check was:

```bash
cd lean
LEAN_PATH=/tmp/p97-r-two-off-live-oleans \
  lake env lean -R .. -M 16384 \
  -o /tmp/p97-r-two-off-live-oleans/TwoOffLiveFailureClassification.olean \
  ../scratch/atail-force/r-two-off-live-failure/TwoOffLiveFailureClassification.lean
```

It completed successfully. No full `lake-build` was run, and no production
file or production `sorry` was changed.
