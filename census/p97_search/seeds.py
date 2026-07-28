"""Phase-2 explicit seed constructions for the P97 counterexample search
lane.

Implements ``census/p97_search/PHASE2-SPEC.md`` section 6: S-K3-9 and
S-FR-20.  Both are incidence projections of real (numerically or exactly
verified) k=3 configurations, so they double as soundness controls on
the ADMITTED rule bank -- a kill here falsifies a rule (gate must fail
loudly, never be "fixed" by adjusting a rule).
"""

from __future__ import annotations

import contextlib
import importlib.util
import io
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from node import Node

__all__ = ["SeedNode", "S_K3_9", "S_FR_20", "SEEDS"]

_HERE = Path(__file__).resolve().parent
_REPO_ROOT = _HERE.parents[1]  # census/p97_search -> census -> repo root


@dataclass(frozen=True)
class SeedNode:
    name: str
    node: Node
    exact: bool
    citation: str


# ---------------------------------------------------------------------------
# S-K3-9 (spec section 6): 9 exact Q(sqrt3) points
# (scratch/p97-search-lane/verify_k3_control.py PTS).  Import PTS, do not
# retype -- group the 8 squared distances per point in exact sympy
# arithmetic; each point has exactly one group of size 3 (verified twice,
# 2026-07-28, per the source file's own docstring).
# ---------------------------------------------------------------------------

_K3_CONTROL_PATH = _REPO_ROOT / "scratch" / "p97-search-lane" / "verify_k3_control.py"


def _load_k3_control_module() -> Any:
    """Import ``verify_k3_control.py`` for its ``PTS`` literal.  The
    source file is a standalone script (it runs its own exact-arithmetic
    checks and calls ``sys.exit`` at module scope); ``PTS`` is assigned
    long before that exit call, so the module object already has it once
    execution reaches the exit -- catch the resulting ``SystemExit``
    (code 0 on success; a nonzero code means the source file's OWN
    checks failed, and we must not silently proceed with unverified
    points, so that re-raises loudly)."""

    spec = importlib.util.spec_from_file_location(
        "p97_search_k3_control_source", _K3_CONTROL_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"S-K3-9: could not load {_K3_CONTROL_PATH}")
    module = importlib.util.module_from_spec(spec)
    buf = io.StringIO()
    try:
        with contextlib.redirect_stdout(buf):
            spec.loader.exec_module(module)
    except SystemExit as exc:
        if exc.code not in (0, None):
            raise RuntimeError(
                f"S-K3-9: verify_k3_control.py's own checks failed (exit "
                f"code {exc.code!r}); refusing to build the seed from "
                f"unverified points. Output:\n{buf.getvalue()}"
            ) from exc
    return module


def _build_k3_node() -> Node:
    from sympy import expand, simplify

    module = _load_k3_control_module()
    pts = module.PTS
    n = len(pts)
    if n != 9:
        raise RuntimeError(f"S-K3-9: expected 9 points in verify_k3_control.PTS, got {n}")

    def d2(p: Any, q: Any) -> Any:
        return expand((p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2)

    S: dict[int, frozenset[int]] = {}
    for i in range(n):
        groups: dict[Any, list[int]] = {}
        for j in range(n):
            if j == i:
                continue
            key = simplify(d2(pts[i], pts[j]))
            groups.setdefault(key, []).append(j)
        size3_groups = [members for members in groups.values() if len(members) == 3]
        if len(size3_groups) != 1:
            raise RuntimeError(
                f"S-K3-9: point {i} does not have exactly one equidistant "
                f"group of size 3 (group sizes: "
                f"{sorted((len(m) for m in groups.values()), reverse=True)})"
            )
        S[i] = frozenset(size3_groups[0])

    return Node.from_mapping(n=9, k=3, S=S)


S_K3_9 = SeedNode(
    name="S-K3-9",
    node=_build_k3_node(),
    exact=True,
    citation=(
        "scratch/p97-search-lane/verify_k3_control.py PTS: 9 exact "
        "Q(sqrt3) points, independently verified twice (researcher agent "
        "+ orchestrator, per the source file's docstring): all 9 points "
        "pairwise distinct, strict convex position, every point has "
        "exactly one equidistant group of size exactly 3. "
        "PHASE2-SPEC.md section 6 (S-K3-9)."
    ),
)


# ---------------------------------------------------------------------------
# S-FR-20 (spec section 6): the Fishburn-Reeds 20-gon incidence node
# (scratch/p97-search-lane/fishburn-reeds-notes.md).  Labels 0-9 = A-side
# vertices 1-10, labels 10-19 = B-side vertices 1-10 (B-side vertex j ->
# label 9 + j).  For each of the 15 unordered pairs {i, j} in the notes'
# edge list, add BOTH cross-cut edges (i_A, j_B) and (j_A, i_B); S[p] =
# p's 3 partners.
# ---------------------------------------------------------------------------

# Transcribed verbatim from scratch/p97-search-lane/fishburn-reeds-notes.md
# ("Unit-distance edges ... 15 unordered pairs"), citing Fishburn-Reeds
# 1992 Table 1; verified there numerically (|d^2 - 1| < 4e-12, degrees
# all 3, adjacency slopes match Table 1 col 3).
_FR20_PAIRS: tuple[tuple[int, int], ...] = (
    (1, 10), (2, 10), (3, 10),
    (1, 9), (4, 9), (5, 9),
    (2, 5), (3, 4),
    (1, 6), (3, 7), (5, 7), (6, 7),
    (2, 8), (4, 8), (6, 8),
)


def _fr20_label_a(v: int) -> int:
    return v - 1


def _fr20_label_b(v: int) -> int:
    return 9 + v


def _build_fr20_node() -> Node:
    if len(_FR20_PAIRS) != 15:
        raise RuntimeError(f"S-FR-20: expected 15 edge pairs, got {len(_FR20_PAIRS)}")

    adjacency: dict[int, set[int]] = {label: set() for label in range(20)}

    def add_edge(x: int, y: int) -> None:
        adjacency[x].add(y)
        adjacency[y].add(x)

    for i, j in _FR20_PAIRS:
        add_edge(_fr20_label_a(i), _fr20_label_b(j))
        add_edge(_fr20_label_a(j), _fr20_label_b(i))

    for label, partners in adjacency.items():
        if len(partners) != 3:
            raise RuntimeError(
                f"S-FR-20: label {label} has degree {len(partners)}, "
                "expected 3 (scratch/p97-search-lane/"
                "fishburn-reeds-notes.md 15-pair edge list)"
            )

    S = {label: frozenset(partners) for label, partners in adjacency.items()}
    return Node.from_mapping(n=20, k=3, S=S)


S_FR_20 = SeedNode(
    name="S-FR-20",
    node=_build_fr20_node(),
    exact=True,
    citation=(
        "scratch/p97-search-lane/fishburn-reeds-notes.md 15-pair edge "
        "list (Fishburn-Reeds 1992, 'Unit distances between vertices of "
        "a convex polygon', Table 1); numerically verified there "
        "(|d^2-1| < 4e-12, degrees all 3, adjacency slopes match Table 1 "
        "col 3). PHASE2-SPEC.md section 6 (S-FR-20)."
    ),
)


SEEDS: tuple[SeedNode, ...] = (S_K3_9, S_FR_20)
