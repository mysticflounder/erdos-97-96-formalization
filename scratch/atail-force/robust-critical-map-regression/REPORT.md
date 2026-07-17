# Robust critical-map regression

Date: 2026-07-16

Status: **BASE FINITE SURFACE SAT; CURRENT BANK-CLEAN COVERAGE
INDETERMINATE; GLOBAL CARDINAL MINIMALITY IS THE FIRST MISSING PARENT
FIELD.**

## Verdict

The smallest higher-cap robust profile admits the retained critical-map
interface at the finite incidence/cyclic-order level.  The checked witness is

```text
profile                                      (6,6,5)
carrier card                                  14
physical second opposite closed-cap card       6
base represented surface                     SAT
row digest       a9c6acbf0c466c65fff5613ff2b0864ee0302a1973f4c37edbecb74ee6a12119
blocker digest   621ca4029eb342b33ee756a9e6421b00826d33677278ecde345ae42405d7db79
```

This is a valid regression against any proposed cap-at-least-six robust
consumer that uses only the represented finite consequences below.  It is
**not** a Euclidean counterexample and does not refute the Lean theorem.

The first SAT assignment has five current producer-bank matches, including
the direct three-row Kalmanson terminal.  Hence it is not bank-clean.  A
bounded bank-clean CEGAR replay inspected 20 verifier-valid completions; every
one matched the current bank, but the run stopped at 25 iterations rather than
proving coverage:

```text
bank-clean verdict            ITERATION_BUDGET_FAIL_CLOSED
iterations                    25
verifier-valid bank matches   20
pairwise verifier rejections   5
```

Therefore the current result is neither a bank-clean SAT survivor nor an
UNSAT certificate.  It says:

1. the corrected 101 checkpoint does not decide this endpoint, because that
   checkpoint fixes the four-point opposite-cap profile `(8,4,5)`;
2. the cap-six retained-map surface itself is structurally nonempty; and
3. the existing producer bank is promising on sampled completions, but there
   is still no formal coverage theorem forcing a banked completion from the
   live robust packet.

## Exact represented parent fields

`audit.py` retains all of the following simultaneously:

- the fourteen-label convex cyclic frame with cap profile `(6,6,5)`;
- one admissible selected four-row at every carrier center (the finite global
  K4 projection);
- Moser-endpoint cap one-hit admissibility and the current killed local row
  types through `mc.cached_candidate_lists(..., PROVEN_ROWS)`;
- pairwise row compatibility, including the convex two-common-point chord
  separation rule;
- at most two carrier centers through any fixed carrier pair;
- a total source-indexed blocker map on every carrier source;
- no self-blocker;
- exclusion of the physical second apex from the blocker-map image, the exact
  finite consequence of `FullyDeletionRobustAt.centerAt_ne`;
- source membership in the selected row at its blocker center;
- exact-row marking at every center in the blocker-map image; and
- two support-disjoint selected four-rows at the physical second apex, a
  sufficient finite cause of `FullyDeletionRobustAt`.

The stored witness is independently replayed by
`shadow.verify_assignment`; `--check` also compares the complete stored JSON,
including the row and blocker digests.

## What is not encoded

The SAT result does not construct real coordinates, radii, a minimum
enclosing circle, or an actual `CounterexampleData`.  In particular it does
not encode:

- the real-distance realization of every selected support;
- the full logical `no_qfree` field beyond its exact-row/source-locking finite
  consequences;
- `hNoM44` or the complete cap/MEC placement data;
- the source-faithful frontier packet and its named `q,w` history; or
- `D.Minimal`.

Current producer-bank matches are theorem-discovery evidence only until a
checked live extractor proves that every retained robust packet supplies one
of their exact row schemas.  Blocking literal all-center completions is not a
coverage proof.

## Comparison with the global minimal-deletion-core bridge

The read-only lane
`scratch/atail-force/global-minimal-deletion-core/` identifies the first
obvious field not represented here: global cardinal minimality `D.Minimal`.
It is also absent from the current route-B tail interface, even though
`removableVertexOfLarge_of_nonIsM44` has it one layer above that interface.

This distinction is substantive.  The total `CriticalShellSystem` records
one critical singleton deletion at each chosen blocker, while `D.Minimal`
can minimize a **set** of deletions and produce a fresh center with either:

1. a shared-radius collision;
2. a multi-source `MinimalDeletionCore` with disjoint exact shells and packing
   inequalities; or
3. an installed singleton frontier omission.

None of these global set-deletion alternatives is visible in the SAT surface.
The witness therefore does not regress the minimal-deletion bridge.

`D.Minimal` is the smallest **obvious** missing global field because it is
already available immediately above the tail and has a kernel-checked
extractor that creates genuinely new data.  It is not yet proved sufficient:
the three resulting arms still need consumers.

The corrected theorem-development target should consequently be a parent
theorem of the following mathematical shape, provisionally
`RobustSecondApexMinimalDeletion`:

```lean
D.Minimal →
CriticalShellSystem D.A →
FullyDeletionRobustAt D S.oppApex2 →
6 ≤ S.oppCap2.card →
-- retain the source-faithful frontier / survivor-pair data
False
```

Equivalently, its first checked milestone may return the exact
collision/core/installed-singleton trichotomy rather than `False`.  The key
route correction is to thread `D.Minimal` at the parent boundary and consume
the existing global minimal-deletion extractor, not to mine more literal
all-center selected-row completions as if they were the live object.

## Bank preflight

Before constructing the regression, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for full deletion
  robustness, global K4, physical second-apex common deletion, and critical
  shell systems.

No archived theorem supplies a direct cap-at-least-six robust contradiction.
The reusable facts found were the current critical-shell support lock/fiber
bounds, the cap/MEC one-hit bounds, and the existing finite metric consumers
used by the producer-bank replay.

## Replay

From the repository root:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/robust-critical-map-regression/audit.py \
  --max-iterations 500 --check --summary

UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/robust-critical-map-regression/audit.py \
  --max-iterations 25 --require-bank-clean --check --summary
```

Both commands are deterministic at the stored checkpoint.  The first returns
`SAT_FINITE_STRUCTURAL_SHADOW_ONLY`; the second returns
`ITERATION_BUDGET_FAIL_CLOSED` and must not be reported as UNSAT.

No production file, closure doc, proof-blueprint state, or other scratch lane
was changed.
