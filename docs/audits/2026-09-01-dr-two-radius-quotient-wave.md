# D-R two-radius branch: named-role quotient wave (Phase 1a)

Date: 2026-09-01. Lane `dr-two-radius-20260901`. Plan
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`, Phase 1a.

Status: Phase 1a settled SAT by an exact witness; Phase 1b not started. No
result here closes a Lean theorem, supplies coverage, or authorizes removing
the live `sorry` at `Rigid221Closure.lean:1245`. Every verdict below is CONJECTURE-level
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

Run root `scratch/runs/dr-two-radius-20260901/q1a-wave-2` (reduced
five-point controls built from the same atom generators):

| cell | control | atoms | declared reals | verdict | solve time |
|---|---|---:|---:|---|---:|
| generic-x | duplicate-center (three points equidistant from two centres) | 18 | 43 | UNKNOWN | 301 s (budget 300 s) |
| generic-x | small-sat (three points on one circle, convex with two apexes) | 31 | 43 | SAT, algebraic model | under 1 s |

Reading of the reduced controls:

- The negative control is a genuine geometric UNSAT (two distinct circles
  share at most two points), not a syntactic one, and Z3 4.17.0 nlsat does
  not settle it in 300 s. The Z3 one-shot route is therefore not a usable
  UNSAT instrument for this lane at any size; the only UNSAT it produced
  (`five-at-second-apex`) was a syntactic clash with the exactness family.
  A rerun with only the twelve mentioned reals declared (`q1a-wave-3`,
  budget 300 s) is UNKNOWN as well, so the spare declarations were not the
  cause.
- The positive control returned SAT with the model `x_9 = root-obj(4x² − 7, 2)`
  (an algebraic number). The exact-rational verifier rejected it as
  `non-rational-readback`, as designed; the first run of the encoder then
  treated that rejection as a failure and discarded the custody tree. The
  encoder now publishes such a result with classification
  `Z3_SAT_ALGEBRAIC_MODEL_NOT_RATIONALLY_REPLAYED_DIAGNOSTIC`: a bare solver
  SAT, never a verified witness. The rational witness for this control is
  the hand-checked pentagon in the tests, replayed exactly.

Consequences applied in the same checkpoints:

- Reduced controls now declare only the reals their atoms mention (the
  journal for `generic-x`/`none` still declares all 43).
- The `source_digests` of the `q1a-wave-1` and `q1a-wave-2` run manifests
  were refreshed after the encoder edits; the published custody trees under
  `*/artifacts/*` carry the exact executed encoder bytes as
  `implementation-0000` snapshots.

## Constructive exact witness (no solver)

`witness` subcommand. The Moser triangle is fixed as `a2 = (0,0)`,
`a1 = (1,0)`, `a3 = (1/2, -6/7)` with rational circumcentre
`(1/2, -665/2352)`; every class point is a rational point of its class
circle (Pythagorean parametrisation), so every equality holds exactly by
construction. A float search over the same parametrisation (class radii,
the blocker `c1`, its row radius, one angle per class point) maximises the
smallest normalised slack of the strict atoms: the within-cap order is read
off the current configuration and frozen, a bounded trust-region
least-squares solve drives hinge residuals of every strict atom to zero,
the order is re-read, and the loop repeats until stable. The parameters are
then rationalised (`limit_denominator(10000)`) and every atom is replayed
with `Fraction` arithmetic by the same `replay_atoms` the PIQD verifier
uses. Only an exactly replayed configuration is returned.

History: a uniform random sampler (2000 trials) found nothing; SLSQP on the
epigraph form converged to worse points than its start; the hinge
least-squares form stalled once on two coincident row points (the
edge-normalised convexity margin was singular there, now floored at 0.02)
and once on the enclosure atoms of the three Moser vertices, which sit on
the circle by construction and were wrongly counted as zero-margin atoms.

Result (`certificates/p97_dr_two_radius/witness-x-exact-witness.json`, also
under `q1a-wave-2/artifacts/`; seed 0,
restart 8 of the randomised restarts; the designed restart 0 now starts
from its parameters and replays in a few seconds):

- EMPIRICALLY VERIFIED, exact over Q: a 20-point configuration realising
  the principal all-distinct cell with `B2 = X`, all 717 asserted atoms
  replayed, smallest normalised margin 0.33 (worst family: distinctness,
  two points about 0.01 apart).
- Realised cell: `Is = X2, B1_1, Y2, c1, U3`; `I1 = U0, U1, B1_2, Y3, X3`;
  `I2 = U2, Y0, X0, X1, Y1, B1_0, B1_3` (counterclockwise from a1, a2, a3
  respectively). Class radii about 0.964 (`U`), 0.982 (`X`), 0.964 (`Y`);
  the blocker `c1 ≈ (0.133, 0.010)` sits in the surplus cap next to `a2`
  with row radius about 0.84, so its row lies near `a1`.
- Omitted-fact readback on the witness: no five-class at `a2` (class sizes
  4, 4, then singletons); the `U` radius is the unique four-radius at `a1`;
  the `B1` radius is the unique four-radius at `c1`. The named points other
  than `a1`, `a2`, `c1` carry no four-class, and `X`, `Y` have no named
  unique-four blocker because `a2` carries two four-classes: these are
  exactly the facts the named-role quotient cannot express (blockers of the
  unnamed carrier points; the exact-12 count).

Reading. Phase 1a is SAT: the named-role facts the Lean binders expose,
with metric exactness and convex position on the named points, do not force
a contradiction. Any closure of the branch must use what the quotient omits:
the blocker of every carrier point (`CriticalShellSystem` at unnamed
points), the exact carrier count, or the a2-blocker exclusion interacting
with those. By the plan's decision rule the lane moves to encoding 1b
(exact-12 full carrier, profile (5,4,6)).

The `Z`-role cell (a third exact class at `a2` as the second ingress row,
24 points, 1028 atoms) is realizable as well:
`certificates/p97_dr_two_radius/witness-z-exact-witness.json`, designed
restart 0,
smallest normalised margin 0.25, all 1028 atoms replayed over Q, three
four-classes at `a2` and no five-class.

## Claim boundary

- PROVEN: nothing new.
- EMPIRICALLY VERIFIED (exact over Q, replayed by a test): the principal
  cell of the named-role quotient with `B2 = X` is realizable; encoding 1a
  is SAT at that cell. This is a statement about the encoded quotient, not
  about the Lean obligation: the quotient omits the blockers of unnamed
  points and the carrier count, and the encoding-to-claim map has not been
  adversarially audited by a second reader.
- EMPIRICALLY VERIFIED: one full-system negative control UNSAT in 2 ms
  (syntactic); the reduced geometric negative control UNKNOWN at 300 s twice;
  the reduced positive control SAT with an algebraic model.
- Instrument finding: Z3 QF_NRA one-shot through PIQD is not a usable
  UNSAT oracle for this lane. UNSAT-side evidence for 1b needs either a
  counting/order argument provable in Lean or a Gröbner/CAD engine, which
  needs Adam's approval before it runs.
