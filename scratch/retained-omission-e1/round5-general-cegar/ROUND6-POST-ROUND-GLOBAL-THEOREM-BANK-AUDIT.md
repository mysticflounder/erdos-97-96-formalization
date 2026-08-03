# Round-6 post-round global theorem-bank audit

Date: 2026-08-02.  Scope is the equal-center/all-endpoint-omission probe in
`probe_equal_endpoint_omission.py`; no production Lean was edited.

## Probe artifacts

* `artifacts-n17-generic/equal-center-endpoint-omission/result.json` is
  **SAT** (2,686 ms, 30,000 ms bound).  The model has both C rows
  `{a1,t1,q1,q2}` and Q sources `{a1,t1}`.  This is a bounded N17 Boolean/
  metric-profile witness only (`external_solver_only=true`, no Lean kernel,
  no full Euclidean coordinates, no universal-n claim).
* `result-cyclic.json` is **UNKNOWN** at the 10,000 ms bound.  Neither result
  is promotable evidence for a contradiction.

## Required theorem-bank registries

Searched all six required registries:

* `docs/general-n-certificate-bank-mining-2026-07-09.md`
* `certificates/p97_rvol_general_n_mining.{md,json}`
* `certificates/erdos97_legacy_general_n_mining.{md,json}`
* `certificates/erdos_general_theorem_p97_mining.{md,json}`

The three JSON banks each have **zero** recursive-object matches for
`FreshThird`, `firstNonHit`, `secondNonHit`, `equalCenter`, `exactFour`,
`allCollisionEndpointsOmitted`, or endpoint omission (including declaration
name matches).  The prose bank has no FreshThird/endpoint-omission hit; its
single `exact four` hit (line 606) is an unrelated `(m,4,4)` equilateral-frame
note.  Therefore there is no bank declaration, source path, or
`source_reachable` record for this packet.

## Focused indexed-Lean search

Command (agentic mode):

```text
nthdegree docs search --lean --agentic
  "FreshThirdEqualCenterExactFourRow_of_hits allCollisionEndpointsOmitted_of_equalCenterHits source-clean terminal"
```

The agentic answer returned only the two producer handles:

* `MTKB4Q` — `freshThirdEqualCenterExactFourRow_of_hits`;
* `BDWWVD` — `allCollisionEndpointsOmitted_of_equalCenterHits`.

It explicitly found no source-clean terminal label.  A follow-up ranked search
returned `NNVB0J`,
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`, and `FQHR7S`,
`allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq`; both are
stronger first-fiber/equal-blocker packets, not FreshThird adapters.

## Import and kernel reachability

The source declarations are at
`FrontierLiveClosure.lean:9247-9277` (exact four-row producer) and
`:9436-9500` (all four endpoint omissions).  A scratch elaboration importing
`Erdos9796Proof.P97.ATail.FrontierLiveClosure` confirms
`freshThirdEqualCenterExactFourRow_of_hits` and the rederived omission producer
have only `[propext, Classical.choice, Quot.sound]`.  However, the current
imported OLean does **not** expose
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.allCollisionEndpointsOmitted_of_equalCenterHits`
(`unknown constant`), so that newly present source declaration is not yet
import-reachable in the current build state.

The nearest contradiction consumer,
`false_of_twoCapSources_sameBlockerAllEndpointOmission`
(`:11171-11224`), requires `FreshOutsideFirstBlockerFiber`, complete
`FirstFiberCapSourceWitness`s, common-radius/cap-interior data, mutual
cross-membership, and exact shell-cap intersection.  The FreshThird packet
provides none of these adapters.  Moreover its transitive first-fiber
consumer contains `sorry` (`:11016`), so an axiom print includes `sorryAx`.
The normalized FreshThird coordinator itself remains `by sorry`
(`:9806-9815`).

## Verdict

**NO-GO for promotion.**  The SAT/UNKNOWN artifacts are diagnostic only; the
equal-center producers are useful source-clean producers once rebuilt, but no
theorem-bank or indexed source-clean terminal/adapter consumes them, and the
closest first-fiber terminal has both missing hypotheses and a `sorryAx`
dependency.
