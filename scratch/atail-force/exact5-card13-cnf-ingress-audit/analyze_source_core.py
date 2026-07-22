#!/usr/bin/env python3
"""Map the saved direct source core back to its source assertion families.

This is an audit helper, not a solver or a certificate checker.  It rebuilds
the current Z3 source surface, checks the saved source-expression hashes by
exact ``sexpr`` equality, and reports which constructor line introduced each
selected assertion.
"""

from __future__ import annotations

from collections import Counter
import inspect
import json
from pathlib import Path
import re
import sys

import z3


HERE = Path(__file__).resolve().parent
TERMINAL = HERE.parent / "exact5-card13-same-radius-terminal"
GATE = HERE.parent / "exact5-global-cover-parent-gate"
sys.path.insert(0, str(TERMINAL))
sys.path.insert(0, str(GATE))

import asymmetric_ordinal_rank as ordinal  # noqa: E402
import encode  # noqa: E402


class TracedSolver:
    """Small proxy recording the source line of every added assertion."""

    def __init__(self) -> None:
        self.solver = z3.SolverFor("QF_FD")
        self.origins: list[tuple[str, int]] = []

    def add(self, *assertions: z3.BoolRef) -> None:
        caller = inspect.currentframe().f_back
        assert caller is not None
        before = len(self.solver.assertions())
        self.solver.add(*assertions)
        after = len(self.solver.assertions())
        self.origins.extend(
            [(caller.f_code.co_name, caller.f_lineno)] * (after - before)
        )

    def assertions(self):
        return self.solver.assertions()


def traced_base(orbit: str):
    outer = encode.Outer.__new__(encode.Outer)
    outer.orbit = orbit
    outer.roles = encode.ORBIT_ROLES[orbit]
    outer.solver = TracedSolver()
    outer.m = outer._new_family("m")
    outer.cover = [outer._new_family(f"g{edge}") for edge in range(2)]
    outer.blocker = [z3.Int(f"blocker_{source}") for source in encode.VERTICES]
    outer.shell = [z3.Bool(f"shell_{point}") for point in encode.VERTICES]
    outer.q = z3.Int("frontier_q")
    outer.w = z3.Int("frontier_w")
    outer.b1 = [z3.Bool(f"b1_{point}") for point in encode.VERTICES]
    outer._add_base()
    return outer


def selected_row_key(assertion: z3.BoolRef) -> str:
    text = assertion.sexpr()
    match = re.search(r"\b(m|g0|g1)_(\d+)_\d+\b", text)
    if match:
        return f"{match.group(1)}@{match.group(2)}"
    if "b1_" in text:
        return "b1@4"
    return "unclassified"


def row_signature(assertion: z3.BoolRef) -> str:
    text = assertion.sexpr()
    keys = {
        f"{family}@{center}"
        for family, center in re.findall(r"\b(m|g0|g1)_(\d+)_\d+\b", text)
    }
    if "b1_" in text:
        keys.add("b1@4")
    blockers = sorted({int(item) for item in re.findall(r"\bblocker_(\d+)\b", text)})
    suffix = f" blockers={blockers}" if blockers else ""
    return ",".join(sorted(keys)) + suffix


def main() -> None:
    payload = json.loads(
        (TERMINAL / "direct.source-core.json").read_text(encoding="utf-8")
    )
    surface, _ranks, counts = ordinal.build(payload["orbit"], 0)
    assertions = list(surface.solver.assertions())
    selected = {entry["index"]: entry for entry in payload["core"]}
    for index, entry in selected.items():
        if assertions[index].sexpr() != entry["assertion"]:
            raise AssertionError(f"saved source assertion drift at {index}")

    base = traced_base(payload["orbit"])
    base_assertions = list(base.solver.assertions())
    if len(base_assertions) != counts["base_assertions"]:
        raise AssertionError("traced base assertion count drift")
    for index, assertion in enumerate(base_assertions):
        if assertion.sexpr() != assertions[index].sexpr():
            raise AssertionError(f"traced base assertion drift at {index}")

    base_count = counts["base_assertions"]
    role_count = counts["source_role_assertions"]
    rank_count = counts["rank_atoms"]
    row_count = counts["guarded_selected_row_rank_equalities"]
    shell_count = counts["guarded_exact_five_shell_rank_equalities"]
    bounds_start = base_count + role_count
    rows_start = bounds_start + rank_count
    shell_start = rows_start + row_count
    kalmanson_start = shell_start + shell_count

    base_origins = Counter()
    base_signatures: dict[str, Counter[str]] = {}
    role_indices = []
    rank_indices = []
    row_keys = Counter()
    shell_indices = []
    kalmanson_quadruples = Counter()
    for index in selected:
        if index < base_count:
            function, line = base.solver.origins[index]
            origin = f"{function}:{line}"
            base_origins[origin] += 1
            base_signatures.setdefault(origin, Counter())[row_signature(assertions[index])] += 1
        elif index < bounds_start:
            role_indices.append(index - base_count)
        elif index < rows_start:
            rank_indices.append(index - bounds_start)
        elif index < shell_start:
            row_keys[selected_row_key(assertions[index])] += 1
        elif index < kalmanson_start:
            shell_indices.append(index - shell_start)
        else:
            atoms = {
                int(number)
                for pair in re.findall(r"ord_rank_(\d+)_(\d+)", assertions[index].sexpr())
                for number in pair
            }
            kalmanson_quadruples[",".join(map(str, sorted(atoms)))] += 1

    source_lines = Path(encode.__file__).read_text(encoding="utf-8").splitlines()
    base_report = []
    for origin, count in sorted(base_origins.items(), key=lambda item: int(item[0].split(":")[1])):
        function, raw_line = origin.split(":")
        line = int(raw_line)
        base_report.append({
            "function": function,
            "line": line,
            "source": source_lines[line - 1].strip(),
            "selected": count,
            "row_signatures": dict(sorted(base_signatures[origin].items())),
        })

    report = {
        "schema": "p97-exact5-card13-direct-source-core-map-v1",
        "source_assertions": len(assertions),
        "selected_assertions": len(selected),
        "base_by_constructor_line": base_report,
        "selected_role_indices": sorted(role_indices),
        "selected_rank_bound_indices": sorted(rank_indices),
        "omitted_rank_bound_indices": sorted(set(range(rank_count)) - set(rank_indices)),
        "selected_row_equalities_by_family_center": dict(sorted(row_keys.items())),
        "selected_shell_equality_indices": sorted(shell_indices),
        "kalmanson_selected_by_quadruple": dict(sorted(kalmanson_quadruples.items())),
    }
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
