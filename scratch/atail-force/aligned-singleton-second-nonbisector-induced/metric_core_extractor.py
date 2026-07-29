#!/usr/bin/env python3
"""Extract a deterministic QF_LRA core for one fresh checkpoint survivor.

This is a solver-evidence extractor, not a proof certificate.  It loads the
checkpoint's literal arrays into a fresh solver and asks for a new surviving
outer model; it cannot reproduce the original incremental run's terminal
assignment because that assignment was not checkpointed.  It then quotients
named occurrences by the new model ranks and checks the complete strict metric
system.
Every non-tautological true-row equality and every strict triangle/Kalmanson
inequality is assumption-tracked.  Z3's initial core is greedily shrunk, then
the resulting relations are replayed alone in a fresh QF_LRA solver.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import os
import platform
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable

import z3


HERE = Path(__file__).resolve().parent
CEGAR_PATH = HERE / "cegar.py"
CHECKPOINT_PATH = HERE / "cegar-v8-local-robust-batched32k.checkpoint.json"
DEFAULT_JSON_PATH = HERE / "metric-core-local-robust.json"
DEFAULT_REPORT_PATH = HERE / "metric-core-local-robust-report.md"


@dataclass(frozen=True)
class Relation:
    identifier: str
    kind: str
    expression: z3.BoolRef
    description: dict[str, object]


def canonical_bytes(value: object) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=True,
        separators=(",", ":"),
        sort_keys=True,
    ).encode()


def sha256_value(value: object) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_cegar() -> Any:
    spec = importlib.util.spec_from_file_location(
        "atail_induced_cegar_for_metric_core",
        CEGAR_PATH,
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {CEGAR_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


class Budget:
    def __init__(self, wall_seconds: float, per_check_timeout_ms: int) -> None:
        if wall_seconds <= 0 or per_check_timeout_ms <= 0:
            raise ValueError("budgets must be positive")
        self.deadline = time.monotonic() + wall_seconds
        self.per_check_timeout_ms = per_check_timeout_ms

    def timeout_ms(self) -> int:
        remaining_ms = int((self.deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            raise RuntimeError("BUDGET: wall-clock budget exhausted")
        return max(1, min(self.per_check_timeout_ms, remaining_ms))


class MetricSystem:
    def __init__(
        self,
        classes: tuple[tuple[str, ...], ...],
        class_of: dict[str, int],
    ) -> None:
        self.classes = classes
        self.class_of = class_of
        self.q = len(classes)
        self.distances = {
            (left, right): z3.Real(f"metric_d_{left}_{right}")
            for left in range(self.q)
            for right in range(left + 1, self.q)
        }
        self.base_constraints = [
            distance > 0 for distance in self.distances.values()
        ]
        a0_class = class_of["a0"]
        a1_class = class_of["a1"]
        if a0_class == a1_class:
            raise RuntimeError("FAIL_CLOSED: scale roles a0 and a1 are aliased")
        self.scale_pair = min(a0_class, a1_class), max(a0_class, a1_class)
        self.base_constraints.append(self.distances[self.scale_pair] == 1)

    def node(self, left: int, right: int) -> tuple[int, int] | None:
        if left == right:
            return None
        return min(left, right), max(left, right)

    def named_node(self, left: str, right: str) -> tuple[int, int] | None:
        return self.node(self.class_of[left], self.class_of[right])

    def d(self, left: int, right: int) -> z3.ArithRef:
        node = self.node(left, right)
        return z3.RealVal(0) if node is None else self.distances[node]

    def class_description(self, index: int) -> dict[str, object]:
        members = list(self.classes[index])
        return {
            "index": index,
            "representative": members[0],
            "members": members,
        }

    def distance_description(
        self,
        node: tuple[int, int] | None,
    ) -> dict[str, object]:
        if node is None:
            return {"kind": "zero"}
        left, right = node
        return {
            "kind": "distance",
            "symbol": f"D{left}_{right}",
            "left_class": self.class_description(left),
            "right_class": self.class_description(right),
        }


def relation_registry(
    metric: MetricSystem,
    outer: Any,
    outer_model: z3.ModelRef,
) -> list[Relation]:
    relations: list[Relation] = []

    def append(kind: str, expression: z3.BoolRef, data: dict[str, object]) -> None:
        identifier = f"R{len(relations):05d}"
        description = {"id": identifier, "kind": kind, **data}
        relations.append(Relation(identifier, kind, expression, description))

    for center, left, right in sorted(outer.required_rows):
        atom = outer.rows[center, left, right]
        if not z3.is_true(outer_model.eval(atom, model_completion=True)):
            continue
        center_class = metric.class_of[center]
        left_node = metric.named_node(center, left)
        right_node = metric.named_node(center, right)
        if left_node == right_node:
            continue
        append(
            "true_row_equality",
            metric.d(center_class, metric.class_of[left])
            == metric.d(center_class, metric.class_of[right]),
            {
                "named_roles": {
                    "center": center,
                    "left": left,
                    "right": right,
                },
                "center_class": metric.class_description(center_class),
                "relation": {
                    "lhs": [metric.distance_description(left_node)],
                    "operator": "=",
                    "rhs": [metric.distance_description(right_node)],
                },
            },
        )

    for i, j, k in itertools.combinations(range(metric.q), 3):
        triangle_sides = (
            (
                "opposite_k",
                (metric.node(i, j), metric.node(j, k)),
                metric.node(i, k),
                metric.d(i, j) + metric.d(j, k) > metric.d(i, k),
            ),
            (
                "opposite_j",
                (metric.node(i, j), metric.node(i, k)),
                metric.node(j, k),
                metric.d(i, j) + metric.d(i, k) > metric.d(j, k),
            ),
            (
                "opposite_i",
                (metric.node(i, k), metric.node(j, k)),
                metric.node(i, j),
                metric.d(i, k) + metric.d(j, k) > metric.d(i, j),
            ),
        )
        for side, lhs_nodes, rhs_node, expression in triangle_sides:
            append(
                "strict_triangle",
                expression,
                {
                    "ordered_classes": [
                        metric.class_description(index) for index in (i, j, k)
                    ],
                    "side": side,
                    "relation": {
                        "lhs": [
                            metric.distance_description(node) for node in lhs_nodes
                        ],
                        "operator": ">",
                        "rhs": [metric.distance_description(rhs_node)],
                    },
                },
            )

    for a, b, c, d in itertools.combinations(range(metric.q), 4):
        diagonal = (metric.node(a, c), metric.node(b, d))
        kalmanson_sides = (
            (
                "adjacent_pairs",
                (metric.node(a, b), metric.node(c, d)),
                metric.d(a, b) + metric.d(c, d)
                < metric.d(a, c) + metric.d(b, d),
            ),
            (
                "outer_inner_pairs",
                (metric.node(a, d), metric.node(b, c)),
                metric.d(a, d) + metric.d(b, c)
                < metric.d(a, c) + metric.d(b, d),
            ),
        )
        for side, lhs_nodes, expression in kalmanson_sides:
            append(
                "strict_kalmanson",
                expression,
                {
                    "ordered_classes": [
                        metric.class_description(index)
                        for index in (a, b, c, d)
                    ],
                    "side": side,
                    "relation": {
                        "lhs": [
                            metric.distance_description(node) for node in lhs_nodes
                        ],
                        "operator": "<",
                        "rhs": [
                            metric.distance_description(node) for node in diagonal
                        ],
                    },
                },
            )
    return relations


def configured_solver(
    metric: MetricSystem,
    budget: Budget,
) -> z3.Solver:
    solver = z3.SolverFor("QF_LRA")
    solver.set(
        timeout=budget.timeout_ms(),
        random_seed=0,
        unsat_core=True,
    )
    solver.add(*metric.base_constraints)
    return solver


def status_name(result: z3.CheckSatResult) -> str:
    if result == z3.sat:
        return "SAT"
    if result == z3.unsat:
        return "UNSAT"
    return "UNKNOWN"


def solve_and_shrink(
    metric: MetricSystem,
    relations: list[Relation],
    budget: Budget,
    max_shrink_checks: int,
) -> tuple[list[Relation], dict[str, object]]:
    solver = configured_solver(metric, budget)
    tokens: dict[str, z3.BoolRef] = {}
    for relation in relations:
        token = z3.Bool(f"assume_{relation.identifier}")
        tokens[relation.identifier] = token
        solver.add(z3.Implies(token, relation.expression))

    all_tokens = [tokens[relation.identifier] for relation in relations]
    solver.set(timeout=budget.timeout_ms())
    result = solver.check(*all_tokens)
    if result == z3.unknown:
        raise RuntimeError(
            f"UNKNOWN: complete quotient metric system: {solver.reason_unknown()}"
        )
    if result != z3.unsat:
        raise RuntimeError(
            f"FAIL_CLOSED: complete quotient metric system returned {result}"
        )

    initial_names = {
        token.decl().name() for token in solver.unsat_core()
    }
    initial_core = [
        relation
        for relation in relations
        if f"assume_{relation.identifier}" in initial_names
    ]
    if not initial_core:
        raise RuntimeError("FAIL_CLOSED: Z3 returned an empty UNSAT core")
    if len(initial_core) > max_shrink_checks:
        raise RuntimeError(
            "BUDGET: initial core size exceeds --max-shrink-checks "
            f"({len(initial_core)} > {max_shrink_checks})"
        )

    core = list(initial_core)
    shrink_checks = 0
    for relation in list(initial_core):
        trial = [candidate for candidate in core if candidate != relation]
        solver.set(timeout=budget.timeout_ms())
        trial_result = solver.check(
            *(tokens[candidate.identifier] for candidate in trial)
        )
        shrink_checks += 1
        if trial_result == z3.unknown:
            raise RuntimeError(
                "UNKNOWN: greedy core shrink at "
                f"{relation.identifier}: {solver.reason_unknown()}"
            )
        if trial_result == z3.unsat:
            core = trial

    core_only = configured_solver(metric, budget)
    core_only.add(*(relation.expression for relation in core))
    core_only.set(timeout=budget.timeout_ms())
    core_only_result = core_only.check()
    if core_only_result == z3.unknown:
        raise RuntimeError(
            f"UNKNOWN: core-alone replay: {core_only.reason_unknown()}"
        )
    if core_only_result != z3.unsat:
        raise RuntimeError(
            f"FAIL_CLOSED: core-alone replay returned {core_only_result}"
        )

    necessity: list[dict[str, str]] = []
    for omitted in core:
        replay = configured_solver(metric, budget)
        replay.add(
            *(
                relation.expression
                for relation in core
                if relation != omitted
            )
        )
        replay.set(timeout=budget.timeout_ms())
        replay_result = replay.check()
        if replay_result == z3.unknown:
            raise RuntimeError(
                "UNKNOWN: final minimality replay without "
                f"{omitted.identifier}: {replay.reason_unknown()}"
            )
        if replay_result != z3.sat:
            raise RuntimeError(
                "FAIL_CLOSED: final core is not inclusion-minimal; omitting "
                f"{omitted.identifier} returned {replay_result}"
            )
        necessity.append(
            {"omitted": omitted.identifier, "status": status_name(replay_result)}
        )

    return core, {
        "complete_system_status": status_name(result),
        "z3_initial_core_size": len(initial_core),
        "greedy_shrink_checks": shrink_checks,
        "greedy_core_size": len(core),
        "core_alone_status": status_name(core_only_result),
        "single_deletion_replays": necessity,
        "inclusion_minimal": True,
    }


def count_kinds(relations: Iterable[Relation]) -> dict[str, int]:
    counts: dict[str, int] = {}
    for relation in relations:
        counts[relation.kind] = counts.get(relation.kind, 0) + 1
    return dict(sorted(counts.items()))


def reconstruct(
    timeout_ms: int,
    wall_seconds: float,
    max_shrink_checks: int,
) -> dict[str, object]:
    budget = Budget(wall_seconds, timeout_ms)
    cegar = load_cegar()
    checkpoint = json.loads(CHECKPOINT_PATH.read_text())
    if not isinstance(checkpoint, dict):
        raise RuntimeError("FAIL_CLOSED: checkpoint root must be an object")
    raw_cuts = checkpoint.get("cuts")
    if not isinstance(raw_cuts, list) or not raw_cuts:
        raise RuntimeError("FAIL_CLOSED: checkpoint cuts must be a nonempty list")

    outer = cegar.OuterMap(
        timeout_ms=budget.timeout_ms(),
        random_seed=0,
        z_branch="new",
        escape_arm="robust",
        global_tier="local",
    )
    literal_count = 0
    validated_cuts: list[list[list[object]]] = []
    for cut_index, raw_cut in enumerate(raw_cuts):
        if not isinstance(raw_cut, list):
            raise RuntimeError(
                f"FAIL_CLOSED: checkpoint cut {cut_index} is not a list"
            )
        cut = []
        rendered_cut: list[list[object]] = []
        for raw_literal in raw_cut:
            literal = cegar.Literal.from_json(raw_literal)
            literal.validate(outer.names)
            cut.append(literal)
            rendered_cut.append(literal.to_json())
            literal_count += 1
        outer.add_cut(cut)
        validated_cuts.append(rendered_cut)

    outer.solver.set(timeout=budget.timeout_ms())
    outer_result = outer.solver.check()
    if outer_result == z3.unknown:
        raise RuntimeError(
            f"UNKNOWN: fresh checkpoint-survivor solve: "
            f"{outer.solver.reason_unknown()}"
        )
    if outer_result != z3.sat:
        raise RuntimeError(
            f"FAIL_CLOSED: fresh checkpoint-survivor solve returned {outer_result}"
        )
    outer_model = outer.solver.model()

    classes = tuple(tuple(group) for group in outer.alias_classes(outer_model))
    if len(classes) < 4:
        raise RuntimeError("FAIL_CLOSED: quotient has fewer than four classes")
    class_of = {
        name: class_index
        for class_index, members in enumerate(classes)
        for name in members
    }
    if set(class_of) != set(outer.names):
        raise RuntimeError("FAIL_CLOSED: quotient classes do not cover outer names")

    metric = MetricSystem(classes, class_of)
    relations = relation_registry(metric, outer, outer_model)
    core, validation = solve_and_shrink(
        metric,
        relations,
        budget,
        max_shrink_checks,
    )

    relation_descriptions = [relation.description for relation in relations]
    core_descriptions = [relation.description for relation in core]
    base_description = {
        "positive_distance_pairs": len(metric.distances),
        "scale": {
            "pair": list(metric.scale_pair),
            "roles": ["a0", "a1"],
            "value": "1",
        },
    }
    payload: dict[str, object] = {
        "schema": "p97-local-robust-checkpoint-survivor-metric-core-v2",
        "result": "UNSAT",
        "source": {
            "analyzer_path": Path(__file__).name,
            "analyzer_sha256": sha256_file(Path(__file__)),
            "cegar_path": CEGAR_PATH.name,
            "cegar_sha256": sha256_file(CEGAR_PATH),
            "checkpoint_path": CHECKPOINT_PATH.name,
            "checkpoint_sha256": sha256_file(CHECKPOINT_PATH),
            "checkpoint_keys_ignored_except_cuts": sorted(
                key for key in checkpoint if key != "cuts"
            ),
            "validated_cut_count": len(validated_cuts),
            "validated_literal_count": literal_count,
            "validated_cuts_sha256": sha256_value(validated_cuts),
            "configuration": {
                "random_seed": 0,
                "z_branch": "new",
                "escape_arm": "robust",
                "global_tier": "local",
                "logic_outer": "QF_UFBV",
                "logic_metric": "QF_LRA",
            },
        },
        "environment": {
            "python": platform.python_version(),
            "z3": z3.get_version_string(),
        },
        "checkpoint_survivor": {
            "status": "SAT",
            "named_occurrence_count": len(outer.names),
            "ordered_alias_class_count": len(classes),
            "ordered_alias_classes": [list(group) for group in classes],
        },
        "metric_system": {
            "base_constraints": base_description,
            "tracked_relation_count": len(relations),
            "tracked_relation_counts": count_kinds(relations),
            "tracked_relations_sha256": sha256_value(relation_descriptions),
        },
        "core": {
            "relations": core_descriptions,
            "relation_count": len(core),
            "relation_counts": count_kinds(core),
            "relations_sha256": sha256_value(core_descriptions),
        },
        "validation": validation,
        "trust_scope": [
            (
                "The fresh outer SAT model and metric UNSAT result are Z3 "
                "solver evidence for this checkpoint cut set and current "
                "configuration only."
            ),
            (
                "QF_LRA uses exact rational linear-arithmetic semantics, but "
                "this artifact contains no independently replayed Farkas, "
                "DRAT/LRAT, or Lean proof certificate."
            ),
            (
                "Checkpoint metadata and stats are deliberately ignored; only "
                "the literal arrays are parsed, validated against the current "
                "OuterMap names, hashed, and replayed."
            ),
            (
                "The core is inclusion-minimal under single deletion within "
                "Z3's returned assumption core; it is not claimed minimum-size "
                "or universal beyond this fresh checkpoint survivor. In "
                "particular, it says nothing about the original run's lost "
                "terminal assignment."
            ),
        ],
    }
    payload["payload_without_self_hash_sha256"] = sha256_value(payload)
    return payload


def class_label(description: dict[str, object]) -> str:
    return (
        f"C{description['index']}="
        + "{" + ",".join(description["members"]) + "}"
    )


def distance_label(description: dict[str, object]) -> str:
    if description["kind"] == "zero":
        return "0"
    return (
        f"{description['symbol']}("
        f"{class_label(description['left_class'])}, "
        f"{class_label(description['right_class'])})"
    )


def relation_label(relation: dict[str, object]) -> str:
    formula = relation["relation"]
    lhs = " + ".join(distance_label(term) for term in formula["lhs"])
    rhs = " + ".join(distance_label(term) for term in formula["rhs"])
    return f"{lhs} {formula['operator']} {rhs}"


def render_report(payload: dict[str, object]) -> str:
    source = payload["source"]
    outer = payload["checkpoint_survivor"]
    metric = payload["metric_system"]
    core = payload["core"]
    validation = payload["validation"]
    lines = [
        "# Fresh local-robust checkpoint-survivor metric core",
        "",
        (
            f"Result: **{payload['result']}**. The fresh outer model has "
            f"{outer['ordered_alias_class_count']} ordered alias classes; the "
            f"complete quotient QF_LRA system tracks "
            f"{metric['tracked_relation_count']} relations. Z3's assumption "
            f"core greedily shrinks to **{core['relation_count']} relations**."
        ),
        "",
        "## Core relations",
        "",
    ]
    for relation in core["relations"]:
        lines.append(
            f"- `{relation['id']}` `{relation['kind']}`: "
            f"{relation_label(relation)}"
        )
        if relation["kind"] == "true_row_equality":
            roles = relation["named_roles"]
            lines.append(
                "  Named row: "
                f"center `{roles['center']}`, roles `{roles['left']}` and "
                f"`{roles['right']}`."
            )
        else:
            lines.append(
                "  Ordered classes: "
                + "; ".join(
                    class_label(group) for group in relation["ordered_classes"]
                )
                + f"; side `{relation['side']}`."
            )
    if (
        core["relation_counts"]
        == {"strict_kalmanson": 1, "true_row_equality": 2}
        and core["relation_count"] == 3
    ):
        lines.extend(
            [
                "",
                (
                    "The two row equalities identify the two corresponding "
                    "Kalmanson terms, so its strict inequality reduces exactly "
                    "to the same sum being less than itself."
                ),
            ]
        )
    lines.extend(
        [
            "",
            "## Replay and scope",
            "",
            (
                f"- Loaded and validated {source['validated_cut_count']} cuts "
                f"({source['validated_literal_count']} literals); ignored stale "
                f"checkpoint keys: "
                f"`{', '.join(source['checkpoint_keys_ignored_except_cuts'])}`."
            ),
            (
                f"- Complete-system replay: "
                f"`{validation['complete_system_status']}`; core-alone replay: "
                f"`{validation['core_alone_status']}`; every one-relation "
                "deletion replayed `SAT`."
            ),
            (
                f"- Core hash: `{core['relations_sha256']}`. Checkpoint hash: "
                f"`{source['checkpoint_sha256']}`. Encoder hash: "
                f"`{source['cegar_sha256']}`."
            ),
            (
                "- Trust boundary: exact QF_LRA solver evidence for this fresh "
                "checkpoint survivor, not the original run's terminal model, "
                "a minimum-cardinality core, a general theorem, a Farkas "
                "certificate, or a kernel-checked proof."
            ),
            "",
        ]
    )
    return "\n".join(lines)


def atomic_write(path: Path, content: str) -> None:
    path = path.resolve()
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    temporary.write_text(content)
    os.replace(temporary, path)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument(
        "--write",
        action="store_true",
        help="write the default JSON and Markdown artifacts",
    )
    mode.add_argument(
        "--check",
        action="store_true",
        help="reconstruct and require exact equality with both default artifacts",
    )
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--wall-seconds", type=float, default=900.0)
    parser.add_argument("--max-shrink-checks", type=int, default=10_000)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.max_shrink_checks <= 0:
        raise ValueError("--max-shrink-checks must be positive")
    payload = reconstruct(
        args.timeout_ms,
        args.wall_seconds,
        args.max_shrink_checks,
    )
    rendered_json = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    rendered_report = render_report(payload)

    if args.check:
        expected_json = json.loads(DEFAULT_JSON_PATH.read_text())
        if expected_json != payload:
            raise SystemExit(f"FAIL: reconstructed JSON differs from {DEFAULT_JSON_PATH}")
        if DEFAULT_REPORT_PATH.read_text() != rendered_report:
            raise SystemExit(
                f"FAIL: reconstructed report differs from {DEFAULT_REPORT_PATH}"
            )
        print(
            "PASS",
            f"result={payload['result']}",
            f"core={payload['core']['relation_count']}",
            f"hash={payload['core']['relations_sha256']}",
        )
        return

    atomic_write(DEFAULT_JSON_PATH, rendered_json)
    atomic_write(DEFAULT_REPORT_PATH, rendered_report)
    print(
        "WROTE",
        DEFAULT_JSON_PATH.name,
        DEFAULT_REPORT_PATH.name,
        f"result={payload['result']}",
        f"core={payload['core']['relation_count']}",
        f"hash={payload['core']['relations_sha256']}",
    )


if __name__ == "__main__":
    main()
