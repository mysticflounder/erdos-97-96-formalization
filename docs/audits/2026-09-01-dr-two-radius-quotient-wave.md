# D-R two-radius branch: named-role quotient wave (Phase 1a)

Date: 2026-09-01. Lane `dr-two-radius-20260901`. Plan
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`, Phase 1a.

Status: diagnostic computation in progress. No result here closes a Lean
theorem, supplies coverage, or authorizes removing the live `sorry` at
`Rigid221Closure.lean:1245`. Every verdict below is CONJECTURE-level
evidence about one encoding until a second reader audits the
encoding-to-claim map.

## Encoder

`census/card_head/dr_two_radius_quotient.py` (tests in
`census/card_head/tests/test_dr_two_radius_quotient.py`, 19 tests).

Named roles (all distinct carrier points in every cell of this module):
`a2 = oppApex2` (gauge origin), `a1 = oppApex1` (gauge `(1,0)`),
`a3 = surplusApex`, `U0..U3` (exact class at `a1`; `U0 = interior_q`,
`U1 = interior_w`), `X0..X3`, `Y0..Y3` (the two exact classes at `a2`),
`B1_0..B1_3` (row at the source's blocker; `B1_0 = source`), `c1` (that
blocker), optional `Z0..Z3` when the second ingress row is a third class.
The MEC centre and squared radius are auxiliary real variables.

Atom families and their Lean images are the module's
`SOURCE_CLAUSE_LEDGER`; facts the quotient cannot assert are
`OMITTED_FACTS` and are checked on every exact model at readback. The
derivation `source ∈ B1` (from `CriticalShellSystem.no_qfree`) is recorded
there as a derived identity.

Cyclic order convention: `a1, Is, a2, I1, a3, I2` counterclockwise, from
`CapTriple` endpoint membership (cap `i` has endpoints `v_{i+1}, v_{i+2}`).
Cap membership is asserted directly through `OnArcOpposite` sign products,
not only through the order.

The generic cell (`generic-x`) has 20 carrier points, 43 real variables,
717 atoms (360 convexity, 190 distinctness, 60 exactness, 12 row
equalities). Free coordinates after the gauge: 39; equalities: 15.

## Runs (all through `piqd`, Z3 4.17.0, QF_NRA one-shot, no local fallback)

Run root `scratch/runs/dr-two-radius-20260901/q1a-wave-1`:

| cell | control | atoms | verdict | solve time |
|---|---|---:|---|---:|
| generic-x | five-at-second-apex (full system + one equality) | 718 | UNSAT | 2 ms |
| generic-x | duplicate-center (full system + two equalities) | 719 | UNKNOWN | 611 s (budget 600 s) |
| generic-x | none | 717 | UNKNOWN | 930 s (budget 900 s) |

Reading. The first control shows the exactness family is live and that
PIQD custody, receipts, and result shaping work. The two UNKNOWNs are the
nlsat stall the QF_NRA reference describes: 43 real variables with 360
strict orientation atoms are beyond a one-shot budget, for UNSAT and SAT
alike. A timeout is the absence of a verdict, not evidence for either side.

Consequences applied in the same checkpoint:

- Negative and positive controls are now tiny systems built from the same
  atom generators (`duplicate-center`: 5 points, 18 atoms; `small-sat`:
  5 points, 31 atoms, with a hand-checked rational witness in the tests).
  They run under `q1a-wave-2`; results are recorded when they publish.
- The `source_digests` of `q1a-wave-1/run_manifest.json` were refreshed
  after the encoder edits that added the reduced controls and the witness
  search; the published custody trees under `q1a-wave-1/artifacts/*` carry
  the exact executed encoder bytes as `implementation-0000` snapshots.

## Constructive exact witness (no solver)

`witness` subcommand: the Moser triangle and MEC are fixed rationally,
every class point is a rational point of its class circle (Pythagorean
parametrisation), so every equality holds exactly by construction; every
inequality is then replayed with `Fraction` arithmetic by the same
`replay_atoms` the PIQD verifier uses. The within-cap order is read off
the sample, so the returned cell is the one the witness realises.

Result of the first sampler (uniform random angles, 2000 trials, seed 1):
no witness. Failure histogram: `sample:U 1249`, `sample:X 424`,
`sample:Y 180`, `sample:B1 135`, `atom:convexity 12`. Twelve samples
reached the full replay and all failed strict convexity: with the
right-angled-adjacent triangle `a3 = (1/4, -3/4)` the class circles leave
slivers of height about 0.02 to 0.05 beyond each chord, and 20 points in
those slivers must form three convex chains. Blind sampling does not reach
that set.

Next step recorded for the lane: replace the sampler's inner loop with a
margin-minimising local search over the same rational parametrisation
(near-equilateral triangle `a3 = (1/2, -6/7)` gives about 13 percent radial
room at each apex instead of 5 percent), then rationalise the parameters and
replay exactly. Only an exactly replayed configuration counts as a witness.

## Claim boundary

- PROVEN: nothing new.
- EMPIRICALLY VERIFIED: one full-system negative control UNSAT in 2 ms;
  two full-system one-shots UNKNOWN at budget.
- Open: whether the generic cell is realizable. Degrees of freedom (39
  free coordinates, 15 equalities) make SAT the expected outcome; nothing
  here establishes it.
