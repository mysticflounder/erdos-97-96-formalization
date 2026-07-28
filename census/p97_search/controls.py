"""All Phase-1 smoke gates for the P97 counterexample-search lane.

Implements ``census/p97_search/PHASE1-SPEC.md`` sections 2, 4, and 5 in
full: G-CANON-1, G-CANON-2, G-SHADOW-NODE, G-SEEDED, G-RULES, plus the
standalone unit tests called out alongside them (profiles_for(11, 4)).

Phase-2 authorized edit (``census/p97_search/PHASE2-SPEC.md`` section
4.3): with R-FIBER4/R-CAPGE4 promoted CANDIDATE -> ADMITTED, ``G-RULES``
is updated so their kill/spare pairs become live positive controls (run
through the real engine entry points instead of asserting hard-refusal),
and the CANDIDATE engine-refusal path is retested via a synthetic
``R-TEST-CANDIDATE`` rule that exists ONLY in this file (never in
``rules.ALL_RULES`` / the rule-bank hash).  No other Phase-1 behavior
changes.  This file must still exit 0 standalone (gate G-P1-REGRESS in
``controls2.py``).

Run from the repo root:
    uv run python census/p97_search/controls.py

Exits nonzero if any gate fails.
"""

from __future__ import annotations

import importlib.util
import random
import sys
import time
import traceback
from itertools import combinations, permutations, product
from pathlib import Path
from typing import Any, Callable, Iterable, Mapping

_HERE = Path(__file__).resolve().parent
_REPO_ROOT = _HERE.parents[1]
sys.path.insert(0, str(_HERE))

from annotations import AnnotatedNode, BlockerAnnotation  # noqa: E402
from canonical import canonical  # noqa: E402
from cells import Cell, CellError, profiles_for  # noqa: E402
from node import Node, NodeInvariantError, relabel  # noqa: E402
from rules import (  # noqa: E402
    ADMITTED_ANNOTATED_RULES,
    ADMITTED_CELL_RULES,
    ALL_RULES,
    CANDIDATE,
    CANDIDATE_RULES,
    R_CAPGE4,
    R_CIRC2,
    R_FIBER4,
    Rule,
    apply_rule,
    prune_annotated_node,
    prune_node,
)


class GateFailure(AssertionError):
    """Raised by a gate function to record a failure (caught by main())."""


GateFn = Callable[[], str]


# ---------------------------------------------------------------------------
# G-CANON-1: 200 random (node, random-pi) pairs at small n.
# ---------------------------------------------------------------------------


def _random_node(rng: random.Random, n: int, k: int) -> Node:
    shells = []
    for p in range(n):
        pool = [q for q in range(n) if q != p]
        size = rng.randint(k, len(pool))
        shells.append(frozenset(rng.sample(pool, size)))
    return Node(n=n, k=k, shells=tuple(shells))


def gate_canon_1() -> str:
    rng = random.Random(20260728)
    trials = 200
    for trial in range(trials):
        n = rng.randint(3, 7)
        k = rng.randint(1, max(1, n - 2))
        node = _random_node(rng, n, k)
        perm = list(range(n))
        rng.shuffle(perm)
        relabeled = relabel(node, perm)
        c1 = canonical(node)
        c2 = canonical(relabeled)
        if c1 != c2:
            raise GateFailure(
                f"G-CANON-1 trial {trial}: canonical(node) != canonical(pi.node) "
                f"for n={n}, k={k}, perm={perm}\nnode.S={dict(node.S)}\n"
                f"canonical(node)={c1}\ncanonical(pi.node)={c2}"
            )
    return f"{trials}/{trials} (node, random-pi) pairs agree"


# ---------------------------------------------------------------------------
# G-CANON-2: exhaustive n=5, k=2, canonical-form partition vs independent
# brute-force isomorphism partition (all 120 permutations of S_5).
# ---------------------------------------------------------------------------


def _subsets_at_least(pool: tuple[int, ...], min_size: int) -> list[tuple[int, ...]]:
    out: list[tuple[int, ...]] = []
    for size in range(min_size, len(pool) + 1):
        out.extend(combinations(pool, size))
    return out


def _brute_force_certificate(
    n: int, k: int, shells: tuple[frozenset[int], ...], perms: list[tuple[int, ...]]
) -> tuple[int, int, tuple[tuple[int, ...], ...]]:
    """Independent (no shared code with canonical.py) minimum-over-orbit
    isomorphism invariant: try every permutation, keep the lexicographically
    smallest relabeled serialization.  Two nodes share this key iff a
    permutation maps one onto the other (see module docstring / RESULTS.md
    for the short proof)."""

    best: tuple[tuple[int, ...], ...] | None = None
    for perm in perms:
        new_shells: list[tuple[int, ...] | None] = [None] * n
        for p in range(n):
            new_shells[perm[p]] = tuple(sorted(perm[q] for q in shells[p]))
        cert = tuple(new_shells)  # type: ignore[arg-type]
        if best is None or cert < best:
            best = cert
    assert best is not None
    return (k, n, best)


def gate_canon_2() -> str:
    n, k = 5, 2
    pools = [tuple(q for q in range(n) if q != p) for p in range(n)]
    per_point_choices = [_subsets_at_least(pool, k) for pool in pools]
    perms = list(permutations(range(n)))

    canon_groups: dict[Any, set[int]] = {}
    brute_groups: dict[Any, set[int]] = {}
    total = 0
    for combo in product(*per_point_choices):
        shells = tuple(frozenset(c) for c in combo)
        node = Node(n=n, k=k, shells=shells)
        ckey = canonical(node)
        canon_groups.setdefault(ckey, set()).add(total)
        bkey = _brute_force_certificate(n, k, shells, perms)
        brute_groups.setdefault(bkey, set()).add(total)
        total += 1

    canon_partition = {frozenset(v) for v in canon_groups.values()}
    brute_partition = {frozenset(v) for v in brute_groups.values()}
    if canon_partition != brute_partition:
        only_canon = canon_partition - brute_partition
        only_brute = brute_partition - canon_partition
        raise GateFailure(
            "G-CANON-2: canonical() partition disagrees with brute-force "
            f"isomorphism partition. total nodes={total}, canon classes="
            f"{len(canon_partition)}, brute classes={len(brute_partition)}, "
            f"canon-only cells={len(only_canon)}, brute-only cells={len(only_brute)}"
        )
    return (
        f"{total} nodes (n=5, k=2), {len(canon_partition)} isomorphism "
        "classes; canonical() partition == brute-force partition exactly"
    )


# ---------------------------------------------------------------------------
# G-SHADOW-NODE: import the 15-point tri-apex shadow from
# scratch/triapex-incidence-obstruction/check_model.py and encode it as a
# census node.  Read the literals via import, do not retype them.
# ---------------------------------------------------------------------------

_SHADOW_PATH = _REPO_ROOT / "scratch" / "triapex-incidence-obstruction" / "check_model.py"


def _load_shadow_module() -> Any:
    spec = importlib.util.spec_from_file_location("p97_search_triapex_shadow", _SHADOW_PATH)
    if spec is None or spec.loader is None:
        raise GateFailure(f"G-SHADOW-NODE: could not load {_SHADOW_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def gate_shadow_node() -> str:
    # Literals below are read live from check_model.py, not retyped:
    #   POINTS/APICES lines 12-14, SHELLS lines 26-39 (12 non-apex centers
    #   0..11), RICH_CLASSES lines 21-25 (3 apex classes, zipped with
    #   sorted(APICES) exactly as check_model.py's own
    #   install_equal_distance_classes() does at line 73).
    shadow = _load_shadow_module()
    if len(shadow.SHELLS) != 12:
        raise GateFailure(f"G-SHADOW-NODE: expected 12 SHELLS, got {len(shadow.SHELLS)}")
    if len(shadow.RICH_CLASSES) != 3:
        raise GateFailure(
            f"G-SHADOW-NODE: expected 3 RICH_CLASSES, got {len(shadow.RICH_CLASSES)}"
        )
    S: dict[int, frozenset[int]] = {}
    for c in range(12):
        S[c] = frozenset(shadow.SHELLS[c])
    for apex, support in zip(sorted(shadow.APICES), shadow.RICH_CLASSES, strict=True):
        S[apex] = frozenset(support)

    try:
        node = Node.from_mapping(n=15, k=4, S=S)
    except NodeInvariantError as exc:
        raise GateFailure(f"G-SHADOW-NODE: shadow encoding fails (D1)/(D2): {exc}") from exc

    result = prune_node(node)
    if result.pruned:
        raise GateFailure(
            f"G-SHADOW-NODE: shadow node was pruned by ADMITTED rule(s) {result.fired}"
        )
    return "n=15, k=4 shadow node passes (D1)/(D2) and is not pruned by any ADMITTED rule"


# ---------------------------------------------------------------------------
# G-SEEDED: plant one valid n=9, k=2 node among 50 invalid mutants; verify
# exactly the planted node survives the filter pipeline (construct + prune).
# ---------------------------------------------------------------------------


def _filter_pipeline(
    candidates: list[tuple[int, int, Mapping[int, Iterable[int]]]]
) -> list[tuple[int, Node]]:
    """Construct each raw (n, k, S) candidate as a Node (D1/D2 rejection is
    a construction-time filter, not pruning) then run the ADMITTED rule
    bank; return the (index, Node) survivors."""

    survivors: list[tuple[int, Node]] = []
    for idx, (n, k, raw_S) in enumerate(candidates):
        try:
            node = Node.from_mapping(n=n, k=k, S=raw_S)
        except NodeInvariantError:
            continue
        result = prune_node(node)
        if not result.pruned:
            survivors.append((idx, node))
    return survivors


def _build_seeded_candidates() -> tuple[Node, list[tuple[int, int, Mapping[int, Iterable[int]]]]]:
    # Planted valid node: 9 points on a 9-cycle, S[p] = the two cycle
    # neighbors of p.  n=9, k=2.  Passes (D1) (neighbors != p), (D2)
    # (|S[p]| = 2 = k), and R-CIRC2 (any two distinct 2-point neighbor sets
    # on a 9-cycle intersect in at most one point, since two vertices would
    # need identical neighbor pairs to share both, which only happens for
    # p == q on a cycle of length > 4).
    n, k = 9, 2
    planted_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    planted_node = Node.from_mapping(n=n, k=k, S=planted_S)

    candidates: list[tuple[int, int, Mapping[int, Iterable[int]]]] = [(n, k, planted_S)]

    # 9 (D1) mutants: one per point p, S[p] gains a self-loop.
    for p in range(n):
        mutant = dict(planted_S)
        mutant[p] = set(planted_S[p]) | {p}
        candidates.append((n, k, mutant))

    # 9 (D2) mutants: one per point p, S[p] emptied below k.
    for p in range(n):
        mutant = dict(planted_S)
        mutant[p] = set()
        candidates.append((n, k, mutant))

    # 32 R-CIRC2 mutants: pick a distinct-point pair (p, q) and force
    # S[p] == S[q] == the same 3-point set drawn from neither p nor q, so
    # |S[p] ∩ S[q]| = 3 > 2 while (D1)/(D2) stay satisfied at every point.
    circ2_count = 0
    for p in range(n):
        if circ2_count >= 32:
            break
        for q in range(n):
            if q == p:
                continue
            if circ2_count >= 32:
                break
            pool = sorted(set(range(n)) - {p, q})
            shared = frozenset(pool[:3])
            mutant = dict(planted_S)
            mutant[p] = shared
            mutant[q] = shared
            candidates.append((n, k, mutant))
            circ2_count += 1

    assert len(candidates) == 51, f"expected 1 planted + 50 mutants, got {len(candidates)}"
    return planted_node, candidates


def gate_seeded() -> str:
    planted_node, candidates = _build_seeded_candidates()
    survivors = _filter_pipeline(candidates)
    if len(survivors) != 1:
        raise GateFailure(
            f"G-SEEDED: expected exactly 1 survivor, got {len(survivors)}: "
            f"indices {[i for i, _ in survivors]}"
        )
    idx, survivor_node = survivors[0]
    if idx != 0 or survivor_node.digest() != planted_node.digest():
        raise GateFailure(
            f"G-SEEDED: the surviving node is not the planted node "
            f"(survivor index={idx}, digest match={survivor_node.digest() == planted_node.digest()})"
        )
    return "planted n=9, k=2 node is the unique survivor among 50 invalid mutants"


# ---------------------------------------------------------------------------
# G-RULES: per-rule kill/spare pairs.  R-CIRC2 (ADMITTED) is exercised
# through prune_node.  Phase-2 (PHASE2-SPEC.md section 4.3): R-FIBER4 and
# R-CAPGE4 are now ADMITTED too, so their kill/spare pairs become LIVE
# positive controls run through the real engine entry points
# (prune_annotated_node / apply_rule) instead of asserting hard-refusal.
# The CANDIDATE-refusal path itself is retested via a synthetic
# R-TEST-CANDIDATE rule that lives only in this file.
# ---------------------------------------------------------------------------


def _build_circ2_pair() -> tuple[Node, Node]:
    n, k = 5, 2
    # Conforming: 5-cycle neighbors, R-CIRC2-satisfying (see G-SEEDED
    # docstring for the same argument at n=9; holds identically at n=5).
    conforming_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    conforming = Node.from_mapping(n=n, k=k, S=conforming_S)

    # Violating: S[0] = S[1] = {2, 3, 4}, |S[0] ∩ S[1]| = 3 > 2.
    violating_S = dict(conforming_S)
    violating_S[0] = {2, 3, 4}
    violating_S[1] = {2, 3, 4}
    violating = Node.from_mapping(n=n, k=k, S=violating_S)
    return violating, conforming


def gate_rules() -> str:
    violating, conforming = _build_circ2_pair()
    lines = []

    # --- R-CIRC2 (ADMITTED): kill the violator, spare the conforming node.
    killed = prune_node(violating)
    if not killed.pruned or "R-CIRC2" not in killed.fired:
        raise GateFailure(f"G-RULES: R-CIRC2 failed to kill the violating pair: {killed}")
    spared = prune_node(conforming)
    if spared.pruned:
        raise GateFailure(f"G-RULES: R-CIRC2 incorrectly killed the conforming pair: {spared}")
    lines.append("R-CIRC2: violating node killed, conforming node spared")

    # --- R-FIBER4 (ADMITTED, Phase 2, domain=annotated-node): live
    # positive control.  A B1-valid blocker annotation on the conforming
    # (5-cycle) node -- c(x) = a neighbor of x, so x in S[c(x)] trivially
    # -- is spared by the real engine call (not pruned, no defensive
    # raise).  The defensive predicate is provably False for every
    # constructible AnnotatedNode (spec section 4.1 mini-lemma), so there
    # is no genuine "killed" case to exercise here without monkeypatching
    # (that raise-path is gate G-FIBER in controls2.py).
    blocker_c = tuple((x + 1) % conforming.n for x in range(conforming.n))
    blocker = BlockerAnnotation(node=conforming, c=blocker_c)
    anode = AnnotatedNode(node=conforming, blocker=blocker)
    fiber_result = prune_annotated_node(anode)
    if fiber_result.pruned:
        raise GateFailure(
            f"G-RULES: R-FIBER4 incorrectly pruned a B1-valid annotated node: {fiber_result}"
        )
    if R_FIBER4 not in ADMITTED_ANNOTATED_RULES:
        raise GateFailure("G-RULES: R-FIBER4 must be in ADMITTED_ANNOTATED_RULES")
    lines.append(
        "R-FIBER4: live via prune_annotated_node on a B1-valid blocker-annotated node -- spared "
        "(defensive predicate has no constructible killed case, see PHASE2-SPEC.md section 4.1)"
    )

    # --- R-CAPGE4 (ADMITTED, Phase 2, domain=cell): live kill/spare pair
    # through apply_rule directly on Cell descriptors (Phase-2 tightening:
    # profiled cells require k=4, n>9).  Killed cell has a cap < 4; spared
    # cell is the census-554 cell (5, 5, 4), all caps >= 4.
    killed_cell = Cell(k=4, n=10, profile=(3, 5, 5))  # sums to n+3=13, cap 3 < 4
    spared_cell = Cell(k=4, n=11, profile=(4, 5, 5))  # census-554 cell, all caps >= 4
    if not apply_rule(R_CAPGE4, killed_cell):
        raise GateFailure(f"G-RULES: R-CAPGE4 (live) failed to flag {killed_cell}")
    if apply_rule(R_CAPGE4, spared_cell):
        raise GateFailure(f"G-RULES: R-CAPGE4 (live) incorrectly flagged {spared_cell}")
    if R_CAPGE4 not in ADMITTED_CELL_RULES:
        raise GateFailure("G-RULES: R-CAPGE4 must be in ADMITTED_CELL_RULES")
    lines.append(
        f"R-CAPGE4: live via apply_rule; killed={killed_cell.profile} (n={killed_cell.n}) "
        f"spared={spared_cell.profile} (n={spared_cell.n})"
    )

    if CANDIDATE_RULES:
        raise GateFailure(
            f"G-RULES: CANDIDATE_RULES must be empty after Phase-2 promotion, got {CANDIDATE_RULES}"
        )
    if len(ALL_RULES) != 3 or {r.id for r in ALL_RULES} != {"R-CIRC2", "R-FIBER4", "R-CAPGE4"}:
        raise GateFailure(f"G-RULES: ALL_RULES must be exactly the 3 promoted rules, got {ALL_RULES}")

    # --- R-TEST-CANDIDATE (synthetic, controls-only): retests the
    # CANDIDATE engine-refusal path now that no production rule is
    # CANDIDATE any more.  Never added to rules.ALL_RULES / the bank hash.
    r_test_candidate = Rule(
        id="R-TEST-CANDIDATE",
        status=CANDIDATE,
        hypotheses=(),
        predicate=lambda obj: False,  # trivial: never fires even if consulted
        citation="synthetic controls-only rule, PHASE2-SPEC.md section 4.3; never in ALL_RULES",
        domain="node",
    )
    if r_test_candidate.id in {r.id for r in ALL_RULES}:
        raise GateFailure("G-RULES: R-TEST-CANDIDATE leaked into rules.ALL_RULES")
    for obj, label in ((violating, "violating"), (conforming, "conforming")):
        try:
            apply_rule(r_test_candidate, obj)
        except AssertionError:
            pass
        else:
            raise GateFailure(
                f"G-RULES: apply_rule(R-TEST-CANDIDATE, {label}) did not hard-refuse a CANDIDATE rule"
            )
        try:
            prune_node(obj, rules=(r_test_candidate,))
        except AssertionError:
            pass
        else:
            raise GateFailure(
                f"G-RULES: prune_node(..., rules=(R-TEST-CANDIDATE,)) did not hard-refuse on {label}"
            )
    lines.append(
        "R-TEST-CANDIDATE (synthetic, controls-only): apply_rule/prune_node hard-refuse "
        "(AssertionError) on both pair members; not in rules.ALL_RULES"
    )

    return "; ".join(lines)


# ---------------------------------------------------------------------------
# Standalone unit test: profiles_for(11, 4) must include the census-554
# cell (5, 5, 4), with the count checked by hand (spec section 4).
# ---------------------------------------------------------------------------


def unit_test_profiles_for() -> str:
    # By hand: n=11, min_cap=4 => total = n + 3 = 14.  Sorted triple
    # a <= b <= c, a + b + c = 14, each >= 4.  Since a is the minimum,
    # 3a <= 14 => a <= 4 (a >= 4 by the floor), so a = 4 exactly.  Then
    # b + c = 10 with 4 <= b <= c: b=4,c=6 and b=5,c=5 (b=6,c=4 fails
    # b <= c).  So exactly two profiles: (4, 4, 6) and (4, 5, 5).
    result = profiles_for(11, 4)
    expected = ((4, 4, 6), (4, 5, 5))
    if result != expected:
        raise GateFailure(f"profiles_for(11, 4) = {result}, expected {expected}")
    census_554 = tuple(sorted((5, 5, 4)))
    if census_554 not in result:
        raise GateFailure(f"census-554 cell {census_554} missing from {result}")
    # Cell descriptor construction/validation smoke check.
    Cell(k=4, n=11, profile=census_554)
    try:
        Cell(k=4, n=11, profile=(5, 5, 5))  # sums to 15 != n+3=14
    except CellError:
        pass
    else:
        raise GateFailure("Cell did not reject a profile with the wrong sum")
    return f"profiles_for(11, 4) == {result} (hand count: 2); census-554 cell present"


# ---------------------------------------------------------------------------
# Orchestration
# ---------------------------------------------------------------------------

GATES: tuple[tuple[str, GateFn], ...] = (
    ("G-CANON-1", gate_canon_1),
    ("G-CANON-2", gate_canon_2),
    ("G-SHADOW-NODE", gate_shadow_node),
    ("G-SEEDED", gate_seeded),
    ("G-RULES", gate_rules),
    ("profiles_for unit test", unit_test_profiles_for),
)


def main() -> int:
    rows: list[tuple[str, str, bool, str]] = []
    all_pass = True
    for name, fn in GATES:
        start = time.time()
        try:
            detail = fn()
            elapsed = time.time() - start
            rows.append((name, "PASS", True, f"{detail} ({elapsed:.2f}s)"))
        except Exception as exc:  # noqa: BLE001 - report and continue to next gate
            elapsed = time.time() - start
            all_pass = False
            detail = f"{exc} ({elapsed:.2f}s)"
            rows.append((name, "FAIL", False, detail))
            traceback.print_exc(file=sys.stderr)

    print()
    print(f"{'Gate':<24}{'Verdict':<8}Detail")
    print("-" * 100)
    for name, verdict, _ok, detail in rows:
        print(f"{name:<24}{verdict:<8}{detail}")
    print()
    print(f"ALL_GATES_PASS = {all_pass}")
    return 0 if all_pass else 1


if __name__ == "__main__":
    raise SystemExit(main())
