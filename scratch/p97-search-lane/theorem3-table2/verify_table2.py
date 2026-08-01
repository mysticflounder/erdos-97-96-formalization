#!/usr/bin/env python3
"""Certificate-producing verifier for a pinned transcription of FR Table 2.

The semantic variables x[r,c] are the entries of an alpha-by-beta 0-1
matrix.  A clause is emitted for every occurrence of a Figure-4 pattern:

* P1 and both P2 variants;
* the complete lettered P3 family, including row case R2, and its transpose;
* the two source P4 variants for every k >= 3.

Blank cells in a pattern are unconstrained.  Thus the pattern clauses encode
the current ledger transcription of the paper's monotone "has none of the
Fig. 4 patterns among its submatrices" predicate.  The 6x8 Table-2 claim
currently has a 19-one countermodel under this transcription, so this module
must not be described as an exact verifier of the paper until that discrepancy
is resolved.  The production census rule bank is intentionally not
imported: its R-P3 omits the geometrically open R2 case, and ALL_RULES contains
non-paper rules.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import time
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Iterable, Iterator, Sequence


TABLE2: dict[tuple[int, int], int] = {
    (1, b): b for b in range(1, 16)
} | {
    (2, b): b + 1 for b in range(2, 16)
} | {
    (3, b): b + 3 for b in range(3, 16)
} | {
    (4, 4): 9,
    (4, 5): 10,
    (4, 6): 12,
    (4, 7): 13,
    (4, 8): 14,
    (4, 9): 15,
    (4, 10): 16,
    (4, 11): 17,
    (4, 12): 18,
    (4, 13): 19,
    (4, 14): 20,
    (4, 15): 21,
    (5, 5): 12,
    (5, 6): 14,
    (5, 7): 15,
    (5, 8): 17,
    (5, 9): 18,
    (5, 10): 20,
    (5, 11): 21,
    (5, 12): 22,
    (5, 13): 23,
    (5, 14): 24,
    (5, 15): 25,
    (6, 6): 15,
    (6, 7): 17,
    (6, 8): 18,
    (6, 9): 20,
    (6, 10): 21,
    (6, 11): 22,
    (6, 12): 24,
    (6, 13): 26,
    (6, 14): 28,
    (6, 15): 30,
}


@dataclass
class CNF:
    nvars: int
    clauses: list[tuple[int, ...]]
    tags: dict[str, int]

    @classmethod
    def with_semantic_vars(cls, count: int) -> "CNF":
        return cls(count, [], {})

    def new_var(self) -> int:
        self.nvars += 1
        return self.nvars

    def add(self, clause: Iterable[int], tag: str) -> None:
        item = tuple(clause)
        if any(lit == 0 or abs(lit) > self.nvars for lit in item):
            raise ValueError(f"bad clause {item!r} with nvars={self.nvars}")
        self.clauses.append(item)
        self.tags[tag] = self.tags.get(tag, 0) + 1

    def add_at_least(self, variables: Sequence[int], target: int) -> None:
        """Witness-DP encoding of sum(variables) >= target.

        q(i,j) may be true only if at least j of the first i inputs are true.
        Only the reverse implication is needed because q(n,target) is asserted.
        """
        if target <= 0:
            return
        if target > len(variables):
            self.add((), "CARD")
            return
        previous: dict[int, int] = {}
        for i, x in enumerate(variables, start=1):
            current: dict[int, int] = {}
            for j in range(1, min(i, target) + 1):
                q = self.new_var()
                current[j] = q
                a = previous.get(j)  # already had j before x
                b_true = j == 1
                b = previous.get(j - 1) if j > 1 else None
                # q -> a or b
                if not b_true:
                    self.add((-q, *(v for v in (a, b) if v is not None)), "CARD")
                # q -> a or x
                self.add((-q, *(v for v in (a,) if v is not None), x), "CARD")
            previous = current
        self.add((previous[target],), "CARD")

    def write(self, path: Path) -> str:
        data = (
            f"p cnf {self.nvars} {len(self.clauses)}\n"
            + "".join(" ".join(map(str, clause)) + " 0\n" for clause in self.clauses)
        )
        path.write_text(data)
        return hashlib.sha256(data.encode()).hexdigest()


def cell_var(beta: int, row: int, col: int) -> int:
    return row * beta + col + 1


def p1_occurrences(alpha: int, beta: int) -> Iterator[frozenset[tuple[int, int]]]:
    for rows in combinations(range(alpha), 2):
        for cols in combinations(range(beta), 2):
            yield frozenset((r, c) for r in rows for c in cols)


P2_A = ((0, 0), (0, 1), (1, 2), (2, 0), (2, 2))
P2_B = ((0, 0), (0, 2), (1, 0), (2, 1), (2, 2))


def p2_occurrences(alpha: int, beta: int) -> Iterator[frozenset[tuple[int, int]]]:
    for rows in combinations(range(alpha), 3):
        for cols in combinations(range(beta), 3):
            for pattern in (P2_A, P2_B):
                yield frozenset((rows[r], cols[c]) for r, c in pattern)


def _p3_orientation_1(
    alpha: int, beta: int
) -> Iterator[frozenset[tuple[int, int]]]:
    """The paper's lettered P3 family in its first orientation."""
    for ra in range(alpha):
        for rb in range(ra + 1, alpha):
            for rc in range(ra + 1, alpha):
                for rd in range(max(rb, rc) + 1, alpha):
                    for c1 in range(beta):
                        for ck in range(c1 + 1, beta):
                            for ch in range(ck, beta):
                                for c2 in range(ch + 1, beta):
                                    yield frozenset(
                                        (
                                            (ra, c1),
                                            (ra, ck),
                                            (rb, c1),
                                            (rc, c2),
                                            (rd, c2),
                                            (rd, ch),
                                        )
                                    )


def p3_occurrences(alpha: int, beta: int) -> Iterator[frozenset[tuple[int, int]]]:
    seen: set[frozenset[tuple[int, int]]] = set()
    for occurrence in _p3_orientation_1(alpha, beta):
        if occurrence not in seen:
            seen.add(occurrence)
            yield occurrence
    for transposed in _p3_orientation_1(beta, alpha):
        occurrence = frozenset((c, r) for r, c in transposed)
        if occurrence not in seen:
            seen.add(occurrence)
            yield occurrence


def p4_relative(k: int, variant: str) -> tuple[tuple[int, int], ...]:
    if variant == "A":
        return tuple(
            cell
            for i in range(k - 1)
            for cell in ((i, k - 2 - i), (i, k - 1 - i))
        ) + ((k - 1, 0), (k - 1, k - 1))
    if variant == "B":
        return ((0, 0), (0, k - 1)) + tuple(
            cell
            for i in range(1, k)
            for cell in ((i, k - 1 - i), (i, k - i))
        )
    raise ValueError(variant)


def p4_occurrences(alpha: int, beta: int) -> Iterator[frozenset[tuple[int, int]]]:
    for k in range(3, min(alpha, beta) + 1):
        for rows in combinations(range(alpha), k):
            for cols in combinations(range(beta), k):
                for variant in ("A", "B"):
                    yield frozenset(
                        (rows[r], cols[c]) for r, c in p4_relative(k, variant)
                    )


PATTERN_GENERATORS = (
    ("P1", p1_occurrences),
    ("P2", p2_occurrences),
    ("P3", p3_occurrences),
    ("P4", p4_occurrences),
)


def pattern_occurrences(
    alpha: int, beta: int
) -> Iterator[tuple[str, frozenset[tuple[int, int]]]]:
    seen: set[frozenset[tuple[int, int]]] = set()
    for tag, generator in PATTERN_GENERATORS:
        for occurrence in generator(alpha, beta):
            # A duplicate forbidden clause is semantically redundant.  Keep
            # the first tag in P1--P4 order for deterministic manifests.
            if occurrence not in seen:
                seen.add(occurrence)
                yield tag, occurrence


def direct_pattern_hits(
    matrix: Sequence[Sequence[int]],
) -> list[tuple[str, frozenset[tuple[int, int]]]]:
    alpha = len(matrix)
    beta = len(matrix[0]) if matrix else 0
    return [
        (tag, cells)
        for tag, cells in pattern_occurrences(alpha, beta)
        if all(matrix[r][c] for r, c in cells)
    ]


def make_cnf(alpha: int, beta: int, at_least: int) -> CNF:
    semantic_count = alpha * beta
    cnf = CNF.with_semantic_vars(semantic_count)
    for tag, cells in pattern_occurrences(alpha, beta):
        cnf.add((-cell_var(beta, r, c) for r, c in sorted(cells)), tag)
    cnf.add_at_least(tuple(range(1, semantic_count + 1)), at_least)
    return cnf


def parse_assignment(output: str) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in output.splitlines():
        if line.startswith("v "):
            for token in line[2:].split():
                lit = int(token)
                if lit:
                    assignment[abs(lit)] = lit > 0
    return assignment


def run_solver(cnf_path: Path, proof_path: Path | None, timeout_s: int) -> dict:
    command = ["cadical", "-q", "-t", str(timeout_s), str(cnf_path)]
    if proof_path is not None:
        command.append(str(proof_path))
    started = time.monotonic()
    proc = subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=timeout_s + 30,
        check=False,
    )
    elapsed = time.monotonic() - started
    verdict = {10: "SAT", 20: "UNSAT", 0: "UNKNOWN"}.get(
        proc.returncode, f"ERROR-{proc.returncode}"
    )
    return {
        "command": command,
        "elapsed_s": elapsed,
        "returncode": proc.returncode,
        "verdict": verdict,
        "stdout": proc.stdout,
        "stderr": proc.stderr,
    }


def check_drat(cnf_path: Path, proof_path: Path, timeout_s: int) -> dict:
    started = time.monotonic()
    proc = subprocess.run(
        ["drat-trim", str(cnf_path), str(proof_path)],
        capture_output=True,
        text=True,
        timeout=timeout_s + 30,
        check=False,
    )
    elapsed = time.monotonic() - started
    output = proc.stdout + proc.stderr
    verified_marker = any(
        line.strip() == "s VERIFIED" for line in output.splitlines()
    )
    return {
        "elapsed_s": elapsed,
        "returncode": proc.returncode,
        "verified": proc.returncode == 0 and verified_marker,
        "output": output,
    }


def matrix_from_assignment(
    alpha: int, beta: int, assignment: dict[int, bool]
) -> list[list[int]]:
    return [
        [int(assignment.get(cell_var(beta, r, c), False)) for c in range(beta)]
        for r in range(alpha)
    ]


def verify_case(
    root: Path, alpha: int, beta: int, claimed: int, timeout_s: int
) -> dict:
    case_dir = root / f"a{alpha}-b{beta}-g{claimed}"
    case_dir.mkdir(parents=True, exist_ok=True)
    result: dict = {
        "alpha": alpha,
        "beta": beta,
        "claimed_g": claimed,
        "predicate": "candidate-FR-Figure-4-P1-P4-full-P3-source-P4",
    }

    lower_cnf = make_cnf(alpha, beta, claimed)
    lower_path = case_dir / "lower.cnf"
    result["lower"] = {
        "vars": lower_cnf.nvars,
        "clauses": len(lower_cnf.clauses),
        "clause_tags": lower_cnf.tags,
        "cnf_sha256": lower_cnf.write(lower_path),
    }
    lower_run = run_solver(lower_path, None, timeout_s)
    (case_dir / "lower.solver.log").write_text(
        lower_run.pop("stdout") + lower_run.pop("stderr")
    )
    result["lower"].update(lower_run)
    if lower_run["verdict"] == "SAT":
        log = (case_dir / "lower.solver.log").read_text()
        assignment = parse_assignment(log)
        matrix = matrix_from_assignment(alpha, beta, assignment)
        ones = sum(map(sum, matrix))
        hits = direct_pattern_hits(matrix)
        model_ok = ones >= claimed and not hits
        (case_dir / "lower.model.txt").write_text(
            "\n".join("".join(map(str, row)) for row in matrix) + "\n"
        )
        result["lower"].update(
            {
                "semantic_ones": ones,
                "direct_model_check": model_ok,
                "direct_pattern_hits": len(hits),
            }
        )

    upper_cnf = make_cnf(alpha, beta, claimed + 1)
    upper_path = case_dir / "upper.cnf"
    proof_path = case_dir / "upper.drat"
    result["upper"] = {
        "vars": upper_cnf.nvars,
        "clauses": len(upper_cnf.clauses),
        "clause_tags": upper_cnf.tags,
        "cnf_sha256": upper_cnf.write(upper_path),
    }
    upper_run = run_solver(upper_path, proof_path, timeout_s)
    (case_dir / "upper.solver.log").write_text(
        upper_run.pop("stdout") + upper_run.pop("stderr")
    )
    result["upper"].update(upper_run)
    if upper_run["verdict"] == "UNSAT":
        drat = check_drat(upper_path, proof_path, timeout_s)
        (case_dir / "upper.drat.check").write_text(drat.pop("output"))
        result["upper"]["drat"] = drat
    elif upper_run["verdict"] == "SAT":
        log = (case_dir / "upper.solver.log").read_text()
        assignment = parse_assignment(log)
        matrix = matrix_from_assignment(alpha, beta, assignment)
        ones = sum(map(sum, matrix))
        hits = direct_pattern_hits(matrix)
        model_ok = ones >= claimed + 1 and not hits
        (case_dir / "upper.model.txt").write_text(
            "\n".join("".join(map(str, row)) for row in matrix) + "\n"
        )
        result["upper"].update(
            {
                "semantic_ones": ones,
                "direct_model_check": model_ok,
                "direct_pattern_hits": len(hits),
            }
        )

    result["status"] = (
        "CERTIFIED-CANDIDATE-TRANSCRIPTION"
        if result["lower"].get("verdict") == "SAT"
        and result["lower"].get("direct_model_check") is True
        and result["upper"].get("verdict") == "UNSAT"
        and result["upper"].get("drat", {}).get("verified") is True
        else "INCOMPLETE"
    )
    (case_dir / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    return result


def parse_case(text: str) -> tuple[int, int, int]:
    match = re.fullmatch(r"(\d+)x(\d+)(?:=(\d+))?", text)
    if not match:
        raise argparse.ArgumentTypeError("case must be ALPHAxBETA[=G]")
    alpha, beta = int(match[1]), int(match[2])
    claimed = int(match[3]) if match[3] else TABLE2.get((alpha, beta))
    if claimed is None:
        raise argparse.ArgumentTypeError(f"no built-in Table 2 value for {text}")
    return alpha, beta, claimed


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "cases", nargs="+", type=parse_case, help="ALPHAxBETA[=G], e.g. 6x8"
    )
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--out", type=Path, default=Path(__file__).parent / "runs")
    args = parser.parse_args()
    summaries = []
    for alpha, beta, claimed in args.cases:
        result = verify_case(args.out, alpha, beta, claimed, args.timeout)
        summaries.append(
            {
                "case": f"{alpha}x{beta}",
                "claimed_g": claimed,
                "status": result["status"],
                "lower_s": round(result["lower"]["elapsed_s"], 3),
                "upper_s": round(result["upper"]["elapsed_s"], 3),
                "upper_drat": result["upper"].get("drat", {}).get("verified", False),
            }
        )
        print(json.dumps(summaries[-1], sort_keys=True), flush=True)
    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / "summary.json").write_text(json.dumps(summaries, indent=2) + "\n")
    return (
        0
        if all(
            row["status"] == "CERTIFIED-CANDIDATE-TRANSCRIPTION"
            for row in summaries
        )
        else 1
    )


if __name__ == "__main__":
    raise SystemExit(main())
