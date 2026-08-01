"""All Phase-2 smoke gates for the P97 counterexample-search lane.

Implements ``census/p97_search/PHASE2-SPEC.md`` section 7 in full:
G-P1-REGRESS, G-ANN-B1, G-CANON-ANN, G-CAP-ANN, G-FIBER, G-CAPGE4,
G-ITER-DEDUP, G-ITER-SHADOW, G-ITER-KILL, G-SEEDED-2, G-SEED-K3,
G-SEED-FR20, G-BANK-REVAL; plus G-CUTPAT (sections 4.4--4.7 amendments,
R-P1/R-P2/full-source-P3/P4 cut-matrix rules).  Phase-3 prerequisites add
G-CANON-JOINT-EXACT, G-ITER-COMBINED, and G-ITER-MIXED-MODE.

Run from the repo root:
    uv run python census/p97_search/controls2.py

Exits nonzero if any gate fails.  Gate banks are written to a fresh temp
directory (production banks are never committed, per spec section 5).
"""

from __future__ import annotations

import importlib.util
import json
import random
import subprocess
import sys
import tempfile
import time
import traceback
from pathlib import Path
from typing import Any, Callable

_HERE = Path(__file__).resolve().parent
_REPO_ROOT = _HERE.parents[1]
sys.path.insert(0, str(_HERE))

from annotations import AnnotatedNode, AnnotationError, BlockerAnnotation, CapAnnotation  # noqa: E402
from canonical import canonical, canonical_annotated, canonical_perms  # noqa: E402
from cells import Cell, CellError  # noqa: E402
from iterate import (  # noqa: E402
    BankStaleError,
    CanonicalBank,
    Generator,
    explicit_seeds,
    iterate_cell,
    mutation_probe,
)
from node import Node, relabel  # noqa: E402
from rules import (  # noqa: E402
    FiberDefensivePredicateFired,
    R_CAPGE4,
    R_CIRC2,
    R_FIBER4,
    R_P1,
    R_P2,
    R_P3,
    R_P4,
    R_P4_B_COL,
    apply_rule,
    find_p2_occurrence,
    find_p3_occurrence,
    find_p4_occurrence,
    find_p4_b_col_occurrence,
    fr_theorem3_dense_small,
    prune_cut_matrix,
    r_fiber4_predicate,
    r_fiber4_profile_violates,
)
import seeds as _seeds_mod  # noqa: E402


class GateFailure(AssertionError):
    """Raised by a gate function to record a failure (caught by main())."""


GateFn = Callable[[], str]

_TMP_ROOT = Path(tempfile.mkdtemp(prefix="p97-search-phase2-gates-"))


def _bank_path(name: str) -> Path:
    return _TMP_ROOT / f"{name}.jsonl"


# ---------------------------------------------------------------------------
# G-P1-REGRESS: Phase-1 controls.py still exits 0 after the section-4.3
# authorized edits.  Run as a subprocess -- a literal exit-code check.
# ---------------------------------------------------------------------------


def gate_p1_regress() -> str:
    proc = subprocess.run(
        [sys.executable, str(_HERE / "controls.py")],
        cwd=str(_REPO_ROOT),
        capture_output=True,
        text=True,
        timeout=300,
    )
    if proc.returncode != 0:
        raise GateFailure(
            f"G-P1-REGRESS: controls.py exited {proc.returncode}\n"
            f"stdout:\n{proc.stdout}\nstderr:\n{proc.stderr}"
        )
    return f"controls.py exited 0 (stdout tail: {proc.stdout.strip().splitlines()[-1] if proc.stdout.strip() else ''!r})"


# ---------------------------------------------------------------------------
# G-ANN-B1: a B1-violating blocker map is rejected at construction; a
# valid one is accepted; fibers computed correctly on a hand example.
# ---------------------------------------------------------------------------


def gate_ann_b1() -> str:
    # Hand example: n=5, k=2, 5-cycle node, S[p] = {p-1, p+1} mod 5.
    n, k = 5, 2
    cycle_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    node = Node.from_mapping(n=n, k=k, S=cycle_S)

    # Valid: c(x) = (x+1) % n -- a neighbor of x, so x in S[c(x)] holds
    # (S[(x+1)%n] = {x, x+2}, contains x).
    valid_c = tuple((x + 1) % n for x in range(n))
    valid = BlockerAnnotation(node=node, c=valid_c)

    # Hand-computed fibers: fiber(d) = {x : c(x) = d} = {(d-1) % n}.
    fibers = valid.fibers()
    expected_fibers = {d: frozenset({(d - 1) % n}) for d in range(n)}
    if fibers != expected_fibers:
        raise GateFailure(f"G-ANN-B1: fibers mismatch, got {fibers}, expected {expected_fibers}")

    # Invalid: c(0) = 2, but S[2] = {1, 3}, 0 not in S[2] -- (B1) violated.
    invalid_c = (2,) + valid_c[1:]
    try:
        BlockerAnnotation(node=node, c=invalid_c)
    except AnnotationError:
        pass
    else:
        raise GateFailure("G-ANN-B1: a B1-violating blocker map was accepted")

    return (
        f"valid c={valid_c} accepted, fibers={dict(fibers)} match hand computation; "
        f"invalid c={invalid_c} rejected (AnnotationError)"
    )


# ---------------------------------------------------------------------------
# G-CANON-ANN: 100 random (annotated node, random sigma) pairs at small
# n, both annotation kinds; canonical_annotated invariance.  Includes an
# explicit nontrivial-automorphism case exercising canonical_perms > 1.
# ---------------------------------------------------------------------------


def _random_node(rng: random.Random, n: int, k: int) -> Node:
    shells = []
    for p in range(n):
        pool = [q for q in range(n) if q != p]
        size = rng.randint(k, len(pool))
        shells.append(frozenset(rng.sample(pool, size)))
    return Node(n=n, k=k, shells=tuple(shells))


def _random_blocker_annotated_node(rng: random.Random, n: int, k: int) -> AnnotatedNode:
    # Build c first (any fixed-point-free function), then construct
    # shells so S[c(x)] contains x by construction -- guarantees (B1)
    # without rejection-sampling.
    c = [rng.choice([q for q in range(n) if q != x]) for x in range(n)]
    shells: list[set[int]] = [set() for _ in range(n)]
    for x in range(n):
        shells[c[x]].add(x)
    for p in range(n):
        pool = [q for q in range(n) if q != p and q not in shells[p]]
        needed = max(0, k - len(shells[p]))
        if needed > 0 and pool:
            shells[p].update(rng.sample(pool, min(needed, len(pool))))
    node = Node(n=n, k=k, shells=tuple(frozenset(s) for s in shells))
    blocker = BlockerAnnotation(node=node, c=tuple(c))
    return AnnotatedNode(node=node, blocker=blocker)


def _random_cap_annotated_node(rng: random.Random, n: int, k: int) -> AnnotatedNode:
    node = _random_node(rng, n, k)
    M = frozenset(rng.sample(range(n), 3))
    f = {x: rng.randint(0, 2) for x in range(n) if x not in M}
    caps = CapAnnotation(node=node, M=M, f=f)
    return AnnotatedNode(node=node, caps=caps)


def _random_combined_annotated_node(
    rng: random.Random, n: int, k: int
) -> AnnotatedNode:
    blocker_anode = _random_blocker_annotated_node(rng, n, k)
    node = blocker_anode.node
    M = frozenset(rng.sample(range(n), 3))
    f = {x: rng.randint(0, 2) for x in range(n) if x not in M}
    caps = CapAnnotation(node=node, M=M, f=f)
    return AnnotatedNode(
        node=node,
        blocker=blocker_anode.blocker,
        caps=caps,
    )


def _transport_annotated(anode: AnnotatedNode, perm: list[int]) -> AnnotatedNode:
    new_node = relabel(anode.node, perm)
    new_blocker = None
    if anode.blocker is not None:
        new_c: list[int | None] = [None] * len(perm)
        for x, cx in enumerate(anode.blocker.c):
            new_c[perm[x]] = perm[cx]
        new_blocker = BlockerAnnotation(node=new_node, c=tuple(new_c))  # type: ignore[arg-type]
    new_caps = None
    if anode.caps is not None:
        # Cap INDICES are defined relative to the sorted Moser order
        # (CapAnnotation.closed_cap: cap i excludes sorted_moser()[i]).
        # Relabeling by an arbitrary perm need not preserve the numeric
        # order of the Moser vertices, so the old cap index j and the
        # new cap index for the *same geometric cap* can differ -- f's
        # VALUES must be re-indexed by that induced permutation rho, not
        # just have their keys relabeled.
        old_moser = anode.caps.sorted_moser()
        new_moser_sorted = tuple(sorted(perm[m] for m in old_moser))
        rho = {j: new_moser_sorted.index(perm[old_moser[j]]) for j in range(3)}
        new_M = frozenset(new_moser_sorted)
        new_f = {perm[x]: rho[val] for x, val in anode.caps.f.items()}
        new_caps = CapAnnotation(node=new_node, M=new_M, f=new_f)
    return AnnotatedNode(node=new_node, blocker=new_blocker, caps=new_caps)


def _symmetric_complete_node(n: int, k: int) -> Node:
    """S[p] = every other label -- fully symmetric under all n!
    permutations (used to exercise canonical_perms size > 1)."""

    shells = tuple(frozenset(q for q in range(n) if q != p) for p in range(n))
    return Node(n=n, k=k, shells=shells)


def gate_canon_ann() -> str:
    rng = random.Random(20260728)
    trials = 120
    kinds_checked = {"blocker": 0, "caps": 0, "combined": 0}

    for trial in range(trials):
        n = rng.randint(4, 6)
        k = rng.randint(1, max(1, n - 3))
        kind = ("blocker", "caps", "combined")[trial % 3]
        if kind == "blocker":
            anode = _random_blocker_annotated_node(rng, n, k)
        elif kind == "caps":
            anode = _random_cap_annotated_node(rng, n, k)
        else:
            anode = _random_combined_annotated_node(rng, n, k)
        kinds_checked[kind] += 1

        perm = list(range(n))
        rng.shuffle(perm)
        transported = _transport_annotated(anode, perm)

        c1 = canonical_annotated(anode)
        c2 = canonical_annotated(transported)
        if c1 != c2:
            raise GateFailure(
                f"G-CANON-ANN trial {trial} ({kind}): canonical_annotated(anode) != "
                f"canonical_annotated(sigma.anode) for n={n}, k={k}, perm={perm}\n"
                f"c1={c1}\nc2={c2}"
            )

    # Explicit nontrivial-automorphism case: n=4, k=1, fully symmetric
    # shells -- canonical_perms must have size > 1 (in fact n! = 24).
    n, k = 4, 1
    sym_node = _symmetric_complete_node(n, k)
    perms = canonical_perms(sym_node)
    if len(perms) <= 1:
        raise GateFailure(
            f"G-CANON-ANN: symmetric n={n} node has canonical_perms size {len(perms)}, "
            "expected > 1 to exercise the automorphism branch"
        )
    blocker_c = tuple((x + 1) % n for x in range(n))
    sym_blocker = BlockerAnnotation(node=sym_node, c=blocker_c)
    sym_M = frozenset({0, 1, 2})
    sym_f = {3: 1}
    sym_caps = CapAnnotation(node=sym_node, M=sym_M, f=sym_f)
    sym_anode = AnnotatedNode(node=sym_node, blocker=sym_blocker, caps=None)
    sym_anode_caps = AnnotatedNode(node=sym_node, blocker=None, caps=sym_caps)
    sym_anode_combined = AnnotatedNode(
        node=sym_node, blocker=sym_blocker, caps=sym_caps
    )
    for label, anode in (
        ("blocker", sym_anode),
        ("caps", sym_anode_caps),
        ("combined", sym_anode_combined),
    ):
        rand_perm = list(range(n))
        rng.shuffle(rand_perm)
        transported = _transport_annotated(anode, rand_perm)
        if canonical_annotated(anode) != canonical_annotated(transported):
            raise GateFailure(
                f"G-CANON-ANN: symmetric-node {label} case failed invariance "
                f"under perm={rand_perm}"
            )

    return (
        f"{trials}/{trials} random (annotated node, sigma) pairs agree "
        f"({kinds_checked}); symmetric n=4 node has |canonical_perms|={len(perms)} > 1, "
        "all three annotation modes pass invariance on it too"
    )


# ---------------------------------------------------------------------------
# G-CANON-JOINT-EXACT: on the fully symmetric n=4 node, enumerate all
# 3^4 valid blocker maps and all 4*3 cap annotations.  Joint canonical
# equality must induce exactly the same partition as an independent
# brute-force search over all 4! label permutations and all 3! cap-index
# permutations.  This detects over-merging that invariance alone cannot.
# ---------------------------------------------------------------------------


def _bruteforce_combined_key(anode: AnnotatedNode) -> tuple[Any, ...]:
    from itertools import permutations

    best: tuple[Any, ...] | None = None
    n = anode.node.n
    for perm_t in permutations(range(n)):
        transported = _transport_annotated(anode, list(perm_t))
        assert transported.blocker is not None and transported.caps is not None
        moser = transported.caps.sorted_moser()
        m_index = {m: j for j, m in enumerate(moser)}
        for tau in permutations(range(3)):
            cap_part = tuple(
                ("M", tau[m_index[p]])
                if p in m_index
                else ("f", tau[transported.caps.f[p]])
                for p in range(n)
            )
            candidate = (transported.blocker.c, cap_part)
            if best is None or candidate < best:
                best = candidate
    assert best is not None
    return best


def gate_canon_joint_exact() -> str:
    from itertools import combinations, product

    n, k = 4, 1
    node = _symmetric_complete_node(n, k)
    canon_to_brute: dict[Any, set[Any]] = {}
    brute_to_canon: dict[Any, set[Any]] = {}
    count = 0

    blocker_choices = [
        tuple(choice)
        for choice in product(*(tuple(q for q in range(n) if q != x) for x in range(n)))
    ]
    for c in blocker_choices:
        blocker = BlockerAnnotation(node=node, c=c)
        for M_t in combinations(range(n), 3):
            M = frozenset(M_t)
            non_moser = tuple(sorted(set(range(n)) - M))
            for values in product(range(3), repeat=len(non_moser)):
                caps = CapAnnotation(
                    node=node,
                    M=M,
                    f=dict(zip(non_moser, values, strict=True)),
                )
                anode = AnnotatedNode(node=node, blocker=blocker, caps=caps)
                canon_key = canonical_annotated(anode)
                brute_key = _bruteforce_combined_key(anode)
                canon_to_brute.setdefault(canon_key, set()).add(brute_key)
                brute_to_canon.setdefault(brute_key, set()).add(canon_key)
                count += 1

    if any(len(keys) != 1 for keys in canon_to_brute.values()):
        raise GateFailure("G-CANON-JOINT-EXACT: canonical form over-merged brute orbits")
    if any(len(keys) != 1 for keys in brute_to_canon.values()):
        raise GateFailure("G-CANON-JOINT-EXACT: canonical form split a brute orbit")
    if len(canon_to_brute) != len(brute_to_canon):
        raise GateFailure(
            "G-CANON-JOINT-EXACT: canonical/brute orbit counts differ "
            f"({len(canon_to_brute)} != {len(brute_to_canon)})"
        )
    return (
        f"{count} combined annotations partition into {len(canon_to_brute)} "
        "orbits identically under joint canonicalization and brute-force isomorphism"
    )


# ---------------------------------------------------------------------------
# G-CAP-ANN: closed sizes sum to n+3 on random valid annotations;
# closed_profile matches a hand-computed example.
# ---------------------------------------------------------------------------


def gate_cap_ann() -> str:
    rng = random.Random(20260728)
    trials = 50
    for trial in range(trials):
        n = rng.randint(4, 9)
        k = rng.randint(1, max(1, n - 3))
        anode = _random_cap_annotated_node(rng, n, k)
        total = sum(anode.caps.closed_cap(i).__len__() for i in range(3))
        if total != n + 3:
            raise GateFailure(
                f"G-CAP-ANN trial {trial}: closed cap sizes sum to {total}, expected n+3={n + 3}"
            )

    # Hand-computed example: n=7, M={0,2,4} (m0=0, m1=2, m2=4),
    # f(1)=0, f(3)=1, f(5)=1, f(6)=2.
    #   closed_cap(0) excludes m0=0: {1,2,4} (f^-1(0)={1} + {m1,m2}) -> size 3
    #   closed_cap(1) excludes m1=2: {0,3,4,5} (f^-1(1)={3,5} + {m0,m2}) -> size 4
    #   closed_cap(2) excludes m2=4: {0,2,6} (f^-1(2)={6} + {m0,m1}) -> size 3
    #   sum = 3+4+3 = 10 = n+3 = 10.
    n = 7
    node = _random_node(random.Random(1), n, 1)
    M = frozenset({0, 2, 4})
    f = {1: 0, 3: 1, 5: 1, 6: 2}
    caps = CapAnnotation(node=node, M=M, f=f)
    expected = {0: frozenset({1, 2, 4}), 1: frozenset({0, 3, 4, 5}), 2: frozenset({0, 2, 6})}
    for i in range(3):
        if caps.closed_cap(i) != expected[i]:
            raise GateFailure(
                f"G-CAP-ANN hand example: closed_cap({i}) = {caps.closed_cap(i)}, "
                f"expected {expected[i]}"
            )
    if caps.closed_profile() != (3, 3, 4):
        raise GateFailure(
            f"G-CAP-ANN hand example: closed_profile() = {caps.closed_profile()}, expected (3, 3, 4)"
        )

    return (
        f"{trials}/{trials} random cap annotations sum to n+3; hand example n=7 "
        "M={0,2,4} f={1:0,3:1,5:1,6:2} -> closed_profile=(3,3,4) matches"
    )


# ---------------------------------------------------------------------------
# G-FIBER: profile form kill/spare; node form False on a valid node; the
# iterator raises (not prunes) if the node-form predicate ever returns
# True (monkeypatched).
# ---------------------------------------------------------------------------


def gate_fiber() -> str:
    n, k = 5, 2
    cycle_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    node = Node.from_mapping(n=n, k=k, S=cycle_S)

    # Profile form: kill/spare.  |S[p]| = 2 for every p.
    killing_m = {0: 3, 1: 0, 2: 0, 3: 1, 4: 1}  # sum=5=n, m[0]=3 > |S[0]|=2
    sparing_m = {0: 1, 1: 1, 2: 1, 3: 1, 4: 1}  # sum=5=n, every part <= 2
    if not r_fiber4_profile_violates(node, killing_m):
        raise GateFailure(f"G-FIBER: profile form failed to flag {killing_m}")
    if r_fiber4_profile_violates(node, sparing_m):
        raise GateFailure(f"G-FIBER: profile form incorrectly flagged {sparing_m}")

    # Node form: False on a valid (B1-enforced) blocker-annotated node.
    blocker_c = tuple((x + 1) % n for x in range(n))
    blocker = BlockerAnnotation(node=node, c=blocker_c)
    anode = AnnotatedNode(node=node, blocker=blocker)
    if r_fiber4_predicate(anode):
        raise GateFailure("G-FIBER: node-form predicate returned True on a valid AnnotatedNode")

    # Iterator raises if the node-form predicate ever returns True
    # (monkeypatch R_FIBER4.predicate; frozen dataclass -> object.__setattr__).
    cell = Cell(k=k, n=n, profile=None)
    bank = CanonicalBank(_bank_path("g-fiber"), cell)
    gen = Generator(name="g-fiber-probe", coverage="PARTIAL", produce=lambda c: iter([anode]))

    original_predicate = R_FIBER4.predicate
    object.__setattr__(R_FIBER4, "predicate", lambda _anode: True)
    try:
        try:
            iterate_cell(cell, gen, bank)
        except FiberDefensivePredicateFired as exc:
            raised = True
            raised_repr = repr(exc)
        else:
            raised = False
            raised_repr = ""
    finally:
        object.__setattr__(R_FIBER4, "predicate", original_predicate)

    if not raised:
        raise GateFailure(
            "G-FIBER: iterate_cell did NOT raise when R-FIBER4's predicate was monkeypatched True"
        )

    return (
        f"profile form: kill={killing_m} spare={sparing_m}; node form False on a valid node; "
        f"iterate_cell raises when monkeypatched True ({raised_repr})"
    )


# ---------------------------------------------------------------------------
# G-CAPGE4: Cell (4, 12, (3, 6, 6)) pruned; (4, 12, (4, 5, 6)) spared;
# FRAMELESS spared.  Profiled-cell validation rejects k != 4 and n <= 9.
# ---------------------------------------------------------------------------


def gate_capge4() -> str:
    killed = Cell(k=4, n=12, profile=(3, 6, 6))  # sums to 15 = n+3
    spared = Cell(k=4, n=12, profile=(4, 5, 6))  # sums to 15 = n+3
    frameless = Cell(k=4, n=12, profile=None)

    if not apply_rule(R_CAPGE4, killed):
        raise GateFailure(f"G-CAPGE4: {killed} was not pruned")
    if apply_rule(R_CAPGE4, spared):
        raise GateFailure(f"G-CAPGE4: {spared} was incorrectly pruned")
    if apply_rule(R_CAPGE4, frameless):
        raise GateFailure(f"G-CAPGE4: FRAMELESS {frameless} was incorrectly pruned")

    # Profiled-cell validation: k != 4 rejected.
    try:
        Cell(k=3, n=11, profile=(4, 5, 5))  # sum=14=n+3, but k != 4
    except CellError:
        pass
    else:
        raise GateFailure("G-CAPGE4: a profiled cell with k != 4 was accepted")

    # Profiled-cell validation: n <= 9 rejected.
    try:
        Cell(k=4, n=9, profile=(4, 4, 4))  # sum=12=n+3, k=4, but n=9 not > 9
    except CellError:
        pass
    else:
        raise GateFailure("G-CAPGE4: a profiled cell with n <= 9 was accepted")

    return (
        f"killed={killed.profile} (n=12) pruned; spared={spared.profile} (n=12) spared; "
        "FRAMELESS spared; k!=4 and n<=9 profiled cells rejected"
    )


# ---------------------------------------------------------------------------
# G-ITER-DEDUP: feed pi-relabeled duplicates of one node; the bank stores
# exactly one entry.
# ---------------------------------------------------------------------------


def gate_iter_dedup() -> str:
    rng = random.Random(20260728)
    n, k = 5, 2
    cycle_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    base = Node.from_mapping(n=n, k=k, S=cycle_S)

    duplicates = [base]
    for _ in range(6):
        perm = list(range(n))
        rng.shuffle(perm)
        duplicates.append(relabel(base, perm))

    cell = Cell(k=k, n=n, profile=None)
    bank = CanonicalBank(_bank_path("g-iter-dedup"), cell)
    gen = Generator(name="g-iter-dedup-probe", coverage="PARTIAL", produce=lambda c: iter(duplicates))
    manifest = iterate_cell(cell, gen, bank)

    entries = bank.entries()
    if len(entries) != 1:
        raise GateFailure(
            f"G-ITER-DEDUP: expected exactly 1 bank entry from {len(duplicates)} "
            f"pi-relabeled duplicates, got {len(entries)}: {entries}"
        )
    return (
        f"{len(duplicates)} pi-relabeled duplicates (including identity) collapse to "
        f"exactly 1 bank entry (counts={manifest['counts']})"
    )


# ---------------------------------------------------------------------------
# G-ITER-SHADOW: the Phase-1 15-point shadow node (bare mode, FRAMELESS
# (4, 15) cell) banks OPEN.
# ---------------------------------------------------------------------------

_SHADOW_PATH = _REPO_ROOT / "scratch" / "triapex-incidence-obstruction" / "check_model.py"


def _load_shadow_node() -> Node:
    spec = importlib.util.spec_from_file_location("p97_search_phase2_triapex_shadow", _SHADOW_PATH)
    if spec is None or spec.loader is None:
        raise GateFailure(f"G-ITER-SHADOW: could not load {_SHADOW_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    S: dict[int, frozenset[int]] = {}
    for c in range(12):
        S[c] = frozenset(module.SHELLS[c])
    for apex, support in zip(sorted(module.APICES), module.RICH_CLASSES, strict=True):
        S[apex] = frozenset(support)
    return Node.from_mapping(n=15, k=4, S=S)


def gate_iter_shadow() -> str:
    shadow = _load_shadow_node()
    cell = Cell(k=4, n=15, profile=None)
    bank = CanonicalBank(_bank_path("g-iter-shadow"), cell)
    gen = Generator(name="g-iter-shadow-probe", coverage="PARTIAL", produce=lambda c: iter([shadow]))
    manifest = iterate_cell(cell, gen, bank)

    entries = bank.entries()
    if len(entries) != 1:
        raise GateFailure(f"G-ITER-SHADOW: expected exactly 1 bank entry, got {len(entries)}")
    entry = next(iter(entries.values()))
    if entry["status"] != "OPEN":
        raise GateFailure(f"G-ITER-SHADOW: shadow node banked {entry['status']}, expected OPEN: {entry}")
    return f"n=15, k=4 shadow node banks OPEN (mode={manifest['mode']}, fired={entry['fired']})"


# ---------------------------------------------------------------------------
# G-ITER-KILL: an R-CIRC2-violating node banks PRUNED with fired
# ["R-CIRC2"] and the correct hypothesis set.
# ---------------------------------------------------------------------------


def gate_iter_kill() -> str:
    n, k = 5, 2
    cycle_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    violating_S = dict(cycle_S)
    violating_S[0] = {2, 3, 4}
    violating_S[1] = {2, 3, 4}
    violating = Node.from_mapping(n=n, k=k, S=violating_S)

    cell = Cell(k=k, n=n, profile=None)
    bank = CanonicalBank(_bank_path("g-iter-kill"), cell)
    gen = Generator(name="g-iter-kill-probe", coverage="PARTIAL", produce=lambda c: iter([violating]))
    manifest = iterate_cell(cell, gen, bank)

    entries = bank.entries()
    if len(entries) != 1:
        raise GateFailure(f"G-ITER-KILL: expected exactly 1 bank entry, got {len(entries)}")
    entry = next(iter(entries.values()))
    if entry["status"] != "PRUNED" or entry["fired"] != ["R-CIRC2"]:
        raise GateFailure(f"G-ITER-KILL: unexpected entry {entry}")
    if entry["hypotheses"] != []:
        raise GateFailure(
            f"G-ITER-KILL: expected empty hypothesis set (R-CIRC2 has none, FRAMELESS cell), "
            f"got {entry['hypotheses']}"
        )
    return f"R-CIRC2-violating node banks PRUNED, fired={entry['fired']}, hypotheses={entry['hypotheses']}"


# ---------------------------------------------------------------------------
# G-ITER-COMBINED: Phase-3 prerequisite.  A profiled exact cell accepts
# one object carrying both annotations, applies blocker checks, and
# publishes both the frame and blocker hypothesis tags.
# ---------------------------------------------------------------------------


def _combined_fixture() -> tuple[AnnotatedNode, Cell]:
    n, k = 10, 4
    offsets = (1, 2, 3, 5)
    node = Node(
        n=n,
        k=k,
        shells=tuple(
            frozenset((p + offset) % n for offset in offsets) for p in range(n)
        ),
    )
    blocker = BlockerAnnotation(
        node=node,
        c=tuple((x - 1) % n for x in range(n)),
    )
    M = frozenset({0, 1, 2})
    caps = CapAnnotation(
        node=node,
        M=M,
        f={3: 0, 4: 0, 5: 1, 6: 1, 7: 2, 8: 2, 9: 2},
    )
    anode = AnnotatedNode(node=node, blocker=blocker, caps=caps)
    cell = Cell(k=k, n=n, profile=(4, 4, 5), exact=True)
    return anode, cell


def gate_iter_combined() -> str:
    anode, cell = _combined_fixture()
    bank = CanonicalBank(_bank_path("g-iter-combined"), cell)
    gen = Generator(
        name="g-iter-combined-probe",
        coverage="PARTIAL",
        produce=lambda _cell: iter((anode,)),
    )
    manifest = iterate_cell(cell, gen, bank)
    entries = list(bank.entries().values())
    if len(entries) != 1 or entries[0]["status"] != "OPEN":
        raise GateFailure(f"G-ITER-COMBINED: expected one OPEN entry, got {entries}")
    expected_hypotheses = ["blocker-annotated", "convex", "k=4", "n>9"]
    if manifest["mode"] != "cap+blocker-annotated":
        raise GateFailure(f"G-ITER-COMBINED: wrong mode {manifest['mode']!r}")
    if manifest["published_hypotheses"] != expected_hypotheses:
        raise GateFailure(
            "G-ITER-COMBINED: wrong published hypotheses "
            f"{manifest['published_hypotheses']!r}"
        )
    return (
        "n=10 exact cyclic shell fixture banks OPEN in combined mode with "
        f"published_hypotheses={expected_hypotheses}"
    )


# ---------------------------------------------------------------------------
# G-ITER-MIXED-MODE: mode consistency is checked over every produced object,
# even when the first object is rejected by cell admission.
# ---------------------------------------------------------------------------


def gate_iter_mixed_mode() -> str:
    anode, cell = _combined_fixture()
    bank = CanonicalBank(_bank_path("g-iter-mixed-mode"), cell)
    gen = Generator(
        name="g-iter-mixed-mode-probe",
        coverage="PARTIAL",
        # The bare object is rejected by this profiled cell.  It must still
        # establish the run mode, causing the following combined object to
        # fail the no-mixed-modes contract.
        produce=lambda _cell: iter((anode.node, anode)),
    )
    try:
        iterate_cell(cell, gen, bank)
    except ValueError as exc:
        if "mixed object modes" not in str(exc):
            raise GateFailure(f"G-ITER-MIXED-MODE: wrong error: {exc}") from exc
        return "rejected bare then admitted combined is rejected as mixed mode"
    raise GateFailure(
        "G-ITER-MIXED-MODE: rejected bare object hid a following combined mode"
    )


# ---------------------------------------------------------------------------
# G-SEEDED-2: Phase-1 G-SEEDED plant-and-recover, through the full
# iterate_cell path: exactly the planted valid node ends OPEN.
# ---------------------------------------------------------------------------


def gate_seeded_2() -> str:
    cell = Cell(k=2, n=9, profile=None)
    bank = CanonicalBank(_bank_path("g-seeded-2"), cell)
    manifest = iterate_cell(cell, mutation_probe, bank)

    open_entries = [e for e in bank.entries().values() if e["status"] == "OPEN"]
    if len(open_entries) != 1:
        raise GateFailure(
            f"G-SEEDED-2: expected exactly 1 OPEN entry, got {len(open_entries)}: {open_entries}"
        )

    n, k = 9, 2
    planted_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    planted = Node.from_mapping(n=n, k=k, S=planted_S)
    planted_digest = _canonical_digest(canonical(planted))
    if open_entries[0]["digest"] != planted_digest:
        raise GateFailure(
            f"G-SEEDED-2: the unique OPEN entry's digest does not match the planted node's "
            f"canonical digest (entry={open_entries[0]}, planted_digest={planted_digest})"
        )
    return (
        f"mutation_probe through iterate_cell: exactly the planted n=9, k=2 node ends OPEN "
        f"(counts={manifest['counts']})"
    )


def _canonical_digest(canon: Any) -> str:
    import hashlib

    return hashlib.sha256(repr(canon).encode("utf-8")).hexdigest()


# ---------------------------------------------------------------------------
# G-SEED-K3, G-SEED-FR20: both seeds pass D1/D2/exact-3, bank OPEN in
# their (3, n) FRAMELESS exact cells, NOT pruned by any ADMITTED rule.
# FR-20's degrees-all-3 check is enforced inside seeds.py's construction
# (raises if violated); reasserted here directly too.
# ---------------------------------------------------------------------------


def _gate_seed(seed_name: str) -> str:
    seed = next(s for s in _seeds_mod.SEEDS if s.name == seed_name)
    node = seed.node
    if any(len(node.shell(p)) != node.k for p in range(node.n)):
        raise GateFailure(f"{seed_name}: not every shell has size exactly k={node.k} (exact-3 failed)")

    cell = Cell(k=node.k, n=node.n, profile=None, exact=True)
    bank = CanonicalBank(_bank_path(f"seed-{seed_name.lower()}"), cell)
    # Exercise the actual named Phase-2 generator (spec section 6), not
    # an ad hoc stand-in: explicit_seeds(cell) filters seeds.SEEDS by
    # (k, n) match, so this cell admits exactly this one seed node.
    manifest = iterate_cell(cell, explicit_seeds, bank)

    entries = bank.entries()
    if len(entries) != 1:
        raise GateFailure(f"{seed_name}: expected exactly 1 bank entry, got {len(entries)}")
    entry = next(iter(entries.values()))
    if entry["status"] != "OPEN":
        raise GateFailure(f"{seed_name}: banked {entry['status']}, expected OPEN: {entry}")
    return f"{seed_name}: n={node.n}, k={node.k}, exact-3 pass, banks OPEN (counts={manifest['counts']})"


def gate_seed_k3() -> str:
    return _gate_seed("S-K3-9")


def gate_seed_fr20() -> str:
    result = _gate_seed("S-FR-20")
    fr20 = next(s for s in _seeds_mod.SEEDS if s.name == "S-FR-20").node
    degrees = {p: len(fr20.shell(p)) for p in range(fr20.n)}
    if any(d != 3 for d in degrees.values()):
        raise GateFailure(f"G-SEED-FR20: degrees not all 3: {degrees}")
    return result + f"; degrees all 3 (checked directly: {sorted(set(degrees.values()))})"


# ---------------------------------------------------------------------------
# G-BANK-REVAL: a bank written under a mutated rule-bank hash demotes
# PRUNED entries to STALE on load, and refuses use until revalidated.
# ---------------------------------------------------------------------------


def gate_bank_reval() -> str:
    n, k = 5, 2
    cycle_S = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    violating_S = dict(cycle_S)
    violating_S[0] = {2, 3, 4}
    violating_S[1] = {2, 3, 4}
    violating = Node.from_mapping(n=n, k=k, S=violating_S)

    cell = Cell(k=k, n=n, profile=None)
    path = _bank_path("g-bank-reval")
    bank = CanonicalBank(path, cell)
    gen = Generator(name="g-bank-reval-probe", coverage="PARTIAL", produce=lambda c: iter([violating]))
    manifest = iterate_cell(cell, gen, bank)
    if manifest["counts"]["pruned"] != 1:
        raise GateFailure(f"G-BANK-REVAL: setup did not produce exactly 1 PRUNED entry: {manifest}")

    # Simulate "written under a mutated rule-bank hash": rewrite the
    # on-disk header's rule_bank_hash to a value that cannot match.
    lines = path.read_text().splitlines()
    header = json.loads(lines[0])
    header["rule_bank_hash"] = "deadbeef" * 8
    lines[0] = json.dumps(header)
    path.write_text("\n".join(lines) + "\n")

    try:
        CanonicalBank(path, cell)
    except BankStaleError:
        pass
    else:
        raise GateFailure("G-BANK-REVAL: normal construction did not refuse a bank with a hash mismatch")

    revalidating = CanonicalBank.open_for_revalidation(path, cell)
    if revalidating.stale_count != 1:
        raise GateFailure(
            f"G-BANK-REVAL: expected 1 STALE entry after demotion, got {revalidating.stale_count}"
        )
    stale = [e for e in revalidating.entries().values() if e["status"] == "STALE"]
    if len(stale) != 1:
        raise GateFailure(f"G-BANK-REVAL: expected 1 STALE entry, got {stale}")

    iterate_cell(cell, gen, revalidating)
    if revalidating.stale_count != 0:
        raise GateFailure(
            f"G-BANK-REVAL: revalidation pass left {revalidating.stale_count} STALE entries"
        )
    refreshed = revalidating.entries()
    if len(refreshed) != 1 or next(iter(refreshed.values()))["status"] != "PRUNED":
        raise GateFailure(f"G-BANK-REVAL: entry after revalidation is not fresh PRUNED: {refreshed}")

    return (
        "hash-mismatched bank demotes 1 PRUNED entry to STALE on load; normal construction "
        "refuses use (BankStaleError); open_for_revalidation + rerun clears STALE back to PRUNED"
    )


# ---------------------------------------------------------------------------
# Orchestration
# ---------------------------------------------------------------------------

def gate_cutpat() -> str:
    """Spec section 4.4: R-P1/R-P2 kill/spare pairs, FR-20 positive and
    orientation controls, engine domain refusal, input validation."""

    from itertools import combinations as _comb

    # Diagnostic-only Fishburn--Reeds Theorem-3 antecedent.  Calling the
    # helper must neither mutate the matrix nor alter the full scanner's
    # exact attribution, order, or hypothesis union.
    dense_3x3 = [[1] * 3 for _ in range(3)]
    dense_copy = [row[:] for row in dense_3x3]
    dense_before = prune_cut_matrix(dense_3x3)
    expected_dense_fired = ("R-P1", "R-P2", "R-P3", "R-P4", "R-P4-B-COL")
    expected_dense_hypotheses = frozenset(
        {
            "convex",
            "one-side-contiguous-arc",
            "contiguous-cut",
            "same-distance-cells",
            "C2-orientation",
        }
    )
    assert dense_before.fired == expected_dense_fired, (
        f"Theorem-3 diagnostic attribution baseline: {dense_before}"
    )
    assert dense_before.hypotheses == expected_dense_hypotheses, (
        f"Theorem-3 diagnostic hypothesis baseline: {dense_before}"
    )
    assert fr_theorem3_dense_small(dense_3x3), (
        "3x3 all-ones matrix must satisfy the dense-small diagnostic"
    )
    assert dense_3x3 == dense_copy, "Theorem-3 diagnostic mutated its input"
    dense_after = prune_cut_matrix(dense_3x3)
    assert dense_after == dense_before, (
        "calling the Theorem-3 diagnostic changed exact pruning attribution: "
        f"before={dense_before}, after={dense_after}"
    )

    degree_miss = [row[:] for row in dense_3x3]
    degree_miss[0][0] = 0
    assert not fr_theorem3_dense_small(degree_miss), (
        "degree-two row/column must miss the dense-small diagnostic"
    )
    dense_3x4 = [[1] * 4 for _ in range(3)]
    dense_4x3 = [list(row) for row in zip(*dense_3x4)]
    assert fr_theorem3_dense_small(dense_3x4)
    assert fr_theorem3_dense_small(dense_3x4) == fr_theorem3_dense_small(dense_4x3), (
        "dense-small diagnostic is not transpose invariant"
    )
    degree_miss_t = [list(row) for row in zip(*degree_miss)]
    assert fr_theorem3_dense_small(degree_miss) == fr_theorem3_dense_small(
        degree_miss_t
    ), "degree-miss diagnostic is not transpose invariant"
    assert not fr_theorem3_dense_small([]), (
        "empty matrix must not satisfy the Theorem-3 cut diagnostic vacuously"
    )

    # R-P1 kill: K_{2,2} at non-contiguous rows/cols in a 3x4 matrix.
    p1_kill = [[0, 1, 0, 1], [0, 0, 0, 0], [0, 1, 0, 1]]
    res = prune_cut_matrix(p1_kill)
    assert res.pruned and res.fired == ("R-P1",), f"P1 kill: {res}"

    # R-P1 spare: 3 of the 4 cells.
    p1_spare = [[0, 1, 0, 1], [0, 0, 0, 0], [0, 1, 0, 0]]
    res = prune_cut_matrix(p1_spare)
    assert not res.pruned, f"P1 spare fired: {res}"

    # R-P2 kill, variant A at rows (0,2,5), cols (1,3,4) of a 6x6.
    va = [[0] * 6 for _ in range(6)]
    for r, c in ((0, 1), (0, 3), (2, 4), (5, 1), (5, 4)):
        va[r][c] = 1
    res = prune_cut_matrix(va)
    assert res.pruned and res.fired == ("R-P2",), f"P2-A kill: {res}"
    occ = find_p2_occurrence(va)
    assert occ == ("A", (0, 2, 5), (1, 3, 4)), f"P2-A witness: {occ}"

    # R-P2 kill, variant B at rows (1,3,4), cols (0,2,5).
    vb = [[0] * 6 for _ in range(6)]
    for r, c in ((1, 0), (1, 5), (3, 0), (4, 2), (4, 5)):
        vb[r][c] = 1
    res = prune_cut_matrix(vb)
    assert res.pruned and res.fired == ("R-P2",), f"P2-B kill: {res}"
    occ = find_p2_occurrence(vb)
    assert occ == ("B", (1, 3, 4), (0, 2, 5)), f"P2-B witness: {occ}"

    # R-P2 spare: 4 of the 5 variant-A cells.
    va_spare = [row[:] for row in va]
    va_spare[5][4] = 0
    res = prune_cut_matrix(va_spare)
    assert not res.pruned, f"P2 spare fired: {res}"

    # Exact-boundary control: the S-FR-20 symmetric cut matrix (native C2)
    # has alpha+beta=20 and degree 3, so the strict dense-small diagnostic
    # is false.  It must also survive the four source P1--P4 scanners.  The
    # auxiliary B_col rule is checked only by the full-bank soundness scan
    # and is not counted as Fishburn--Reeds Theorem-3 source evidence.
    # The configuration is exactly certified
    # realizable (fr-certify/), so any firing would be an over-prune.
    fr = [[0] * 10 for _ in range(10)]
    for i, j in _seeds_mod._FR20_PAIRS:
        fr[i - 1][j - 1] = 1
        fr[j - 1][i - 1] = 1  # unordered pair {i,j}: A_iB_j AND A_jB_i
    assert sum(map(sum, fr)) == 30 and all(sum(row) == 3 for row in fr), (
        "FR matrix must be symmetric with 30 ones, degree 3 per row"
    )
    assert not fr_theorem3_dense_small(fr), (
        "FR-20 alpha+beta=20 boundary must miss the strict dense-small diagnostic"
    )
    source_res = prune_cut_matrix(fr, rules=(R_P1, R_P2, R_P3, R_P4))
    assert not source_res.pruned, f"FR-20 native C2 source P1--P4 over-pruned: {source_res}"
    res = prune_cut_matrix(fr)
    assert not res.pruned, f"FR-20 native C2 over-pruned: {res}"

    # Orientation control: the column-reversed matrix is the C1
    # misreading; it must fire R-P2, with exactly 16 variant-B
    # occurrences (offsets restated independently of rules.py).
    fr_c1 = [row[::-1] for row in fr]
    res = prune_cut_matrix(fr_c1)
    assert res.pruned and "R-P2" in res.fired, f"FR-20 C1 reading: {res}"
    b_hits = sum(
        1
        for rows in _comb(range(10), 3)
        for cols in _comb(range(10), 3)
        if fr_c1[rows[0]][cols[0]]
        and fr_c1[rows[0]][cols[2]]
        and fr_c1[rows[1]][cols[0]]
        and fr_c1[rows[2]][cols[1]]
        and fr_c1[rows[2]][cols[2]]
    )
    assert b_hits == 16, f"expected 16 C1 variant-B occurrences, got {b_hits}"

    # Engine hard-refusal: node-domain rule in the cut-matrix path.
    try:
        prune_cut_matrix(p1_spare, rules=(R_CIRC2,))
    except AssertionError:
        pass
    else:
        raise AssertionError("prune_cut_matrix accepted a node-domain rule")

    # Input validation: both the scanner and diagnostic reject ragged and
    # non-0/1 matrices via the shared cut-matrix validator.
    for bad in ([[0, 1], [0]], [[0, 2], [0, 1]]):
        for consumer in (prune_cut_matrix, fr_theorem3_dense_small):
            try:
                consumer(bad)
            except ValueError:
                pass
            else:
                raise AssertionError(
                    f"{consumer.__name__} accepted malformed matrix: {bad}"
                )

    # R-P3 (section 4.5 amendment): exact positive, all-one-cell-deletion
    # spare, and source-name noncollision controls for the six source
    # orientation-1 row/inner-column cases plus the two additional R2
    # transpose shapes.  The remaining four transposes are already equal to
    # source shapes, so these eight templates are the full transpose closure.
    p3_templates = {
        "R1-distinct-inner": (
            4,
            4,
            ((0, 0), (0, 1), (1, 0), (2, 3), (3, 2), (3, 3)),
        ),
        "R1-merged-inner": (
            4,
            3,
            ((0, 0), (0, 1), (1, 0), (2, 2), (3, 1), (3, 2)),
        ),
        "R2-distinct-inner": (
            4,
            4,
            ((0, 0), (0, 1), (2, 0), (1, 3), (3, 2), (3, 3)),
        ),
        "R2-merged-inner": (
            4,
            3,
            ((0, 0), (0, 1), (2, 0), (1, 2), (3, 1), (3, 2)),
        ),
        "R3-distinct-inner": (
            3,
            4,
            ((0, 0), (0, 1), (1, 0), (1, 3), (2, 2), (2, 3)),
        ),
        "R3-merged-inner": (
            3,
            3,
            ((0, 0), (0, 1), (1, 0), (1, 2), (2, 1), (2, 2)),
        ),
        "R2-distinct-inner-transpose": (
            4,
            4,
            ((0, 0), (0, 2), (1, 0), (2, 3), (3, 1), (3, 3)),
        ),
        "R2-merged-inner-transpose": (
            3,
            4,
            ((0, 0), (0, 2), (1, 0), (1, 3), (2, 1), (2, 3)),
        ),
    }
    for name, (nr, nc, cells) in p3_templates.items():
        kill = [[0] * nc for _ in range(nr)]
        for r, c in cells:
            kill[r][c] = 1
        res = prune_cut_matrix(kill)
        assert res.pruned and res.fired == ("R-P3",), f"P3 {name} kill: {res}"
        occ = find_p3_occurrence(kill)
        assert occ == (name, tuple(range(nr)), tuple(range(nc))), (
            f"P3 {name} source-name collision/witness mismatch: {occ}"
        )

        for r0, c0 in cells:
            spare = [row[:] for row in kill]
            spare[r0][c0] = 0
            res = prune_cut_matrix(spare, rules=(R_P3,))
            assert not res.pruned, f"P3 {name} deletion spare {(r0, c0)} fired: {res}"
            assert find_p3_occurrence(spare) is None, (
                f"P3 {name} deletion spare {(r0, c0)} collided with another template"
            )

    # R-P4 (section 4.6 amendment): both actual source variants at k=3
    # and k=5, embedded on non-contiguous rows and columns.  Isolate R-P4
    # because the k=3 cycle may also be recognized by another admitted
    # pattern rule.
    p4_embeddings = {
        3: ((0, 2, 5), (1, 3, 5), 6, 6),
        5: ((0, 2, 4, 6, 8), (1, 3, 5, 7, 9), 9, 10),
    }
    for k, (rows, cols, nr, nc) in p4_embeddings.items():
        relative = {
            "A": tuple(
                cell
                for i in range(k - 1)
                for cell in ((i, k - 2 - i), (i, k - 1 - i))
            )
            + ((k - 1, 0), (k - 1, k - 1)),
            "B": ((0, 0), (0, k - 1))
            + tuple(
                cell
                for i in range(1, k)
                for cell in ((i, k - 1 - i), (i, k - i))
            ),
        }
        for variant, cells in relative.items():
            kill = [[0] * nc for _ in range(nr)]
            for ri, ci in cells:
                kill[rows[ri]][cols[ci]] = 1
            res = prune_cut_matrix(kill, rules=(R_P4,))
            assert res.pruned and res.fired == ("R-P4",), (
                f"P4 {variant} k={k} kill: {res}"
            )
            occ = find_p4_occurrence(kill)
            assert occ == (variant, rows, cols), f"P4 {variant} k={k} witness: {occ}"

            spare = [row[:] for row in kill]
            ri, ci = cells[0]
            spare[rows[ri]][cols[ci]] = 0
            res = prune_cut_matrix(spare, rules=(R_P4,))
            assert not res.pruned, f"P4 {variant} k={k} spare fired: {res}"

            # The separately admitted auxiliary B_col scanner must not
            # absorb either actual Figure-4 variant.
            res = prune_cut_matrix(kill, rules=(R_P4_B_COL,))
            assert not res.pruned, (
                f"source P4 {variant} k={k} misclassified as B_col: {res}"
            )

    # Every B_col occurrence is already subsumed by P2-A.  For k >= 3,
    # relative rows (0,k-2,k-1) and columns (0,1,k-1) select exactly
    # P2-A's five cells.  Check the explicit non-contiguous witness at
    # representative k=3 and k=5.
    for k, (rows, cols, nr, nc) in p4_embeddings.items():
        b_col_subsumed = [[0] * nc for _ in range(nr)]
        for i in range(k - 1):
            b_col_subsumed[rows[i]][cols[i]] = 1
            b_col_subsumed[rows[i]][cols[i + 1]] = 1
        b_col_subsumed[rows[k - 1]][cols[k - 1]] = 1
        b_col_subsumed[rows[k - 1]][cols[0]] = 1

        expected_p2 = (
            "A",
            (rows[0], rows[k - 2], rows[k - 1]),
            (cols[0], cols[1], cols[k - 1]),
        )
        occ = find_p2_occurrence(b_col_subsumed)
        assert occ == expected_p2, (
            f"B_col k={k} embedded P2-A witness: {occ}, expected {expected_p2}"
        )
        res = prune_cut_matrix(b_col_subsumed, rules=(R_P2,))
        assert res.pruned and res.fired == ("R-P2",), (
            f"B_col k={k} must be subsumed by R-P2: {res}"
        )

    # R-P4-B-COL (section 4.7 amendment): exact non-contiguous k=4
    # embedding.  It fires the auxiliary rule, remains outside R-P4's
    # source A/B scanner, and deletion of one required cell spares it.
    b_col_rows = (0, 2, 4, 6)
    b_col_cols = (1, 3, 5, 7)
    b_col = [[0] * 8 for _ in range(7)]
    b_col_cells = tuple(
        cell
        for i in range(3)
        for cell in ((i, i), (i, i + 1))
    ) + ((3, 3), (3, 0))
    for ri, ci in b_col_cells:
        b_col[b_col_rows[ri]][b_col_cols[ci]] = 1

    res = prune_cut_matrix(b_col, rules=(R_P4, R_P4_B_COL))
    assert res.pruned and res.fired == ("R-P4-B-COL",), (
        f"B_col must fire only its auxiliary P4 rule: {res}"
    )
    occ = find_p4_b_col_occurrence(b_col)
    assert occ == (b_col_rows, b_col_cols), f"B_col witness mismatch: {occ}"
    assert find_p4_occurrence(b_col) is None, (
        "B_col must remain outside the actual Figure-4 A/B scanner"
    )

    b_col_spare = [row[:] for row in b_col]
    ri, ci = b_col_cells[0]
    b_col_spare[b_col_rows[ri]][b_col_cols[ci]] = 0
    res = prune_cut_matrix(b_col_spare, rules=(R_P4_B_COL,))
    assert not res.pruned, f"B_col 2k-1 spare fired: {res}"

    assert (
        R_P1.domain
        == R_P2.domain
        == R_P3.domain
        == R_P4.domain
        == R_P4_B_COL.domain
        == "cut-matrix"
    )
    return (
        "Theorem-3 diagnostic: 3x3 positive, degree miss, transpose, malformed, "
        "FR-20 strict boundary, and exact attribution noninterference; "
        "P1/P2 kill+spare, FR-20 survives source C2 / fires R-P2 in C1 (16 B-hits), "
        "P3 full-source transpose closure: 8 exact positives, 48 deletion spares, "
        "source names noncolliding, "
        "P4 A/B kill+spare at k=3,5; B_col exact kill+spare, source separation, "
        "and explicit P2-A subsumption at k=3,5, "
        "refusal+validation OK"
    )


GATES: tuple[tuple[str, GateFn], ...] = (
    ("G-P1-REGRESS", gate_p1_regress),
    ("G-ANN-B1", gate_ann_b1),
    ("G-CANON-ANN", gate_canon_ann),
    ("G-CANON-JOINT-EXACT", gate_canon_joint_exact),
    ("G-CAP-ANN", gate_cap_ann),
    ("G-FIBER", gate_fiber),
    ("G-CAPGE4", gate_capge4),
    ("G-ITER-DEDUP", gate_iter_dedup),
    ("G-ITER-SHADOW", gate_iter_shadow),
    ("G-ITER-KILL", gate_iter_kill),
    ("G-ITER-COMBINED", gate_iter_combined),
    ("G-ITER-MIXED-MODE", gate_iter_mixed_mode),
    ("G-SEEDED-2", gate_seeded_2),
    ("G-SEED-K3", gate_seed_k3),
    ("G-SEED-FR20", gate_seed_fr20),
    ("G-BANK-REVAL", gate_bank_reval),
    ("G-CUTPAT", gate_cutpat),
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
    print(f"{'Gate':<16}{'Verdict':<8}Detail")
    print("-" * 100)
    for name, verdict, _ok, detail in rows:
        print(f"{name:<16}{verdict:<8}{detail}")
    print()
    print(f"gate bank dir: {_TMP_ROOT}")
    print(f"ALL_GATES_PASS = {all_pass}")
    return 0 if all_pass else 1


if __name__ == "__main__":
    raise SystemExit(main())
