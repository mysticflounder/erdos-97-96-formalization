#!/usr/bin/env python3
"""Extract and replay the local-robust terminal quotient closure certificate.

The source checkpoint contains the 1,985 direct four-point cuts preceding the
first quotient-metric call.  This script deterministically rebuilds that outer
witness, checks the observed quotient UNSAT, and extracts a closure-preserving
66-literal certificate:

* a spanning forest inside every alias class;
* the adjacent chain of ordered class representatives; and
* a spanning forest for the true-row distance-equality closure.

The certificate is structural only.  It does not claim to be a minimal metric
UNSAT core, and it deliberately contains no false-row disequalities.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Hashable, Iterable

import z3


HERE = Path(__file__).resolve().parent
CEGAR_PATH = HERE / "cegar.py"
CHECKPOINT_PATH = HERE / "cegar-v8-local-robust-batched32k.checkpoint.json"
DEFAULT_ARTIFACT_PATH = HERE / "quotient-closure-certificate-local-robust.json"

EXPECTED_CLASSES = (
    ("a0", "z3", "e2"),
    ("z", "s4"),
    ("r4",),
    ("other",),
    ("q", "t"),
    ("a1", "e4"),
    ("r1", "be"),
    ("p1",),
    ("source", "b2"),
    ("r2", "b1"),
    ("p2",),
    ("a2", "s2", "r3"),
    ("z2",),
    ("e3",),
    ("bz",),
    ("escape",),
    ("bs", "p4", "z4"),
    ("s3",),
    ("p3",),
)


class DisjointSet:
    def __init__(self, items: Iterable[Hashable]) -> None:
        self.parent = {item: item for item in items}

    def find(self, item: Hashable) -> Hashable:
        parent = self.parent
        while parent[item] != item:
            parent[item] = parent[parent[item]]
            item = parent[item]
        return item

    def union(self, left: Hashable, right: Hashable) -> bool:
        left_root, right_root = self.find(left), self.find(right)
        if left_root == right_root:
            return False
        self.parent[right_root] = left_root
        return True


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
        "atail_induced_cegar_for_closure_certificate",
        CEGAR_PATH,
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {CEGAR_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def distance_node(
    class_of: dict[str, int],
    left: str,
    right: str,
) -> tuple[int, int] | None:
    left_class, right_class = class_of[left], class_of[right]
    if left_class == right_class:
        return None
    return min(left_class, right_class), max(left_class, right_class)


def rendered_node(
    node: tuple[int, int] | None,
    representatives: list[str],
) -> list[str]:
    if node is None:
        return ["zero"]
    return [
        "distance",
        representatives[node[0]],
        representatives[node[1]],
    ]


def closure_signature(
    dsu: DisjointSet,
    nodes: list[tuple[int, int] | None],
    representatives: list[str],
) -> list[list[list[str]]]:
    components: dict[Hashable, list[list[str]]] = {}
    for node in nodes:
        components.setdefault(dsu.find(node), []).append(
            rendered_node(node, representatives)
        )
    normalized = [
        sorted(component, key=canonical_bytes)
        for component in components.values()
    ]
    return sorted(normalized, key=canonical_bytes)


def reconstruct(timeout_ms: int) -> dict[str, object]:
    cegar = load_cegar()
    checkpoint = json.loads(CHECKPOINT_PATH.read_text())
    raw_cuts = checkpoint.get("cuts")
    if not isinstance(raw_cuts, list) or len(raw_cuts) != 1_985:
        raise RuntimeError("expected exactly 1,985 checkpoint cuts")

    outer = cegar.OuterMap(
        timeout_ms=timeout_ms,
        random_seed=0,
        z_branch="new",
        escape_arm="robust",
        global_tier="local",
    )
    for raw_cut in raw_cuts:
        cut = [cegar.Literal.from_json(raw) for raw in raw_cut]
        for literal in cut:
            literal.validate(outer.names)
        outer.add_cut(cut)

    outer.solver.set(timeout=timeout_ms)
    outer_status = outer.solver.check()
    if outer_status != z3.sat:
        raise RuntimeError(f"terminal outer replay returned {outer_status}")
    model = outer.solver.model()

    classes = tuple(tuple(group) for group in outer.alias_classes(model))
    if classes != EXPECTED_CLASSES:
        raise RuntimeError(
            "terminal ordered alias classes drifted:\n"
            + json.dumps(classes, indent=2)
        )
    representatives = [group[0] for group in classes]
    class_of = {
        name: class_number
        for class_number, group in enumerate(classes)
        for name in group
    }

    selected, _, _ = outer.selected_literals(model)
    selected_json = [literal.to_json() for literal in selected]
    selected_set = {canonical_bytes(literal) for literal in selected_json}
    selected_counts: Counter[str] = Counter()
    for literal in selected:
        if literal.kind in ("alias", "row"):
            selected_counts[f"{literal.kind}_{str(literal.args[-1]).lower()}"] += 1
        else:
            selected_counts[literal.kind] += 1

    alias_equalities: list[list[object]] = []
    for group in classes:
        representative = group[0]
        alias_equalities.extend(
            ["alias", representative, name, True]
            for name in group[1:]
        )

    adjacent_orders = [
        ["order", left, right]
        for left, right in zip(representatives, representatives[1:])
    ]

    quotient_nodes: list[tuple[int, int] | None] = [None]
    quotient_nodes.extend(
        (left, right)
        for left in range(len(classes))
        for right in range(left + 1, len(classes))
    )
    full_row_closure = DisjointSet(quotient_nodes)
    certificate_row_closure = DisjointSet(quotient_nodes)
    true_rows: list[tuple[str, str, str]] = []
    row_forest: list[list[object]] = []
    for center, left, right in sorted(outer.required_rows):
        atom = outer.rows[center, left, right]
        if not z3.is_true(model.eval(atom, model_completion=True)):
            continue
        true_rows.append((center, left, right))
        left_node = distance_node(class_of, center, left)
        right_node = distance_node(class_of, center, right)
        full_row_closure.union(left_node, right_node)
        if certificate_row_closure.union(left_node, right_node):
            row_forest.append(["row", center, left, right, True])

    certificate_literals = alias_equalities + adjacent_orders + row_forest
    missing = [
        literal
        for literal in certificate_literals
        if canonical_bytes(literal) not in selected_set
    ]
    if missing:
        raise RuntimeError(f"certificate literals not selected: {missing!r}")

    alias_replay = DisjointSet(outer.names)
    for _, left, right, equal in alias_equalities:
        if equal is not True:
            raise AssertionError("alias certificate must contain only equalities")
        alias_replay.union(left, right)
    reconstructed_partition = {
        frozenset(
            name
            for name in outer.names
            if alias_replay.find(name) == alias_replay.find(representative)
        )
        for representative in representatives
    }
    expected_partition = {frozenset(group) for group in classes}
    partition_ok = reconstructed_partition == expected_partition
    order_ok = adjacent_orders == [
        ["order", representatives[index], representatives[index + 1]]
        for index in range(len(representatives) - 1)
    ]

    full_signature = closure_signature(
        full_row_closure,
        quotient_nodes,
        representatives,
    )
    certificate_signature = closure_signature(
        certificate_row_closure,
        quotient_nodes,
        representatives,
    )
    row_closure_ok = certificate_signature == full_signature

    quotient_checker = cegar.QuotientMetricCheck(
        outer,
        model,
        timeout_ms=timeout_ms,
        iteration=66_000_019,
    )
    quotient_status = quotient_checker.check()
    if quotient_status != z3.unsat:
        detail = (
            quotient_checker.reason_unknown()
            if quotient_status == z3.unknown
            else "metric survivor"
        )
        raise RuntimeError(f"terminal quotient replay returned {quotient_status}: {detail}")

    expected_counts = {
        "alias_equalities": 12,
        "adjacent_orders": 18,
        "true_row_equality_forest": 36,
        "combined": 66,
    }
    actual_counts = {
        "alias_equalities": len(alias_equalities),
        "adjacent_orders": len(adjacent_orders),
        "true_row_equality_forest": len(row_forest),
        "combined": len(certificate_literals),
    }
    if actual_counts != expected_counts:
        raise RuntimeError(
            f"closure-certificate count drift: {actual_counts!r}"
        )
    if not partition_ok or not order_ok or not row_closure_ok:
        raise RuntimeError(
            "closure replay failed: "
            f"partition={partition_ok}, order={order_ok}, rows={row_closure_ok}"
        )

    certificate_hashes = {
        "alias_equalities_sha256": sha256_value(alias_equalities),
        "adjacent_orders_sha256": sha256_value(adjacent_orders),
        "true_row_equality_forest_sha256": sha256_value(row_forest),
        "combined_literals_sha256": sha256_value(certificate_literals),
        "distance_equality_closure_sha256": sha256_value(full_signature),
    }
    payload: dict[str, object] = {
        "schema": "p97-local-robust-terminal-quotient-closure-v1",
        "source": {
            "cegar_path": CEGAR_PATH.name,
            "cegar_sha256": sha256_file(CEGAR_PATH),
            "checkpoint_path": CHECKPOINT_PATH.name,
            "checkpoint_sha256": sha256_file(CHECKPOINT_PATH),
            "checkpoint_direct_cut_count": len(raw_cuts),
            "configuration": {
                "random_seed": 0,
                "z_branch": "new",
                "escape_arm": "robust",
                "global_tier": "local",
            },
        },
        "terminal_outer": {
            "named_occurrences": len(outer.names),
            "ordered_alias_classes": [list(group) for group in classes],
            "class_representatives": representatives,
            "selected_literal_counts": dict(sorted(selected_counts.items())),
            "selected_literal_total": len(selected),
        },
        "quotient_metric_replay": {
            "status": str(quotient_status),
            "constraint_counts": dict(sorted(quotient_checker.counts.items())),
        },
        "certificate": {
            "counts": actual_counts,
            "alias_equalities": alias_equalities,
            "adjacent_orders": adjacent_orders,
            "true_row_equality_forest": row_forest,
            "combined_literals": certificate_literals,
            "hashes": certificate_hashes,
        },
        "closure_replay": {
            "status": "PASS",
            "partition_reconstructed": partition_ok,
            "adjacent_order_chain_reconstructed": order_ok,
            "distance_equality_closure_reconstructed": row_closure_ok,
            "quotient_distance_node_count_including_zero": len(quotient_nodes),
            "selected_true_row_count": len(true_rows),
            "distance_equality_component_count": len(full_signature),
        },
        "scope": (
            "Structural closure certificate for the observed local robust "
            "terminal quotient; not a generalized metric UNSAT core."
        ),
    }
    payload["payload_without_self_hash_sha256"] = sha256_value(payload)
    return payload


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument(
        "--write",
        type=Path,
        metavar="PATH",
        help=f"write canonical report JSON (default path: {DEFAULT_ARTIFACT_PATH})",
    )
    mode.add_argument(
        "--check",
        type=Path,
        metavar="PATH",
        help="reconstruct and require exact equality with an existing report",
    )
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument(
        "--summary",
        action="store_true",
        help="print only the validation status and combined certificate hash",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.timeout_ms <= 0:
        raise ValueError("--timeout-ms must be positive")
    payload = reconstruct(args.timeout_ms)
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"

    if args.check is not None:
        expected = json.loads(args.check.read_text())
        if expected != payload:
            raise SystemExit(f"FAIL: reconstructed report differs from {args.check}")
        print(
            "PASS",
            args.check,
            payload["certificate"]["hashes"]["combined_literals_sha256"],
        )
        return

    if args.write is not None:
        output = args.write.resolve()
        output.parent.mkdir(parents=True, exist_ok=True)
        temporary = output.with_name(f".{output.name}.{os.getpid()}.tmp")
        temporary.write_text(rendered)
        os.replace(temporary, output)
        print(
            "WROTE",
            output,
            payload["certificate"]["hashes"]["combined_literals_sha256"],
        )
        return

    if args.summary:
        print(
            "PASS",
            payload["certificate"]["counts"],
            payload["certificate"]["hashes"]["combined_literals_sha256"],
        )
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()
