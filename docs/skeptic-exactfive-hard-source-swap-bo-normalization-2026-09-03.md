# Skeptic audit: profile-1697 B--O normalization

Date: 2026-09-03

Verdict: **CERTIFIED**. The formula-scoped normalization and collinearity
contradiction are certified below, and the stated live-source/Lean boundaries
are accurate. No finding requires a repair.

## Audited scope

Targets:

- `census/card_head/exactfive_hard_source_swap_bo_source_qfnra_piqd.py`;
- `docs/specs/p97-exactfive-hard-source-swap-bo-source-qfnra-v1.md`; and
- `docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-bo-source-qfnra-plan.md`.

The certified mathematical claim is restricted to the two authenticated
profile-1697 formulas with the fresh orders pinned in the producer. It is not a
claim that every live Lean source instance enters profile 1697.

## Resolved custody check

The lane checkpoint includes the skeptic report at
`.codex/worktree-checkpoints/exactfive-hard-source-swap-bo-source-qfnra-20260903.json:13`:

> `"docs/skeptic-exactfive-hard-source-swap-bo-normalization-2026-09-03.md",`

The producer's exact ownership constant now contains the same path at
`census/card_head/exactfive_hard_source_swap_bo_source_qfnra_piqd.py:78-88`:

> `"docs/skeptic-exactfive-hard-source-swap-bo-normalization-2026-09-03.md",`

The focused test at
`census/card_head/tests/test_exactfive_hard_source_swap_bo_source_qfnra_piqd.py:269-274`
now creates and validates the governed run root:

> `root, manifest = subject.ensure_run_root()`

Observed read-only test result after synchronization: **38 passed**. No target
solver was invoked during this audit.

## Claim audit

### C1. Current orders and role map: CERTIFIED

The specification identifies the aliases at
`docs/specs/p97-exactfive-hard-source-swap-bo-source-qfnra-v1.md:38-40`:

> `Write B=c000, O=c001, Q=c002, A=c003, and S=c005.`

A read-only reconstruction of profile 1697 returned
`c000={U,c1}`, `c001={O}`, `c002={c2,q}`, `c003={a}`, and
`c005={p,s}`. The reconstruction is tied to the indexed profile and digest by
`exactfive_hard_source_swap_adaptive_order_nra_piqd.py:142-147`:

> `if index != PROFILE_INDEX or profile.profile_id != PROFILE_SHA256:`
>
> `    raise AdaptiveOrderNraError("authenticated survivor 1697 changed")`

The B--O producer pins the two current orders at
`exactfive_hard_source_swap_bo_source_qfnra_piqd.py:60-69`; in both, the five
relevant classes occur in the order `B < S < O < Q < A`. It replays the prior
adaptive artifacts and rejects order drift at lines 254-273:

> `or tuple(gauge.get("order", ())) != expected_order`
>
> `or gauge.get("order_sha256") != adaptive.order_sha256(expected_order)`

This is not an old fixed-order/current adaptive-order mix. The source core is
rebuilt through `adaptive.build_planar_system(order)` at lines 277-281, using
the authenticated fresh order.

### C2. The B--O gauge is legal: CERTIFIED

The target asserts every increasing-order signed area strictly positive. The
ledger is built over all 165 triples at
`exactfive_hard_source_swap_bo_source_qfnra_piqd.py:308-321`:

> `for triple in itertools.combinations(order, 3):`

and emitted with the strict sign at lines 481-483:

> `out.extend(f"(assert (> {entry['reduced_smt']} 0))" for entry in current["area_ledger"])`

In particular, `area(B,S,O)>0`, so B and O cannot coincide. Translation,
positive scaling by `1/|BO|`, and the rotation that sends the vector BO to the
positive x-axis form an orientation-preserving similarity taking
`B` to `(0,0)` and `O` to `(1,0)`. Every squared distance is multiplied by the
same positive factor, so the row equalities, radius disequality, and source
strict comparison retain their truth values.

### C3. A and S are forced: CERTIFIED

The source rows reconstructed at
`exactfive_hard_source_swap_adaptive_order_nra_piqd.py:567-570` are the current
`T0`, `K1`, `K2`, and `L` rows:

> `{"id": row["id"], "center": row["center"], "support": list(row["support"])}`
>
> `for row in frozen_order.ROWS`

The six normalization row keys are explicitly checked at
`exactfive_hard_source_swap_bo_source_qfnra_piqd.py:330-344`. Among them,
T0 supplies `OA^2=OB^2`, `OS^2=OA^2`, and `OQ^2=OA^2`; K1 supplies
`BA^2=BO^2` and `BS^2=BO^2`; K2 supplies `QO^2=QA^2`.

After the legal gauge, `BO^2=1`. Write `A=(a_x,a_y)`. The T0 and K1
equalities give

`(a_x-1)^2+a_y^2=1` and `a_x^2+a_y^2=1`.

Subtracting gives `a_x=1/2`, then `a_y^2=3/4`. Since the current orders put
`B<O<A`, the emitted assertion `area(B,O,A)>0` gives `a_y>0`. Define
`r=a_y`; hence `A=(1/2,r)`, `4r^2-3=0`, and `r>0`.

The same two-circle calculation gives `S=(1/2,s_y)` and `s_y^2=3/4`.
The current orders put `B<S<O`, so `area(B,S,O)=-s_y>0` and `s_y<0`.
Together with `r>0` and `s_y^2=r^2`, this forces `s_y=-r`. Thus
`S=(1/2,-r)`.

The implementation's check at lines 338-344 only confirms that the chosen
substitution satisfies the six source polynomials after `r^2=3/4`; it does not
itself prove the universal direction:

> `if _reduce_modulus(poly):`
>
> `    raise BoSourceQfnraError(f"normalization does not replay source equality: {key}")`

The preceding algebra supplies that missing direction for the two formula
cells.

### C4. Q is forced, without a hidden division: CERTIFIED

Write `Q=(q_x,q_y)`. T0 gives `QO^2=1`, while K2 gives `QA^2=QO^2`.
Subtracting the two circle equations after `A=(1/2,r)` and `r^2=3/4` gives
`q_x=2r q_y`. Substitution in `QO^2=1` gives
`4q_y(q_y-r)=0`.

The current orders put `B<O<Q`, so `area(B,O,Q)=q_y>0`. Therefore
`q_y` is nonzero, the zero branch is excluded, and `q_y=r`. Then
`q_x=2r^2=3/2`. No division by `r` or by an unproved nonzero quantity is used;
the only branch exclusion comes from the strict signed-area assertion. Hence
`Q=(3/2,r)` is forced.

### C5. The retained `(S,O,Q)` assertion contradicts the forced points: CERTIFIED

The specification states at
`docs/specs/p97-exactfive-hard-source-swap-bo-source-qfnra-v1.md:75-78`:

> `the fixed triple (S,O,Q) must reduce identically to zero in both current orders;`
>
> `its strict assertion remains in each query.`

Indeed, with `S=(1/2,-r)`, `O=(1,0)`, and `Q=(3/2,r)`,

`area(S,O,Q) = (1/2)(2r) - r(1) = 0`.

Both current orders place `S<O<Q`, so the complete area ledger also demands
`area(S,O,Q)>0`. The producer checks the zero polynomial at lines 352-354:

> `if collision not in area_by_triple or not area_by_triple[collision]["identically_zero"]:`

and still emits every strict area assertion at lines 481-483. The focused test
confirms that the journal contains `(assert (> 0 0))` at
`test_exactfive_hard_source_swap_bo_source_qfnra_piqd.py:103-110`:

> `assert commands.count("(assert (> 0 0))") >= 1`

Thus each of the two authenticated formula cells is contradictory before any
use of the radius disequality, source strict inequality, or remaining-point
coordinates.

### C6. Scope labels: CERTIFIED

The specification correctly limits the result at
`docs/specs/p97-exactfive-hard-source-swap-bo-source-qfnra-v1.md:8-12`:

> `It does not supply the missing live-source-to-profile-1697 alias completeness bridge and therefore makes no live closure, Lean, promotion, or theorem claim.`

That limitation is necessary. The alias-profile payload itself records
`"claim_boundary": "source_alias_only_no_order_or_live_coverage"` at
`exactfive_hard_source_swap_grid.py:473-492`. The same file lists unproved
abstraction assumptions, including at lines 399-417:

> `"content": "c1 = U, where U is the surplus apex separator",`
>
> `"enforced": False,`

and

> `"the abstract role names identify the displayed T0, K1, K2, and L supports"`
>
> `"enforced": False,`

The producer also marks `live_source_alias_completeness`, `source_realization`,
`live_closure`, `promotion`, and `theorem` false at
`exactfive_hard_source_swap_bo_source_qfnra_piqd.py:70-76`. These labels are
accurate. The contradiction proves only that the two authenticated conditional
formulas have no real realization.

## Dependency chain

1. `exactfive_hard_source_swap_grid.py` constructs a conditional alias profile
   and explicitly denies live coverage.
2. `exactfive_hard_source_swap_adaptive_order_nra_piqd.py` binds profile 1697,
   reconstructs its classes and rows, and produces the two fresh orders.
3. `exactfive_hard_source_swap_adaptive_equality_core_piqd.py:387-548` replays
   and content-binds the adaptive artifacts; the B--O producer calls that
   replay at lines 254-274.
4. The B--O producer rebuilds each current source ledger, applies the forced
   normalization, and retains all 165 strict areas and all 13 row equalities.
5. No Lean declaration consumes this result, no Lean ingress binding exists,
   and no theorem or closure claim is made.

## Conclusion

The focused suite passes, the normalization is forced for both authenticated
formula cells, and the retained strict `(S,O,Q)` assertion contradicts those
forced coordinates. The result remains conditional on the profile-1697 alias
formula and has no live-source, Lean, promotion, or closure force.
