# Profile 0034 supporting-edge unguarded deletion postrun

Date: 2026-09-04

## Outcome

The physical-deletion wave completed all 55 Z3 queries through PIQD. The two controls passed. Of the 51 deletion probes, 40 were custody-valid UNSAT and 11 reached UNKNOWN at the 60-second bound. The two adaptive reduced candidates returned SAT, but the immutable terminal records them as `SAT_REPLAY_UNRESOLVED` because its exact reader rejected Z3 algebraic `root-obj` values.

Postrun analysis supplied exact rational points for both reduced candidates. Independent replay accepted both points against the retained physical assertions. This confirms that the reduced systems are satisfiable; it does not change the immutable run dispositions and it carries no theorem or promotion claim.

## Custody

- Lane: `exactfive-hard-source-swap-profile0034-supporting-edge-unguarded-deletion-piqd-20260904`
- Run: `run-0001`
- Execution commit: `35e24a0e141ea7e3bb3099e503bbc88d31fe5414`
- Run-manifest self-hash: `12ebeaf41cb6fe8a79c11f37f3143a33379e71a88f9274dc3edcad2bd133a342`
- Launch self-hash: `45c4f3767df769f025e8473dde05c59e7d4c63462a6a4b59608b419226241002`
- Terminal self-hash: `bcc34f7e5c76ba9d0debd10532d875c83eb62139b120c01b7e23b38b4e6d9098`
- Queries: 55 fresh, unique, closed PIQD sessions; one solve per session
- Offline artifact replay: passed

The terminal disposition counts are one `SAT_REPLAYED`, two `SAT_REPLAY_UNRESOLVED`, eleven `UNKNOWN`, and forty-one `UNSAT_CUSTODY_VALID`. Mean solve time was about 23.25 seconds; the maximum was 64.853 seconds. Eleven cells reached at least 60 seconds.

## Deletion mine

Deleting any group outside the lists below left a custody-valid UNSAT system. These are the only one-group deletions that remained UNKNOWN.

For the `<` radius branch:

- `edge-index-00`, the edge `c000 -> c005`;
- `edge-index-03`, the edge `c003 -> c004`;
- `edge-index-04`, the edge `c004 -> c002`;
- `source-row-equality-01`, row `T0` at support role `p`;
- `source-row-equality-05`, row `K2` at support role `a`.

For the `>` radius branch:

- `edge-index-00`, the edge `c000 -> c005`;
- `edge-index-03`, the edge `c003 -> c004`;
- `source-row-equality-00`, row `T0` at support role `d`;
- `source-row-equality-01`, row `T0` at support role `p`;
- `source-row-equality-03`, row `K1` at support role `s`;
- `source-row-equality-05`, row `K2` at support role `a`.

The radius group and source-strict group were individually deletable on both branches while retaining UNSAT.

## Exact reduced witnesses

Coordinates use the scaled vertical coordinate `Y`, so squared distance is `dx^2 + 3*dY^2`. The fixed frame is `c000=(0,0)`, `c001=(1,0)`, and `c003=(1/2,-1/2)`.

The `<` witness sets:

```text
c002=(9/8,-3/8)   c004=(1,-1/2)    c005=(6/67,-16/67)
c006=(1,0)        c007=(0,1)       c008=(1,0)
c009=(0,1)        c010=(1,0)       c011=(0,1)   c012=(1,0)
```

Replay checked 33 supporting-edge assertions and two row equalities. The minimum area is `1/16`; both row residuals are zero.

The `>` witness sets:

```text
c002=(3/4,-1/4)   c004=(2,0)          c005=(6/67,-16/67)
c006=(1,0)        c007=(1/97,56/97)   c008=(1,0)
c009=(0,1)        c010=(1,0)          c011=(0,1)   c012=(1,0)
```

Replay checked 22 supporting-edge assertions and four row equalities. The minimum area is `352/6499`; all four row residuals are zero.

## Interpretation and next action

The wave does not yield a small contradiction: each adaptive system built solely from the unresolved deletion groups has an exact rational model. Its value is a sharp group filter. The next governed wave therefore keeps every proven-needed background group hard asserted, guards only the five or six unresolved groups, and requests a named assumption core from PIQD/Z3. That query can isolate which members of the small branch-local set participate in the full contradiction.

No Lean theorem-bank search was triggered at this checkpoint. The wave produced a computational group filter, not a concrete reusable theorem statement. A new corpus search becomes warranted once the core wave yields a stable geometric antecedent set.

All theorem, universal, Lean, source-entitlement, Euclidean, and promotion claims remain false.
