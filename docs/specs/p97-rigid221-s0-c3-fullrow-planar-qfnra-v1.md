# Rigid221 S0 C3 full-row planar QF_NRA diagnostic v1

## Claim boundary

This lane asks finite Euclidean realizability questions about one named 18-role
packet. Its results are computational discovery evidence about the emitted
formula only. There is no source ingress, ambient-cardinality coverage theorem,
Lean consumer, or proof certificate. The checkpoint-16 controls test exact
rational parsing, the full five-point physical O-circle, four secondary pair
rows, and convex-hull replay; they are not full-row 18-role witnesses.

The prior `qfnra-three-full-rows` run timed out for both fixed orders and both
engines, including exact-metric and convex-only relaxations. A timeout is no
verdict. This lane therefore separates the target into stages and records
`UNKNOWN` as inconclusive rather than increasing timeouts until an answer
appears.

## Packet

The 18 pairwise-distinct roles are
`O,p,q,u,s,r,O1,bu,bs,br,f1,f2,ua,ub,sa,sb,ra,rb`. The displayed rows are:

| row | center | support |
| --- | --- | --- |
| C | O | p, q, u, s, r |
| F1 | O1 | p, q, f1, f2 |
| Ku | bu | u, s, ua, ub |
| Ks | bs | s, r, sa, sb |
| Kr | br | r, u, ra, rb |

Each row asserts equal squared center-distances and a strictly positive squared
distance. The exact-fiber stage additionally excludes every off-support role
from the displayed radius: 12 exclusions for C and 13 for each four-support
row, hence 64 total. The full-uniqueness stage says that at each of
`O1,bu,bs,br` no four off-support roles have one common center-distance. Each
off-support set has cardinality 13, giving exactly
`4 * choose(13,4) = 2860` assertions.

The deletion matrix is not redundantly encoded in SMT. Exact SAT replay groups
all remaining roles by exact positive squared distance at each of
`O1,bu,bs,br`. Before deletion, the full-uniqueness stage requires the displayed
fiber to have multiplicity exactly four and to be the sole fiber with
multiplicity at least four. After each deletion `u,s,r`, replay recomputes every
fiber over the remaining roles. A cell is `kill` precisely when the actual
maximum positive multiplicity is at most three, and `survive` when it is at
least four:

| deleted | Ku | Ks | Kr |
| --- | --- | --- | --- |
| u | kill | survive | kill |
| s | kill | kill | survive |
| r | survive | kill | kill |

## Convexity modes

Fixed-order cells assert, for every directed boundary edge, that each of the
other 16 roles lies strictly to its left. Thus each cell has `18 * 16 = 288`
strict supporting-edge inequalities. The forward and reverse label orders are
two explicit diagnostic cells; they do not enumerate all cyclic orders.

The all-order formula introduces a normal `(nx_i,ny_i)` for every role `i` and
asserts

`nx_i*(x_i-x_j) + ny_i*(y_i-y_j) > 0`

for all `j != i`, giving `18 * 17 = 306` inequalities. This says that each
finite point is exposed by a strict supporting line. It avoids a factorial
disjunction and places no cyclic label order in the formula. Exact SAT replay
also derives the actual cyclic hull order from the coordinates and checks all
supporting edges. This substitution is a single order-free geometric encoding,
not outer enumeration of orders.

Translation, rotation, and positive scaling are gauge-fixed with
`O=(0,0), p=(1,0)`. Pairwise distinctness supplies 153 strict squared-distance
inequalities.

## Controls

The positive control is the exact rational checkpoint-16 configuration

`P(t)=((1-t^2)/(1+t^2), 2t/(1+t^2))`

with `p=P(-3/5)`, `q=P(-9/20)`, `a=P(-3/10)`, `b=P(-1/20)`, `c=P(3/8)`,
`o1=(51/100)(p+q)`, `b_ab=(51/100)(a+b)`,
`b_ac=(19/30)(a+c)`, and `b_bc=(14/25)(b+c)`. Its declared CCW order is
`O,p,o1,q,a,b_ab,b,b_ac,b_bc,c`. Replay checks all 80 supporting-edge
inequalities and all 45 distinct pairs. Its physical O-row is the full
five-point circle `{p,q,a,b,c}`, with four radius equalities, positive radius,
and exact off-fiber exclusions for `o1,b_ab,b_ac,b_bc`. Replay also checks the
four secondary pair rows `O1:{p,q}`, `b_ab:{a,b}`, `b_ac:{a,c}`, and
`b_bc:{b,c}`. The negative control replaces `b_ab` by `a`; its fixed coordinates
contradict distinctness, O-row exactness, and strict convexity.

Both controls run before any selected target. Each query uses fresh independent
Z3 and cvc5 PIQD sessions. No solver executable is invoked directly.

## Custody and replay

The producer authenticates the lane checkpoint. Before any generated artifact,
it creates a `worktree-run-manifest/v1` with the checkpoint's exact `base_head`,
nonempty source and input digest maps, and a canonical self-hash. Launch,
terminal, and adapter trees are create-once. The existing PIQD SMT source
adapter owns append/solve/export receipts, fresh session identity, exact journal
binding, and immutable artifact publication.

SAT readback accepts only integers and exact rationals supported by the existing
parser. Algebraic or malformed values reject semantic replay, so the lane
records the result as inconclusive. Replay checks the full selected stage,
including exact fibers, complete distance-multiplicity vectors, uniqueness,
convexity, and all nine post-deletion maxima. Earlier stages report the same
multiplicity inventories without demanding the full-uniqueness or deletion
conclusions. `UNSAT` remains formula-scoped discovery evidence; `UNKNOWN`
and cross-engine disagreement remain inconclusive.

The canonical stages are `row-equalities`, `exact-fibers`, and
`full-uniqueness`. Their separation localizes the first solver obstruction
without silently weakening the reported stage.
