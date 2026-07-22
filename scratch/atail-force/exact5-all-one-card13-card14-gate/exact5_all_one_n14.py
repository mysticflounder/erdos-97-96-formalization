#!/usr/bin/env python3
"""Integrated ordinal/LRA falsification gate for card-14 exact-five all-one."""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import sys
import time
from collections import Counter
from fractions import Fraction
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
LANE = ROOT / "scratch/atail-force/exact5-global-cover-parent-gate"
QUOTIENT = ROOT / (
    "scratch/atail-force/variable-card-kalmanson-positive-dual/"
    "analyze_quotient_cycles.py"
)
sys.path.insert(0, str(LANE))

import verify as verify_module  # noqa: E402
import encode as encode_module  # noqa: E402


PROFILES = {
    "5,7,5": (5, 7, 5),
    "6,6,5": (6, 6, 5),
}
ALL_ONE_ORBITS = (
    "allOneHitHubLeft",
    "allOneHitHubMiddle",
    "allOneHitHubRight",
)


def load_module(path: Path, name: str):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def configure(profile_name: str) -> dict[str, object]:
    surplus_card, opposite1_card, physical_card = PROFILES[profile_name]
    if physical_card != 5:
        raise AssertionError("exact-five physical cap drift")
    n = 14
    vertices = tuple(range(n))
    third = 0
    first = 4
    second = first + surplus_card - 1
    physical_cap = frozenset(range(0, first + 1))
    physical_interior = frozenset((1, 2, 3))
    surplus_cap = frozenset(range(first, second + 1))
    opposite1 = frozenset((*range(second, n), 0))
    caps = (surplus_cap, opposite1, physical_cap)
    endpoints = ((first, second), (second, third), (third, first))
    assert tuple(map(len, caps)) == PROFILES[profile_name]
    assert sum(map(len, caps)) == n + 3
    values = {
        "N": n,
        "VERTICES": vertices,
        "VSET": set(vertices),
        "THIRD_VERTEX": third,
        "FIRST_APEX": first,
        "SECOND_APEX": second,
        "SURPLUS_CAP": surplus_cap,
        "OPP_CAP1": opposite1,
        "PHYSICAL_CAP": physical_cap,
        "PHYSICAL_INTERIOR": physical_interior,
        "CAPS": caps,
        "CAP_ENDPOINTS": endpoints,
    }
    for module in (verify_module, encode_module):
        for key, value in values.items():
            setattr(module, key, value)
    return values


def load_engines(profile_name: str):
    config = configure(profile_name)
    metric = load_module(HERE / "exact5_all_one_l1.py",
                         f"exact5_all_one_l1_{profile_name.replace(',', '_')}")
    quotient = load_module(QUOTIENT,
                           f"quotient_cycle_{profile_name.replace(',', '_')}")
    return config, metric, quotient


def add_shell_cross_family_geometry(outer: encode_module.Outer) -> None:
    """Add the cross-center geometry omitted by the card-13 outer.

    ``shell`` is the complete exact-five circle at the second apex.  It is a
    circle row just as ``m``/``g0``/``g1`` and ``b1`` are, except that it may
    legitimately share more than two targets with a selected row at the same
    center.  At every *other* center, the ordinary two-circle and convex
    bisector-parity constraints apply.  It must also participate in the
    global bound saying that one target pair has at most two carrier centers.
    """
    solver = outer.solver
    vertices = verify_module.VERTICES
    first = int(verify_module.FIRST_APEX)
    second = int(verify_module.SECOND_APEX)
    families = [outer.m, *outer.cover]

    for family in families:
        for center in vertices:
            if center == second:
                continue
            left, right = sorted((second, center))
            solver.add(z3.PbLe([
                (z3.And(outer.shell[p], family[center, p]), 1)
                for p in vertices
            ], 2))
            remaining = [p for p in vertices if p not in {left, right}]
            for a, b in itertools.combinations(remaining, 2):
                if (left < a < right) != (left < b < right):
                    continue
                solver.add(z3.Not(z3.And(
                    outer.shell[a], outer.shell[b],
                    family[center, a], family[center, b],
                )))

    # b1 is the selected circle row at the first apex.
    left, right = sorted((second, first))
    solver.add(z3.PbLe([
        (z3.And(outer.shell[p], outer.b1[p]), 1) for p in vertices
    ], 2))
    remaining = [p for p in vertices if p not in {left, right}]
    for a, b in itertools.combinations(remaining, 2):
        if (left < a < right) != (left < b < right):
            continue
        solver.add(z3.Not(z3.And(
            outer.shell[a], outer.shell[b], outer.b1[a], outer.b1[b]
        )))

    # The tracked outer already enforces this bound for m/g/b1.  Reassert the
    # stronger version with the exact-five shell counted at its actual center.
    for a, b in itertools.combinations(vertices, 2):
        at_centers = []
        for center in vertices:
            occurrences = [
                z3.And(family[center, a], family[center, b])
                for family in families
            ]
            if center == first:
                occurrences.append(z3.And(outer.b1[a], outer.b1[b]))
            if center == second:
                occurrences.append(z3.And(outer.shell[a], outer.shell[b]))
            at_centers.append(z3.Or(*occurrences))
        solver.add(z3.PbLe([(occurs, 1) for occurs in at_centers], 2))


def verify_shell_cross_family(decoded: dict[str, object]) -> list[str]:
    """Independent concrete check of ``add_shell_cross_family_geometry``."""
    errors: list[str] = []
    vertices = verify_module.VERTICES
    first = int(verify_module.FIRST_APEX)
    second = int(verify_module.SECOND_APEX)
    shell = set(decoded["shell"])
    rows = {int(c): set(s) for c, s in decoded["rows"].items()}
    covers = [
        {int(c): set(s) for c, s in raw.items()}
        for raw in decoded["cover_rows"]
    ]
    families = [rows, *covers]

    def alternating(center: int, a: int, b: int) -> bool:
        left, right = sorted((second, center))
        return (left < a < right) != (left < b < right)

    for family_index, family in enumerate(families):
        for center in vertices:
            if center == second:
                continue
            common = shell & family[center]
            if len(common) > 2:
                errors.append(
                    f"shell/f{family_index} overlap > 2 at center {center}"
                )
            for a, b in itertools.combinations(sorted(common), 2):
                if not alternating(center, a, b):
                    errors.append(
                        f"shell/f{family_index} nonalternating pair "
                        f"at center {center}: {a,b}"
                    )

    b1 = set(decoded["b1"])
    common = shell & b1
    if len(common) > 2:
        errors.append("shell/b1 overlap > 2")
    for a, b in itertools.combinations(sorted(common), 2):
        if not alternating(first, a, b):
            errors.append(f"shell/b1 nonalternating pair: {a,b}")

    for a, b in itertools.combinations(vertices, 2):
        centers = []
        for center in vertices:
            occurs = any(a in family[center] and b in family[center]
                         for family in families)
            if center == first:
                occurs = occurs or (a in b1 and b in b1)
            if center == second:
                occurs = occurs or (a in shell and b in shell)
            if occurs:
                centers.append(center)
        if len(centers) > 2:
            errors.append(f"target pair {a,b} has centers {centers}")
    return errors


def equality_records(decoded: dict[str, object]) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []

    def row(family: str, center: int, support: set[int]) -> None:
        reference = min(support)
        for point in sorted(support - {reference}):
            records.append({
                "name": f"{family}[{center}]:{reference}={point}",
                "kind": "rowEquality",
                "family": family,
                "center": center,
                "left": reference,
                "right": point,
            })

    rows = {int(c): set(s) for c, s in decoded["rows"].items()}
    covers = [
        {int(c): set(s) for c, s in raw.items()}
        for raw in decoded["cover_rows"]
    ]
    for family_name, family in (
        ("m", rows), ("g0", covers[0]), ("g1", covers[1])
    ):
        for center, support in family.items():
            row(family_name, center, support)
    row("b1", int(verify_module.FIRST_APEX), set(decoded["b1"]))
    row("shell", int(verify_module.SECOND_APEX), set(decoded["shell"]))
    records.append({
        "name": "frontier:firstApexEquality",
        "kind": "frontierFirstEquality",
        "q": int(decoded["q"]),
        "w": int(decoded["w"]),
    })
    return records


def quotient_pairs(records: list[dict[str, object]], quotient):
    pairs = []
    first = int(verify_module.FIRST_APEX)
    for item in records:
        if item["kind"] == "rowEquality":
            center = int(item["center"])
            pairs.append((
                quotient.edge(center, int(item["left"])),
                quotient.edge(center, int(item["right"])),
            ))
        elif item["kind"] == "frontierFirstEquality":
            pairs.append((
                quotient.edge(first, int(item["q"])),
                quotient.edge(first, int(item["w"])),
            ))
    return pairs


def minimize_ordinal_core(records: list[dict[str, object]], quotient):
    # Prefer a relabelable m/g0/g1 core when one exists.  Fixed physical rows
    # and frontier atoms are attempted for deletion first; the prior natural
    # order systematically discarded m/g0 and left non-generalizable cores.
    def removal_priority(item: dict[str, object]) -> int:
        if item["kind"] != "rowEquality":
            return 0
        if item["family"] in {"b1", "shell"}:
            return 0
        return 1

    core = sorted(records, key=removal_priority)
    analysis = quotient.quotient_cycle(14, quotient_pairs(core, quotient))
    if not analysis["has_cycle"]:
        return None
    cursor = 0
    while cursor < len(core):
        trial = core[:cursor] + core[cursor + 1:]
        result = quotient.quotient_cycle(14, quotient_pairs(trial, quotient))
        if result["has_cycle"]:
            core = trial
            analysis = result
        else:
            cursor += 1
    families = {
        str(item.get("family")) for item in core
        if item["kind"] == "rowEquality"
    }
    return {
        "base": "strict Kalmanson equality quotient",
        "minimal": True,
        "method": "deletion-minimal quotient-cycle core",
        "constraint_count": len(core),
        "constraints": core,
        "uses": {
            family: family in families
            for family in ("m", "g0", "g1", "b1", "shell")
        },
        "cycle": analysis,
    }


def parse_distances(raw: dict[str, str]) -> dict[tuple[int, int], Fraction]:
    return {tuple(map(int, key.split(","))): Fraction(value)
            for key, value in raw.items()}


def exact_distance(table: dict[tuple[int, int], Fraction],
                   left: int, right: int) -> Fraction:
    if left == right:
        return Fraction(0)
    return table[(left, right) if left < right else (right, left)]


def verify_sat(decoded: dict[str, object], metric: dict[str, object]) -> list[str]:
    errors = verify_module.verify_decoded(decoded)
    table = parse_distances(metric["distances"])
    vertices = verify_module.VERTICES
    if set(table) != set(itertools.combinations(vertices, 2)):
        return [*errors, "distance table domain mismatch"]
    for pair, value in table.items():
        if value < 1:
            errors.append(f"positivity failed at {pair}")
    for a, b, c in itertools.combinations(vertices, 3):
        dab = exact_distance(table, a, b)
        dac = exact_distance(table, a, c)
        dbc = exact_distance(table, b, c)
        if dab + dbc < dac + 1:
            errors.append(f"triangle0 failed at {a,b,c}")
        if dac + dbc < dab + 1:
            errors.append(f"triangle1 failed at {a,b,c}")
        if dab + dac < dbc + 1:
            errors.append(f"triangle2 failed at {a,b,c}")
    for a, b, c, d in itertools.combinations(vertices, 4):
        diagonals = exact_distance(table, a, c) + exact_distance(table, b, d)
        if diagonals < exact_distance(table, a, b) + exact_distance(table, c, d) + 1:
            errors.append(f"K1 failed at {a,b,c,d}")
        if diagonals < exact_distance(table, a, d) + exact_distance(table, b, c) + 1:
            errors.append(f"K2 failed at {a,b,c,d}")
    for item in equality_records(decoded):
        if item["kind"] == "rowEquality":
            center = int(item["center"])
            if exact_distance(table, center, int(item["left"])) != \
                    exact_distance(table, center, int(item["right"])):
                errors.append(f"row equality failed: {item['name']}")
        else:
            first = int(verify_module.FIRST_APEX)
            if exact_distance(table, first, int(item["q"])) != \
                    exact_distance(table, first, int(item["w"])):
                errors.append("frontier first equality failed")
    second = int(verify_module.SECOND_APEX)
    q, w = int(decoded["q"]), int(decoded["w"])
    if abs(exact_distance(table, second, q) - exact_distance(table, second, w)) < 1:
        errors.append("frontier second separation failed")
    first = int(verify_module.FIRST_APEX)
    for item in metric.get("negations", []):
        if item["kind"] == "negateSameCapFirstApex":
            left = exact_distance(table, first, int(item["C"]))
            right = exact_distance(table, first, int(item["K"]))
        elif item["kind"] == "negateOrdered":
            left = exact_distance(table, first, int(item["J"]))
            right = exact_distance(table, first, int(item["C"]))
        else:
            errors.append(f"unknown negation {item['kind']}")
            continue
        if abs(left - right) < 1:
            errors.append(f"closing-core negation failed: {item}")
    return errors


def save(path: Path | None, payload: dict[str, object]) -> None:
    if path is None:
        return
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def solve(profile_name: str, orbit: str, seconds: float, seed: int,
          checkpoint: Path | None, resume: Path | None) -> dict[str, object]:
    config, metric, quotient = load_engines(profile_name)
    deadline = time.monotonic() + seconds
    outer = encode_module.Outer(orbit, max(1, int(seconds * 1000)), seed)
    add_shell_cross_family_geometry(outer)
    bank: list[dict[str, object]] = []
    counters: Counter[str] = Counter()
    connectivity = {"m": 0, "g0": 0, "g1": 0}
    if resume is not None:
        prior = json.loads(resume.read_text())
        if prior["profile"] != profile_name or prior["orbit"] != orbit:
            raise ValueError("resume surface mismatch")
        bank = list(prior.get("bank", []))
        counters.update(prior.get("counters", {}))
        for record in bank:
            if "core" in record:
                metric.block_all_increasing_embeddings(outer, record["core"])
            else:
                outer.block_decoded(record["decoded"])

    def checkpoint_payload(status: str, reason: str = "") -> dict[str, object]:
        return {
            "schema": "p97-card14-exact5-all-one-integrated-v1",
            "status": status,
            "reason": reason,
            "profile": profile_name,
            "orbit": orbit,
            "config": {
                "n": config["N"],
                "first_apex": config["FIRST_APEX"],
                "second_apex": config["SECOND_APEX"],
                "caps": [sorted(cap) for cap in config["CAPS"]],
            },
            "counters": dict(counters),
            "connectivity_cuts": connectivity,
            "bank": bank,
        }

    while True:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            result = checkpoint_payload("UNKNOWN", "wall budget")
            save(checkpoint, result)
            return result
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=seed)
        status = outer.solver.check()
        if status == z3.unsat:
            result = checkpoint_payload("UNSAT", "outer exhausted")
            save(checkpoint, result)
            return result
        if status == z3.unknown:
            result = checkpoint_payload(
                "UNKNOWN", f"B0: {outer.solver.reason_unknown()}"
            )
            save(checkpoint, result)
            return result
        decoded = outer.decode(outer.solver.model())
        families = [
            {int(c): set(s) for c, s in decoded["rows"].items()},
            *[{int(c): set(s) for c, s in raw.items()}
              for raw in decoded["cover_rows"]],
        ]
        added = False
        for name, symbolic, family in zip(
            ("m", "g0", "g1"), (outer.m, *outer.cover), families, strict=True
        ):
            for component in verify_module.sink_sccs(family):
                if len(component) < 14:
                    outer.add_connectivity_cut(symbolic, component)
                    connectivity[name] += 1
                    added = True
        if added:
            continue
        errors = [
            *verify_module.verify_decoded(decoded),
            *verify_shell_cross_family(decoded),
        ]
        if errors:
            result = checkpoint_payload("ENCODER_ERROR", "; ".join(errors))
            result["decoded"] = decoded
            save(checkpoint, result)
            return result
        counters["b0_candidates"] += 1

        ordinal_core = minimize_ordinal_core(equality_records(decoded), quotient)
        if ordinal_core is not None:
            counters["ordinal_unsat"] += 1
            core = {key: ordinal_core[key] for key in (
                "base", "minimal", "method", "constraint_count",
                "constraints", "uses",
            )}
            metric.block_all_increasing_embeddings(outer, core)
            bank.append({"kind": "quotientOrdinalCycle", "core": core,
                         "cycle": ordinal_core["cycle"]})
        else:
            counters["lra_checks"] += 1
            lra = metric.check_linear(decoded, min(10_000, remaining_ms), seed)
            if lra["status"] == "UNKNOWN":
                result = checkpoint_payload(
                    "UNKNOWN", f"LRA/{lra['stage']}: {lra['reason']}"
                )
                result["decoded"] = decoded
                save(checkpoint, result)
                return result
            if lra["status"] == "SAT":
                sat_errors = verify_sat(decoded, lra)
                if sat_errors:
                    result = checkpoint_payload(
                        "ENCODER_ERROR", "; ".join(sat_errors)
                    )
                    result["decoded"] = decoded
                    result["metric"] = lra
                    save(checkpoint, result)
                    return result
                counters["sat"] += 1
                result = checkpoint_payload(
                    "SAT", "exact-Fraction verified common-order shadow"
                )
                result["decoded"] = decoded
                result["metric"] = lra
                save(checkpoint, result)
                return result
            counters["full_lra_unsat"] += 1
            if lra["stage"] == "commonOrderBase" and lra["core"]["minimal"]:
                core = lra["core"]
                metric.block_all_increasing_embeddings(outer, core)
                bank.append({"kind": "fullLraFarkas", "core": core})
            else:
                outer.block_decoded(decoded)
                bank.append({"kind": "literalTerminalNegation", "decoded": decoded})
                counters["literal_blocks"] += 1
        if int(counters["b0_candidates"]) % 10 == 0:
            save(checkpoint, checkpoint_payload("RUNNING"))


def smoke(profile_name: str) -> dict[str, object]:
    _config, metric, _quotient = load_engines(profile_name)
    base, table, _tracked = metric.build_base_linear_problem(
        {
            "rows": {str(c): [p for p in verify_module.VERTICES if p != c][:4]
                     for c in verify_module.VERTICES},
            "cover_rows": [
                {str(c): [p for p in verify_module.VERTICES if p != c][:4]
                 for c in verify_module.VERTICES}
                for _ in range(2)
            ],
            "b1": [0, 1, 2, 3],
            "shell": [0, 1, 2, 3, 4],
            "q": 0,
            "w": 1,
        },
        5_000,
        1,
    )
    if base.check() != z3.sat:
        raise RuntimeError("unconstrained metric base smoke is not SAT")
    # Hand-checkable strict K2 contradiction at 0 < 1 < 8 < 11.
    base.add(
        metric.dist(table, 0, 8) == metric.dist(table, 0, 11),
        metric.dist(table, 1, 8) == metric.dist(table, 1, 11),
    )
    if base.check() != z3.unsat:
        raise RuntimeError("known two-row Kalmanson smoke is not UNSAT")
    deadline = time.monotonic() + 15.0
    outer = encode_module.Outer("allOneHitHubMiddle", 15_000, 1)
    add_shell_cross_family_geometry(outer)
    connectivity = 0
    while True:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            raise RuntimeError("shell-aware B0 smoke exhausted wall budget")
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=1)
        status = outer.solver.check()
        if status != z3.sat:
            raise RuntimeError(f"shell-aware B0 smoke did not find SAT: {status}")
        decoded = outer.decode(outer.solver.model())
        families = [
            {int(c): set(s) for c, s in decoded["rows"].items()},
            *[{int(c): set(s) for c, s in raw.items()}
              for raw in decoded["cover_rows"]],
        ]
        added = False
        for symbolic, family in zip(
            (outer.m, *outer.cover), families, strict=True
        ):
            for component in verify_module.sink_sccs(family):
                if len(component) < 14:
                    outer.add_connectivity_cut(symbolic, component)
                    connectivity += 1
                    added = True
        if not added:
            break
    errors = [
        *verify_module.verify_decoded(decoded),
        *verify_shell_cross_family(decoded),
    ]
    if errors:
        raise RuntimeError("shell-aware B0 verifier failed: " + "; ".join(errors))
    return {
        "status": "PASS",
        "profile": profile_name,
        "known_metric_sat": True,
        "known_kalmanson_unsat": True,
        "shell_aware_b0_sat_and_independently_verified": True,
        "connectivity_cuts": connectivity,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", choices=tuple(PROFILES), required=True)
    parser.add_argument("--orbit", choices=ALL_ONE_ORBITS)
    parser.add_argument("--seconds", type=float, default=60.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--checkpoint", type=Path)
    parser.add_argument("--resume", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--smoke", action="store_true")
    args = parser.parse_args()
    if args.smoke:
        result = smoke(args.profile)
    else:
        if args.orbit is None:
            parser.error("--orbit is required unless --smoke is used")
        result = solve(
            args.profile, args.orbit, args.seconds, args.seed,
            args.checkpoint, args.resume,
        )
    save(args.output, result)
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
