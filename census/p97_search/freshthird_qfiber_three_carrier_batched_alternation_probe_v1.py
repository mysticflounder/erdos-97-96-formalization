"""Probe the FreshThird carrier CNF with all source-proved cap cuts present.

The structural CEGAR wave was repeatedly rediscovering the same
``noAlternatingCap`` theorem one model at a time.  This probe installs the
finite CNF projection of that theorem up front, then asks CaDiCaL for one
model per boundary cell and sends each model through the existing independent
source replay.  It is discovery evidence only; a SAT result is not a Lean
claim and an UNSAT result is not promoted here.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import subprocess
from pathlib import Path

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    ROLES,
    FreshThirdCarrierCnfEncoding,
    _canonical_json,
)

SCHEMA = "p97-freshthird-qfiber-three-carrier-batched-alternation-probe/v1"
ALTERNATING_PATTERNS = ((True, False, True, False), (False, True, False, True))
FRONTIER_ROLE_SCOPE = (
    "boundaryFanBlockerRowSource0_0",
    "boundaryFanBlockerRowSource0_1",
    "boundaryFanBlockerRowSource0_2",
    "boundaryFanBlockerRowSource1_0",
    "boundaryFanBlockerRowSource1_1",
    "boundaryFanBlockerRowSource1_2",
    "boundaryFanBlockerRowSource2_0",
    "boundaryFanBlockerRowSource2_1",
    "boundaryFanBlockerRowSource2_2",
    "boundaryFanBlockerRowSource3_0",
    "boundaryFanBlockerRowSource3_1",
    "boundaryFanBlockerRowSource3_2",
    "freshCenter",
    "sourceCenter",
)


def no_alternating_cap_clauses(
    encoding: FreshThirdCarrierCnfEncoding,
    role_scope: tuple[str, ...] = FRONTIER_ROLE_SCOPE,
) -> tuple[tuple[int, ...], ...]:
    """Return every four-role, three-cap CNF projection of noAlternatingCap."""

    clauses: list[tuple[int, ...]] = []
    for cap in range(3):
        if any(role not in ROLES for role in role_scope):
            raise ValueError("role scope contains an unknown role")
        for roles in itertools.combinations(role_scope, 4):
            for membership in ALTERNATING_PATTERNS:
                clauses.append(
                    (
                        -encoding.before(roles[0], roles[1]),
                        -encoding.before(roles[1], roles[2]),
                        -encoding.before(roles[2], roles[3]),
                        *tuple(
                            -encoding.in_cap(role, cap)
                            if member
                            else encoding.in_cap(role, cap)
                            for role, member in zip(roles, membership, strict=True)
                        ),
                    )
                )
    return tuple(clauses)


def _parse_model(stdout: bytes, num_vars: int) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in stdout.decode("utf-8", errors="strict").splitlines():
        if not line.startswith("v ") and line != "v":
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal == 0:
                continue
            if not 1 <= abs(literal) <= num_vars:
                raise ValueError("model literal out of range")
            value = literal > 0
            if abs(literal) in assignment and assignment[abs(literal)] != value:
                raise ValueError("conflicting model literal")
            assignment[abs(literal)] = value
    if len(assignment) != num_vars:
        raise ValueError(f"incomplete model: {len(assignment)}/{num_vars}")
    return assignment


def _run_cell(
    boundary_index: int,
    out_dir: Path,
    cadical: str,
    timeout_seconds: int,
) -> dict[str, object]:
    encoding = FreshThirdCarrierCnfEncoding(boundary_index)
    extra = no_alternating_cap_clauses(encoding)
    cnf = encoding.cnf_bytes(extra)
    out_dir.mkdir(parents=True, exist_ok=True)
    cnf_path = out_dir / "query.cnf"
    cnf_path.write_bytes(cnf)
    completed = subprocess.run(
        [cadical, "-q", "-t", str(timeout_seconds), str(cnf_path)],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=timeout_seconds + 5,
        check=False,
    )
    result: dict[str, object] = {
        "boundary_index": boundary_index,
        "schema": SCHEMA,
        "extra_clause_count": len(extra),
        "role_scope": list(FRONTIER_ROLE_SCOPE),
        "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
        "returncode": completed.returncode,
    }
    if completed.returncode != 10:
        result["status"] = "UNSAT" if completed.returncode == 20 else "UNKNOWN"
        return result
    assignment = _parse_model(completed.stdout, encoding.num_vars)
    encoding.validate(assignment)
    replay = encoding.semantic_replay(assignment, timeout_ms=timeout_seconds * 1000)
    result["status"] = "SAT_ABSTRACTION"
    result["semantic_replay"] = {
        "accepted": replay.accepted,
        "detail": replay.detail,
    }
    result["model_signature_sha256"] = hashlib.sha256(
        _canonical_json(encoding.model_signature(assignment))
    ).hexdigest()
    return result


def run(out_dir: Path, cadical: str = "cadical", timeout_seconds: int = 30) -> dict[str, object]:
    results = [
        _run_cell(i, out_dir / f"cell-{i}", cadical, timeout_seconds)
        for i in range(4)
    ]
    report = {"schema": SCHEMA, "results": results}
    (out_dir / "summary.json").write_bytes(_canonical_json(report))
    return report


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--timeout-seconds", type=int, default=30)
    args = parser.parse_args()
    run(args.out_dir, args.cadical, args.timeout_seconds)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
