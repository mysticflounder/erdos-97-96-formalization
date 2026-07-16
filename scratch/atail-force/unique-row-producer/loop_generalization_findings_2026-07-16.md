# Generalization audit of the live 555/654 mining loop

Date: 2026-07-16

Status: **ONE EXISTING GEOMETRIC THEOREM REUSED; BROAD LITERAL-KERNEL
COLLAPSE NOT OBSERVED; GENERIC CERTIFICATE ADAPTER REMAINS THE UNIFORM
ROUTE.**

This is a scratch-lane theorem-discovery audit. It does not prove that the
live `CriticalPairFrontier` produces any row system below, and it does not
promote CAS output to a Lean theorem.

The CAS extraction snapshot is
`card_five_interior_shadow_search.py` at SHA-256
`8a2785e2b5bfc370104def18cc550e7ed0f114f51f310fe9a8d6bdce07f434e7`.
It contains 154 loop cores:

- 65 unit-ideal 555 cores;
- 13 forced-pair 555 cores;
- 29 unit-ideal 654 cores; and
- 47 forced-pair 654 cores.

The loop advanced while this audit ran. A structural-only refresh at
2026-07-16 18:49 UTC used SHA-256
`0dfdb437ac37f9a1e00a9e7290a5e6a83cd69da49bf4f08f64bfc1cbaf8b7d9a`
and included the additional unique cores `unit-core-555-66` and
`unit-core-555-67`, for 156 live cores total. CAS result files retain their
own earlier snapshot hash and are not silently reinterpreted against the
newer bank.

A final structural-only refresh at 2026-07-16 19:17 UTC used SHA-256
`43f16f52d23d51317a43ef44db2f8d61eb6c800669842d29f6a2c25abeb99be9`
and included `unit-core-555-68` and `unit-core-555-69`, for 158 live cores:
69 unit-ideal 555, 13 forced-pair 555, 29 unit-ideal 654, and 47 forced-pair
654.

## Proven theorem reuse

The strongest concrete general theorem is already in production Lean:

```text
Problem97.Census554.EqualityCore.six_point_circle_chain_collision
```

with its arbitrary-label wrapper

```text
Problem97.Census554.EqualityCore.
  not_realizes_of_sixPointCircleChainCollisionCore
```

The support-only Singular lift extractor independently recovers the same
five-row, nine-equality active kernel from both `unit-core-654-16` and
`unit-core-654-18`:

```text
1  : {0,2,X}
2  : {0,1,10,11}
X  : {0,2}
10 : {0,1}
11 : {1,X,10}
```

where `X = 8` for core 16 and `X = 9` for core 18. Thus the two admissions
are the same geometric theorem under the relabeling `8 ↔ 9`. The extraction
shrinks each nominal 16-equality system to nine nonzero-cofactor equality
generators and internally replays the lift identity in Singular. The
machine-readable evidence is
`loop_active_kernel_654_shared_chain.json`.

This is not a new theorem conjecture: the theorem is kernel-checked and
indexed in the current Lean corpus. The new result is the exact identification
of two live loop admissions as instances of it.

## Full-core quotient

An injective row-support quotient was run on the retained cores, comparing
only cores of the same certificate grade. For forced-pair cores the
distinguished pair was preserved up to swapping.

- Exact relabeling types at the final 158-core snapshot: 142.
- Nontrivial exact-isomorphism classes: 12.
- Strict subcore embeddings between distinct retained cores: zero.
- Exact-isomorphism classes crossing the 555/654 profile boundary: zero.

The nontrivial classes are:

- `forced-pair-core-654-35`, `forced-pair-core-654-37`;
- `unit-core-555-20`, `unit-core-555-24`, `unit-core-555-36`;
- `unit-core-555-21`, `unit-core-555-23`;
- `unit-core-555-22`, `unit-core-555-35`;
- `unit-core-555-25`, `unit-core-555-28`, `unit-core-555-40`;
- `unit-core-555-26`, `unit-core-555-38`, `unit-core-555-51`,
  `unit-core-555-53`;
- `unit-core-555-27`, `unit-core-555-29`;
- `unit-core-555-33`, `unit-core-555-43`;
- `unit-core-555-55`, `unit-core-555-59`;
- `unit-core-555-62`, `unit-core-555-68`;
- `unit-core-654-19`, `unit-core-654-20`; and
- `unit-core-654-29`, `unit-core-654-30`.

Therefore relabel-invariance removes 16 duplicate presentations, but the
retained systems do not collapse to a small catalog of literal subpatterns.
The existing arbitrary-label `EqualityCore.Realizes` and relabel-transfer
machinery is the appropriate theorem layer for these duplicates.

## Universal incidence motifs are not yet contradictions

At the final 158-core snapshot, every retained core contains a directed
three-cycle among row centers. A mutual center-incidence pair occurs in 155 of
158 cores; the three exceptions are `forced-pair-core-654-23`,
`forced-pair-core-654-28`, and `forced-pair-core-654-31`.

This is genuine structural uniformity, but not by itself a theorem target.
The earlier active-kernel audit found elementary realizations of the
cycle/reciprocal-edge skeleton. It is useful preprocessing for organizing
cases, not a contradiction without additional metric equalities.

## Reuse of older certificate-active kernels

The 49 independently replayed active equality kernels in
`core_data_pattern_mining.json` were embedded into the final 158 live retained
cores. There are 15 embedding edges, from 12 old kernels into 13 live cores.
Every hit is in the 654 profile; there are no hits in any 555 core and none in
the recent forced-pair 654 cluster.

The covered live cores are:

```text
unit-core-654-03
unit-core-654-16, unit-core-654-18
unit-core-654-19, unit-core-654-20
unit-core-654-21, unit-core-654-22, unit-core-654-23
unit-core-654-24, unit-core-654-25, unit-core-654-26
forced-pair-core-654-01, forced-pair-core-654-05
```

The normalization-anchor images were checked explicitly. Most unit-core hits
preserve anchors `0,1`; the exceptional hits still transfer as collision
theorems under injectivity:

- the old core-12 kernel in `forced-pair-core-654-01` maps its anchors to
  labels `11,0`, not to the designated forced pair `7,8`;
- the old core-21 kernel in `forced-pair-core-654-05` maps its anchors to
  labels `0,2`; and
- the old core-48 kernel in `unit-core-654-03` maps its anchors to labels
  `1,9`.

Consequently these are genuine no-injective-realization consumers, but they
must not be described as certificates for the loop's designated pair unless
the mapped anchors actually are that pair.

In particular, two loop entries currently classified operationally as
forced-pair cores already contain smaller pure equality-collision candidates:

- the nine-active-equality core-12 certificate inside
  `forced-pair-core-654-01` forces labels `11 = 0`; and
- the 13-active-equality core-21 certificate inside
  `forced-pair-core-654-05` forces labels `0 = 2`.

Their rational certificates were independently replayed, and placeholder-free
scratch Lean sources were generated. They remain unbuilt under the standing
no-build gate, so this is **certificate-backed scratch evidence**, not a
kernel-checked theorem claim. If those wrappers are later elaborated, the two
forced-pair admissions can be consumed by pure collision theorems without
mentioning their designated Rabinowitsch pairs.

## Forced-pair active kernels

`forced-pair-core-654-01`, the smallest retained forced-pair core, admits a
support lift in 42.2 seconds. Its nominal five-row, 15-equality system shrinks
to five rows, 11 equality generators, and the Rabinowitsch generator for
`(7,8)`. That active pair-preserving kernel embeds in no other live core.
Thus it is a valid smaller theorem candidate, but not a shared family theorem.

The recent neighboring cores `forced-pair-core-654-45` and
`forced-pair-core-654-46` share six literal rows. Their common six-row,
18-equality subsystem does **not** force `(7,8)`:

- msolve returns `NONUNIT` in both forward and reversed variable orders;
- Singular did not decide the same Rabinowitsch ideal within 300 seconds.

Hence the obvious intersection of the two cores is not the desired shared
forcing theorem. The additional two rows on each side are essential to the
currently certified pair collision, or a different proper subsystem must be
found.

## Extraction limits

The support extractor is
`mine_loop_active_kernels.py`. It records nonzero Singular lift positions and
checks the reconstructed identity internally, but does not retain coefficient
polynomials or perform an independent exact replay.

Observed budgets:

- `unit-core-654-16` and `unit-core-654-18`: success in about 0.02 seconds;
- `forced-pair-core-654-01`: success in 42.2 seconds;
- `unit-core-555-63` and `unit-core-555-64`: unresolved at 600 seconds;
- `forced-pair-core-654-45` and `forced-pair-core-654-46`: unresolved at
  600 seconds and again at 1800 seconds with the standard `lift` backend;
  both are also unresolved at 1800 seconds with the independent `slimgb`
  backend.

The timeout cases support no conclusion about whether their active kernels
collapse. The two 1800-second result files are
`loop_active_kernel_654_recent_1800.json` and
`loop_active_kernel_654_recent_slimgb_1800.json`.

## The theorem-level conclusion

The data support two different theorem layers.

1. **Small geometric consumers when a kernel genuinely repeats.** The
   six-point circle-chain theorem is the clean example and immediately covers
   cores 654-16 and 654-18.
2. **A generic row/Rabinowitsch certificate adapter for the broad bank.**
   After quotienting, 142 retained types remain, and the earlier 654
   active-kernel census likewise had almost no exact collapse. The uniform
   result should therefore parameterize the row pattern, distinguished
   inequality pair, certificate tags, and checked cofactors, rather than
   introduce one Lean theorem per retained core.

The algebraic soundness pieces already exist:

- `U5GramCert.false_of_unitIdealCertChecker{Normalized}` is the generic
  polynomial-certificate soundness theorem; and
- `Census554.isDead_of_checkCert` supplies a Rabinowitsch-aware semantic
  adapter, but is fixed to the Census-554 `Fin 11` coordinate convention.

The useful generalization is a `Fin n` or arbitrary finite-label version of
the latter adapter, reusing `EqualityCore.RowPattern`/`Realizes`. Generated
certificates would then be data checked by one theorem, while repeated small
geometric kernels can still be promoted separately when they materially
compress the bank.

None of this closes the producer boundary. A live proof still has to derive a
matching row hypergraph from the actual frontier/cap data; the mining loop only
supplies contradiction consumers.
