#!/usr/bin/env python3
"""Join the card-12 total critical-map shadow to one Euclidean geometry model.

This is a theorem-discovery query, not a proof checker.  It takes the saved
``(5,5,5)`` global-count shadow, retains its total source-to-blocker map and
exact four-point row at every carrier center, and adds the coordinate-level
strict-convex, MEC, Moser-cap, and target-negation atoms from the production
ATAIL geometry encoder.

The finite shadow treats every off-row distance at a fixed center as a fresh
class.  The polynomial query enforces that interpretation literally: the four
saved row members have one common positive squared radius, every off-row
point has a different radius, and all off-row radii are pairwise distinct.
Consequently the saved blocker map is a genuine deletion-critical total
``CriticalShellSystem`` whenever the polynomial system is realized.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

import sympy as sp


ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_geometry as geometry


HERE = Path(__file__).resolve().parent
SHADOWS = HERE.parent / "global_count_boundary" / "shadows.json"
PROFILE = [5, 5, 5]
EXPECTED_SHADOW_SHA256 = (
    "e771d39cd7291aaf8e6adb7a7853495623e54439b2205d5fcdac4a085161064c"
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_case() -> dict[str, Any]:
    require(sha256(SHADOWS) == EXPECTED_SHADOW_SHA256, "shadow source drift")
    document = json.loads(SHADOWS.read_text(encoding="utf-8"))
    matches = [case for case in document["cases"] if case["profile"] == PROFILE]
    require(len(matches) == 1, "expected exactly one (5,5,5) shadow")
    return matches[0]


def cap_frame(case: dict[str, Any]) -> tuple[str, str, str]:
    caps = [set(map(int, cap)) for cap in case["caps"]]
    surplus_index = int(case["surplus_cap_index"])
    other = [index for index in range(3) if index != surplus_index]
    surplus_apex = next(iter(caps[other[0]] & caps[other[1]]))
    endpoints = sorted((caps[surplus_index] & caps[other[0]]) |
                       (caps[surplus_index] & caps[other[1]]))
    require(len(endpoints) == 2, "surplus cap does not have two endpoints")
    # The focused robust packet uses the first endpoint 4 and second endpoint 0.
    require(set(endpoints) == {0, 4} and surplus_apex == 8,
            "saved Moser gauge drift")
    return str(surplus_apex), "4", "0"


def point(label: int) -> tuple[sp.Symbol, sp.Symbol]:
    return sp.symbols(f"x_{label} y_{label}", real=True)


def d2(left: int, right: int) -> sp.Expr:
    lx, ly = point(left)
    rx, ry = point(right)
    return sp.expand((lx - rx) ** 2 + (ly - ry) ** 2)


def build_system() -> tuple[geometry.GeometrySystem, dict[str, Any]]:
    case = load_case()
    labels = tuple(str(label) for label in case["cyclic_order"])
    require(set(map(int, labels)) == set(range(12)), "carrier labels drifted")
    surplus_apex, first_apex, second_apex = cap_frame(case)
    caps = tuple(frozenset(map(str, cap)) for cap in case["caps"])
    spec = geometry.GeometryBlueprint(
        case_id="card12_555_total_critical_map_shadow",
        labels=labels,
        cyclic_order=labels,
        surplus_apex=surplus_apex,
        opp_apex1=first_apex,
        opp_apex2=second_apex,
        surplus_cap=caps[int(case["surplus_cap_index"])],
        opp_cap1=caps[2],
        opp_cap2=caps[1],
        exact_classes=(),
        pinned_k4_rows=(),
    )
    base = geometry.build_geometry_system(spec)
    variables = list(base.variables)
    atoms = list(base.atoms)
    rows = {int(center): tuple(map(int, support))
            for center, support in case["rows"].items()}
    blocker = {int(source): int(center)
               for source, center in case["critical_shell_blocker_map"].items()}
    require(set(rows) == set(range(12)), "row map is not total")
    require(set(blocker) == set(range(12)), "blocker map is not total")

    for source, center in blocker.items():
        require(center != source, f"source {source} blocks itself")
        require(source in rows[center],
                f"source {source} is absent from blocker row {center}")

    for center in range(12):
        support = set(rows[center])
        require(len(support) == 4 and center not in support,
                f"center {center} has malformed exact row")
        radius = sp.Symbol(f"critical_radius2_{center}", real=True)
        variables.append(radius)
        atoms.append(geometry.NamedPolynomialAtom(
            f"CRITICAL_RADIUS_POS_{center}", "total-critical-map", "gt",
            (radius,), "CriticalFourShell.radius_pos"))
        for member in sorted(support):
            atoms.append(geometry.NamedPolynomialAtom(
                f"CRITICAL_ROW_{center}_{member}", "total-critical-map", "eq",
                (d2(center, member) - radius,),
                "CriticalFourShell.support_eq_radius"))
        outside = sorted(set(range(12)) - support - {center})
        for member in outside:
            atoms.append(geometry.NamedPolynomialAtom(
                f"CRITICAL_EXACT_OFF_{center}_{member}",
                "total-critical-map-exact", "ne",
                (d2(center, member) - radius,),
                "CriticalFourShell.support_eq / full exact filter"))
        for index, left in enumerate(outside):
            for right in outside[index + 1:]:
                atoms.append(geometry.NamedPolynomialAtom(
                    f"CRITICAL_OFF_CLASS_NE_{center}_{left}_{right}",
                    "total-critical-map-exact", "ne",
                    (d2(center, left) - d2(center, right),),
                    "finite-shadow fresh off-row distance classes"))

    names = [atom.name for atom in atoms]
    require(len(names) == len(set(names)), "named atom collision")
    omitted = tuple(item for item in base.omitted_ledger
                    if "CriticalShellSystem" not in item
                    and "critical-blocker" not in item)
    omitted += (
        "full U3LocalizedNoQFreePacket/U3FixedTriplePacket/liveData provenance beyond the exact dangerous row",
        "a Lean extraction theorem from the live parent to this fixed 12-label shadow",
    )
    system = geometry.GeometrySystem(
        spec, tuple(dict.fromkeys(variables)), tuple(atoms), omitted)
    metadata = {
        "shadow_sha256": sha256(SHADOWS),
        "profile": PROFILE,
        "carrier_card": 12,
        "row_count": len(rows),
        "blocker_count": len(blocker),
        "atom_count": len(atoms),
        "atom_family_counts": {
            family: sum(atom.family == family for atom in atoms)
            for family in sorted({atom.family for atom in atoms})
        },
        "robust_packet": {
            "q": 10,
            "w": 11,
            "blocker_q": blocker[10],
            "blocker_w": blocker[11],
            "support_q": list(rows[blocker[10]]),
            "support_w": list(rows[blocker[11]]),
        },
        "omitted_ledger": list(omitted),
        "evidence_scope": "fixed finite shadow plus named QF_NRA geometry; solver results are not Lean proofs",
    }
    return system, metadata


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--emit-smt2", type=Path)
    parser.add_argument("--z3-ms", type=int)
    parser.add_argument("--cvc5-seconds", type=float)
    parser.add_argument(
        "--families",
        help="comma-separated atom families; defaults to the full system",
    )
    args = parser.parse_args()
    system, metadata = build_system()
    enabled_atoms = None
    if args.families:
        families = {item.strip() for item in args.families.split(",") if item.strip()}
        known = {atom.family for atom in system.atoms}
        require(families <= known, f"unknown atom families: {sorted(families - known)}")
        enabled_atoms = [atom.name for atom in system.atoms if atom.family in families]
        metadata["enabled_families"] = sorted(families)
        metadata["enabled_atom_count"] = len(enabled_atoms)
    if args.emit_smt2:
        args.emit_smt2.write_text(
            geometry.build_cvc5_smt2(system, enabled_atoms), encoding="utf-8")
        metadata["smt2_path"] = str(args.emit_smt2)
        metadata["smt2_sha256"] = sha256(args.emit_smt2)
    if args.z3_ms is not None:
        metadata["z3"] = geometry.run_z3_bounded(
            system, enabled_atoms, timeout_ms=args.z3_ms)
    if args.cvc5_seconds is not None:
        result = geometry.run_cvc5_bounded(
            system, enabled_atoms, timeout_seconds=args.cvc5_seconds)
        diagnostic = str(result.get("stderr", ""))
        if (result.get("status") == "ERROR" and
                "interrupted by timeout" in diagnostic):
            result["raw_status"] = "ERROR"
            result["status"] = "TIMEOUT"
            result["normalization"] = (
                "exact cvc5 timeout diagnostic; fail-closed, no retry")
        elif (
            result.get("status") == "UNKNOWN"
            and result.get("reason") == "host-timeout"
        ):
            result["raw_status"] = "UNKNOWN"
            result["status"] = "TIMEOUT"
            result["normalization"] = "host timeout; fail-closed, no retry"
        metadata["cvc5"] = result
    if args.check:
        require(metadata["row_count"] == 12, "row-count drift")
        require(metadata["blocker_count"] == 12, "blocker-count drift")
        require(metadata["robust_packet"] == {
            "q": 10,
            "w": 11,
            "blocker_q": 1,
            "blocker_w": 3,
            "support_q": [0, 3, 8, 10],
            "support_w": [2, 4, 6, 11],
        }, "robust packet drift")
    print(json.dumps(metadata, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
