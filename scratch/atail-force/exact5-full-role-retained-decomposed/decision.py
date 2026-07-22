#!/usr/bin/env python3
"""Decomposed exact-five card-13 all-one retained-row decision gate.

The earlier full-role gate put all Boolean incidence choices and the complete
linear Kalmanson metric in one solver.  That mixed outer timed out before
producing a candidate.  This driver keeps the same source projection but
replaces the real metric in the outer with a generic lazy ordinal quotient:

* the finite solver proposes a source-faithful row/incidence assignment;
* selected rows generate an equality quotient of the 78 distance terms;
* cancellation in each strict Kalmanson inequality generates a strict order
  on quotient classes; and
* a directed cycle is returned with a replayable row-incidence explanation.

Graph transitivity and irreflexivity reject quotient cycles without putting
integer or real variables in the finite solver and without a persistent
literal-core bank.  An ordinal-surviving assignment is then passed to the
existing exact rational LRA oracle.  This is a scratch decision surface, not a
proof and not a Euclidean realization check.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FULL_GATE = ROOT / "scratch/atail-force/exact5-full-role-retained-gate"
sys.path.insert(0, str(FULL_GATE))

_SPEC = importlib.util.spec_from_file_location(
    "exact5_full_role_retained_gate_decision",
    FULL_GATE / "decision.py",
)
if _SPEC is None or _SPEC.loader is None:
    raise RuntimeError("cannot load full-role retained gate")
_FULL = importlib.util.module_from_spec(_SPEC)
sys.modules[_SPEC.name] = _FULL
_SPEC.loader.exec_module(_FULL)

FIRST_APEX = _FULL.FIRST_APEX
N = _FULL.N
SECOND_APEX = _FULL.SECOND_APEX
VERTICES = _FULL.VERTICES
FocusOuter = _FULL.FocusOuter
edge = _FULL.edge
linear_check = _FULL.linear_check
sink_sccs = _FULL.sink_sccs
verify_focus = _FULL.verify_focus


class FiniteFocusOuter(FocusOuter):
    """The focused contract with no arithmetic variables in the outer."""

    def _add_ordinal_prefilter(self) -> None:
        return

    def __init__(self, orbit: str, radius_arm: str,
                 timeout_ms: int, seed: int) -> None:
        super().__init__(orbit, radius_arm, timeout_ms, seed)
        self._add_complete_class_geometry()
        assertions = self.solver.assertions()
        self.solver = z3.SolverFor("QF_FD")
        self.solver.set(timeout=timeout_ms, random_seed=seed)
        self.solver.add(*assertions)

    def _add_complete_class_geometry(self) -> None:
        """Add two-circle facts for full classes, not chosen four-subsets."""
        solver = self.solver
        selected: list[tuple[int, list[z3.BoolRef]]] = []
        for family in (self.m, *self.cover):
            selected.extend((
                center,
                [family[center, point] for point in VERTICES],
            ) for center in VERTICES)
        selected.extend((
            (FIRST_APEX, list(self.b1)),
            (SECOND_APEX, list(self.shell)),
            (FIRST_APEX, list(self.parent_first)),
            (SECOND_APEX, list(self.parent_second)),
        ))

        complete: list[tuple[int, list[z3.BoolRef]]] = [
            (SECOND_APEX, list(self.shell)),
        ]
        if self.radius_arm == "same":
            complete.append((FIRST_APEX, [
                z3.Or(self.m[FIRST_APEX, point], self.b1[point])
                for point in VERTICES
            ]))
        else:
            complete.extend((
                (FIRST_APEX, [self.m[FIRST_APEX, point]
                              for point in VERTICES]),
                (FIRST_APEX, list(self.b1)),
            ))

        for class_center, members in complete:
            for row_center, row in selected:
                if class_center == row_center:
                    continue
                solver.add(z3.PbLe([
                    (z3.And(members[point], row[point]), 1)
                    for point in VERTICES
                ], 2))
                left, right = sorted((class_center, row_center))
                targets = [point for point in VERTICES
                           if point not in {left, right}]
                for a, b in itertools.combinations(targets, 2):
                    if (left < a < right) != (left < b < right):
                        continue
                    solver.add(z3.Not(z3.And(
                        members[a], members[b], row[a], row[b]
                    )))

        # Count actual center occurrences of a common target pair.  The full
        # O2 class and, in the same arm, pairs split across the two selected O1
        # rows were absent from the predecessor's selected-row-only count.
        by_center: dict[int, list[list[z3.BoolRef]]] = {
            center: [] for center in VERTICES
        }
        for center, row in selected + complete:
            by_center[center].append(row)
        for a, b in itertools.combinations(VERTICES, 2):
            at_centers = [z3.Or(*(
                z3.And(row[a], row[b]) for row in by_center[center]
            )) for center in VERTICES]
            solver.add(z3.PbLe([(item, 1) for item in at_centers], 2))


def verify_complete_class_geometry(decoded: dict[str, object]) -> list[str]:
    """Solver-independent replay of the added full-class two-circle facts."""
    errors: list[str] = []
    rows = {int(center): set(support)
            for center, support in decoded["rows"].items()}
    covers = [
        {int(center): set(support) for center, support in raw.items()}
        for raw in decoded["cover_rows"]
    ]
    selected: list[tuple[int, set[int]]] = []
    for family in (rows, *covers):
        selected.extend(family.items())
    selected.extend((
        (FIRST_APEX, set(decoded["b1"])),
        (SECOND_APEX, set(decoded["shell"])),
        (FIRST_APEX, set(decoded["parent_first"])),
        (SECOND_APEX, set(decoded["parent_second"])),
    ))
    complete = [(SECOND_APEX, set(decoded["shell"]))]
    if decoded["radius_arm"] == "same":
        complete.append((FIRST_APEX,
                         rows[FIRST_APEX] | set(decoded["b1"])))
    else:
        complete.extend((
            (FIRST_APEX, rows[FIRST_APEX]),
            (FIRST_APEX, set(decoded["b1"])),
        ))
    for class_center, members in complete:
        for row_center, row in selected:
            if class_center == row_center:
                continue
            shared = members & row
            if len(shared) > 2:
                errors.append("complete class and selected row overlap above two")
            left, right = sorted((class_center, row_center))
            for a, b in itertools.combinations(sorted(shared), 2):
                if a in {left, right} or b in {left, right}:
                    continue
                if (left < a < right) == (left < b < right):
                    errors.append(
                        f"complete-class nonalternation {left},{right};{a},{b}"
                    )
    by_center: dict[int, list[set[int]]] = {
        center: [] for center in VERTICES
    }
    for center, row in selected + complete:
        by_center[center].append(row)
    for a, b in itertools.combinations(VERTICES, 2):
        centers = sum(any({a, b} <= row for row in by_center[center])
                      for center in VERTICES)
        if centers > 2:
            errors.append(f"complete-class pair {a},{b} has {centers} centers")
    return errors


DistanceTerm = tuple[int, int]
EqualityEdge = tuple[DistanceTerm, DistanceTerm, str]


def selected_equalities(decoded: dict[str, object]) -> list[EqualityEdge]:
    """Expand selected rows into a deterministic spanning equality graph."""
    rows = {int(center): set(support)
            for center, support in decoded["rows"].items()}
    covers = [
        {int(center): set(support) for center, support in raw.items()}
        for raw in decoded["cover_rows"]
    ]
    row_specs: list[tuple[str, int, set[int]]] = []
    for name, family in (("m", rows), ("g0", covers[0]), ("g1", covers[1])):
        row_specs.extend((name, center, support)
                         for center, support in family.items())
    row_specs.extend((
        ("double", FIRST_APEX, set(decoded["b1"])),
        ("shell", SECOND_APEX, set(decoded["shell"])),
        ("parentB1", FIRST_APEX, set(decoded["parent_first"])),
        ("parentB2", SECOND_APEX, set(decoded["parent_second"])),
    ))
    equalities: list[EqualityEdge] = []
    for name, center, support in row_specs:
        ref = min(support)
        for point in sorted(support - {ref}):
            equalities.append((
                edge(center, ref),
                edge(center, point),
                f"row|{name}|{center}|{ref}={point}",
            ))

    if decoded["radius_arm"] == "same":
        retained_ref = min(rows[FIRST_APEX])
        double_ref = min(set(decoded["b1"]))
        equalities.append((
            edge(FIRST_APEX, retained_ref),
            edge(FIRST_APEX, double_ref),
            "firstApexRadius|same",
        ))
    return equalities


def ordinal_cycle_from_equalities(
    equalities: list[EqualityEdge],
) -> list[str] | None:
    """Return one explanation of a Kalmanson quotient-order cycle."""
    equality_graph: dict[DistanceTerm, list[tuple[DistanceTerm, str]]] = {
        pair: [] for pair in itertools.combinations(VERTICES, 2)
    }
    for left, right, reason in equalities:
        equality_graph[left].append((right, reason))
        equality_graph[right].append((left, reason))

    component: dict[DistanceTerm, int] = {}
    component_index = 0
    for start in equality_graph:
        if start in component:
            continue
        todo = [start]
        component[start] = component_index
        while todo:
            current = todo.pop()
            for nxt, _ in equality_graph[current]:
                if nxt not in component:
                    component[nxt] = component_index
                    todo.append(nxt)
        component_index += 1

    path_cache: dict[tuple[DistanceTerm, DistanceTerm], list[str]] = {}

    def equality_path(left: DistanceTerm, right: DistanceTerm) -> list[str]:
        key = (left, right)
        if key in path_cache:
            return path_cache[key]
        if left == right:
            return []
        todo = [left]
        parent: dict[DistanceTerm, tuple[DistanceTerm, str] | None] = {left: None}
        for current in todo:
            if current == right:
                break
            for nxt, reason in equality_graph[current]:
                if nxt not in parent:
                    parent[nxt] = (current, reason)
                    todo.append(nxt)
        if right not in parent:
            raise AssertionError("requested path across different components")
        reasons: list[str] = []
        cursor = right
        while parent[cursor] is not None:
            previous, reason = parent[cursor]  # type: ignore[misc]
            reasons.append(reason)
            cursor = previous
        path_cache[key] = reasons
        return reasons

    strict_graph: dict[int, list[tuple[int, list[str]]]] = {
        index: [] for index in range(component_index)
    }

    def path_in_strict_graph(start: int, target: int) -> list[str] | None:
        todo = [start]
        parent: dict[int, tuple[int, list[str]] | None] = {start: None}
        for current in todo:
            if current == target:
                break
            for nxt, reasons in strict_graph[current]:
                if nxt not in parent:
                    parent[nxt] = (current, reasons)
                    todo.append(nxt)
        if target not in parent:
            return None
        reasons: list[str] = []
        cursor = target
        while parent[cursor] is not None:
            previous, edge_reasons = parent[cursor]  # type: ignore[misc]
            reasons.extend(edge_reasons)
            cursor = previous
        return reasons

    def add_cancellation(
        left: tuple[DistanceTerm, DistanceTerm],
        right: tuple[DistanceTerm, DistanceTerm],
    ) -> list[str] | None:
        for left_index, right_index in itertools.product(range(2), repeat=2):
            equal_left = left[left_index]
            equal_right = right[right_index]
            if component[equal_left] != component[equal_right]:
                continue
            # remaining right < remaining left
            lower = component[right[1 - right_index]]
            upper = component[left[1 - left_index]]
            reasons = equality_path(equal_left, equal_right)
            if lower == upper:
                reasons.extend(equality_path(
                    right[1 - right_index], left[1 - left_index]
                ))
                return sorted(set(reasons))
            reverse_path = path_in_strict_graph(upper, lower)
            if reverse_path is not None:
                return sorted(set(reasons + reverse_path))
            strict_graph[lower].append((upper, reasons))
        return None

    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonal = (edge(a, c), edge(b, d))
        for right in ((edge(a, b), edge(c, d)),
                      (edge(a, d), edge(b, c))):
            core = add_cancellation(diagonal, right)
            if core is not None:
                return core
    return None


def minimal_ordinal_core_from_equalities(
    equalities: list[EqualityEdge],
) -> list[str] | None:
    """Deletion-minimize one quotient cycle in an equality-edge packet."""
    core = ordinal_cycle_from_equalities(equalities)
    if core is None:
        return None
    # A strict comparison edge lives between equality components.  Its short
    # explanation records the cancellation equality but not every equality
    # path identifying adjacent comparison endpoints.  Minimize from the full
    # selected equality graph so the resulting antecedent is independently
    # replayable even after those components split.
    active = list(equalities)
    for reason in list(dict.fromkeys(item[2] for item in active)):
        trial = [item for item in active if item[2] != reason]
        if ordinal_cycle_from_equalities(trial) is not None:
            active = trial
    if ordinal_cycle_from_equalities(active) is None:
        raise AssertionError("ordinal core minimization lost its cycle")
    return sorted(set(item[2] for item in active))


def ordinal_cycle_core(decoded: dict[str, object]) -> list[str] | None:
    """Return a deletion-minimal row explanation for a quotient cycle.

    The equality graph is generated only by selected-row equalities plus the
    fixed same-radius arm equality.  Every strict edge is one cancellation of
    a source-valid Kalmanson inequality.  Thus the returned directed cycle is
    independently replayable.  Deletion minimization happens entirely in the
    graph propagator; it makes no additional solver calls.
    """
    return minimal_ordinal_core_from_equalities(selected_equalities(decoded))


def solve(
    orbit: str,
    radius_arm: str,
    seconds: float,
    seed: int,
    max_exact_candidates: int,
) -> dict[str, object]:
    deadline = time.monotonic() + seconds
    outer = FiniteFocusOuter(orbit, radius_arm, max(1, int(seconds * 1000)), seed)
    connectivity_cuts = {"m": 0, "g0": 0, "g1": 0}
    finite_checked = 0
    ordinal_rejections = 0
    first_ordinal_core: dict[str, object] | None = None
    exact_checked = 0
    exact_rejections = 0
    first_exact_core: dict[str, object] | None = None
    first_focused_core: dict[str, object] | None = None

    while exact_checked < max_exact_candidates:
        remaining = int((deadline - time.monotonic()) * 1000)
        if remaining <= 0:
            return {
                "status": "UNKNOWN",
                "reason": "wall budget",
                "finite_checked": finite_checked,
                "ordinal_rejections": ordinal_rejections,
                "first_ordinal_core": first_ordinal_core,
                "exact_checked": exact_checked,
                "exact_rejections": exact_rejections,
                "first_exact_core": first_exact_core,
                "first_focused_core": first_focused_core,
                "connectivity_cuts": connectivity_cuts,
            }
        outer.solver.set(timeout=remaining, random_seed=seed)
        status = outer.solver.check()
        if status != z3.sat:
            return {
                "status": str(status).upper(),
                "reason": (
                    outer.solver.reason_unknown()
                    if status == z3.unknown else "finite plus ordinal theory exhausted"
                ),
                "finite_checked": finite_checked,
                "ordinal_rejections": ordinal_rejections,
                "first_ordinal_core": first_ordinal_core,
                "exact_checked": exact_checked,
                "exact_rejections": exact_rejections,
                "first_exact_core": first_exact_core,
                "first_focused_core": first_focused_core,
                "connectivity_cuts": connectivity_cuts,
            }

        decoded = outer.decode(outer.solver.model())
        families = [
            {int(center): set(support)
             for center, support in decoded["rows"].items()},
            *[
                {int(center): set(support) for center, support in raw.items()}
                for raw in decoded["cover_rows"]
            ],
        ]
        added = False
        for name, symbolic, family in zip(
            ("m", "g0", "g1"), (outer.m, *outer.cover), families, strict=True
        ):
            for component in sink_sccs(family):
                if len(component) < N:
                    outer.add_connectivity_cut(symbolic, component)
                    connectivity_cuts[name] += 1
                    added = True
        if added:
            continue

        errors = verify_focus(decoded)
        errors.extend(verify_complete_class_geometry(decoded))
        if errors:
            return {"status": "ENCODER_ERROR", "errors": errors,
                    "decoded": decoded}

        finite_checked += 1
        ordinal_core = ordinal_cycle_core(decoded)
        if ordinal_core is not None:
            ordinal_rejections += 1
            if first_ordinal_core is None:
                first_ordinal_core = {"decoded": decoded, "core": ordinal_core}
            if not outer.block_core(ordinal_core, decoded):
                return {
                    "status": "ENCODER_ERROR",
                    "errors": ["ordinal explanation could not be translated"],
                    "decoded": decoded,
                    "core": ordinal_core,
                }
            if finite_checked % 100 == 0:
                print(
                    f"ordinal progress orbit={orbit} arm={radius_arm} "
                    f"finite_checked={finite_checked}",
                    file=sys.stderr,
                    flush=True,
                )
            continue

        exact_checked += 1
        metric = linear_check(decoded, min(30_000, remaining), seed)
        if metric["status"] == "SAT":
            return {
                "status": "SAT",
                "label": "SAT_VERIFIED_EXACT_CARD13_DECOMPOSED_ORDERED_SHADOW",
                "epistemic_scope": (
                    "exact rational triangle/Kalmanson plus selected/full-class "
                    "parent projection; not planar Euclidean or MEC"
                ),
                "finite_checked": finite_checked,
                "ordinal_rejections": ordinal_rejections,
                "first_ordinal_core": first_ordinal_core,
                "exact_checked": exact_checked,
                "exact_rejections": exact_rejections,
                "connectivity_cuts": connectivity_cuts,
                "decoded": decoded,
                **metric,
            }
        if metric["status"] in {"UNKNOWN", "ENCODER_ERROR"}:
            return {
                "exact_checked": exact_checked,
                "exact_rejections": exact_rejections,
                "finite_checked": finite_checked,
                "ordinal_rejections": ordinal_rejections,
                "first_ordinal_core": first_ordinal_core,
                "connectivity_cuts": connectivity_cuts,
                "decoded": decoded,
                **metric,
            }

        exact_rejections += 1
        core = list(metric["core"])
        record = {"decoded": decoded, "core": core}
        if first_exact_core is None:
            first_exact_core = record
        focused = any(
            "parentB" in item
            or "firstApex" in item
            or item.startswith("row|double|")
            for item in core
        )
        if focused and first_focused_core is None:
            first_focused_core = record

        # These are bounded in-run theory lemmas, not a persistent literal
        # bank.  A row-only core is generalized over every increasing order
        # embedding by FocusOuter's checked blocker; focused complete-class
        # cores retain precisely their source antecedents.
        if not outer.block_core(core, decoded):
            outer.block_full(decoded)
        print(
            f"progress orbit={orbit} arm={radius_arm} "
            f"exact_checked={exact_checked} focused={focused}",
            file=sys.stderr,
            flush=True,
        )

    return {
        "status": "UNKNOWN",
        "reason": "exact candidate budget",
        "finite_checked": finite_checked,
        "ordinal_rejections": ordinal_rejections,
        "first_ordinal_core": first_ordinal_core,
        "exact_checked": exact_checked,
        "exact_rejections": exact_rejections,
        "first_exact_core": first_exact_core,
        "first_focused_core": first_focused_core,
        "connectivity_cuts": connectivity_cuts,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=(
        "allOneHitHubLeft", "allOneHitHubMiddle", "allOneHitHubRight"
    ), required=True)
    parser.add_argument("--radius-arm", choices=("same", "distinct"),
                        required=True)
    parser.add_argument("--seconds", type=float, default=300.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--max-exact-candidates", type=int, default=50)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = {
        "schema": "p97-exact5-card13-decomposed-ordinal-rank-v1",
        "profile": "5,6,5",
        "orbit": args.orbit,
        "radius_arm": args.radius_arm,
        **solve(
            args.orbit,
            args.radius_arm,
            args.seconds,
            args.seed,
            args.max_exact_candidates,
        ),
    }
    payload = json.dumps(result, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(payload + "\n")
    print(payload)


if __name__ == "__main__":
    main()
