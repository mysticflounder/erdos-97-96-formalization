# R least-entry terminal payload branch audit

**Status: source-current branch quotient; no production closure.**

This audit starts only from the least-positive terminal entry produced by
`LeastTerminalHitPredecessor.lean` and its exact
`RetainedActualBlockerTerminalPayload`. It does not strengthen a bare
`b ∈ C` landing and does not assume robust-mate or radius coherence across
orbit edges.

## Required bank preflight

The general-n sibling and archive registries required by `AGENTS.md` were
checked, together with indexed `nthdegree docs search --lean` queries for
third common circle points, q-deleted K4 rows, dangerous triples, and
reciprocal selected-class incidence. The closest usable consumers are:

- `Problem97.two_circle_third_point_eq`;
- `false_of_actualBlocker_hit_thirdCommonPoint`;
- `U5QDeletedK4Class.not_dangerous_triple_subset_of_ne_center`.

`u5_common_bisector_triple_incompatibility` was also checked, but it is not
the residual-terminal bridge: its signature additionally requires the first
circle's center itself in the blocker row.

No bank declaration consumes the whole retained terminal payload or a bare
terminal blocker.

## Exact normalized cells

Write `b` for the actual blocker, `K` for its selected critical four-shell,
`rho` for the robust pair's first-apex radius, and `rT,q,w` for the terminal
radius and endpoints. Endpoint roles automatically lie on the terminal
class; endpoint-plus-own-class-card-at-most-three subcases are inconsistent.
The feasible quotient is:

| Blocker role | HIT needs | OMISSION needs |
|---|---|---|
| `b = q` | `rho = rT` and `w ∈ K.support` | `rho = rT`, `w ∈ K.support`, and one further distinct point of `K.support` on the `rho` class |
| `b = w` | Symmetrically, `rho = rT` and `q ∈ K.support` | Symmetrically, `q` plus one further distinct common point |
| residual, terminal-radius | `rho = rT` and `q ∈ K.support ∨ w ∈ K.support` | `rho = rT ∧ q ∈ K.support ∧ w ∈ K.support` |
| residual, own-class card at most three | one explicit third point in `K.support` on the `rho` class | two distinct additional points of `K.support` on the `rho` class |

In the small-class cells, proving that the blocker's retained first-apex
class has cardinality at least four is an alternative immediate
contradiction.

The HIT conditions feed the checked third-common-point consumer. The clean
residual-terminal OMISSION bridge makes `P.x,q,w` three common points of the
circles centered at `b` and `S.oppApex1`, so the banked two-circle theorem
closes.

`r-full-parent-entry/ResidualTerminalOmissionConsumer.lean` formalizes that
claim. Its checked theorem
`false_of_residualTerminalOmission_of_terminalPairSupportBridge` consumes the
exact residual-terminal OMISSION cell and only

```text
rho = rT ∧ q ∈ K.support ∧ w ∈ K.support.
```

The proof derives all three distinctness facts from erased-versus-retained
provenance and closes through `Problem97.two_circle_third_point_eq`.

## Exact OMISSION row adapter

`r-full-parent-entry/ActualBlockerOmissionAdapter.lean` proves
`ActualBlockerOmissionOutcome.exactRowPacket`. It keeps
`B = K.support` definitionally and exports the exact four-point support,
`P.x ∈ B`, `P.y ∉ B`, the full positive-radius-class equality at `b`, the
metric residual, deletion survival, and a source-derived
`U5QDeletedK4Class D P.y b B`.

The same file proves the exact bank-facing closer
`ActualBlockerOmissionExactRowPacket.false_of_dangerousTriple_subset`.
Consequently an OMISSION cell closes as soon as the full geometry produces

```text
T : U5DangerousTriple D P.y P.x
T ⊆ B.
```

This is more precise than an anonymous K4 witness: the remaining one-row
ingredient is named dangerous-triple incidence in the actual selected shell.
For a cycle-wide use, one must additionally produce a common deleted endpoint;
the source-exact pairs currently choose their mates independently.

## Correct next producer surface

The smallest high-value terminal bridges are either the residual-terminal
circle intersection

```text
rho = rT ∧ q ∈ K.support ∧ w ∈ K.support
```

or the dangerous-triple subset above. The missing work is production of one
of those exact incidences from full MEC/cap/global-K4 provenance, not another
consumer theorem or marginal row census.

No production `sorry` is closed by this audit.
