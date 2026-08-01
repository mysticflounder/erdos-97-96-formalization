"""Exact SAT/DRAT probe for the current Phase-3 base plus DUAL2 and S-MINCUT."""

from __future__ import annotations

import hashlib
import itertools
import json
import os
import subprocess
from datetime import UTC, datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUTPUT = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_dual2_mincut_probe_20260729"
)
BASE_CNF = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_sixcut_supplemental_cube17_v2_20260729/base.cnf"
)
EXPECTED_BASE_CNF_SHA256 = (
    "5cb7f2a0d7ce521ad57c7b1258518fbcfaea72d2b0ccdcca2f0b2f93c49edab9"
)
VARIABLE_COUNT = 204
BASE_CLAUSE_COUNT = 5532


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def s_var(p: int, q: int) -> int:
    if not (0 <= p < 10 and 0 <= q < 10 and p != q):
        raise ValueError(f"invalid selected-shell atom s[{p},{q}]")
    return 1 + 9 * p + (q if q < p else q - 1)


def b_var(x: int, d: int) -> int:
    if not (0 <= x < 10 and 0 <= d < 10 and x != d):
        raise ValueError(f"invalid blocker atom b[{x},{d}]")
    return 91 + 9 * x + (d if d < x else d - 1)


def f_var(x: int, i: int) -> int:
    if not (3 <= x < 10 and 0 <= i < 3):
        raise ValueError(f"invalid cap atom f[{x},{i}]")
    return 181 + 3 * (x - 3) + i


def dual2_clauses() -> list[tuple[int, ...]]:
    n = 10
    clauses: list[tuple[int, ...]] = []
    for a, b in itertools.combinations(range(n), 2):
        centers = [p for p in range(n) if p not in (a, b)]
        for p, q, r in itertools.combinations(centers, 3):
            clauses.append(
                (
                    -s_var(p, a),
                    -s_var(p, b),
                    -s_var(q, a),
                    -s_var(q, b),
                    -s_var(r, a),
                    -s_var(r, b),
                )
            )
    return clauses


def mincut_clauses() -> list[tuple[int, ...]]:
    n = 10
    clauses: list[tuple[int, ...]] = []
    for mask in range(1, (1 << n) - 1):
        inside = [x for x in range(n) if mask & (1 << x)]
        outside = [p for p in range(n) if not mask & (1 << p)]
        clauses.append(
            tuple(s_var(p, x) for p in outside for x in inside)
        )
    return clauses


def parse_model(stdout: str) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in stdout.splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal:
                assignment[abs(literal)] = literal > 0
    return assignment


def validate_base_assignment(
    assignment: dict[int, bool],
) -> tuple[list[list[int]], list[int], dict[int, int]]:
    if any(var not in assignment for var in range(1, VARIABLE_COUNT + 1)):
        raise SystemExit("CaDiCaL model omitted a base variable")
    shells = [
        [q for q in range(10) if q != p and assignment[s_var(p, q)]]
        for p in range(10)
    ]
    if any(len(shell) != 4 for shell in shells):
        raise SystemExit("decoded model violates S-EXACT")
    if any(
        len(set(shells[p]) & set(shells[q])) > 2
        for p, q in itertools.combinations(range(10), 2)
    ):
        raise SystemExit("decoded model violates S-CIRC2")
    blockers: list[int] = []
    for x in range(10):
        chosen = [
            d for d in range(10)
            if d != x and assignment[b_var(x, d)]
        ]
        if len(chosen) != 1 or x not in shells[chosen[0]]:
            raise SystemExit("decoded model violates B-TOTAL/B-MEM")
        blockers.append(chosen[0])
    fibers: dict[int, int] = {}
    for x in range(3, 10):
        chosen = [i for i in range(3) if assignment[f_var(x, i)]]
        if len(chosen) != 1:
            raise SystemExit("decoded model violates CAP-TOTAL")
        fibers[x] = chosen[0]
    counts = sorted(sum(value == i for value in fibers.values()) for i in range(3))
    if counts != [2, 2, 3]:
        raise SystemExit("decoded model violates CAP-PROFILE")
    return shells, blockers, fibers


def main() -> int:
    base_cnf_sha256 = sha256_file(BASE_CNF)
    if base_cnf_sha256 != EXPECTED_BASE_CNF_SHA256:
        raise SystemExit(
            "base CNF hash mismatch: "
            f"{base_cnf_sha256} != {EXPECTED_BASE_CNF_SHA256}"
        )
    if OUTPUT.exists():
        raise SystemExit(f"refusing to reuse output: {OUTPUT}")
    OUTPUT.mkdir(parents=True)

    dual2 = dual2_clauses()
    mincut = mincut_clauses()
    if len(dual2) != 2520 or len(mincut) != 1022:
        raise SystemExit("static clause count mismatch")
    cnf_path = OUTPUT / "base-dual2-mincut.cnf"
    proof_path = OUTPUT / "base-dual2-mincut.drat"
    base_lines = BASE_CNF.read_bytes().splitlines(keepends=True)
    if (
        len(base_lines) < 2
        or base_lines[1] != b"p cnf 204 5532\n"
        or len(base_lines) - 2 != BASE_CLAUSE_COUNT
    ):
        raise SystemExit("frozen base CNF header/body count mismatch")
    added = b"".join(
        (" ".join(str(lit) for lit in clause) + " 0\n").encode()
        for clause in [*dual2, *mincut]
    )
    cnf_path.write_bytes(
        b"c phase3-v0.1+dual2+mincut frozen-base probe\n"
        + f"p cnf {VARIABLE_COUNT} "
          f"{BASE_CLAUSE_COUNT + len(dual2) + len(mincut)}\n".encode()
        + b"".join(base_lines[2:])
        + added
    )

    command = [
        "cadical",
        "-q",
        "-t",
        "3600",
        str(cnf_path),
        str(proof_path),
    ]
    started = datetime.now(UTC)
    result = subprocess.run(
        command,
        cwd=ROOT,
        capture_output=True,
        text=True,
        timeout=3660,
        check=False,
        env={
            **os.environ,
            "OMP_NUM_THREADS": "1",
            "OPENBLAS_NUM_THREADS": "1",
            "MKL_NUM_THREADS": "1",
        },
    )
    verdict = "SAT" if result.returncode == 10 else (
        "UNSAT" if result.returncode == 20 else "UNKNOWN"
    )
    validation: dict[str, object] = {}
    drat_verified = False
    if verdict == "SAT":
        assignment = parse_model(result.stdout)
        shells, blockers, fibers = validate_base_assignment(assignment)
        dual2_ok = all(
            sum(a in shells[p] and b in shells[p] for p in range(10)) <= 2
            for a, b in itertools.combinations(range(10), 2)
        )
        mincut_ok = all(
            any(x in shells[p] for p in range(10) for x in range(10)
                if not mask & (1 << p) and mask & (1 << x))
            for mask in range(1, (1 << 10) - 1)
        )
        if not dual2_ok or not mincut_ok:
            raise SystemExit("decoded SAT model failed independent static checks")
        validation = {
            "decoded": True,
            "dual2": dual2_ok,
            "mincut": mincut_ok,
            "base_assignment_sha256": hashlib.sha256(
                json.dumps(
                    {str(var): assignment[var]
                     for var in range(1, VARIABLE_COUNT + 1)},
                    sort_keys=True,
                    separators=(",", ":"),
                ).encode()
            ).hexdigest(),
        }
        (OUTPUT / "model.json").write_text(
            json.dumps(
                {
                    "true_base_variables": [
                        var for var in range(1, VARIABLE_COUNT + 1)
                        if assignment[var]
                    ],
                    "shells": shells,
                    "blockers": blockers,
                    "cap_fibers": fibers,
                },
                indent=2,
                sort_keys=True,
            )
            + "\n"
        )
        proof_path.unlink(missing_ok=True)
    elif verdict == "UNSAT":
        check = subprocess.run(
            ["drat-trim", str(cnf_path), str(proof_path)],
            cwd=ROOT,
            capture_output=True,
            text=True,
            timeout=3660,
            check=False,
        )
        drat_verified = any(
            line.strip() == "s VERIFIED" for line in check.stdout.splitlines()
        )
        (OUTPUT / "drat-check.txt").write_text(
            check.stdout + "\n" + check.stderr
        )

    manifest = {
        "schema": "p97-phase3-dual2-mincut-probe-v1",
        "started_at": started.isoformat(),
        "finished_at": datetime.now(UTC).isoformat(),
        "frozen_base_cnf": str(BASE_CNF.relative_to(ROOT)),
        "frozen_base_cnf_sha256": base_cnf_sha256,
        "cell": {"k": 4, "n": 10, "profile": [4, 4, 5], "exact": True},
        "base_clause_count": BASE_CLAUSE_COUNT,
        "dual2_clause_count": len(dual2),
        "mincut_clause_count": len(mincut),
        "total_clause_count": BASE_CLAUSE_COUNT + len(dual2) + len(mincut),
        "variable_count": VARIABLE_COUNT,
        "cnf_sha256": sha256_file(cnf_path),
        "verdict": verdict,
        "cadical_returncode": result.returncode,
        "drat_verified": drat_verified,
        "validation": validation,
        "claim": (
            "finite SAT/DRAT probe of the current Phase-3 abstraction plus "
            "static DUAL2 and n=10 S-MINCUT only"
        ),
    }
    (OUTPUT / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(manifest, sort_keys=True))
    if verdict == "UNKNOWN" or (verdict == "UNSAT" and not drat_verified):
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
