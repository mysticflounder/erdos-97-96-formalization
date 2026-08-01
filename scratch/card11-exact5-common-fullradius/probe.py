#!/usr/bin/env python3
"""Full local-radius partition extension of the card-11 common shell lane.

This wraps ``scratch/card11-exact5-common-source-indexed`` and adds, at every
labelled center ``c``, a Boolean equality relation on the ten positive incident
edges ``{c,u}`` with ``u != c``.  Reflexivity is implicit, symmetry is obtained
by one canonical variable for each unordered pair, and three Horn clauses per
triple enforce transitivity.

Every selected Census row is required to be exactly one local equality class.
For a source-indexed chosen blocker, the selected row contains the source; the
``no_qfree`` clauses then forbid every four-subset of the six labels outside
that row from being a class after source deletion.  This is equivalent to
checking all remaining labels because deleting the source leaves only three
members of the selected class and exact-class clauses forbid mixing its
members with outside labels.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Mapping


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
SOURCE_DIR = REPO_ROOT / "scratch" / "card11-exact5-common-source-indexed"
_source_spec = importlib.util.spec_from_file_location(
    "card11_exact5_common_source_indexed", SOURCE_DIR / "probe.py"
)
if _source_spec is None or _source_spec.loader is None:
    raise RuntimeError("could not load source-indexed common-shell lane")
source = importlib.util.module_from_spec(_source_spec)
sys.modules[_source_spec.name] = source
_source_spec.loader.exec_module(source)


SCHEMA = "card11_exact5_common_fullradius.v1"
LABELS = tuple(range(source.base.profile.N))
EXPECTED_EQUALITY_VARIABLES = len(LABELS) * (len(LABELS) - 1) * (len(LABELS) - 2) // 2
EXPECTED_USED_VARIABLES = len(LABELS)


class ProbeError(RuntimeError):
    pass


@dataclass(frozen=True)
class SolverResult:
    verdict: str
    returncode: int
    stdout: str
    stderr: str
    wall_seconds: float


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def write_json(path: Path, value: object) -> None:
    write_text(path, json.dumps(value, sort_keys=True, indent=2) + "\n")


def incident_labels(center: int) -> tuple[int, ...]:
    return tuple(label for label in LABELS if label != center)


def equality_key(center: int, left: int, right: int) -> tuple[int, int, int]:
    if left == right or center in (left, right):
        raise ProbeError("equality variables compare two distinct positive incident edges")
    return center, min(left, right), max(left, right)


def add_clause_block(instance, blocks: list[dict], name: str, callback) -> None:
    before = len(instance.cnf.clauses)
    callback()
    after = len(instance.cnf.clauses)
    blocks.append({
        "name": name,
        "first_clause_1based": before + 1,
        "last_clause_1based": after,
        "clause_count": after - before,
    })


def add_full_radius_layer(
    instance,
    separation,
    shell,
    indexed: Mapping[str, object],
    *,
    include_no_qfree: bool = True,
) -> dict:
    """Add exact local distance partitions and chosen-blocker deletion guards."""

    blocks: list[dict] = []
    equality: dict[tuple[int, int, int], int] = {}
    variables_before = instance.cnf.n

    for center in LABELS:
        for left, right in itertools.combinations(incident_labels(center), 2):
            equality[(center, left, right)] = instance.cnf.new_var()

    if len(equality) != EXPECTED_EQUALITY_VARIABLES:
        raise ProbeError("unexpected equality-variable count")

    def eq(center: int, left: int, right: int) -> int:
        return equality[equality_key(center, left, right)]

    def equivalence_clauses() -> None:
        for center in LABELS:
            for a, b, d in itertools.combinations(incident_labels(center), 3):
                ab, ad, bd = eq(center, a, b), eq(center, a, d), eq(center, b, d)
                instance.cnf.add([-ab, -ad, bd])
                instance.cnf.add([-ab, -bd, ad])
                instance.cnf.add([-ad, -bd, ab])

    add_clause_block(instance, blocks, "local-equality-transitivity", equivalence_clauses)

    def exact_selected_rows() -> None:
        for center in LABELS:
            incident = set(incident_labels(center))
            for row_index, raw_support in enumerate(instance.cand[center]):
                support = set(raw_support)
                outside = incident - support
                selector = instance.x[(center, row_index)]
                for left, right in itertools.combinations(sorted(support), 2):
                    instance.cnf.add([-selector, eq(center, left, right)])
                for inside in sorted(support):
                    for other in sorted(outside):
                        instance.cnf.add([-selector, -eq(center, inside, other)])

    add_clause_block(instance, blocks, "selected-row-is-entire-positive-radius-class", exact_selected_rows)

    choices = indexed["choices"]
    choices_by_center = {center: [] for center in LABELS}
    for choice in choices:
        choices_by_center[choice.center].append(choice)

    used = {center: instance.cnf.new_var() for center in LABELS}
    if len(used) != EXPECTED_USED_VARIABLES:
        raise ProbeError("unexpected used-center-variable count")

    def used_center_semantics() -> None:
        for center in LABELS:
            center_choices = choices_by_center[center]
            if not center_choices:
                instance.cnf.add([-used[center]])
                continue
            for choice in center_choices:
                instance.cnf.add([-choice.variable, used[center]])
            instance.cnf.add([-used[center]] + [
                choice.variable for choice in center_choices
            ])

    add_clause_block(instance, blocks, "used-center-iff-some-source-choice", used_center_semantics)

    if include_no_qfree:
        def no_qfree_clauses() -> None:
            for center in LABELS:
                incident = set(incident_labels(center))
                for row_index, raw_support in enumerate(instance.cand[center]):
                    support = set(raw_support)
                    outside = sorted(incident - support)
                    selector = instance.x[(center, row_index)]
                    # If this is a used blocker row, its four-element support is
                    # an entire class and contains every mapped source.  After
                    # deleting such a source, that class has size three.  Thus
                    # a remaining K4 exists iff four of the six outside labels
                    # are all equal at this center.
                    for quad in itertools.combinations(outside, 4):
                        anchor = quad[0]
                        instance.cnf.add([
                            -used[center],
                            -selector,
                            -eq(center, anchor, quad[1]),
                            -eq(center, anchor, quad[2]),
                            -eq(center, anchor, quad[3]),
                        ])

        add_clause_block(instance, blocks, "chosen-blocker-no-qfree-after-source-deletion", no_qfree_clauses)

    if shell is not None:
        def exact_first_apex_shell() -> None:
            center = source.base.profile.V
            support = set(shell["u5"])
            incident = set(incident_labels(center))
            if center in support or len(support) != 5:
                raise ProbeError("first-apex shell must be five positive incident edges")
            outside = incident - support
            for left, right in itertools.combinations(sorted(support), 2):
                instance.cnf.add([eq(center, left, right)])
            for inside in sorted(support):
                for other in sorted(outside):
                    instance.cnf.add([-eq(center, inside, other)])

        add_clause_block(instance, blocks, "first-apex-named-exact-five-entire-class", exact_first_apex_shell)

    return {
        "equality": equality,
        "eq": eq,
        "used": used,
        "choices_by_center": choices_by_center,
        "clause_blocks": blocks,
        "added_variables": instance.cnf.n - variables_before,
        "include_no_qfree": include_no_qfree,
    }


def build_manifest(instance, separation, shell, indexed, layer) -> dict:
    equality_rows = [
        {"center": center, "left": left, "right": right, "variable": variable}
        for (center, left, right), variable in sorted(layer["equality"].items())
    ]
    x_rows = [
        {
            "center": center,
            "row_index": row_index,
            "support": sorted(instance.cand[center][row_index]),
            "variable": instance.x[(center, row_index)],
        }
        for center in LABELS
        for row_index in range(len(instance.cand[center]))
    ]
    source_choices = [
        {
            "source": choice.source,
            "center": choice.center,
            "row_index": choice.row_index,
            "variable": choice.variable,
        }
        for choice in indexed["choices"]
    ]
    orders = [
        {
            "variable": variable,
            "orientation": order.orientation,
            "internal_index": order.internal_index,
            "labels": list(order.labels),
        }
        for order, variable in separation.order_to_selector.items()
    ]
    return {
        "schema": SCHEMA,
        "carrier_labels": list(LABELS),
        "center_exclusion_and_positive_radius": (
            "at center c the universe is exactly the ten unordered edges {c,u} with u != c; "
            "distinct carrier labels make these edges positive-length, so the center is never a shell member"
        ),
        "equality_semantics": (
            "one canonical Boolean per unordered pair of distinct incident edges; reflexivity is implicit, "
            "symmetry is canonicalization, and all three transitivity implications are emitted per triple"
        ),
        "selected_row_semantics": (
            "every positive x[c,row] forces all six internal equalities and all 24 support/outside inequalities; "
            "the four labels are therefore the entire local positive-radius class, never a subset"
        ),
        "no_qfree_semantics": (
            "used[c] iff some source choice maps to c; y implies the unique x row containing its source; "
            "after deleting that source the selected class has size three, and every four-subset of the six "
            "outside labels is forbidden from one class"
            if layer["include_no_qfree"] else
            "DISABLED ONLY FOR A MUTATION-CONTROL SELF-TEST"
        ),
        "first_apex_shell_semantics": (
            "the named five labels are exactly one local class at center V, with every incident outside edge unequal"
            if shell is not None else "no named exact-five shell in this base/self-test instance"
        ),
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "clause_blocks": layer["clause_blocks"],
        "equality_variables": equality_rows,
        "used_center_variables": {
            str(center): variable for center, variable in sorted(layer["used"].items())
        },
        "selected_rows": x_rows,
        "source_choices": source_choices,
        "order_selectors": orders,
        "shell": shell,
    }


def build_instance(
    surplus_shell: int | None = None,
    other_shell: int | None = None,
    *,
    include_no_qfree: bool = True,
):
    instance, separation, shell, indexed, inherited_schema = source.build_instance(
        surplus_shell, other_shell
    )
    clauses_before = len(instance.cnf.clauses)
    variables_before = instance.cnf.n
    layer = add_full_radius_layer(
        instance, separation, shell, indexed,
        include_no_qfree=include_no_qfree,
    )
    manifest = build_manifest(instance, separation, shell, indexed, layer)
    manifest["inherited_schema"] = inherited_schema
    manifest["inherited_variables"] = variables_before
    manifest["inherited_clauses"] = clauses_before
    manifest["fullradius_added_variables"] = instance.cnf.n - variables_before
    manifest["fullradius_added_clauses"] = len(instance.cnf.clauses) - clauses_before
    return instance, separation, shell, indexed, layer, manifest


def parse_assignment(output: str) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise ProbeError(f"conflicting assignments for variable {variable}")
            assignment[variable] = value
    return assignment


def run_cadical(cnf_path: Path, proof_path: Path, timeout: int) -> tuple[SolverResult, list[str]]:
    command = ["cadical", "-q", "-t", str(timeout), str(cnf_path), str(proof_path)]
    started = time.monotonic()
    try:
        completed = subprocess.run(
            command, capture_output=True, text=True, timeout=timeout + 30
        )
    except subprocess.TimeoutExpired as error:
        return SolverResult(
            "TIMEOUT", 124, error.stdout or "", error.stderr or "",
            time.monotonic() - started,
        ), command
    if completed.returncode == 10:
        verdict = "SAT"
    elif completed.returncode == 20:
        verdict = "UNSAT"
    elif completed.returncode == 0:
        verdict = "UNKNOWN"
    else:
        verdict = "ERROR"
    return SolverResult(
        verdict, completed.returncode, completed.stdout, completed.stderr,
        time.monotonic() - started,
    ), command


def source_provenance() -> dict[str, dict[str, str]]:
    paths = {
        "fullradius_driver": Path(__file__).resolve(),
        "independent_verifier": HERE / "verify_artifact.py",
        "source_indexed_driver": Path(source.__file__).resolve(),
        "common_projection_driver": Path(source.base.__file__).resolve(),
        "census_profile": Path(source.base.profile.__file__).resolve(),
        "cover_encoder": Path(source.base.sat_cover.__file__).resolve(),
        "separation_encoder": Path(source.base.separation_encoding.__file__).resolve(),
        "critical_shell_interface": (
            REPO_ROOT / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean"
        ),
    }
    return {
        name: {"path": str(path), "sha256": sha256_file(path)}
        for name, path in paths.items()
    }


def run_independent_verifier(case_dir: Path, timeout: int = 600) -> dict:
    command = [
        sys.executable, str(HERE / "verify_artifact.py"), str(case_dir),
        "--timeout", str(timeout),
    ]
    completed = subprocess.run(
        command, capture_output=True, text=True, timeout=timeout + 30
    )
    if completed.returncode != 0:
        raise ProbeError(
            "independent verifier failed: "
            f"returncode={completed.returncode}, stdout={completed.stdout[-500:]!r}, "
            f"stderr={completed.stderr[-500:]!r}"
        )
    return json.loads((case_dir / "verification.json").read_text(encoding="utf-8"))


def run_case(s: int, o: int, timeout: int, output_root: Path) -> dict:
    case_dir = output_root / "runs" / source.common_shell_name(s, o)
    case_dir.mkdir(parents=True, exist_ok=True)
    instance, separation, shell, indexed, layer, manifest = build_instance(s, o)
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    write_text(cnf_path, instance.dimacs())
    write_json(case_dir / "manifest.json", manifest)
    result, command = run_cadical(cnf_path, proof_path, timeout)
    write_text(case_dir / "cadical.stdout", result.stdout)
    write_text(case_dir / "cadical.stderr", result.stderr)
    record = {
        "schema": SCHEMA,
        "case": {"s": s, "o": o},
        "verdict": result.verdict,
        "returncode": result.returncode,
        "wall_seconds": result.wall_seconds,
        "command": command,
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "cnf_sha256": sha256_file(cnf_path),
        "manifest_sha256": sha256_file(case_dir / "manifest.json"),
        "proof_sha256": sha256_file(proof_path) if proof_path.exists() else None,
        "proof_bytes": proof_path.stat().st_size if proof_path.exists() else 0,
    }
    write_json(case_dir / "result.json", record)
    verification = run_independent_verifier(case_dir)
    record["independent_verification"] = verification
    write_json(case_dir / "result.json", record)
    write_json(case_dir / "provenance.json", {
        "schema": SCHEMA,
        "source_provenance": source_provenance(),
        "artifact_hashes": {
            "input.cnf": sha256_file(cnf_path),
            "manifest.json": sha256_file(case_dir / "manifest.json"),
            "cadical.stdout": sha256_file(case_dir / "cadical.stdout"),
            "cadical.stderr": sha256_file(case_dir / "cadical.stderr"),
            "proof.drat": sha256_file(proof_path) if proof_path.exists() else None,
            "verification.json": sha256_file(case_dir / "verification.json"),
        },
    })
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument(
        "--case", action="append",
        choices=[source.common_shell_name(s, o) for s, o in source.base.SHELL_CASES],
    )
    parser.add_argument("--output-root", type=Path, default=HERE)
    args = parser.parse_args()
    if not 1 <= args.timeout <= 1800:
        raise SystemExit("--timeout must be in [1, 1800]")
    selected = [
        pair for pair in source.base.SHELL_CASES
        if not args.case or source.common_shell_name(*pair) in args.case
    ]
    # Deliberately serial: at most one single-threaded CaDiCaL process exists.
    records = [
        run_case(s, o, args.timeout, args.output_root.resolve())
        for s, o in selected
    ]
    summary = {
        "schema": SCHEMA,
        "timeout_per_case_seconds": args.timeout,
        "serial": True,
        "maximum_concurrent_cadical_processes": 1,
        "results": records,
        "terminal": all(record["verdict"] in {"SAT", "UNSAT"} for record in records),
        "trust_boundary": (
            "DRAT verifies each exact CNF only.  Translation from a geometric "
            "CriticalShellSystem/source map to this fixed labelled Census valuation "
            "still requires a theorem-backed source-to-valuation adapter."
        ),
    }
    write_json(args.output_root.resolve() / "summary.json", summary)
    print(json.dumps({
        "cases": len(records),
        "verdicts": [record["verdict"] for record in records],
        "all_independently_verified": all(
            record["independent_verification"]["verified"] for record in records
        ),
    }, sort_keys=True))
    return 0 if summary["terminal"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
