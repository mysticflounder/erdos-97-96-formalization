# ATAIL robust-survival / live-row transport audit

Status: **PROVEN negative compatibility result plus conditional consumer**.
This report does not claim that K-A-PAIR is closed.

## Question

Can the robust branch

```text
HasNEquidistantPointsAt 4 (D.A.erase P.w)
  (H.centerAt P.q P.q_mem_A)
```

be consumed by identifying the frontier source/blocker with the already named
live U1 source `q`, the localized blocker `p`, or the `p`-centered dangerous
`t2` row?

## Preflight

The mandated general-n bank summaries and JSON registries were checked before
deriving the local incidence facts.  Indexed-corpus searches were also run for
critical-shell deletion, same-blocker support, off-surplus marginal/dangerous
triple linkage, and same-side chord results.  The relevant hits were the
already-current production theorems in `ATail/CriticalPairFrontier.lean`, the
existing `t2Row_selected_support_eq_dangerous_of_center_p`, and the archived
same-side/cap consumers.  No banked theorem links an arbitrary first-apex
frontier source to `{t1,t2,t3}` or identifies its chosen blocker with `p`.

## Exact result

The direct identification with the original live source `q` is impossible.
The parent assumption `q ∈ CP.capAt i` is exactly membership in the surplus
cap of `leafSurplusPacket`, while both frontier sources lie in an off-surplus
first-apex marginal.  Hence both frontier sources differ from the live `q`.
The original `hlocalNoQFree` deletes precisely that excluded source, so it
cannot directly refute a cross-deletion that deletes the other frontier source.

There is no provenance gap for the named `t2` row: the actual parent constructs
`Hdepth5Rows` with `CriticalSourceRows.ofCriticalShellSystem Hcritical`, so its
`t2` row is definitionally `Hcritical.selectedAt t2` at
`Hcritical.centerAt t2`.

The live transport that *is* available is exact:

1. Two sources with the same chosen blocker have the same exact selected
   support.
2. Therefore, if the first frontier source's blocker is `p` and the live `t2`
   row at `p` has support `{q,t1,t2,t3}`, then the first frontier source is one
   of `{t1,t2,t3}` (it cannot be the surplus source `q`).
3. Under the same alignment, production's exact normal form specializes to

   ```text
   cross deletion survives  <->  P.w notin {t1,t2,t3}.
   ```

4. Consequently, incidence `P.w ∈ {t1,t2,t3}` contradicts robust survival.

These claims are Lean-checked in `RobustLiveTransport.lean` as:

- `live_q_mem_leafSurplusPacket`;
- `parent_t2_row_provenance`;
- `live_surplus_source_ne_frontier_sources`;
- `selected_support_eq_of_centerAt_eq`;
- `frontier_source_mem_live_dangerous_of_blocker_alignment`;
- `cross_survival_iff_avoids_live_dangerous_triple`; and
- `false_of_cross_survival_and_live_dangerous_incidence`.

All seven declarations close under exactly
`propext`, `Classical.choice`, and `Quot.sound`.

## First missing antecedent

The current parent/live fields do **not** supply either of these facts for an
extracted frontier orientation:

```text
Hcritical.centerAt P.q P.q_mem_A = p
P.w ∈ {t1,t2,t3}.
```

Equivalently, if the critical-shell system is rebuilt/overridden after choosing
the pair, the missing geometric content is a paired incidence theorem placing
both frontier sources in the dangerous triple so that one can be assigned the
`p` blocker and the other deletion is consumed.  `hfixed` describes the exact
dangerous `p`-circle, but it does not place an arbitrary off-surplus
first-apex marginal point on that circle.  The cap hypotheses likewise do not
provide this incidence in the current theorem bank.

Even after this robust branch is eliminated, the complementary cross-hit branch
has the already-proved strict opposite-side sign.  Closing K-A-PAIR still needs
the separate cap/order coupling (or a different contradiction) for that branch;
the live-row transport here is not by itself a full closer.

## Validation

From `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/robust-live-transport/RobustLiveTransport.lean
```

The deliberate scratch-only direct check passed.  The only host message was
the existing non-privileged domain-environment warning.
