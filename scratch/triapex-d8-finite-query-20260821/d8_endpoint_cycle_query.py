#!/usr/bin/env python3
"""Source-tagged exact-row abstraction for the P97 F1/D8 endpoint cycle.

SAT means only that the listed incidence consequences do not yet force a
closure bridge.  It is intentionally labelled ``SAT_ABSTRACTION``.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

import z3


REPO = Path(__file__).resolve().parents[2]
SOURCE_FILES = (
    "lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean",
    "lean/Erdos9796Proof/P97/ATail/FiveCenterDeletionBoundary.lean",
    "lean/Erdos9796Proof/P97/ATail/RetainedMatchingEndpointContinuation.lean",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "TriApexEndpointRetainedOmission.lean",
)

# row name -> (center, deleted source when this is a q-deleted packet row, slots)
ROWS: dict[str, tuple[str, str | None, tuple[str, str, str, str]]] = {
    "retained_o": ("o", None, ("c", "j", "retained_3", "retained_4")),
    "shell_d_b": ("b", None, ("c", "d", "sd_3", "sd_4")),
    "shell_j_x": ("x", None, ("j", "sj_2", "sj_3", "sj_4")),
    "shell_k_a": ("a", None, ("c", "k", "sk_3", "sk_4")),
    "delete_j_at_o": ("o", "j", ("djo_1", "djo_2", "djo_3", "djo_4")),
    "delete_k_at_o": ("o", "k", ("dko_1", "dko_2", "dko_3", "dko_4")),
    "delete_d_at_o": ("o", "d", ("ddo_1", "ddo_2", "ddo_3", "ddo_4")),
}

NAMED = ("o", "a", "b", "x", "c", "d", "j", "k")
SLOTS = tuple(dict.fromkeys(slot for _, _, row in ROWS.values() for slot in row))
ROLES = tuple(dict.fromkeys((*NAMED, *SLOTS)))
BRIDGES = {
    "fresh_on_retained_row": ("k", "retained_o"),
    "kept_on_J_shell": ("c", "shell_j_x"),
    "deleted_on_J_shell": ("d", "shell_j_x"),
    "J_on_K_shell": ("j", "shell_k_a"),
}


def _canonical_json(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def source_manifest() -> dict[str, object]:
    files = {name: _sha256(REPO / name) for name in SOURCE_FILES}
    return {
        "schema": "p97-d8-endpoint-cycle-source-manifest/v1",
        "files": files,
        "query_sha256": _sha256(Path(__file__)),
        "row_contract": {
            row: {"center": center, "deleted": deleted, "slots": list(slots)}
            for row, (center, deleted, slots) in ROWS.items()
        },
    }


@dataclass
class Query:
    solver: z3.Solver
    point_class: dict[str, z3.IntNumRef]
    groups: tuple[str, ...]

    def same(self, left: str, right: str) -> z3.BoolRef:
        return self.point_class[left] == self.point_class[right]

    def incident(self, role: str, row: str) -> z3.BoolRef:
        return z3.Or(*(self.same(role, slot) for slot in ROWS[row][2]))

    def overlap_count(self, left: str, right: str) -> z3.ArithRef:
        return z3.Sum(
            *(z3.If(self.incident(slot, right), 1, 0) for slot in ROWS[left][2])
        )

    def same_support(self, left: str, right: str) -> z3.BoolRef:
        return z3.And(*(self.incident(slot, right) for slot in ROWS[left][2]))


class Builder:
    def __init__(self, timeout_ms: int = 10_000):
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms)
        self.point_class = {role: z3.Int(f"point_class__{role}") for role in ROLES}
        self.groups: list[str] = []

    def q(self) -> Query:
        return Query(self.solver, self.point_class, tuple(self.groups))

    def add_group(self, name: str, constraints: Iterable[z3.BoolRef]) -> None:
        items = tuple(constraints)
        if not items:
            raise ValueError(f"empty constraint group: {name}")
        if name in self.groups:
            raise ValueError(f"duplicate constraint group: {name}")
        self.groups.append(name)
        self.solver.assert_and_track(z3.And(*items), z3.Bool(f"source__{name}"))


def build_query(*, timeout_ms: int = 10_000, avoid_bridges: bool = True) -> Query:
    builder = Builder(timeout_ms)
    q = builder.q()
    n = len(ROLES)
    builder.add_group(
        "finite_equality_classes",
        (z3.And(0 <= q.point_class[role], q.point_class[role] < n) for role in ROLES),
    )
    builder.add_group(
        "four_distinct_centers",
        (z3.Distinct(*(q.point_class[role] for role in ("o", "a", "b", "x"))),),
    )
    builder.add_group(
        "four_distinct_cycle_sources",
        (z3.Distinct(*(q.point_class[role] for role in ("c", "d", "j", "k"))),),
    )
    builder.add_group(
        "actual_blocker_avoids_own_source",
        (z3.Not(q.same("b", "d")), z3.Not(q.same("x", "j")), z3.Not(q.same("a", "k"))),
    )

    for row, (center, deleted, slots) in ROWS.items():
        constraints: list[z3.BoolRef] = [
            z3.Distinct(*(q.point_class[slot] for slot in slots)),
            z3.Not(q.incident(center, row)),
        ]
        if deleted is not None:
            constraints.append(z3.Not(q.incident(deleted, row)))
        builder.add_group(f"exact_row__{row}", constraints)

    builder.add_group(
        "named_shell_omissions",
        (
            z3.Not(q.incident("j", "shell_d_b")),
            z3.Not(q.incident("k", "shell_d_b")),
            z3.Not(q.incident("k", "shell_j_x")),
            z3.Not(q.incident("d", "shell_k_a")),
        ),
    )

    row_names = tuple(ROWS)
    for index, left in enumerate(row_names):
        left_center = ROWS[left][0]
        for right in row_names[index + 1 :]:
            right_center = ROWS[right][0]
            if left_center != right_center:
                builder.add_group(
                    f"two_circle_overlap__{left}__{right}",
                    (q.overlap_count(left, right) <= 2,),
                )

    builder.add_group(
        "three_packet_overlap_bounds",
        (
            q.overlap_count("delete_j_at_o", "shell_d_b") <= 2,
            q.overlap_count("delete_k_at_o", "shell_j_x") <= 2,
            q.overlap_count("delete_d_at_o", "shell_k_a") <= 2,
        ),
    )

    if avoid_bridges:
        builder.add_group(
            "avoid_candidate_closure_bridges",
            (z3.Not(q.incident(role, row)) for role, row in BRIDGES.values()),
        )
    return builder.q()


def _eval_bool(model: z3.ModelRef, expression: z3.BoolRef) -> bool:
    return z3.is_true(model.eval(expression, model_completion=True))


def solve(*, timeout_ms: int = 10_000) -> dict[str, object]:
    q = build_query(timeout_ms=timeout_ms, avoid_bridges=True)
    manifest = source_manifest()
    check = q.solver.check()
    common: dict[str, object] = {
        "schema": "p97-d8-endpoint-cycle-query-result/v1",
        "source_manifest": manifest,
        "source_manifest_sha256": hashlib.sha256(_canonical_json(manifest)).hexdigest(),
        "constraint_groups": list(q.groups),
        "candidate_bridges": list(BRIDGES),
    }
    if check == z3.sat:
        model = q.solver.model()
        classes = {
            role: model.eval(q.point_class[role], model_completion=True).as_long()
            for role in ROLES
        }
        rows = {
            row: [classes[slot] for slot in slots]
            for row, (_, _, slots) in ROWS.items()
        }
        bridge_values = {
            name: _eval_bool(model, q.incident(role, row))
            for name, (role, row) in BRIDGES.items()
        }
        return common | {
            "status": "SAT_ABSTRACTION",
            "point_classes": classes,
            "row_support_classes": rows,
            "bridge_values": bridge_values,
        }
    if check == z3.unsat:
        return common | {
            "status": "UNSAT_RELAXATION",
            "unsat_core": sorted(str(item) for item in q.solver.unsat_core()),
        }
    return common | {"status": "UNKNOWN", "reason": q.solver.reason_unknown()}


def verify_result(result: dict[str, object], *, timeout_ms: int = 10_000) -> None:
    if result.get("status") != "SAT_ABSTRACTION":
        raise ValueError("replay currently verifies SAT_ABSTRACTION results only")
    manifest = source_manifest()
    if result.get("source_manifest") != manifest:
        raise ValueError("source manifest does not match the current source/query files")
    expected_hash = hashlib.sha256(_canonical_json(manifest)).hexdigest()
    if result.get("source_manifest_sha256") != expected_hash:
        raise ValueError("source manifest hash mismatch")
    classes = result.get("point_classes")
    if not isinstance(classes, dict) or set(classes) != set(ROLES):
        raise ValueError("point-class signature is incomplete")
    q = build_query(timeout_ms=timeout_ms, avoid_bridges=True)
    q.solver.add(*(q.point_class[role] == int(classes[role]) for role in ROLES))
    if q.solver.check() != z3.sat:
        raise ValueError("pinned model does not replay")
    model = q.solver.model()
    for name, (role, row) in BRIDGES.items():
        if _eval_bool(model, q.incident(role, row)):
            raise ValueError(f"candidate bridge unexpectedly holds: {name}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--verify", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    args = parser.parse_args()
    if args.verify is not None:
        result = json.loads(args.verify.read_text())
        verify_result(result, timeout_ms=args.timeout_ms)
        print(json.dumps({"verified": True, "status": result["status"]}, sort_keys=True))
        return 0
    result = solve(timeout_ms=args.timeout_ms)
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "status": result["status"],
                "constraint_group_count": len(result["constraint_groups"]),
                "bridge_values": result.get("bridge_values"),
            },
            sort_keys=True,
        )
    )
    return 0 if result["status"] == "SAT_ABSTRACTION" else 1


if __name__ == "__main__":
    raise SystemExit(main())
