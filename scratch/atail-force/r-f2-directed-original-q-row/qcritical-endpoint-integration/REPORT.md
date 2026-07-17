# Q-critical cross-survival endpoint integration

Date: 2026-07-16

Status: **one global-source endpoint kernel-closed; the full-parent residual
surface is reduced from five endpoint classes to four; source-clean; no
production `sorry` closure.**

Lean artifact:
`QCriticalEndpointIntegration.lean`

## Question

Does the q-critical rank reduction carry enough parent provenance to eliminate
any endpoint of `ExistingCrossSinkNormalForm`, rather than merely rediscovering
the same five-way classification?

Yes.  The rank reduction retains one of the two cross-deletion survivals.  In
either orientation, the deleted point is one of the named live-heavy points
`x,y`, and therefore belongs to the exact live class `{q,t1,t2,t3}`.  That
additional fact closes the `DeletedBlockerApexAlignment` endpoint.

It does not close the other four endpoint classes.

## Bank and indexed-corpus preflight

Before adding the adapter, the mandated registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section and its closure-impact notes;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`; and
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`.

Focused `nthdegree docs search --lean` queries covered:

- q-critical cross survival plus companion omission;
- `CommonDeletionTwoCenterPacket`;
- `ApexDoubleCriticalResidual`;
- `DeletedBlockerApexAlignment`;
- adjacent and third-common two-center incompatibilities; and
- deleted-blocker/apex alignment with the retained live blocker.

No hidden generic endpoint eliminator was found.  The nearby U5 declarations
`two_triple_centers_adjacent_incompatibility` and
`two_triple_centers_third_common_incompatibility` require positive named
incidences.  A q-critical companion omission supplies the opposite kind of
information and cannot instantiate those theorems.

The generic common-deletion packet is explicitly nonterminal in the existing
bank.  The prior apex-alignment consumer needs a selected row centered at the
apex and omitting the deleted endpoint.  The q-critical companion omission is
instead in a generated row centered at `x` or `y`, so it does not supply that
packet.

## Closed endpoint

The new structure `LiveDeletedCrossSurvival` orients the retained survival and
records

```text
oriented.survivor.deleted in {q,t1,t2,t3}.
```

`nonempty_liveDeletedCrossSurvival` constructs it from either arm of
`QCriticalRankReduction.crossSurvival`.  It uses the actual second-apex row
already retained by the parent; it does not identify the independently chosen
survivor row with either generated q-critical row.

The theorem

```text
false_of_deletedBlockerApexAlignment
```

then gives a direct contradiction.  The shared critical system satisfies

```text
W.H.centerAt deleted = p
```

because `deleted` belongs to the live class.  A
`DeletedBlockerApexAlignment` for the same oriented packet satisfies

```text
W.H.centerAt deleted = S.oppApex2.
```

The retained three-row chain proves `p != S.oppApex2`.  These are equalities
of the same actual critical-map value, so no selected-support alignment or
metric inference is involved.

## Exact reduced surface

`ReducedCrossSinkNormalForm` removes the impossible alignment endpoint.
`reducedCrossSinkNormalForm` proves that every live-deleted oriented survival
reaches one of exactly four remaining endpoint classes:

1. a global escape source with common deletion at the original deleted point;
2. a global escape source with common deletion at the old survivor center;
3. `ApexDoubleCriticalResidual`; or
4. the relocated-blocker `CommonDeletionTwoCenterPacket`.

The full-parent theorem

```text
OriginalQOutsideMiddleParentContext.
  qCritical_reducedCrossSinkNormalForm
```

combines this reduction with the source-clean q-critical rank theorem.  It has
no free apex exclusion or other geometric side condition.

None of the four returned endpoint classes is currently contradictory.  In
particular, `CommonDeletionTwoCenterPacket` records simultaneous deletion
survival at two centers but does not itself produce the named positive
incidences required by the U5 bank.

## Companion omission boundary

The equal-source q-critical rank branch proves that at least one companion is
omitted from a generated row.  That remains useful information, but it is not
the `DeletedApexOmissionPacket` consumed by the apex lane:

- the generated row is centered at `x` or `y`;
- the apex packet needs a selected row centered at `S.oppApex2`; and
- omission from support cannot be promoted to a cap-placement or metric fact.

Thus the honest next work is endpoint-specific consumption of the four
remaining classes, not another reinterpretation of companion omission.

## Validation

The source-current file was checked with Lean 4.27.0 from `lean/`, using the
existing scratch olean directories and emitting:

```text
/private/tmp/p97-r-f2-qcritical-endpoint-integration-oleans/
  QCriticalEndpointIntegration.olean
```

All five local `#print axioms` checks report exactly:

```text
propext
Classical.choice
Quot.sound
```

The source contains no `sorry`, `admit`, declared axiom, `native_decide`, or
`unsafe`, and no Lean source line exceeds 100 characters.  No full Lake build
was run.

## Bottom line

The endpoint integration makes a real but bounded reduction: the actual-map
deleted-blocker/apex-alignment branch is now impossible at the full q-critical
parent.  Four nonterminal endpoint classes remain, so this scratch result does
not close K-A-PAIR or any production `sorry` by itself.
