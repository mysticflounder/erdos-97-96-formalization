#!/usr/bin/env python3
"""Independent sampled semantic cross-check of legacy and ground-Boolean ports."""

from __future__ import annotations

import argparse
import json
import random
import time
from collections import defaultdict
from pathlib import Path

import z3

import model as legacy
import qf_bool_model as port


class TrackedLegacy(legacy.Encoding):
    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        if not hasattr(self, "constraints_by_block"):
            self.constraints_by_block: dict[str, list[z3.BoolRef]] = defaultdict(list)
        self.constraints_by_block[block].extend(constraints)
        self.counts[block] += len(constraints)


class TrackedPort(port.Encoding):
    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        if not hasattr(self, "constraints_by_block"):
            self.constraints_by_block: dict[str, list[z3.BoolRef]] = defaultdict(list)
        self.constraints_by_block[block].extend(constraints)
        self.counts[block] += len(constraints)


def ground_bool_constraints(
    blocks: dict[str, list[z3.BoolRef]],
) -> tuple[bool, str]:
    seen: set[int] = set()
    stack = [item for constraints in blocks.values() for item in constraints]
    while stack:
        expression = stack.pop()
        if expression.get_id() in seen:
            continue
        seen.add(expression.get_id())
        if expression.sort().kind() != z3.Z3_BOOL_SORT:
            return False, f"unexpected sort {expression.sort()} in {expression}"
        if z3.is_app(expression):
            declaration = expression.decl()
            if (
                declaration.kind() == z3.Z3_OP_UNINTERPRETED
                and declaration.arity() != 0
            ):
                return False, f"non-ground UF application {expression}"
            if (
                declaration.kind() == z3.Z3_OP_UNINTERPRETED
                and expression.sort().kind() != z3.Z3_BOOL_SORT
            ):
                return False, f"non-Boolean free constant {expression}"
            stack.extend(expression.children())
    return True, f"GROUND_BOOL_OK nodes={len(seen)}"


def chosen_indices(length: int, per_block: int, rng: random.Random) -> list[int]:
    if length <= per_block:
        return list(range(length))
    answer = {0, length - 1, length // 2}
    while len(answer) < per_block:
        answer.add(rng.randrange(length))
    return sorted(answer)


def concrete_bool(
    expression: z3.BoolRef,
    first_substitutions: list[tuple[z3.ExprRef, z3.ExprRef]],
    second_substitutions: list[tuple[z3.ExprRef, z3.ExprRef]],
) -> bool:
    reduced = z3.simplify(z3.substitute(expression, *first_substitutions))
    reduced = z3.simplify(z3.substitute(reduced, *second_substitutions))
    if z3.is_true(reduced):
        return True
    if z3.is_false(reduced):
        return False
    raise RuntimeError(f"FAIL_CLOSED_NONCONCRETE_SAMPLE: {reduced}")


def run(samples: int, per_block: int, seed: int) -> dict[str, object]:
    started = time.monotonic()
    old = TrackedLegacy(
        timeout_ms=1,
        random_seed=0,
        nonbisector=True,
        full_circle_intersections=False,
    )
    new = TrackedPort(
        timeout_ms=1,
        random_seed=0,
        nonbisector=True,
        full_circle_intersections=False,
    )
    ground_ok, ground_detail = ground_bool_constraints(new.constraints_by_block)
    if not ground_ok:
        raise RuntimeError(ground_detail)

    old_labels = set(old.constraints_by_block)
    new_labels = set(new.constraints_by_block)
    if old_labels != new_labels:
        raise RuntimeError(
            f"FAIL_CLOSED_LABEL_MISMATCH old-only={old_labels-new_labels} "
            f"new-only={new_labels-old_labels}"
        )
    count_differences = {
        label: (len(old.constraints_by_block[label]), len(new.constraints_by_block[label]))
        for label in sorted(old_labels)
        if len(old.constraints_by_block[label])
        != len(new.constraints_by_block[label])
    }
    if count_differences != {"role_bounds": (24, 12)}:
        raise RuntimeError(
            f"FAIL_CLOSED_UNEXPECTED_COUNT_DIFFERENCES: {count_differences}"
        )

    rng = random.Random(seed)
    checked = 0
    for sample in range(samples):
        role_values = {
            name: rng.choice(new.role_domains[name])
            for name in port.ROLE_NAMES
        }
        member_values = [
            [bool(rng.getrandbits(1)) for _ in range(port.N)]
            for _ in range(port.N)
        ]
        same_values = [
            [
                [bool(rng.getrandbits(1)) for _ in range(port.N)]
                for _ in range(port.N)
            ]
            for _ in range(port.N)
        ]
        blocker_values = [
            [bool(rng.getrandbits(1)) for _ in range(port.N)]
            for _ in range(port.N)
        ]

        old_roles = [
            (old.roles[name], z3.IntVal(value))
            for name, value in role_values.items()
        ]
        new_roles = [
            (new.roles[name][value], z3.BoolVal(value == selected))
            for name, selected in role_values.items()
            for value in range(port.N)
        ]
        old_data: list[tuple[z3.ExprRef, z3.ExprRef]] = []
        new_data: list[tuple[z3.ExprRef, z3.ExprRef]] = []
        for center in range(port.N):
            for point in range(port.N):
                value = member_values[center][point]
                old_data.append((old.member(center, point), z3.BoolVal(value)))
                new_data.append((new.member(center, point), z3.BoolVal(value)))
        for center in range(port.N):
            for left in range(port.N):
                for right in range(port.N):
                    value = same_values[center][left][right]
                    old_data.append((old.same(center, left, right), z3.BoolVal(value)))
                    new_data.append((new.same(center, left, right), z3.BoolVal(value)))
        for source in range(port.N):
            for center in range(port.N):
                value = blocker_values[source][center]
                old_data.append((old.blocker(source, center), z3.BoolVal(value)))
                new_data.append((new.blocker(source, center), z3.BoolVal(value)))

        for label in sorted(old_labels):
            old_constraints = old.constraints_by_block[label]
            new_constraints = new.constraints_by_block[label]
            if label == "role_bounds":
                old_value = all(
                    concrete_bool(item, old_roles, old_data)
                    for item in old_constraints
                )
                new_value = all(
                    concrete_bool(item, new_roles, new_data)
                    for item in new_constraints
                )
                if old_value != new_value:
                    raise RuntimeError(
                        f"FAIL_CLOSED_SAMPLE_MISMATCH sample={sample} block={label}"
                    )
                checked += len(old_constraints) + len(new_constraints)
                continue
            for index in chosen_indices(len(old_constraints), per_block, rng):
                old_value = concrete_bool(
                    old_constraints[index], old_roles, old_data
                )
                new_value = concrete_bool(
                    new_constraints[index], new_roles, new_data
                )
                if old_value != new_value:
                    raise RuntimeError(
                        "FAIL_CLOSED_SAMPLE_MISMATCH "
                        f"sample={sample} block={label} index={index} "
                        f"old={old_value} new={new_value}"
                    )
                checked += 1

    return {
        "schema": "p97-aligned-singleton-qf-bool-crosscheck-v1",
        "status": "PASS",
        "source_model_sha256": port.LEGACY_MODEL_SHA256,
        "ground_formula": ground_detail,
        "samples": samples,
        "assertions_per_block_cap": per_block,
        "sampled_assertion_evaluations": checked,
        "label_count": len(old_labels),
        "expected_count_difference": {"role_bounds": [24, 12]},
        "seed": seed,
        "elapsed_seconds": time.monotonic() - started,
        "method": (
            "independent concrete evaluation of corresponding legacy UF/Int-role "
            "and explicit-table/one-hot assertions on deterministic sampled total "
            "assignments; role samples respect the named role-domain constraints"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--samples", type=int, default=3)
    parser.add_argument("--assertions-per-block", type=int, default=8)
    parser.add_argument("--seed", type=int, default=97017)
    args = parser.parse_args()
    result = run(args.samples, args.assertions_per_block, args.seed)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
