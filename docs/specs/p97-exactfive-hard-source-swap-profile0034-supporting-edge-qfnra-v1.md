# Profile 0034 supporting-edge QF_NRA discovery lane

Status: prelaunch diagnostic only. This lane makes no theorem, certificate,
closure, promotion, source-completeness, or source-realization claim.

## Scope

The producer authenticates and replays the committed profile-0034
equilateral-frame run `run-0002`, including its current committed producer
bytes. It starts no predecessor session and imports no predecessor session
state. A launch uses the maintained PIQD HTTP source adapter with fresh named
sessions for every solver and query.

The case matrix has two authenticated cyclic orders and two strict radius
branches, `<` and `>`. The frame fixes `c000`, `c001`, and `c003`; the remaining
ten points contribute 20 declared Real variables. Squared distances retain
vertical weight 3.

## Sound relaxation

The original fixed-order formula has 286 positive orientations, one for each
sorted triple. This lane emits 143 positive supporting-edge orientations. For
each of the 13 directed cyclic edges `order[i] → order[(i+1) mod 13]`, every
other vertex must lie strictly left of that edge.

Each emitted orientation is one original sorted-triple orientation after a
cyclic determinant rotation. Therefore the original 286-orientation formula
implies the emitted 143-orientation formula. No reverse direction is claimed.
The wrap edges are `c009 → c000` in the mirror order and `c003 → c000` in the
direct order.

Each target has this exact inventory:

| Item | Count |
|---|---:|
| Real declarations | 20 |
| Supporting-edge assertions | 143 |
| Non-tautological row equalities | 11 |
| Strict radius assertion | 1 |
| Strict source assertion | 1 |
| Assertions | 156 |
| Commands, including logic and declarations | 177 |

## Verdict boundary

`UNSAT` is discovery evidence about the relaxed formula and, by the sound
direction above, supports discovery for that original fixed cell. It is not a
certificate or formal proof.

`SAT` is never accepted from the relaxed formula alone. Exact readback must
reconstruct all 13 coordinates and replay:

- all original 286 strict sorted-triple orientations;
- all 13 original row equalities;
- the selected strict radius branch; and
- the strict source metric inequality.

A model that fails any replay check is spurious and the cell remains
inconclusive. Algebraic values outside the exact rational parser are rejected,
so unsupported readback also remains inconclusive.

Controls run before targets. The positive control must replay as SAT on both
adapter engines, and the negative control must return UNSAT on both. The request
timeout is 60 seconds by default and at most four target workers run at once.
An existing launch with a terminal is replayed from immutable artifacts. An
existing launch without a terminal is never resumed; it fails before query or
transport activity and requires a fresh run ID.

## Custody

The immutable run manifest binds this producer, runner, specification,
predecessor records, predecessor result records, and adapter bytes. The lane
uses `scratch/runs/exactfive-hard-source-swap-profile0034-supporting-edge-qfnra-piqd-20260904/run-0001/`.
No terminal artifact exists before an authorized launch.

Before launch construction or transport activity, the runner obtains the full
current Git commit and reads every manifest-bound source from that exact commit.
Each committed blob must match both the current bytes and its run-manifest
digest. Missing blobs, malformed commit output, or byte drift stop the run. An
unrelated dirty path is outside this check. The launch record binds the full
execution commit; the terminal binds the resulting launch hash.
