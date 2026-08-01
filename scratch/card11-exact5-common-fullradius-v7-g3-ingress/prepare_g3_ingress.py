#!/usr/bin/env python3
"""Materialize a kernel-replayable LRAT ingress for the exact-11 G3 CNF.

This script does not run a SAT solver.  It accepts only the frozen G3 CNF and
DRAT proof, requires a completed independent drat-trim verification log, then:

1. extracts a strict input core and a core-relative DRAT;
2. verifies that DRAT against the core while emitting LRAT;
3. normalizes LRAT clause ids for the padded Lean checker;
4. emits an exact core-to-input occurrence map and standalone Lean replay.

The resulting theorem proves only the frozen G3 core CNF unsatisfiable.  The
source-to-valuation and shell-case-selector bridges remain separate obligations.
"""

from __future__ import annotations

import argparse
from collections import Counter
import importlib.util
import json
import os
from pathlib import Path
import shutil
import sys
import time


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
INPUT_DIR = REPO / "scratch/card11-exact5-common-fullradius-v7-g3"
V7_INGRESS = (
    REPO
    / "scratch/card11-exact5-common-fullradius-v7-ingress"
    / "prepare_verified_case.py"
)
NORMALIZER = (
    REPO
    / "scratch/card11-exact5-common-fullradius-v7-ingress"
    / "normalize_lrat_for_padded_core.py"
)

SCHEMA = "card11_exact5_common_fullradius.v7.g3.v1"
EXPECTED_VARIABLES = 49_360
EXPECTED_CLAUSES = 1_370_871
EXPECTED_INPUT_SHA256 = (
    "17569ab86af1d72db6c66ec385176cc020bd62711cfb2e61953dd3e4d36b4ce8"
)
EXPECTED_PROOF_SHA256 = (
    "22d0677b97a023b080008d196ff1362e408091fd69a2384a9e501d3e9504a4fb"
)
EXPECTED_MANIFEST_SHA256 = (
    "68cd8b809b8662dd9dcdf1522d35777db1c625ddd4dbbf81420ce8feeb57973c"
)
SELECTORS = {
    49_358: "s2_o9",
    49_359: "s3_o0",
    49_360: "s3_o9",
}
LEAN_NAME = "Card11Exact5CommonFullradiusV7G3"


def load_helpers():
    specification = importlib.util.spec_from_file_location(
        "card11_v7_ingress_helpers", V7_INGRESS
    )
    if specification is None or specification.loader is None:
        raise RuntimeError(f"cannot load ingress helpers from {V7_INGRESS}")
    module = importlib.util.module_from_spec(specification)
    specification.loader.exec_module(module)
    return module


HELPERS = load_helpers()


def exact_verified_log(path: Path) -> dict:
    if not path.is_file():
        raise RuntimeError(f"missing independent verification log: {path}")
    output = path.read_text(encoding="utf-8", errors="replace")
    if not HELPERS.exact_line(output, "s VERIFIED"):
        raise RuntimeError("independent verification log lacks exact `s VERIFIED`")
    return {
        "path": str(path),
        "sha256": HELPERS.sha256_file(path),
        "bytes": path.stat().st_size,
        "exact_verified_line": True,
    }


def audit_input(verified_log: Path) -> dict:
    manifest_path = INPUT_DIR / "manifest.json"
    cnf_path = INPUT_DIR / "input.cnf"
    proof_path = INPUT_DIR / "proof.drat"
    for path in (manifest_path, cnf_path, proof_path):
        if not path.is_file():
            raise RuntimeError(f"missing frozen G3 artifact: {path}")

    hashes = {
        "input.cnf": HELPERS.sha256_file(cnf_path),
        "proof.drat": HELPERS.sha256_file(proof_path),
        "manifest.json": HELPERS.sha256_file(manifest_path),
    }
    expected = {
        "input.cnf": EXPECTED_INPUT_SHA256,
        "proof.drat": EXPECTED_PROOF_SHA256,
        "manifest.json": EXPECTED_MANIFEST_SHA256,
    }
    if hashes != expected:
        raise RuntimeError(f"frozen G3 artifact hash drift: {hashes}")

    manifest = HELPERS.read_json(manifest_path)
    if manifest.get("schema") != SCHEMA:
        raise RuntimeError("G3 manifest schema drift")
    if int(manifest.get("variables", -1)) != EXPECTED_VARIABLES:
        raise RuntimeError("G3 manifest variable count drift")
    if int(manifest.get("clauses", -1)) != EXPECTED_CLAUSES:
        raise RuntimeError("G3 manifest clause count drift")
    if manifest.get("output_sha256") != EXPECTED_INPUT_SHA256:
        raise RuntimeError("G3 manifest does not bind the frozen CNF")

    variables, clauses, stream = HELPERS.dimacs(cnf_path)
    parsed = sum(1 for _ in stream)
    if (variables, clauses, parsed) != (
        EXPECTED_VARIABLES,
        EXPECTED_CLAUSES,
        EXPECTED_CLAUSES,
    ):
        raise RuntimeError(
            f"G3 DIMACS drift: variables={variables}, header={clauses}, parsed={parsed}"
        )
    return {
        "schema": SCHEMA,
        "variables": variables,
        "clauses": clauses,
        "hashes": hashes,
        "independent_verification": exact_verified_log(verified_log.resolve()),
    }


def classify_core_occurrences(core_to_input: list[int]) -> dict[str, int]:
    wanted = set(core_to_input)
    counts: Counter[str] = Counter()
    _, _, stream = HELPERS.dimacs(INPUT_DIR / "input.cnf")
    for clause_id, clause in enumerate(stream, start=1):
        if clause_id not in wanted:
            continue
        if clause_id == 1:
            counts["selector_totality"] += 1
            continue
        guards = [
            case
            for selector, case in SELECTORS.items()
            if -selector in clause
        ]
        if not guards:
            counts["all_four_common_position"] += 1
        elif len(guards) == 1:
            counts[f"selector_guarded_{guards[0]}"] += 1
        else:
            counts["malformed_multiple_selector_guards"] += 1
    if sum(counts.values()) != len(core_to_input):
        raise RuntimeError("failed to classify every authenticated core occurrence")
    if counts.get("malformed_multiple_selector_guards", 0):
        raise RuntimeError("core contains a clause with multiple selector guards")
    return dict(sorted(counts.items()))


def run_materialization(output_dir: Path, verified_log: Path, timeout: int) -> dict:
    if output_dir.exists():
        raise RuntimeError(f"refusing to overwrite existing output: {output_dir}")
    audit = audit_input(verified_log)
    drat_trim_name = shutil.which("drat-trim")
    if drat_trim_name is None:
        raise RuntimeError("drat-trim is not on PATH")
    if not NORMALIZER.is_file():
        raise RuntimeError(f"missing LRAT normalizer: {NORMALIZER}")
    drat_trim = Path(drat_trim_name).resolve()

    stage = output_dir.with_name(
        f".{output_dir.name}.stage-{os.getpid()}-{time.time_ns()}"
    )
    stage.mkdir(parents=True)
    try:
        core_cnf = stage / "core.cnf"
        core_drat = stage / "core.drat"
        raw_lrat = stage / "core.raw.lrat"
        normalized_lrat = stage / "core.normalized.lrat"
        extract_log = stage / "extract-core.log"
        lrat_log = stage / "core-to-lrat.log"
        normalize_log = stage / "normalize-lrat.log"

        extract = HELPERS.run_checked(
            [
                str(drat_trim),
                str(INPUT_DIR / "input.cnf"),
                str(INPUT_DIR / "proof.drat"),
                "-c",
                str(core_cnf),
                "-l",
                str(core_drat),
            ],
            timeout=timeout,
            log=extract_log,
        )
        if extract["exit_code"] != 0 or not HELPERS.exact_line(
            extract_log.read_text(encoding="utf-8"), "s VERIFIED"
        ):
            raise RuntimeError("G3 core/DRAT extraction did not verify")

        variables, core_clauses, core_to_input = HELPERS.authenticate_core(
            INPUT_DIR / "input.cnf", core_cnf
        )
        core_lrat = HELPERS.run_checked(
            [
                str(drat_trim),
                str(core_cnf),
                str(core_drat),
                "-L",
                str(raw_lrat),
            ],
            timeout=timeout,
            log=lrat_log,
        )
        if core_lrat["exit_code"] != 0 or not HELPERS.exact_line(
            lrat_log.read_text(encoding="utf-8"), "s VERIFIED"
        ):
            raise RuntimeError("G3 core-relative DRAT to LRAT did not verify")

        max_certificate_variable = HELPERS.max_lrat_clause_variable(raw_lrat)
        padding_variable = max(variables, max_certificate_variable) + 1
        normalize = HELPERS.run_checked(
            [
                sys.executable,
                str(NORMALIZER),
                str(raw_lrat),
                str(normalized_lrat),
                "--source-base-clauses",
                str(len(core_clauses)),
                "--checker-base-clauses",
                str(len(core_clauses) + 1),
            ],
            timeout=timeout,
            log=normalize_log,
        )
        if normalize["exit_code"] != 0 or not normalized_lrat.is_file():
            raise RuntimeError("G3 LRAT normalization failed")

        lean_path = stage / f"{LEAN_NAME}Core.lean"
        lean_path.write_text(
            HELPERS.render_lean(
                LEAN_NAME,
                core_clauses,
                normalized_lrat.name,
                padding_variable,
            ),
            encoding="utf-8",
        )
        map_path = stage / "core-to-input-clause-id.json"
        HELPERS.atomic_json(map_path, core_to_input)

        report = {
            "status": "LRAT_MATERIALIZED_LEAN_REPLAY_PENDING",
            "claim_scope": (
                "Frozen G3 trimmed-core CNF UNSAT only; source valuation and "
                "shell-case selector coverage are not supplied."
            ),
            "input_audit": audit,
            "counts": {
                "input_variables": EXPECTED_VARIABLES,
                "input_clauses": EXPECTED_CLAUSES,
                "core_variables": variables,
                "core_clauses": len(core_clauses),
                "max_certificate_variable": max_certificate_variable,
                "certificate_padding_variable": padding_variable,
                "checker_base_clauses": len(core_clauses) + 1,
            },
            "core_clause_count_by_g3_kind": classify_core_occurrences(core_to_input),
            "core_to_input_policy": (
                "first available exact signed-literal-multiset occurrence; "
                "each input occurrence is consumed at most once"
            ),
            "artifacts": {
                path.name: {
                    "sha256": HELPERS.sha256_file(path),
                    "bytes": path.stat().st_size,
                }
                for path in (
                    core_cnf,
                    core_drat,
                    raw_lrat,
                    normalized_lrat,
                    lean_path,
                    map_path,
                )
            },
            "tools": {
                "drat_trim": {
                    "path": str(drat_trim),
                    "sha256": HELPERS.sha256_file(drat_trim),
                },
                "normalizer": {
                    "path": str(NORMALIZER),
                    "sha256": HELPERS.sha256_file(NORMALIZER),
                },
            },
            "runs": {
                "extract_core_and_core_relative_drat": extract,
                "verify_core_relative_drat_and_emit_lrat": core_lrat,
                "normalize_lrat": normalize,
            },
            "lean_replay_command": [
                "cd",
                str(REPO / "lean"),
                "&&",
                "lake",
                "env",
                "lean",
                str(output_dir / lean_path.name),
            ],
            "expected_native_axioms": ["Lean.ofReduceBool", "Lean.trustCompiler"],
        }
        HELPERS.atomic_json(stage / "ingress-report.json", report)
        os.replace(stage, output_dir)
        return report
    except Exception:
        if stage.exists():
            failed = output_dir.with_name(
                f"{output_dir.name}.failed-{os.getpid()}-{time.time_ns()}"
            )
            os.replace(stage, failed)
        raise


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--verified-log",
        type=Path,
        required=True,
        help="completed independent drat-trim log containing exact `s VERIFIED`",
    )
    parser.add_argument(
        "--out",
        type=Path,
        default=HERE / "g3-ingress",
    )
    parser.add_argument("--timeout", type=int, default=86_400)
    parser.add_argument(
        "--audit-only",
        action="store_true",
        help="hash/count/log audit without running drat-trim",
    )
    args = parser.parse_args()
    if args.audit_only:
        print(json.dumps(audit_input(args.verified_log), indent=2, sort_keys=True))
        return 0
    report = run_materialization(
        args.out.resolve(), args.verified_log.resolve(), args.timeout
    )
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
