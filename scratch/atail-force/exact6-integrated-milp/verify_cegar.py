#!/usr/bin/env python3
"""Independent replay of exact CEGAR cuts and the terminal SAT proof."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

import integrated_milp as integrated
from verify_results import QuietLog


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance loop")
    return tuple(sorted((left, right)))


def vector(name: str) -> dict[tuple[int, int], int]:
    parts = name.split("_")
    values: dict[tuple[int, int], int] = defaultdict(int)
    if parts[0] in {"kal1", "kal2"}:
        a, b, c, d = map(int, parts[1:])
        if not 0 <= a < b < c < d < 14:
            raise ValueError(f"non-cyclic Kalmanson index order: {name}")
        terms = [(a, c, 1), (b, d, 1)]
        terms.extend(
            ((a, b, -1), (c, d, -1))
            if parts[0] == "kal1"
            else ((a, d, -1), (b, c, -1))
        )
    elif parts[0] in {"row", "shell"}:
        center, reference, point = map(int, parts[1:])
        if not all(0 <= item < 14 for item in (center, reference, point)):
            raise ValueError(f"row index outside carrier: {name}")
        if len({center, reference, point}) != 3:
            raise ValueError(f"degenerate row equality: {name}")
        if parts[0] == "shell" and center != 9:
            raise ValueError(f"shell equality at wrong apex: {name}")
        terms = [(center, point, 1), (center, reference, -1)]
    elif parts[0] in {"nonneg", "positive"}:
        left, right = map(int, parts[1:])
        if not 0 <= left < right < 14:
            raise ValueError(f"nonnegative edge order/range failure: {name}")
        terms = [(left, right, 1)]
    else:
        raise ValueError(name)
    for left, right, coefficient in terms:
        values[edge(left, right)] += coefficient
    return {term: value for term, value in values.items() if value}


def verify_cut(cut: dict[str, object]) -> None:
    residual: dict[tuple[int, int], int] = defaultdict(int)
    strict = 0
    memberships = set()
    shell_used = False
    for item in cut["constraints"]:
        name = item["name"]
        multiplier = int(item["multiplier"])
        if name.startswith("kal"):
            if multiplier <= 0:
                raise ValueError(f"bad strict multiplier in {cut['id']}")
            strict += multiplier
        elif name.startswith(("nonneg", "positive")) and multiplier < 0:
            raise ValueError(f"bad distance-lower-bound multiplier in {cut['id']}")
        elif name.startswith("row"):
            _, center, reference, point = name.split("_")
            memberships.update(((int(center), int(reference)), (int(center), int(point))))
        elif name.startswith("shell"):
            shell_used = True
        for term, coefficient in vector(name).items():
            residual[term] += multiplier * coefficient
    if any(residual.values()):
        raise ValueError(f"nonzero residual in {cut['id']}")
    if strict != int(cut["strict_weight_sum"]) or strict <= 0:
        raise ValueError(f"strict sum mismatch in {cut['id']}")
    if memberships != {tuple(item) for item in cut["required_memberships"]}:
        raise ValueError(f"antecedent mismatch in {cut['id']}")
    if any(
        not (0 <= center < 14 and 0 <= point < 14 and center != point)
        for center, point in memberships
    ):
        raise ValueError(f"membership domain failure in {cut['id']}")
    if shell_used != (cut.get("conditioned_shell") is not None):
        raise ValueError(f"shell mismatch in {cut['id']}")
    shell = cut.get("conditioned_shell")
    if shell is not None and (
        len(shell) != 5
        or len(set(shell)) != 5
        or any(not 0 <= point < 14 for point in shell)
        or 9 in shell
    ):
        raise ValueError(f"shell cell domain failure in {cut['id']}")


def cut_clause(encoder, cut: dict[str, object]) -> tuple[int, ...]:
    clause = [
        -encoder.m(int(center), int(point))
        for center, point in cut["required_memberships"]
    ]
    shell = cut.get("conditioned_shell")
    if shell is not None:
        shell_set = set(shell)
        clause.extend(
            -encoder.shell[point] if point in shell_set else encoder.shell[point]
            for point in encoder.shell
        )
    return tuple(clause)


def seed_clause(encoder, artifact: dict[str, object]) -> tuple[int, ...]:
    if not artifact["exact_replay_valid"]:
        raise ValueError("seed exact replay flag is false")
    certificate = artifact["certificate"]
    if certificate["upper_bound_marginals"] or certificate["equality_marginals"]:
        raise ValueError("seed depends on a fixed false literal")
    antecedent = artifact["decoded_dual_support"]["antecedent_true_literals"]
    return tuple(-encoder.v.by_name[item["name"]] for item in antecedent)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--result-dir", required=True, type=Path)
    parser.add_argument("--rerun-drat", action="store_true")
    args = parser.parse_args()
    result = json.loads((args.result_dir / "result.json").read_text(encoding="utf-8"))
    manifest_path = Path(result["run_manifest_path"])
    if not manifest_path.is_absolute():
        manifest_path = integrated.REPO / manifest_path
    if sha256(manifest_path) != result["run_manifest_sha256"]:
        raise ValueError("run manifest hash drift")
    run_manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if (
        run_manifest["orbit"] != result["orbit"]
        or run_manifest["encoder_sha256"] != result["encoder_sha256"]
        or run_manifest["strict_metric_profile"]
        != "positive-distances-plus-strict-Kalmanson"
    ):
        raise ValueError("run manifest semantic drift")
    module = integrated.load_encoder()
    encoder = integrated.build_structural_outer(module, result["orbit"], QuietLog())

    for seed in result["seed_records"]:
        path = integrated.REPO / seed["path"] if not Path(seed["path"]).is_absolute() else Path(seed["path"])
        if sha256(path) != seed["sha256"]:
            raise ValueError(f"seed hash drift: {path}")
        artifact = json.loads(path.read_text(encoding="utf-8"))
        checked_seed = subprocess.run(
            [
                sys.executable,
                str(Path(__file__).with_name("verify_dual_probe.py")),
                "--input",
                str(path),
            ],
            capture_output=True,
            text=True,
            check=False,
        )
        if (
            checked_seed.returncode != 0
            or "INDEPENDENT_EXACT_FIXED_LEAF_DUAL_REPLAY_PASS"
            not in checked_seed.stdout
        ):
            raise ValueError(f"independent seed dual replay failed: {path}")
        clause = seed_clause(encoder, artifact)
        if list(clause) != seed["clause"]:
            raise ValueError(f"seed clause drift: {path}")
        encoder.cnf.add("seed_exact_rational_dual_nogood", clause)

    for imported in result.get("import_records", []):
        path = integrated.REPO / imported["path"] if not Path(imported["path"]).is_absolute() else Path(imported["path"])
        if sha256(path) != imported["sha256"]:
            raise ValueError(f"imported bank hash drift: {path}")
        imported_cuts = [
            json.loads(line) for line in path.read_text(encoding="utf-8").splitlines() if line
        ]
        if len(imported_cuts) != imported["cut_count"]:
            raise ValueError(f"imported bank count drift: {path}")
        for cut in imported_cuts:
            verify_cut(cut)
            encoder.cnf.add("imported_exact_kalmanson_nogood", cut_clause(encoder, cut))

    cuts = [
        json.loads(line)
        for line in (args.result_dir / "cuts.jsonl").read_text(encoding="utf-8").splitlines()
        if line
    ]
    ids = [cut["id"] for cut in cuts]
    if len(ids) != len(set(ids)) or len(cuts) != result["derived_cut_count"]:
        raise ValueError("cut bank count/id drift")
    for cut in cuts:
        verify_cut(cut)
        encoder.cnf.add("derived_exact_kalmanson_nogood", cut_clause(encoder, cut))

    terminal_cnf = args.result_dir / "terminal.cnf"
    expected = module.render_dimacs(encoder.cnf, (
        "schema p97-exact6-integrated-exact-cegar-terminal-v1",
        f"orbit {encoder.orbit}",
        "literal_metric_cut_banks omitted",
    ))
    if terminal_cnf.read_bytes() != expected:
        raise ValueError("terminal CNF is not the deterministic replay")
    terminal = result["terminal"]
    if terminal["verdict"] != "UNSAT_DRAT_VERIFIED":
        raise ValueError("recorded terminal proof is not verified")
    for name, record in terminal["artifacts"].items():
        path = Path(record["path"])
        if not path.is_absolute():
            path = integrated.REPO / path
        if sha256(path) != record["sha256"] or path.stat().st_size != record["bytes"]:
            raise ValueError(f"terminal artifact drift: {name}")
    if args.rerun_drat:
        checked = subprocess.run(
            ["drat-trim", str(terminal_cnf), str(args.result_dir / "terminal.drat")],
            capture_output=True,
            text=True,
            check=False,
        )
        if checked.returncode != 0 or "s VERIFIED" not in (checked.stdout + checked.stderr):
            raise ValueError("independent drat-trim rerun failed")
    print(
        "INDEPENDENT_EXACT_CEGAR_REPLAY_PASS "
        f"orbit={result['orbit']} cuts={len(cuts)} drat_rerun={args.rerun_drat}"
    )


if __name__ == "__main__":
    main()
