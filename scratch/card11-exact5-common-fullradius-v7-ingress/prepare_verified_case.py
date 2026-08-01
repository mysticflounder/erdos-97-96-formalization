#!/usr/bin/env python3
"""Materialize a kernel-replayable LRAT ingress from an existing v7 DRAT.

This script never invokes a SAT solver.  It accepts only a hash-bound,
independently DRAT-verified v7 case artifact, extracts a strict input core and
core-relative DRAT in one pass, verifies that DRAT against the core while
emitting LRAT, normalizes the LRAT lemma ids for Lean's checker, and renders a
standalone Lean replay module.

The resulting theorem proves UNSAT only for the frozen core CNF.  The occurrence
map binds every core clause to the exact input-CNF occurrence and manifest block.
It is not the geometric source-to-valuation adapter or the four-case cover.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict, deque
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import time
from typing import Iterable, Iterator


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SCHEMA = "card11_exact5_common_fullradius.v7"
EXPECTED_CASES = {(2, 0), (2, 9), (3, 0), (3, 9)}
EXPECTED_VARIABLES = 49_357
EXPECTED_CLAUSES = 1_370_778
EXPECTED_V7_CLAUSES = 190_080
NORMALIZER = HERE / "normalize_lrat_for_padded_core.py"
V7_PROBE = ROOT / "scratch/card11-exact5-common-fullradius-v7/probe.py"


class IngressError(RuntimeError):
    pass


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def atomic_json(path: Path, value: object) -> None:
    temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}")
    temporary.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    os.replace(temporary, path)


def read_json(path: Path) -> dict:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise IngressError(f"cannot read JSON artifact {path}: {error}") from error
    if not isinstance(value, dict):
        raise IngressError(f"expected JSON object in {path}")
    return value


def dimacs(path: Path) -> tuple[int, int, Iterator[tuple[int, ...]]]:
    """Read DIMACS clauses lazily, including clauses split across lines."""

    source = path.open("r", encoding="ascii")
    header: tuple[int, int] | None = None
    for line in source:
        stripped = line.strip()
        if not stripped or stripped.startswith("c"):
            continue
        fields = stripped.split()
        if fields[:2] != ["p", "cnf"] or len(fields) != 4:
            source.close()
            raise IngressError(f"missing or malformed DIMACS header in {path}")
        header = int(fields[2]), int(fields[3])
        break
    if header is None:
        source.close()
        raise IngressError(f"missing DIMACS header in {path}")

    def clauses() -> Iterator[tuple[int, ...]]:
        pending: list[int] = []
        seen = 0
        try:
            for line_number, line in enumerate(source, start=2):
                stripped = line.strip()
                if not stripped or stripped.startswith("c"):
                    continue
                for token in stripped.split():
                    literal = int(token)
                    if literal == 0:
                        seen += 1
                        yield tuple(pending)
                        pending.clear()
                    else:
                        if abs(literal) > header[0]:
                            raise IngressError(
                                f"{path}:{line_number}: literal outside header domain"
                            )
                        pending.append(literal)
            if pending:
                raise IngressError(f"unterminated final DIMACS clause in {path}")
            if seen != header[1]:
                raise IngressError(
                    f"{path}: header declares {header[1]} clauses, parsed {seen}"
                )
        finally:
            source.close()

    return header[0], header[1], clauses()


def canonical_clause(clause: Iterable[int]) -> tuple[int, ...]:
    return tuple(sorted(clause))


def audit_case(case_dir: Path, *, require_verification: bool) -> dict:
    result_path = case_dir / "result.json"
    manifest_path = case_dir / "manifest.json"
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    for path in (result_path, manifest_path, cnf_path, proof_path):
        if not path.is_file():
            raise IngressError(f"missing artifact: {path}")

    result = read_json(result_path)
    manifest = read_json(manifest_path)
    case = result.get("case", {})
    pair = int(case.get("s", -1)), int(case.get("o", -1))
    if pair not in EXPECTED_CASES:
        raise IngressError(f"unexpected shell case: {pair}")
    if result.get("schema") != SCHEMA or manifest.get("schema") != SCHEMA:
        raise IngressError("unexpected v7 schema")
    if result.get("verdict") != "UNSAT" or int(result.get("returncode", -1)) != 20:
        raise IngressError("case is not a CaDiCaL exit-20 UNSAT artifact")
    if int(result.get("variables", -1)) != EXPECTED_VARIABLES:
        raise IngressError("result variable count drifted")
    if int(result.get("clauses", -1)) != EXPECTED_CLAUSES:
        raise IngressError("result clause count drifted")
    if int(manifest.get("variables", -1)) != EXPECTED_VARIABLES:
        raise IngressError("manifest variable count drifted")
    if int(manifest.get("clauses", -1)) != EXPECTED_CLAUSES:
        raise IngressError("manifest clause count drifted")
    if (
        int(manifest.get("v7_two_center_bisector_parity_clause_count", -1))
        != EXPECTED_V7_CLAUSES
    ):
        raise IngressError("v7 theorem-backed clause count drifted")

    hashes = {
        "input.cnf": sha256_file(cnf_path),
        "manifest.json": sha256_file(manifest_path),
        "proof.drat": sha256_file(proof_path),
    }
    expected_hashes = {
        "input.cnf": result.get("cnf_sha256"),
        "manifest.json": result.get("manifest_sha256"),
        "proof.drat": result.get("proof_sha256"),
    }
    if hashes != expected_hashes:
        raise IngressError("result.json artifact hash mismatch")
    if proof_path.stat().st_size != int(result.get("proof_bytes", -1)):
        raise IngressError("DRAT byte count mismatch")

    variables, clauses, stream = dimacs(cnf_path)
    if variables != EXPECTED_VARIABLES or clauses != EXPECTED_CLAUSES:
        raise IngressError("DIMACS header count drifted")
    # Force structural token/count validation without retaining the 1.37M rows.
    parsed_clauses = sum(1 for _ in stream)

    verification_path = case_dir / "verification.json"
    verification: dict | None = None
    if verification_path.is_file():
        verification = read_json(verification_path)
        if (
            verification.get("verified") is not True
            or verification.get("mode") != "UNSAT-DRAT"
            or verification.get("proof_sha256") != hashes["proof.drat"]
            or verification.get("cnf_sha256") != hashes["input.cnf"]
            or verification.get("manifest_sha256") != hashes["manifest.json"]
        ):
            raise IngressError("independent verification record is not hash-bound")
        exact_line = verification.get("drat_exact_verified_line") is True
        if not exact_line:
            raise IngressError("verification record lacks exact `s VERIFIED`")
    elif require_verification:
        raise IngressError("independent verification.json is required")

    provenance_path = case_dir / "provenance.json"
    provenance_sha256: str | None = None
    source_provenance_current_matches: dict[str, bool] | None = None
    if provenance_path.is_file():
        provenance = read_json(provenance_path)
        if provenance.get("schema") != SCHEMA:
            raise IngressError("provenance schema mismatch")
        artifact_hashes = provenance.get("artifact_hashes", {})
        for name, expected in artifact_hashes.items():
            path = case_dir / name
            if not path.is_file() or sha256_file(path) != expected:
                raise IngressError(f"provenance hash mismatch for {name}")
        provenance_sha256 = sha256_file(provenance_path)
        source_provenance_current_matches = {}
        for name, record in provenance.get("source_provenance", {}).items():
            if not isinstance(record, dict):
                raise IngressError(f"malformed source provenance for {name}")
            source_path = Path(str(record.get("path", "")))
            expected = record.get("sha256")
            source_provenance_current_matches[str(name)] = (
                source_path.is_file()
                and isinstance(expected, str)
                and sha256_file(source_path) == expected
            )
    elif require_verification:
        raise IngressError("provenance.json is required for materialization")

    return {
        "status": (
            "DRAT_VERIFIED_FIXED_CNF"
            if verification is not None
            else "UNVERIFIED_UNSAT_ARTIFACT"
        ),
        "case": {"s": pair[0], "o": pair[1]},
        "schema": SCHEMA,
        "variables": variables,
        "clauses": parsed_clauses,
        "v7_theorem_backed_clauses": EXPECTED_V7_CLAUSES,
        "hashes": hashes,
        "proof_bytes": proof_path.stat().st_size,
        "verification_sha256": (
            sha256_file(verification_path) if verification is not None else None
        ),
        "provenance_sha256": provenance_sha256,
        "source_provenance_current_matches": source_provenance_current_matches,
    }


def finalize_existing_verification(case_dir: Path) -> dict:
    """Complete probe metadata after a verifier-only interrupted serial run."""

    audit = audit_case(case_dir, require_verification=False)
    if audit["status"] != "DRAT_VERIFIED_FIXED_CNF":
        raise IngressError("a completed verified verification.json is required")
    if not V7_PROBE.is_file():
        raise IngressError(f"missing v7 probe: {V7_PROBE}")
    spec = importlib.util.spec_from_file_location(
        "card11_exact5_common_fullradius_v7_finalize", V7_PROBE
    )
    if spec is None or spec.loader is None:
        raise IngressError("cannot load v7 probe for source provenance")
    probe = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = probe
    spec.loader.exec_module(probe)

    verification = read_json(case_dir / "verification.json")
    result = read_json(case_dir / "result.json")
    result["independent_verification"] = verification
    atomic_json(case_dir / "result.json", result)

    artifact_names = (
        "input.cnf",
        "manifest.json",
        "cadical.stdout",
        "cadical.stderr",
        "verification.json",
    )
    for name in artifact_names:
        if not (case_dir / name).is_file():
            raise IngressError(f"cannot finalize without {name}")
    provenance = {
        "schema": SCHEMA,
        "source_provenance": probe.source_provenance(),
        "artifact_hashes": {
            name: sha256_file(case_dir / name) for name in artifact_names
        },
    }
    atomic_json(case_dir / "provenance.json", provenance)
    return audit_case(case_dir, require_verification=True)


def authenticate_core(
    input_cnf: Path,
    core_cnf: Path,
) -> tuple[int, list[tuple[int, ...]], list[int]]:
    """Occurrence-match a core while retaining only the smaller core in RAM."""

    core_variables, core_count, core_stream = dimacs(core_cnf)
    core_clauses = list(core_stream)
    if len(core_clauses) != core_count:
        raise IngressError("core clause count drifted while parsing")
    waiting: dict[tuple[int, ...], deque[int]] = defaultdict(deque)
    for core_index, clause in enumerate(core_clauses):
        waiting[canonical_clause(clause)].append(core_index)

    input_variables, input_count, input_stream = dimacs(input_cnf)
    if input_variables != core_variables:
        raise IngressError("drat-trim changed the DIMACS variable domain")
    core_to_input: list[int | None] = [None] * core_count
    for input_id, clause in enumerate(input_stream, start=1):
        queue = waiting.get(canonical_clause(clause))
        if queue:
            core_to_input[queue.popleft()] = input_id
    missing = [index + 1 for index, value in enumerate(core_to_input) if value is None]
    if missing:
        raise IngressError(
            f"{len(missing)} core clause occurrences are absent from input; "
            f"first core id {missing[0]}"
        )
    if input_count < core_count:
        raise IngressError("trimmed core has more clauses than input")
    return core_variables, core_clauses, [int(value) for value in core_to_input]


def manifest_block_counts(manifest: dict, clause_ids: Iterable[int]) -> dict[str, int]:
    blocks = []
    for block in manifest.get("clause_blocks", []):
        blocks.append(
            (
                int(block["first_clause_1based"]),
                int(block["last_clause_1based"]),
                str(block["name"]),
            )
        )
    blocks.sort()
    counts: Counter[str] = Counter()
    for clause_id in clause_ids:
        matches = [name for first, last, name in blocks if first <= clause_id <= last]
        counts[matches[0] if len(matches) == 1 else "<unclassified-or-overlap>"] += 1
    return dict(sorted(counts.items()))


def exact_line(output: str, value: str) -> bool:
    return value in {line.strip() for line in output.splitlines()}


def run_checked(command: list[str], *, timeout: int, log: Path) -> dict:
    started = time.monotonic()
    completed = subprocess.run(
        command,
        cwd=ROOT,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        timeout=timeout,
        check=False,
    )
    log.write_text(completed.stdout, encoding="utf-8")
    return {
        "command": command,
        "exit_code": completed.returncode,
        "elapsed_seconds": time.monotonic() - started,
        "log_sha256": sha256_file(log),
    }


def lean_name(case: dict) -> str:
    return f"Card11Exact5CommonFullradiusV7S{case['s']}O{case['o']}"


def max_lrat_clause_variable(path: Path) -> int:
    maximum = 0
    with path.open("r", encoding="ascii") as source:
        for line_number, line in enumerate(source, start=1):
            fields = line.split()
            if len(fields) < 2:
                raise IngressError(f"malformed LRAT line {line_number}")
            if fields[1] == "d":
                continue
            try:
                clause_end = fields.index("0", 1)
            except ValueError as error:
                raise IngressError(
                    f"missing LRAT clause terminator on line {line_number}"
                ) from error
            for token in fields[1:clause_end]:
                maximum = max(maximum, abs(int(token)))
    return maximum


def render_lean(
    namespace: str,
    clauses: list[tuple[int, ...]],
    lrat_name: str,
    padding_dimacs_variable: int,
) -> str:
    rows = ",\n".join(
        "  [" + ", ".join(map(str, clause)) + "]" for clause in clauses
    )
    return f"""import Std.Tactic.BVDecide.Reflect

open Std.Sat
open Std.Tactic.BVDecide

namespace Problem97.Card11Exact5CommonFullradiusV7CertificateIngress

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def {namespace}Dimacs : List (List Int) := [
{rows}
]

def {namespace}ToLit (literal : Int) : Nat × Bool :=
  (literal.natAbs - 1, decide (0 < literal))

def {namespace}Cnf : CNF Nat :=
  {namespace}Dimacs.map fun clause => clause.map {namespace}ToLit

/- The verified checker bounds certificate variables by the largest variable in
its input CNF. The core-relative LRAT contains DRAT extension variables, so this
fresh tautology raises that bound without changing the core's models. Its
formula-array slot is included in the normalized LRAT lemma ids. -/
def {namespace}CertificatePadding : CNF Nat :=
  [[({padding_dimacs_variable - 1}, true), ({padding_dimacs_variable - 1}, false)]]

def {namespace}CertificateCnf : CNF Nat :=
  {namespace}Cnf ++ {namespace}CertificatePadding

def {namespace}Lrat : String := include_str "{lrat_name}"

/- Kernel-checked replay against the padded checker CNF. -/
theorem {namespace}CertificateCore_unsat : {namespace}CertificateCnf.Unsat := by
  apply Reflect.verifyCert_correct {namespace}CertificateCnf {namespace}Lrat
  native_decide

/-- Kernel-checked bridge from the frozen core LRAT to the unpadded core-CNF UNSAT.
This does not supply the geometric source-to-valuation or four-case bridge. -/
theorem {namespace}Core_unsat : {namespace}Cnf.Unsat := by
  intro assignment
  have h := {namespace}CertificateCore_unsat assignment
  have hpad :
      CNF.eval assignment {namespace}CertificatePadding = true := by
    cases hvalue : assignment {padding_dimacs_variable - 1} <;>
      simp [{namespace}CertificatePadding, CNF.eval, CNF.Clause.eval, hvalue]
  simpa [{namespace}CertificateCnf, hpad] using h

#print axioms {namespace}Core_unsat

end Problem97.Card11Exact5CommonFullradiusV7CertificateIngress
"""


def _materialize_into(
    case_dir: Path,
    output_dir: Path,
    published_dir: Path,
    timeout: int,
    preserved_stage: Path | None = None,
) -> dict:
    audit = audit_case(case_dir, require_verification=True)
    drat_trim_name = shutil.which("drat-trim")
    if drat_trim_name is None:
        raise IngressError("drat-trim is not on PATH")
    if not NORMALIZER.is_file():
        raise IngressError(f"missing LRAT normalizer: {NORMALIZER}")
    drat_trim = Path(drat_trim_name).resolve()

    output_dir.mkdir(parents=True, exist_ok=True)
    core_cnf = output_dir / "core.cnf"
    core_drat = output_dir / "core.drat"
    raw_lrat = output_dir / "core.raw.lrat"
    normalized_lrat = output_dir / "core.normalized.lrat"
    trim_log = output_dir / "extract-core.log"
    lrat_log = output_dir / "core-to-lrat.log"
    normalize_log = output_dir / "normalize-lrat.log"

    if preserved_stage is not None:
        preserved_stage = preserved_stage.resolve()
        required = (
            "core.cnf",
            "core.drat",
            "core.raw.lrat",
            "extract-core.log",
            "core-to-lrat.log",
        )
        for name in required:
            source = preserved_stage / name
            if not source.is_file():
                raise IngressError(f"missing preserved artifact: {source}")
            shutil.copy2(source, output_dir / name)
        extract = {
            "reused_preserved_stage": str(preserved_stage),
            "log_sha256": sha256_file(trim_log),
        }
    else:
        # One verified pass emits both the strict input core and its
        # core-relative DRAT.
        extract = run_checked(
            [
                str(drat_trim),
                str(case_dir / "input.cnf"),
                str(case_dir / "proof.drat"),
                "-c",
                str(core_cnf),
                "-l",
                str(core_drat),
            ],
            timeout=timeout,
            log=trim_log,
        )
    if extract.get("exit_code", 0) != 0 or not exact_line(
        trim_log.read_text(encoding="utf-8"), "s VERIFIED"
    ):
        raise IngressError("core/DRAT extraction did not end with exact `s VERIFIED`")

    variables, core_clauses, core_to_input = authenticate_core(
        case_dir / "input.cnf", core_cnf
    )
    if preserved_stage is not None:
        core_lrat = {
            "reused_preserved_stage": str(preserved_stage),
            "log_sha256": sha256_file(lrat_log),
        }
    else:
        core_lrat = run_checked(
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
    if core_lrat.get("exit_code", 0) != 0 or not exact_line(
        lrat_log.read_text(encoding="utf-8"), "s VERIFIED"
    ):
        raise IngressError("core-relative DRAT to LRAT did not verify")

    max_certificate_variable = max_lrat_clause_variable(raw_lrat)
    padding_dimacs_variable = max(variables, max_certificate_variable) + 1
    normalize = run_checked(
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
        diagnostic = normalize_log.read_text(
            encoding="utf-8", errors="replace"
        ).splitlines()
        tail = "\n".join(diagnostic[-20:])
        raise IngressError(
            "LRAT normalization failed"
            + (f"; log tail:\n{tail}" if tail else "")
        )

    namespace = lean_name(audit["case"])
    lean_path = output_dir / f"{namespace}Core.lean"
    lean_path.write_text(
        render_lean(
            namespace,
            core_clauses,
            normalized_lrat.name,
            padding_dimacs_variable,
        ),
        encoding="utf-8",
    )
    atomic_json(output_dir / "core-to-input-clause-id.json", core_to_input)
    manifest = read_json(case_dir / "manifest.json")
    report = {
        "status": "LRAT_MATERIALIZED_LEAN_REPLAY_PENDING",
        "claim_scope": (
            "Fixed v7 trimmed-core CNF UNSAT only; source-to-valuation and "
            "four-case cover are not supplied."
        ),
        "input_audit": audit,
        "counts": {
            "input_variables": EXPECTED_VARIABLES,
            "input_clauses": EXPECTED_CLAUSES,
            "core_variables": variables,
            "core_clauses": len(core_clauses),
            "max_certificate_variable": max_certificate_variable,
            "certificate_padding_variable": padding_dimacs_variable,
            "checker_base_clauses": len(core_clauses) + 1,
        },
        "core_clause_count_by_manifest_block": manifest_block_counts(
            manifest, core_to_input
        ),
        "core_to_input_policy": (
            "first available exact signed-literal-multiset occurrence; each "
            "input occurrence is consumed at most once"
        ),
        "artifacts": {
            path.name: {
                "sha256": sha256_file(path),
                "bytes": path.stat().st_size,
            }
            for path in (
                core_cnf,
                core_drat,
                raw_lrat,
                normalized_lrat,
                lean_path,
                output_dir / "core-to-input-clause-id.json",
            )
        },
        "tools": {
            "drat_trim": {
                "path": str(drat_trim),
                "sha256": sha256_file(drat_trim),
            },
            "normalizer": {
                "path": str(NORMALIZER),
                "sha256": sha256_file(NORMALIZER),
            },
        },
        "runs": {
            "extract_core_and_core_relative_drat": extract,
            "verify_core_relative_drat_and_emit_lrat": core_lrat,
            "normalize_lrat": normalize,
        },
        "lean_replay_command": [
            "cd",
            str(ROOT / "lean"),
            "&&",
            "lake",
            "env",
            "lean",
            str(published_dir / lean_path.name),
        ],
        "expected_native_axioms": ["Lean.ofReduceBool", "Lean.trustCompiler"],
    }
    atomic_json(output_dir / "ingress-report.json", report)
    return report


def materialize(
    case_dir: Path,
    output_dir: Path,
    timeout: int,
    preserved_stage: Path | None = None,
) -> dict:
    if output_dir.exists():
        raise IngressError(f"refusing to overwrite existing output dir: {output_dir}")
    stage = output_dir.with_name(
        f".{output_dir.name}.stage-{os.getpid()}-{time.time_ns()}"
    )
    if stage.exists():
        raise IngressError(f"unexpected existing stage dir: {stage}")
    try:
        report = _materialize_into(
            case_dir,
            stage,
            output_dir,
            timeout,
            preserved_stage=preserved_stage,
        )
        os.replace(stage, output_dir)
        return report
    except Exception as error:
        if stage.exists():
            failed = output_dir.with_name(
                f"{output_dir.name}.failed-{os.getpid()}-{time.time_ns()}"
            )
            os.replace(stage, failed)
            raise IngressError(
                f"{error}; partial artifacts and logs preserved at {failed}"
            ) from error
        raise


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("case_dir", type=Path)
    action = parser.add_mutually_exclusive_group()
    action.add_argument("--audit-only", action="store_true")
    action.add_argument("--finalize-existing-verification", action="store_true")
    action.add_argument("--resume-preserved-stage", type=Path)
    parser.add_argument("--output-dir", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=3600)
    args = parser.parse_args()
    case_dir = args.case_dir.resolve()
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")
    if args.audit_only:
        answer = audit_case(case_dir, require_verification=False)
    elif args.finalize_existing_verification:
        answer = finalize_existing_verification(case_dir)
    else:
        output_dir = (
            args.output_dir.resolve()
            if args.output_dir is not None
            else HERE / f"{case_dir.name}-ingress"
        )
        answer = materialize(
            case_dir,
            output_dir,
            args.timeout_seconds,
            preserved_stage=args.resume_preserved_stage,
        )
    print(json.dumps(answer, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
