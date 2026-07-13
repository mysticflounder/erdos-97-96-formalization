#!/usr/bin/env python3
"""Fail-closed checkpoint for the completed ATAIL-Q3 probe.

The checkpoint replays exact realized-window witnesses, validates the stored
token assignments, and runs the geometric falsifier gate. It deliberately does
not claim that token SAT is a full-configuration realization or that the
hand/Z3 proofs of the 15 killed classes are independently replayed here.
"""
from __future__ import annotations

import argparse
import ast
import hashlib
import json
import os
import re
import tempfile
from collections import Counter
from itertools import combinations
from pathlib import Path
from typing import Any, Mapping

import sympy as sp

from census.q3_two_center import falsifier_gate
from census.q3_two_center import q3_token
from census.q3_two_center import q3lib as q


SCHEMA = "p97_atail_q3_checkpoint.v1"
HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
DEFAULT_CHECKPOINT = HERE / "checkpoint.json"

FACTORY_WITNESSES = HERE / "q3_witnesses.json"
RESIDUE_WITNESSES = HERE / "resid_witnesses.json"
SPECIAL_WITNESSES = HERE / "specials_witnesses.json"
FACTORY_RAW = HERE / "factory_raw.json"

TOKEN_FILES = {
    "base_proven": HERE / "q3_token_proven.json",
    "post_sub2_proven": HERE / "q3_token_plus.json",
}
BASE_KILLS = frozenset({(2, 1, 0, 1), (2, 2, 0, 0)})
POST_SUB2_KILLS = BASE_KILLS | frozenset(
    {(0, 3, 0, 1), (0, 4, 0, 0), (1, 3, 0, 0)}
)
EXPECTED_KILLS = {
    "base_proven": BASE_KILLS,
    "post_sub2_proven": POST_SUB2_KILLS,
}

PINNED_INPUTS = [
    Path(__file__).resolve(),
    HERE / "q3lib.py",
    HERE / "q3_token.py",
    HERE / "falsifier_gate.py",
    REPO_ROOT / "census" / "candidate_d_probe" / "encoder.py",
    REPO_ROOT / "census" / "candidate_d_probe" / "q2_token.py",
    FACTORY_RAW,
    FACTORY_WITNESSES,
    RESIDUE_WITNESSES,
    SPECIAL_WITNESSES,
    *TOKEN_FILES.values(),
    *(Path(path) for _tag, path in falsifier_gate.FILES),
]


class CheckpointError(ValueError):
    """The tracked Q3 artifacts do not satisfy the checkpoint contract."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise CheckpointError(message)


def _load_json(path: Path) -> Any:
    try:
        with path.open(encoding="utf-8") as handle:
            return json.load(handle)
    except (OSError, json.JSONDecodeError) as exc:
        raise CheckpointError(f"cannot load {path}: {exc}") from exc


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    try:
        with path.open("rb") as handle:
            for block in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(block)
    except OSError as exc:
        raise CheckpointError(f"cannot hash {path}: {exc}") from exc
    return digest.hexdigest()


def _parse_rational(value: str) -> sp.Rational:
    try:
        return sp.Rational(value)
    except (TypeError, ValueError, ZeroDivisionError) as exc:
        raise CheckpointError(f"invalid rational literal {value!r}") from exc


def _parse_qsqrt3(value: str) -> sp.Expr:
    remainder = value.replace("sqrt(3)", "")
    if re.fullmatch(r"[0-9+*/() -]+", remainder) is None:
        raise CheckpointError(f"invalid Q(sqrt(3)) literal {value!r}")
    try:
        parsed = sp.sympify(value, locals={"sqrt": sp.sqrt})
    except (TypeError, ValueError, SyntaxError) as exc:
        raise CheckpointError(f"invalid Q(sqrt(3)) literal {value!r}") from exc
    _require(not parsed.free_symbols, f"free symbol in algebraic literal {value!r}")
    return sp.simplify(parsed)


def _verify_window(
    class_map: Mapping[str, Mapping[str, Any]],
    class_id: str,
    record: Mapping[str, Any],
    *,
    algebraic: bool,
) -> None:
    _require(class_id in class_map, f"unknown Q3 class {class_id}")
    cls = class_map[class_id]
    subcase = record.get("sc")
    _require(subcase in q.subcases(cls), f"invalid subcase for {class_id}")
    raw_subs = record.get("subs")
    _require(isinstance(raw_subs, dict), f"missing substitutions for {class_id}")
    parser = _parse_qsqrt3 if algebraic else _parse_rational
    substitutions = {name: parser(value) for name, value in raw_subs.items()}
    system = q.build_w2c(cls, subcase)
    required = {str(variable) for variable in system.vars}
    _require(
        set(substitutions) == required,
        f"substitution-variable mismatch for {class_id}",
    )
    verified, failures = q.enc.verify_exact(system, substitutions)
    _require(verified, f"exact replay failed for {class_id}: {failures[:2]}")
    mutation = dict(substitutions)
    mutation["rv2"] += sp.Rational(1, 7)
    mutation_verified, _failures = q.enc.verify_exact(system, mutation)
    _require(not mutation_verified, f"mutation was accepted for {class_id}")


def _verify_classification() -> dict[str, Any]:
    classes = q.all_classes()
    class_map = {cls["id"]: cls for cls in classes}
    _require(len(classes) == 87, f"expected 87 Q3 classes, found {len(classes)}")
    _require(len(class_map) == len(classes), "duplicate Q3 class identifiers")

    raw = _load_json(FACTORY_RAW)
    factory = _load_json(FACTORY_WITNESSES)
    residue = _load_json(RESIDUE_WITNESSES)
    special = _load_json(SPECIAL_WITNESSES)
    for name, payload in (
        ("factory_raw", raw),
        ("factory", factory),
        ("residue", residue),
        ("special", special),
    ):
        _require(isinstance(payload, dict), f"{name} payload is not an object")
    _require(set(raw) == set(class_map), "factory_raw does not cover all classes")

    killed = {
        class_id
        for class_id, record in raw.items()
        if record.get("status") == "KILLED-PROVEN"
    }
    _require(len(factory) == 63, f"expected 63 factory witnesses, got {len(factory)}")
    _require(len(residue) == 5, f"expected 5 residue witnesses, got {len(residue)}")
    _require(len(special) == 4, f"expected 4 special witnesses, got {len(special)}")
    _require(len(killed) == 15, f"expected 15 killed classes, got {len(killed)}")

    factory_ids = set(factory)
    residue_ids = set(residue)
    special_ids = set(special)
    parts = [factory_ids, residue_ids, special_ids, killed]
    for left, right in combinations(parts, 2):
        _require(not left & right, f"classification overlap: {sorted(left & right)}")
    covered = set().union(*parts)
    _require(covered == set(class_map), "classification has missing Q3 classes")

    for class_id, record in factory.items():
        _require(raw[class_id].get("status") == "witness", f"raw drift: {class_id}")
        _require(record == {
            "sc": raw[class_id].get("sc"),
            "subs": raw[class_id].get("subs"),
        }, f"factory witness drift: {class_id}")
        _verify_window(class_map, class_id, record, algebraic=False)
    for class_id, record in residue.items():
        _require(record.get("status") == "VERIFIED", f"bad residue status: {class_id}")
        _require(
            raw[class_id].get("status") == "no-witness-in-menu",
            f"residue no longer matches raw status: {class_id}",
        )
        _verify_window(class_map, class_id, record, algebraic=False)
    for class_id, record in special.items():
        _require(record.get("field") == "Q(sqrt(3))", f"bad field: {class_id}")
        _require(
            raw[class_id].get("status") == "NEEDS-SPECIAL",
            f"special no longer matches raw status: {class_id}",
        )
        _verify_window(class_map, class_id, record, algebraic=True)

    return {
        "mirror_reduced_classes": len(class_map),
        "exact_rational_realizations": len(factory) + len(residue),
        "exact_qsqrt3_realizations": len(special),
        "reported_killed_proven": len(killed),
        "unclassified": 0,
        "all_realization_mutations_rejected": True,
        "reported_killed_ids": sorted(killed),
        "kill_proofs_replayed_by_checkpoint": False,
    }


def _h1_ok(
    center: int,
    selected: frozenset[int],
    cap_s: frozenset[int],
    cap_o1: frozenset[int],
    cap_o2: frozenset[int],
) -> bool:
    if center == 0:
        return (
            len(selected & (cap_o1 - {0})) <= 1
            and len(selected & (cap_o2 - {0})) <= 1
        )
    if center == 1:
        return (
            len(selected & (cap_s - {1})) <= 1
            and len(selected & (cap_o2 - {1})) <= 1
        )
    if center == 2:
        return (
            len(selected & (cap_s - {2})) <= 1
            and len(selected & (cap_o1 - {2})) <= 1
        )
    return True


def _verify_token_assignment(
    profile: tuple[int, int, int],
    assignment_payload: Mapping[str, Any],
    kills: frozenset[tuple[int, int, int, int]],
) -> None:
    n, cap_s, cap_o1, cap_o2, int_s, int_o1, int_o2 = (
        q3_token.qt.build_labels(*profile)
    )
    caps_int = {
        "S": frozenset(int_s),
        "O1": frozenset(int_o1),
        "O2": frozenset(int_o2),
    }
    cap_of_int = {
        point: cap
        for cap, points in caps_int.items()
        for point in points
    }
    try:
        assignment = {
            int(center): frozenset(int(point) for point in selected)
            for center, selected in assignment_payload.items()
        }
    except (TypeError, ValueError) as exc:
        raise CheckpointError(f"malformed token assignment for {profile}") from exc
    _require(set(assignment) == set(range(n)), f"missing center for {profile}")

    for center, selected in assignment.items():
        _require(len(selected) == 4, f"non-four class at {profile}, center {center}")
        _require(center not in selected, f"center selected at {profile}, {center}")
        _require(selected <= set(range(n)), f"label out of range at {profile}")
        _require(
            _h1_ok(center, selected, cap_s, cap_o1, cap_o2),
            f"H1 failed at {profile}, center {center}",
        )
        if center >= 3:
            _require(
                len(selected & {0, 1, 2}) <= 2,
                f"m <= 2 failed at {profile}, center {center}",
            )
            kind = q3_token.qt.type_of(center, selected, caps_int, cap_of_int)
            _require(kind not in kills, f"killed type used at {profile}: {kind}")

    pair_counts: Counter[tuple[int, int]] = Counter()
    for selected in assignment.values():
        pair_counts.update(combinations(sorted(selected), 2))
    _require(max(pair_counts.values()) <= 2, f"C4 failed at {profile}")
    for left, right in combinations(range(n), 2):
        _require(
            len(assignment[left] & assignment[right]) <= 2,
            f"C2 failed at {profile}, centers {left},{right}",
        )
    for left, right in combinations(range(3), 2):
        _require(
            q3_token.joint_ok(
                left,
                assignment[left],
                right,
                assignment[right],
                caps_int,
            ),
            f"Q3 joint kill failed at {profile}, centers {left},{right}",
        )


def _parse_profile(value: str) -> tuple[int, int, int]:
    try:
        parsed = ast.literal_eval(value)
    except (ValueError, SyntaxError) as exc:
        raise CheckpointError(f"invalid profile key {value!r}") from exc
    _require(
        isinstance(parsed, tuple)
        and len(parsed) == 3
        and all(isinstance(part, int) for part in parsed),
        f"invalid profile key {value!r}",
    )
    return parsed


def _verify_token_tier(name: str, path: Path) -> dict[str, Any]:
    payload = _load_json(path)
    _require(isinstance(payload, dict), f"token tier {name} is not an object")
    kills = frozenset(tuple(row) for row in payload.get("K", []))
    _require(kills == EXPECTED_KILLS[name], f"kill-set drift in {name}")
    _require(
        payload.get("joint_kills") == ["K-Q3-1", "K-Q3-5"],
        f"joint-kill drift in {name}",
    )
    profiles_checked = 0
    orders = []
    for n in range(12, 17):
        order_payload = payload.get(str(n))
        _require(isinstance(order_payload, dict), f"missing n={n} in {name}")
        _require(order_payload.get("any_sat") is True, f"n={n} not SAT in {name}")
        rows = order_payload.get("profiles")
        _require(isinstance(rows, dict), f"missing profiles at n={n} in {name}")
        parsed_rows = {_parse_profile(key): row for key, row in rows.items()}
        expected = set(q3_token.profiles_for(n))
        _require(set(parsed_rows) == expected, f"profile surface drift at n={n}")
        for profile, row in parsed_rows.items():
            _require(row.get("sat") is True, f"stored UNSAT profile {profile}")
            classes = row.get("classes")
            _require(isinstance(classes, dict), f"missing model for {profile}")
            _verify_token_assignment(profile, classes, kills)
            profiles_checked += 1
        orders.append({"cardinality": n, "profiles": len(parsed_rows)})
    return {
        "orders": orders,
        "profiles_with_verified_sat_assignment": profiles_checked,
    }


def build_checkpoint() -> dict[str, Any]:
    classification = _verify_classification()
    token = {
        name: _verify_token_tier(name, path)
        for name, path in TOKEN_FILES.items()
    }
    falsifier = falsifier_gate.run_gate(emit=False)
    _require(not falsifier["findings"], "banked falsifier hit a Q3 kill")
    input_digests = {
        str(path.relative_to(REPO_ROOT)): _sha256(path)
        for path in PINNED_INPUTS
    }
    return {
        "schema": SCHEMA,
        "verdict": {
            "atail_q3": "DONE_NEGATIVE_WITHIN_STATED_SURFACES",
            "atail_force": "OPEN_RESEARCH",
            "required_successor": (
                "couple more than one Moser-vertex pair, or supply a new "
                "convexity/critical-row producer"
            ),
        },
        "classification": classification,
        "token_composition": token,
        "geometric_falsifier_gate": {
            "epistemic_scope": "EMPIRICALLY_VERIFIED_GUARD_BANDED_FLOAT",
            **falsifier,
        },
        "scope": {
            "exact_window_replay": True,
            "exact_token_assignment_replay": True,
            "full_configuration_counterexample": False,
            "lean_shared_radius_producer": False,
            "kill_proofs_independently_replayed": False,
        },
        "input_sha256": dict(sorted(input_digests.items())),
    }


def _canonical(document: Mapping[str, Any]) -> str:
    return json.dumps(document, sort_keys=True, indent=2) + "\n"


def _write_atomic(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    args = parser.parse_args()
    try:
        document = build_checkpoint()
        canonical = _canonical(document)
        if args.write:
            _write_atomic(args.checkpoint, canonical)
        elif args.check:
            existing = args.checkpoint.read_text(encoding="utf-8")
            _require(existing == canonical, "committed checkpoint is stale")
        else:
            print(canonical, end="")
        return 0
    except (CheckpointError, OSError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
