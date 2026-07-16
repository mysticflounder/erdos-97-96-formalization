#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Bounded structural replay for the robust all-center continuation gap.

This is deliberately an incidence/cyclic-order search, not a Euclidean
countermodel search.  It fixes the 14 named roles of the exact cap-local
robust model, chooses one selected four-row at every center, and chooses one
critical-shell blocker for every source.  The permanent finite-shadow verifier is
the CEGAR oracle for local cap-row admissibility and cyclic two-circle
separation.

The output is theorem-discovery evidence only.  A global K4 row is merely a
selected equal-distance four-class.  It is marked exact only when its center
lies in the decoded blocker-map image, where the critical shell locks the
selected support.  The full first-apex five-class is separately ambient-exact.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import re
import sys
import time
from pathlib import Path
from typing import Any, Iterable, Mapping

import z3

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.global_confinement import shadow
from census.multi_center import multi_center_census as mc
from census.atail_force import producer_bank


CHECKPOINT = HERE / "checkpoint.json"

# The census profile names its A--C cap ``S``.  Relative to the robust packet,
# that is the first opposite cap; census O1 is the second opposite cap, and
# census O2 is the chosen surplus cap.
PROFILE = (8, 4, 5)
HULL_NAMES = (
    "O",
    "t1",
    "I",
    "F",
    "A",
    "X",
    "Y",
    "Z",
    "D",
    "J",
    "E",
    "C",
    "G",
    "K",
)

SURPLUS_CAP = frozenset({"O", "t1", "I", "F", "A"})
OPP_CAP_1 = frozenset({"A", "X", "Y", "Z", "D", "J", "E", "C"})
OPP_CAP_2 = frozenset({"C", "G", "K", "O"})

FIRST_APEX = "O"
SECOND_APEX = "A"
Q = "E"
W = "D"
FIRST_APEX_CLASS = frozenset({"A", "C", "D", "E", "J"})
MARGINAL = FIRST_APEX_CLASS - SURPLUS_CAP

# A known completion is moved to candidate index zero.  Only the four local
# rows O/A/D/t1 are fixed by the robust packet.  The remaining ten rows remain
# solver choices; the all-zero assignment is a deterministic smoke/replay
# witness, while the optional non-seed search asks for a different completion.
KNOWN_SUPPORTS: dict[str, frozenset[str]] = {
    "O": frozenset({"A", "C", "D", "E"}),
    "A": frozenset({"O", "C", "G", "K"}),
    "C": frozenset({"O", "X", "t1", "I"}),
    "X": frozenset({"A", "Z", "J", "K"}),
    "Y": frozenset({"C", "X", "Z", "F"}),
    "Z": frozenset({"C", "Y", "J", "I"}),
    "D": frozenset({"A", "E", "I", "F"}),
    "J": frozenset({"A", "Y", "G", "t1"}),
    "E": frozenset({"O", "Y", "J", "F"}),
    "G": frozenset({"C", "K", "t1", "F"}),
    "K": frozenset({"O", "Z", "E", "G"}),
    "t1": frozenset({"X", "Y", "Z", "D"}),
    "I": frozenset({"O", "X", "J", "E"}),
    "F": frozenset({"A", "X", "G", "I"}),
}

KNOWN_BLOCKERS = {
    "O": "A",
    "A": "D",
    "C": "A",
    "X": "C",
    "Y": "E",
    "Z": "X",
    "D": "t1",
    "J": "E",
    "E": "D",
    "G": "A",
    "K": "A",
    "t1": "C",
    "I": "D",
    "F": "D",
}

FIXED_LOCAL_ROWS = frozenset({"O", "A", "D", "t1"})
FIXED_BLOCKERS = {Q: "D", W: "t1"}
Q_SHELL_OFF_SOURCE_CENTERS = frozenset({"A", "F", "I"})
W_SHELL_OFF_SOURCE_CENTERS = frozenset({"X", "Y", "Z"})
ROBUST_SUPPORT_CENTERS = (
    Q_SHELL_OFF_SOURCE_CENTERS | W_SHELL_OFF_SOURCE_CENTERS
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


class Surface:
    """Finite Z3 map plus independent row/cap verifier data."""

    def __init__(self) -> None:
        frame, raw_candidates = mc.cached_candidate_lists(
            PROFILE, set(mc.PROVEN_ROWS)
        )
        if raw_candidates is None:
            raise RuntimeError("profile unexpectedly has no row candidates")
        self.frame = frame
        order = shadow.hull_order(frame)
        if len(order) != len(HULL_NAMES):
            raise RuntimeError("frame cardinality drift")
        self.by_name = dict(zip(HULL_NAMES, order))
        self.by_label = {label: name for name, label in self.by_name.items()}

        expected_caps = {
            "surplus": {self.by_label[x] for x in frame.O2},
            "opp1": {self.by_label[x] for x in frame.S},
            "opp2": {self.by_label[x] for x in frame.O1},
        }
        actual_caps = {
            "surplus": set(SURPLUS_CAP),
            "opp1": set(OPP_CAP_1),
            "opp2": set(OPP_CAP_2),
        }
        if expected_caps != actual_caps:
            raise RuntimeError(
                f"role/cap mapping drift: expected {actual_caps}, got {expected_caps}"
            )

        self.candidates: dict[int, tuple[frozenset[int], ...]] = {}
        for center in range(frame.n):
            center_name = self.by_label[center]
            known = frozenset(self.by_name[x] for x in KNOWN_SUPPORTS[center_name])
            available = set(raw_candidates[center])
            if known not in available:
                raise RuntimeError(f"known row at {center_name} left candidate domain")
            ordered = (known, *sorted(available - {known}, key=lambda s: tuple(sorted(s))))
            self.candidates[center] = tuple(ordered)

        self.choice = {
            center: z3.Int(f"row_choice_{center}") for center in range(frame.n)
        }
        self.blocker = {
            source: z3.Int(f"blocker_{source}") for source in range(frame.n)
        }
        self._member_cache: dict[tuple[int, int], z3.BoolRef] = {}

    def member(self, center: int, point: int) -> z3.BoolRef:
        key = (center, point)
        if key not in self._member_cache:
            indices = [
                index
                for index, support in enumerate(self.candidates[center])
                if point in support
            ]
            self._member_cache[key] = z3.Or(
                *(self.choice[center] == index for index in indices)
            )
        return self._member_cache[key]

    def ambient_first_apex_row(self) -> shadow.ClassRow:
        """The full five-point first-apex radius class, not its selected K4."""

        return shadow.ClassRow(
            "ambient:firstApexClass",
            self.by_name[FIRST_APEX],
            frozenset(self.by_name[name] for name in FIRST_APEX_CLASS),
            exact=True,
        )

    def base_solver(self, *, exclude_seed: bool = False) -> z3.Solver:
        solver = z3.Solver()
        solver.set(timeout=10_000, random_seed=0)

        for center, variable in self.choice.items():
            solver.add(0 <= variable, variable < len(self.candidates[center]))
            # Candidate domains already enforce card four and own-center omission.
            solver.add(z3.Not(self.member(center, center)))

        for name in sorted(FIXED_LOCAL_ROWS):
            solver.add(self.choice[self.by_name[name]] == 0)

        # The full ambient first-apex class is a genuine radius class and must
        # participate in every two-circle compatibility check.  The earlier
        # shadow checked only the selected four-subset at O and therefore
        # missed, for example, the common pair J,E against the I-centered row.
        ambient = self.ambient_first_apex_row()
        o = self.by_name[FIRST_APEX]
        for center in range(self.frame.n):
            if center == o:
                continue
            for index, support in enumerate(self.candidates[center]):
                candidate = shadow.ClassRow(
                    f"global:{center}", center, support, exact=False
                )
                if not shadow.rows_compatible(self.frame, ambient, candidate):
                    solver.add(self.choice[center] != index)

        # Euclidean necessary consequences represented in the finite shadow.
        for left in range(self.frame.n):
            for right in range(left + 1, self.frame.n):
                common = z3.Sum(
                    *(
                        z3.If(
                            z3.And(self.member(left, point), self.member(right, point)),
                            1,
                            0,
                        )
                        for point in range(self.frame.n)
                    )
                )
                solver.add(common <= 2)

        # A fixed pair of carrier points has at most two carrier bisector centers.
        for first in range(self.frame.n):
            for second in range(first + 1, self.frame.n):
                centers = z3.Sum(
                    *(
                        z3.If(
                            z3.And(
                                self.member(center, first),
                                self.member(center, second),
                            ),
                            1,
                            0,
                        )
                        for center in range(self.frame.n)
                    )
                )
                solver.add(centers <= 2)

        # Pairs in the ambient O-centered class already use O as one bisector
        # center, even when the selected global:O four-subset omits an endpoint.
        # Hence they may occur together at at most one additional center.
        for first, second in itertools.combinations(sorted(ambient.support), 2):
            other_centers = z3.Sum(
                *(
                    z3.If(
                        z3.And(
                            self.member(center, first),
                            self.member(center, second),
                        ),
                        1,
                        0,
                    )
                    for center in range(self.frame.n)
                    if center != o
                )
            )
            solver.add(other_centers <= 1)

        # Total critical-map shadow: every source chooses a non-self, non-O
        # center whose represented exact four-row contains that source.
        for source, variable in self.blocker.items():
            allowed = [center for center in range(self.frame.n) if center != source and center != o]
            solver.add(z3.Or(*(variable == center for center in allowed)))
            solver.add(
                z3.Or(
                    *(
                        z3.And(variable == center, self.member(center, source))
                        for center in allowed
                    )
                )
            )
        for source_name, blocker_name in FIXED_BLOCKERS.items():
            solver.add(
                self.blocker[self.by_name[source_name]] == self.by_name[blocker_name]
            )

        q = self.by_name[Q]
        w = self.by_name[W]
        apex2 = self.by_name[SECOND_APEX]
        q_blocker = self.by_name["D"]
        w_blocker = self.by_name["t1"]
        solver.add(self.member(q_blocker, q), z3.Not(self.member(q_blocker, w)))
        solver.add(self.member(w_blocker, w), z3.Not(self.member(w_blocker, q)))
        solver.add(z3.Not(self.member(apex2, q)), z3.Not(self.member(apex2, w)))

        # Structural proxy for the new parent boundary: every represented row
        # at an off-source actual-blocker support center avoids the repeated
        # frontier pair.  This is weaker/different from asserting that the
        # center itself does not bisect q,w; the exact coordinate replay below
        # checks the latter independently for the pinned local geometry.
        for center_name in sorted(ROBUST_SUPPORT_CENTERS):
            center = self.by_name[center_name]
            solver.add(
                z3.Not(z3.And(self.member(center, q), self.member(center, w)))
            )

        marginal = [self.by_name[name] for name in sorted(MARGINAL)]
        solver.add(
            z3.Sum(*(z3.If(self.member(apex2, point), 1, 0) for point in marginal))
            == 1
        )
        q_row_union_marginal = {
            self.by_name[name] for name in KNOWN_SUPPORTS["D"] | MARGINAL
        }
        solver.add(
            z3.Or(
                *(
                    self.member(apex2, point)
                    for point in range(self.frame.n)
                    if point not in q_row_union_marginal
                )
            )
        )

        if exclude_seed:
            solver.add(z3.Or(*(variable != 0 for variable in self.choice.values())))
        return solver

    def rows_from_model(self, model: z3.ModelRef) -> tuple[shadow.ClassRow, ...]:
        rows = []
        for center in range(self.frame.n):
            index = model.eval(self.choice[center]).as_long()
            rows.append(
                shadow.ClassRow(
                    f"global:{center}",
                    center,
                    self.candidates[center][index],
                    exact=False,
                )
            )
        return tuple(rows)

    @staticmethod
    def rows_with_blocker_exactness(
        rows: Iterable[shadow.ClassRow], blockers: Mapping[int, int]
    ) -> tuple[shadow.ClassRow, ...]:
        """Mark only selected rows locked to an actual critical-shell center."""

        exact_centers = set(blockers.values())
        return tuple(
            shadow.ClassRow(
                row.name,
                row.center,
                row.support,
                exact=row.center in exact_centers,
            )
            for row in rows
        )

    def blockers_from_model(self, model: z3.ModelRef) -> dict[int, int]:
        return {
            source: model.eval(variable).as_long()
            for source, variable in self.blocker.items()
        }

    def row_choice_indices(self, model: z3.ModelRef) -> dict[int, int]:
        return {
            center: model.eval(variable).as_long()
            for center, variable in self.choice.items()
        }

    def verify_model(
        self, rows: Iterable[shadow.ClassRow], blockers: dict[int, int]
    ) -> tuple[bool, str | None]:
        rows = tuple(rows)
        ok, reason = shadow.verify_assignment(
            self.frame, set(mc.PROVEN_ROWS), rows
        )
        if not ok:
            return False, reason
        by_center = {row.center: row for row in rows}
        if set(by_center) != set(range(self.frame.n)):
            return False, "not exactly one represented row per center"
        o = self.by_name[FIRST_APEX]
        ambient = self.ambient_first_apex_row()
        for row in rows:
            if row.center == o:
                continue
            if not shadow.rows_compatible(self.frame, ambient, row):
                return (
                    False,
                    f"ambient:firstApexClass incompatible with global:{row.center}",
                )
        rows_with_ambient = (ambient, *(row for row in rows if row.center != o))
        for first, second in itertools.combinations(range(self.frame.n), 2):
            centers = {
                row.center
                for row in rows_with_ambient
                if first in row.support and second in row.support
            }
            if len(centers) > 2:
                return (
                    False,
                    f"ambient point pair {(first, second)} occurs at {len(centers)} centers",
                )
        for source, center in blockers.items():
            if center in {source, o}:
                return False, f"invalid blocker {source}->{center}"
            row = by_center[center]
            if source not in row.support:
                return False, f"blocker row does not contain source {source}->{center}"
        if blockers[self.by_name[Q]] != self.by_name["D"]:
            return False, "q blocker drift"
        if blockers[self.by_name[W]] != self.by_name["t1"]:
            return False, "w blocker drift"
        return True, None


INCOMPATIBLE_RE = re.compile(r"incompatible rows global:(\d+), global:(\d+)")
INVALID_RE = re.compile(r"global:(\d+): invalid local class")
AMBIENT_INCOMPATIBLE_RE = re.compile(
    r"ambient:firstApexClass incompatible with global:(\d+)"
)


def solve_with_cegar(
    surface: Surface,
    *,
    exclude_seed: bool,
    force_seed: bool = False,
    max_iterations: int,
    wall_seconds: float,
) -> dict[str, Any]:
    solver = surface.base_solver(exclude_seed=exclude_seed)
    if force_seed:
        for variable in surface.choice.values():
            solver.add(variable == 0)
        for source_name, center_name in KNOWN_BLOCKERS.items():
            solver.add(
                surface.blocker[surface.by_name[source_name]]
                == surface.by_name[center_name]
            )
    refinements: list[dict[str, object]] = []
    started = time.monotonic()

    for iteration in range(1, max_iterations + 1):
        if time.monotonic() - started > wall_seconds:
            return {
                "status": "BUDGET",
                "iterations": iteration - 1,
                "refinements": refinements,
            }
        verdict = solver.check()
        if verdict == z3.unknown:
            return {
                "status": "UNKNOWN_FAIL_CLOSED",
                "iterations": iteration,
                "reason": solver.reason_unknown(),
                "refinements": refinements,
            }
        if verdict == z3.unsat:
            return {
                "status": "UNSAT_STRUCTURAL_MAP",
                "iterations": iteration,
                "refinements": refinements,
            }

        model = solver.model()
        blockers = surface.blockers_from_model(model)
        rows = surface.rows_with_blocker_exactness(
            surface.rows_from_model(model), blockers
        )
        ok, reason = surface.verify_model(rows, blockers)
        if ok:
            choices = surface.row_choice_indices(model)
            serialized_rows = [
                {
                    "center": surface.by_label[row.center],
                    "support": sorted(surface.by_label[x] for x in row.support),
                    "exact_in_shadow": row.exact,
                    "candidate_index": choices[row.center],
                }
                for row in sorted(rows, key=lambda row: surface.by_label[row.center])
            ]
            serialized_blockers = {
                surface.by_label[source]: surface.by_label[center]
                for source, center in sorted(
                    blockers.items(), key=lambda item: surface.by_label[item[0]]
                )
            }
            return {
                "status": "SAT_FINITE_STRUCTURAL_SHADOW",
                "iterations": iteration,
                "refinements": refinements,
                "rows": serialized_rows,
                "blockers": serialized_blockers,
                "row_assignment_sha256": canonical_sha256(serialized_rows),
                "blocker_assignment_sha256": canonical_sha256(serialized_blockers),
                "differs_from_seed": any(index != 0 for index in choices.values()),
            }

        assert reason is not None
        choices = surface.row_choice_indices(model)
        incompatible = INCOMPATIBLE_RE.fullmatch(reason)
        invalid = INVALID_RE.fullmatch(reason)
        ambient_incompatible = AMBIENT_INCOMPATIBLE_RE.fullmatch(reason)
        if incompatible is not None:
            left, right = map(int, incompatible.groups())
            clause = z3.Or(
                surface.choice[left] != choices[left],
                surface.choice[right] != choices[right],
            )
            kind = "block_incompatible_row_pair"
            scope = [surface.by_label[left], surface.by_label[right]]
        elif invalid is not None:
            center = int(invalid.group(1))
            clause = surface.choice[center] != choices[center]
            kind = "block_invalid_local_row"
            scope = [surface.by_label[center]]
        elif ambient_incompatible is not None:
            center = int(ambient_incompatible.group(1))
            clause = surface.choice[center] != choices[center]
            kind = "block_ambient_first_apex_incompatible_row"
            scope = [surface.by_label[center]]
        else:
            # Fail closed but preserve progress even if verifier wording changes.
            clause = z3.Or(
                *(surface.choice[center] != index for center, index in choices.items())
            )
            kind = "block_full_rejected_row_assignment"
            scope = []
        solver.add(clause)
        refinements.append({"kind": kind, "scope": scope, "reason": reason})

    return {
        "status": "MAP_ITERATION_BUDGET",
        "iterations": max_iterations,
        "refinements": refinements,
    }


def solve_corrected_surface_with_dfs(
    surface: Surface, *, max_nodes: int, require_bank_clean: bool = False
) -> dict[str, Any]:
    """Exact finite-shadow DFS with the ambient first-apex row in every prefix."""

    o = surface.by_name[FIRST_APEX]
    q = surface.by_name[Q]
    w = surface.by_name[W]
    ambient = surface.ambient_first_apex_row()
    bank_cut_records: dict[str, dict[str, object]] = {}
    bank_cut_counts: dict[str, int] = {}
    fixed_rows: list[shadow.ClassRow] = []
    variable_rows: list[shadow.VariableRow] = []
    for center in range(surface.frame.n):
        name = surface.by_label[center]
        if name in FIXED_LOCAL_ROWS:
            fixed_rows.append(
                shadow.ClassRow(
                    f"global:{center}",
                    center,
                    surface.candidates[center][0],
                    exact=False,
                )
            )
            continue
        candidates = tuple(
            support
            for support in surface.candidates[center]
            if (
                name not in ROBUST_SUPPORT_CENTERS
                or not ({q, w} <= set(support))
            )
            and shadow.rows_compatible(
                surface.frame,
                ambient,
                shadow.ClassRow(f"candidate:{center}", center, support, exact=False),
            )
        )
        variable_rows.append(
            shadow.VariableRow(
                f"global:{center}", center, candidates, exact=False
            )
        )

    def prefix_compatible(rows: Iterable[shadow.ClassRow]) -> bool:
        rows = tuple(rows)
        if any(
            not shadow.rows_compatible(surface.frame, ambient, row)
            for row in rows
            if row.center != o
        ):
            return False
        actual_rows = (ambient, *(row for row in rows if row.center != o))
        for first, second in itertools.combinations(range(surface.frame.n), 2):
            centers = {
                row.center
                for row in actual_rows
                if first in row.support and second in row.support
            }
            if len(centers) > 2:
                return False
        return True

    def complete_compatible(rows: Iterable[shadow.ClassRow]) -> bool:
        rows = tuple(rows)
        covered = set().union(
            *(
                set(row.support)
                for row in rows
                if row.center != o
            )
        )
        if not set(range(surface.frame.n)) <= covered:
            return False
        if not require_bank_clean:
            return True
        metric_rows = (
            producer_bank.MetricRow(
                ambient.center, tuple(sorted(ambient.support)), exact=True
            ),
            *(
                producer_bank.MetricRow(
                    row.center, tuple(sorted(row.support)), exact=False
                )
                for row in rows
                if row.center != o
            ),
        )
        matches = producer_bank.scan_all_formalized_cores(
            metric_rows,
            surface.frame.n,
            shadow.hull_order(surface.frame),
        )
        if not matches:
            return True
        for match in matches:
            key = json.dumps(
                {
                    "stage": match["stage"],
                    "core": match["core"],
                    "orientation": match["orientation"],
                    "lean_consumer": match["lean_consumer"],
                },
                sort_keys=True,
                separators=(",", ":"),
            )
            bank_cut_records.setdefault(key, dict(match))
            bank_cut_counts[key] = bank_cut_counts.get(key, 0) + 1
        return False

    result = shadow.solve_rows(
        surface.frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed_rows,
        variable_rows=variable_rows,
        max_nodes=max_nodes,
        want_assignment=True,
        prefix_compatible=prefix_compatible,
        complete_compatible=complete_compatible,
    )
    status = result["status"]
    if status != "SAT":
        cut_ledger = [
            {
                **bank_cut_records[key],
                "rejected_complete_assignments": bank_cut_counts[key],
            }
            for key in sorted(bank_cut_records)
        ]
        return {
            "status": (
                "UNSAT_EXHAUSTIVE_CORRECTED_FINITE_SHADOW"
                if status == "UNSAT"
                else "NODE_BUDGET_FAIL_CLOSED"
            ),
            "nodes": result["nodes"],
            "max_nodes": max_nodes,
            "producer_bank_clean_required": require_bank_clean,
            "producer_bank_cut_ledger": cut_ledger,
        }

    rows = tuple(
        shadow.ClassRow(
            record,
            int(payload["center"]),
            frozenset(int(point) for point in payload["support"]),
            bool(payload["exact"]),
        )
        for record, payload in sorted(result["assignment"].items())
    )
    by_center = {row.center: row for row in rows}
    blockers: dict[int, int] = {}
    for source in range(surface.frame.n):
        if source == q:
            blockers[source] = surface.by_name["D"]
            continue
        if source == w:
            blockers[source] = surface.by_name["t1"]
            continue
        allowed = [
            center
            for center, row in by_center.items()
            if center not in {source, o} and source in row.support
        ]
        if not allowed:
            raise RuntimeError(f"DFS coverage did not yield a blocker for {source}")
        blockers[source] = min(allowed)
    rows = surface.rows_with_blocker_exactness(rows, blockers)
    by_center = {row.center: row for row in rows}
    ok, reason = surface.verify_model(rows, blockers)
    if not ok:
        raise RuntimeError(f"corrected DFS witness failed verifier: {reason}")

    choices = {
        center: surface.candidates[center].index(by_center[center].support)
        for center in range(surface.frame.n)
    }
    z3_solver = surface.base_solver()
    for center, index in choices.items():
        z3_solver.add(surface.choice[center] == index)
    z3_status = z3_solver.check()
    if z3_status != z3.sat:
        raise RuntimeError(f"corrected DFS witness failed Z3 replay: {z3_status}")
    z3_model = z3_solver.model()
    z3_blockers = surface.blockers_from_model(z3_model)
    z3_rows = surface.rows_with_blocker_exactness(
        surface.rows_from_model(z3_model), z3_blockers
    )
    ok, reason = surface.verify_model(z3_rows, z3_blockers)
    if not ok:
        raise RuntimeError(f"Z3 replay witness failed verifier: {reason}")

    metric_rows = (
        producer_bank.MetricRow(
            ambient.center, tuple(sorted(ambient.support)), exact=True
        ),
        *(
            producer_bank.MetricRow(
                row.center,
                tuple(sorted(row.support)),
                exact=row.center in set(z3_blockers.values()),
            )
            for row in rows
            if row.center != o
        ),
    )
    final_bank_scan = producer_bank.scan_all_formalized_cores(
        metric_rows,
        surface.frame.n,
        shadow.hull_order(surface.frame),
    )
    if require_bank_clean and final_bank_scan:
        raise RuntimeError("bank-clean DFS returned a matched formalized core")

    serialized_rows = [
        {
            "center": surface.by_label[row.center],
            "support": sorted(surface.by_label[point] for point in row.support),
            "exact_in_shadow": row.exact,
            "candidate_index": choices[row.center],
        }
        for row in sorted(rows, key=lambda row: surface.by_label[row.center])
    ]
    serialized_blockers = {
        surface.by_label[source]: surface.by_label[center]
        for source, center in sorted(z3_blockers.items())
    }
    return {
        "status": "SAT_CORRECTED_FINITE_STRUCTURAL_SHADOW",
        "nodes": result["nodes"],
        "max_nodes": max_nodes,
        "rows": serialized_rows,
        "blockers": serialized_blockers,
        "row_assignment_sha256": canonical_sha256(serialized_rows),
        "blocker_assignment_sha256": canonical_sha256(serialized_blockers),
        "independent_shadow_verifier": "PASS",
        "z3_replay": "PASS",
        "ambient_first_apex_compatibility": "PASS",
        "producer_bank_clean_required": require_bank_clean,
        "producer_bank_final_scan": list(final_bank_scan),
        "producer_bank_cut_ledger": [
            {
                **bank_cut_records[key],
                "rejected_complete_assignments": bank_cut_counts[key],
            }
            for key in sorted(bank_cut_records)
        ],
    }


def smoke_gates(surface: Surface) -> dict[str, object]:
    seed_solver = surface.base_solver()
    for variable in surface.choice.values():
        seed_solver.add(variable == 0)
    for source_name, center_name in KNOWN_BLOCKERS.items():
        seed_solver.add(
            surface.blocker[surface.by_name[source_name]] == surface.by_name[center_name]
        )
    seed_status = seed_solver.check()
    if seed_status != z3.unsat:
        raise RuntimeError(f"stale seed rejection smoke failed: {seed_status}")

    # Independently reconstruct the formerly accepted row/blocker assignment
    # and require the permanent verifier to identify the omitted ambient-row
    # compatibility.  This guards the encoding-to-claim correction itself.
    unchecked_solver = z3.Solver()
    for variable in surface.choice.values():
        unchecked_solver.add(variable == 0)
    if unchecked_solver.check() != z3.sat:
        raise RuntimeError("cannot reconstruct stale seed for verifier smoke")
    unchecked_model = unchecked_solver.model()
    seed_blockers = {
        surface.by_name[source]: surface.by_name[center]
        for source, center in KNOWN_BLOCKERS.items()
    }
    seed_rows = surface.rows_with_blocker_exactness(
        surface.rows_from_model(unchecked_model), seed_blockers
    )
    ok, reason = surface.verify_model(seed_rows, seed_blockers)
    if ok or reason is None or not reason.startswith(
        "ambient:firstApexClass incompatible with global:"
    ):
        raise RuntimeError(f"permanent verifier missed stale-seed bug: {reason}")
    by_center = {row.center: row for row in seed_rows}
    ambient = surface.ambient_first_apex_row()
    row_i = by_center[surface.by_name["I"]]
    if shadow.rows_compatible(surface.frame, ambient, row_i):
        raise RuntimeError("banked O/I common-pair incompatibility smoke failed")
    common_oi = ambient.support & row_i.support
    expected_common_oi = frozenset(
        surface.by_name[name] for name in {"J", "E"}
    )
    if common_oi != expected_common_oi:
        raise RuntimeError(f"O/I bank role mapping drift: {common_oi}")

    direct_target_solver = surface.base_solver()
    apex2 = surface.by_name[SECOND_APEX]
    marginal = [surface.by_name[name] for name in sorted(MARGINAL)]
    direct_target_solver.add(
        z3.Sum(
            *(z3.If(surface.member(apex2, point), 1, 0) for point in marginal)
        )
        >= 2
    )
    direct_status = direct_target_solver.check()
    if direct_status != z3.unsat:
        raise RuntimeError(
            f"fixed local direct-target UNSAT smoke failed: {direct_status}"
        )

    by_center = {row.center: row for row in seed_rows}
    row_a = by_center[surface.by_name["A"]]
    bad_same_center = shadow.ClassRow(
        "smoke:bad-same-center",
        row_a.center,
        frozenset(
            surface.by_name[name] for name in {"O", "D", "E", "F"}
        ),
        exact=True,
    )
    if shadow.rows_compatible(surface.frame, row_a, bad_same_center):
        raise RuntimeError("known exact same-center incompatibility smoke failed")

    return {
        "stale_seed_unsat_in_corrected_map": "PASS",
        "stale_seed_rejected_by_independent_ambient_row_verifier": "PASS",
        "banked_O_I_common_pair_J_E_incompatibility": "PASS",
        "fixed_second_apex_two_hit_target_unsat": "PASS",
        "exact_same_center_overlap_incompatible": "PASS",
    }


def exact_local_bisector_replay() -> dict[str, object]:
    """Replay the six failed bisector equalities in the pinned local model."""

    path = ROOT / "scratch/atail-force/cap-local-transport-model/check.py"
    spec = importlib.util.spec_from_file_location("atail_cap_local_14", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    local = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(local)
    report = local.check_model()
    points = local.build_points()
    failed = []
    positive_q_minus_w_squared_distance = []
    for center in sorted(ROBUST_SUPPORT_CENTERS):
        difference = local.sp.factor(
            local.B.squared_distance(points[center], points[Q])
            - local.B.squared_distance(points[center], points[W])
        )
        if local.sp.simplify(difference) == 0:
            raise RuntimeError(f"unexpected frontier-pair bisector at {center}")
        local.B.exact_positive(difference)
        failed.append(center)
        positive_q_minus_w_squared_distance.append(center)
    return {
        "status": "PASS_EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "coordinate_sha256": report["coordinate_sha256"],
        "q_shell_off_source_centers": sorted(Q_SHELL_OFF_SOURCE_CENTERS),
        "w_shell_off_source_centers": sorted(W_SHELL_OFF_SOURCE_CENTERS),
        "centers_failing_dist_z_q_eq_dist_z_w": failed,
        "all_six_bisector_equalities_false": len(failed) == 6,
        "centers_with_sqdist_z_q_minus_sqdist_z_w_positive": (
            positive_q_minus_w_squared_distance
        ),
        "all_six_strictly_closer_to_w_than_q": (
            len(positive_q_minus_w_squared_distance) == 6
        ),
    }


def compact_partial_search(result: dict[str, Any]) -> dict[str, Any]:
    """Keep fail-closed CEGAR metadata without duplicating 128 cut records."""

    if result.get("status") == "SAT_FINITE_STRUCTURAL_SHADOW":
        return result
    compact = dict(result)
    refinements = list(compact.pop("refinements", []))
    kind_counts: dict[str, int] = {}
    for refinement in refinements:
        kind = str(refinement["kind"])
        kind_counts[kind] = kind_counts.get(kind, 0) + 1
    compact.update(
        {
            "refinement_count": len(refinements),
            "refinement_kind_counts": kind_counts,
            "refinement_sha256": canonical_sha256(refinements),
            "first_refinements": refinements[:5],
        }
    )
    return compact


def sharpened_live_target_from_named_rows(
    rows: Mapping[str, Iterable[str]],
) -> dict[str, object]:
    """Audit the existential one-row outside-pair producer on named supports."""

    normalized = {center: set(support) for center, support in rows.items()}
    strict_surplus = SURPLUS_CAP - {FIRST_APEX, SECOND_APEX}
    eligible = normalized["D"] & strict_surplus
    witnesses = []
    for center in sorted(eligible):
        marginal_hits = normalized[center] & MARGINAL
        fresh = marginal_hits - {Q}
        if Q in normalized[center] and len(marginal_hits) >= 2:
            witnesses.append(
                {
                    "center": center,
                    "fresh_marginal_points": sorted(fresh),
                    "row_support": sorted(normalized[center]),
                }
            )
    return {
        "q": Q,
        "w": W,
        "fresh_role_J_distinct_from_w": "J" != W,
        "marginal": sorted(MARGINAL),
        "strict_surplus": sorted(strict_surplus),
        "eligible_q_blocker_support_centers": sorted(eligible),
        "holds": bool(witnesses),
        "witnesses": witnesses,
        "interpretation_when_false": "the desired existential producer is avoided",
        "exactness_used": False,
    }


def build_report() -> dict[str, object]:
    surface = Surface()
    smokes = smoke_gates(surface)
    local_bisector = exact_local_bisector_replay()
    stale_seed = solve_with_cegar(
        surface,
        exclude_seed=False,
        force_seed=True,
        max_iterations=1,
        wall_seconds=20.0,
    )
    if stale_seed["status"] != "UNSAT_STRUCTURAL_MAP":
        raise RuntimeError(
            f"stale seed was not rejected by corrected map: {stale_seed['status']}"
        )

    corrected = solve_corrected_surface_with_dfs(
        surface,
        max_nodes=1_000_000,
        require_bank_clean=False,
    )
    if corrected["status"] != "SAT_CORRECTED_FINITE_STRUCTURAL_SHADOW":
        raise RuntimeError(f"corrected DFS did not return SAT: {corrected['status']}")

    named_supports = {
        record["center"]: record["support"] for record in corrected["rows"]
    }
    blocker_image = set(corrected["blockers"].values())
    metric_selected = []
    metric_actual_exactness = []
    for record in corrected["rows"]:
        center = surface.by_name[record["center"]]
        if record["center"] == FIRST_APEX:
            support = tuple(
                sorted(surface.by_name[name] for name in FIRST_APEX_CLASS)
            )
            metric_selected.append(
                producer_bank.MetricRow(center, support, exact=True)
            )
            metric_actual_exactness.append(
                producer_bank.MetricRow(center, support, exact=True)
            )
            continue
        support = tuple(
            sorted(surface.by_name[name] for name in record["support"])
        )
        metric_selected.append(
            producer_bank.MetricRow(center, support, exact=False)
        )
        metric_actual_exactness.append(
            producer_bank.MetricRow(
                center,
                support,
                exact=record["center"] in blocker_image,
            )
        )
    order = shadow.hull_order(surface.frame)
    selected_matches = producer_bank.scan_all_formalized_cores(
        tuple(metric_selected), surface.frame.n, order
    )
    actual_matches = producer_bank.scan_all_formalized_cores(
        tuple(metric_actual_exactness), surface.frame.n, order
    )
    if not selected_matches:
        raise RuntimeError("corrected witness unexpectedly became producer-bank clean")
    selected_keys = {
        json.dumps(match, sort_keys=True, separators=(",", ":"))
        for match in selected_matches
    }
    exactness_only = [
        match
        for match in actual_matches
        if json.dumps(match, sort_keys=True, separators=(",", ":"))
        not in selected_keys
    ]
    corrected_target = sharpened_live_target_from_named_rows(named_supports)
    stale_target = sharpened_live_target_from_named_rows(KNOWN_SUPPORTS)

    return {
        "schema": "p97-atail-robust-all-center-structural-cegar-v2",
        "status": "SAT_CORRECTED_FINITE_STRUCTURAL_SHADOW_BANK_MATCHED",
        "trust_boundary": (
            "exhaustive-until-witness finite-shadow DFS plus Z3 substitution and "
            "the production matcher bank; not Euclidean CounterexampleData"
        ),
        "surface": {
            "carrier_card": 14,
            "profile_in_census_roles": list(PROFILE),
            "cyclic_order": list(HULL_NAMES),
            "caps_in_robust_roles": {
                "surplus": sorted(SURPLUS_CAP),
                "opp1": sorted(OPP_CAP_1),
                "opp2": sorted(OPP_CAP_2),
            },
            "pair": {"q": Q, "w": W},
            "apices": {"first": FIRST_APEX, "second": SECOND_APEX},
            "first_apex_exact_class": sorted(FIRST_APEX_CLASS),
            "first_apex_off_surplus_marginal": sorted(MARGINAL),
            "live_roles": {
                "q": Q,
                "w": W,
                "fresh_first_apex_marginal_role": "J",
                "J_distinct_from_w": "J" != W,
            },
            "fixed_local_rows": sorted(FIXED_LOCAL_ROWS),
            "candidate_counts": {
                surface.by_label[center]: len(candidates)
                for center, candidates in sorted(
                    surface.candidates.items(), key=lambda item: surface.by_label[item[0]]
                )
            },
        },
        "smoke_gates": smokes,
        "exact_local_bisector_replay": local_bisector,
        "stale_seed_replay": stale_seed,
        "stale_seed_sharpened_live_target": stale_target,
        "corrected_structural_witness": corrected,
        "corrected_witness_sharpened_live_target": corrected_target,
        "corrected_witness_producer_bank_audit": {
            "selected_row_matches": list(selected_matches),
            "selected_row_match_count": len(selected_matches),
            "blocker_image_exact_center_names": sorted(blocker_image),
            "actual_exactness_matches": list(actual_matches),
            "actual_exactness_match_count": len(actual_matches),
            "blocker_exactness_only_matches": exactness_only,
            "all_matches_have_named_lean_consumers": all(
                match.get("lean_consumer")
                for match in (*selected_matches, *actual_matches)
            ),
        },
        "target_negation": {
            "second_apex_row": sorted(KNOWN_SUPPORTS[SECOND_APEX]),
            "q_blocker_row": sorted(KNOWN_SUPPORTS["D"]),
            "marginal_intersection_card": len(
                KNOWN_SUPPORTS[SECOND_APEX] & MARGINAL
            ),
            "direct_two_hit": False,
            "one_row_confinement": KNOWN_SUPPORTS[SECOND_APEX]
            <= KNOWN_SUPPORTS["D"] | MARGINAL,
        },
        "encoded": [
            "one represented selected four-row at every one of 14 fixed centers",
            "the ambient exact first-apex five-class in compatibility and pair-center checks against every non-O global row",
            "row card four and own-center omission through the candidate domains",
            "the permanent finite cap-row candidate constraints",
            "distinct-center selected-row intersection card at most two",
            "cyclic separation for two common support points",
            "each carrier pair occurs together at at most two represented row centers",
            "one non-self, non-O critical blocker choice for every source",
            "selected rows are exact only at actual blocker-image centers; the A survivor row is not exact by default",
            "fixed E-to-D and D-to-t1 blockers with reciprocal cross omissions",
            "a represented row at each of the six off-source blocker-shell support centers, none repeating the frontier pair",
            "the fixed cap profile, first-apex five-class, second-apex double survivor, and failed target predicates",
        ],
        "omitted": [
            "a producer-bank-clean structural completion",
            "simultaneous Euclidean equal-distance realizability of any bank-clean completion",
            "ambient radius exactness against every unrepresented radius class",
            "literal HasNEquidistantProperty 4 and literal CriticalShellSystem structures",
            "MEC disk inequalities and minimum-radius quantification for the variable row completion",
            "an exhaustive search over other cap profiles, ambient cardinalities, or cyclic orders",
        ],
        "corrected_boundary": (
            "the old seed is invalid once the ambient first-apex class is coupled "
            "to all global rows.  A replacement structural witness exists, but it "
            "already matches formalized equality/order consumers.  Therefore no "
            "new 16-equality metric consumer is justified at this boundary; the "
            "next bounded question is producer-bank-clean structural survival."
        ),
        "source_sha256": {
            str(Path(__file__).resolve().relative_to(ROOT)): sha256(Path(__file__)),
            "census/global_confinement/shadow.py": sha256(
                ROOT / "census/global_confinement/shadow.py"
            ),
            "census/multi_center/multi_center_census.py": sha256(
                ROOT / "census/multi_center/multi_center_census.py"
            ),
            "census/atail_force/producer_bank.py": sha256(
                ROOT / "census/atail_force/producer_bank.py"
            ),
            "scratch/atail-force/cap-local-transport-model/check.py": sha256(
                ROOT / "scratch/atail-force/cap-local-transport-model/check.py"
            ),
        },
        "z3_version": z3.get_version_string(),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    report = build_report()
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not CHECKPOINT.exists() or CHECKPOINT.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {CHECKPOINT}")
        print(
            "PASS: corrected ambient-row structural replay and bank audit match checkpoint"
        )
        return 0
    temporary = CHECKPOINT.with_suffix(CHECKPOINT.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(CHECKPOINT)
    print(f"wrote {CHECKPOINT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
