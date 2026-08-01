#!/usr/bin/env python3
"""Authenticate and adapt the exact-11 G3 pure-RUP ingress for window replay.

The completed ``g3-ingress/`` directory is the provenance anchor.  Its current
LRAT contains RAT lemmas and is therefore deliberately rejected as a replay
input.  A separate, externally verified pure-RUP run may be supplied through a
``pure-rup-report.json``.  No legacy P4/P5 certificate schema is synthesized.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import sys
import tempfile
from typing import Any


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
P5_DIR = REPO / "scratch/atail-force/unique4-exact-two-lrat-ingress"
PROVENANCE_SCHEMA = "card11_exact5_common_fullradius.v7.g3.v1"
PURE_RUP_SCHEMA = "card11_exact5_common_fullradius.v7.g3.pure-rup.v1"
PLAN_SCHEMA = "card11_exact5_common_fullradius.v7.g3.windowed-plan.v1"

EXPECTED_INPUT_SHA256 = (
    "17569ab86af1d72db6c66ec385176cc020bd62711cfb2e61953dd3e4d36b4ce8"
)
EXPECTED_CORE_SHA256 = (
    "310b30d0b9ad2787599ee9b0edce999edfb333934901ca578734182076771683"
)
EXPECTED_MAP_SHA256 = (
    "dc3cdc485465e203165361eeb99b792072a98fafebee73795fb15774132e9004"
)
EXPECTED_RAT_LRAT_SHA256 = (
    "433bb5ed869235107c6e3ffef0c4330aba6c7fff487b879c454a7b1dbd9ba74a"
)
EXPECTED_PURE_RUP_DRAT_SHA256 = (
    "85d5fde40d58a64e58daac312933c38b26cc027b1b60289bde6204434d55ae69"
)
EXPECTED_PURE_RUP_RAW_LRAT_SHA256 = (
    "6c9d62e8a3b46054f61bcd17b6faf8695604f8e9635231c3dc9eef2e5fd61c4f"
)
EXPECTED_CORE_CLAUSES = 273_017
EXPECTED_INPUT_CLAUSES = 1_370_871
EXPECTED_INPUT_VARIABLES = 49_360
EXPECTED_CHECKER_BASE = 273_018
EXPECTED_PADDING_VARIABLE = 96_418
EXPECTED_MAX_CERTIFICATE_VARIABLE = 96_417


class AdapterError(RuntimeError):
    """An ingress or provenance invariant failed closed."""


@dataclass(frozen=True)
class FileRecord:
    path: Path
    byte_count: int
    sha256: str

    def as_json(self) -> dict[str, Any]:
        return {
            "path": str(self.path),
            "byte_count": self.byte_count,
            "sha256": self.sha256,
        }


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def file_record(path: Path) -> FileRecord:
    path = path.resolve()
    if path.is_symlink() or not path.is_file():
        raise AdapterError(f"missing non-symlink artifact: {path}")
    return FileRecord(path, path.stat().st_size, sha256_file(path))


def read_json_object(path: Path, *, label: str) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise AdapterError(f"cannot read {label}: {path}") from exc
    if not isinstance(value, dict):
        raise AdapterError(f"{label} is not a JSON object")
    return value


def require_int(value: object, expected: int, *, label: str) -> None:
    if type(value) is not int or value != expected:
        raise AdapterError(f"{label} drift: expected {expected}, got {value!r}")


def require_equal(value: object, expected: object, *, label: str) -> None:
    if value != expected:
        raise AdapterError(f"{label} drift: expected {expected!r}, got {value!r}")


def artifact_from_report(
    ingress_dir: Path,
    report: dict[str, Any],
    name: str,
    expected_sha256: str,
) -> FileRecord:
    artifacts = report.get("artifacts")
    if not isinstance(artifacts, dict) or not isinstance(artifacts.get(name), dict):
        raise AdapterError(f"ingress report lacks artifact record {name!r}")
    expected = artifacts[name]
    require_equal(expected.get("sha256"), expected_sha256, label=f"{name} report SHA-256")
    record = file_record(ingress_dir / name)
    require_int(expected.get("bytes"), record.byte_count, label=f"{name} report byte count")
    require_equal(record.sha256, expected_sha256, label=f"{name} artifact SHA-256")
    return record


def parse_dimacs_header(path: Path) -> tuple[int, int]:
    try:
        with path.open("r", encoding="ascii") as stream:
            for line in stream:
                if line.startswith("c") or not line.strip():
                    continue
                fields = line.split()
                if len(fields) == 4 and fields[:2] == ["p", "cnf"]:
                    return int(fields[2]), int(fields[3])
                raise AdapterError(f"malformed DIMACS header in {path}")
    except (OSError, UnicodeDecodeError, ValueError) as exc:
        raise AdapterError(f"cannot read DIMACS header: {path}") from exc
    raise AdapterError(f"missing DIMACS header: {path}")


def validate_occurrence_map(path: Path) -> tuple[FileRecord, int]:
    record = file_record(path)
    require_equal(record.sha256, EXPECTED_MAP_SHA256, label="core-to-input map SHA-256")
    try:
        values = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise AdapterError("cannot parse core-to-input occurrence map") from exc
    if not isinstance(values, list):
        raise AdapterError("core-to-input occurrence map is not a list")
    if len(values) != EXPECTED_CORE_CLAUSES:
        raise AdapterError("core-to-input occurrence map length drift")
    if any(type(value) is not int for value in values):
        raise AdapterError("core-to-input occurrence map contains a non-integer")
    if any(value < 1 or value > EXPECTED_INPUT_CLAUSES for value in values):
        raise AdapterError("core-to-input occurrence map contains an out-of-range id")
    if len(set(values)) != len(values):
        raise AdapterError("core-to-input occurrence map is not injective")
    return record, len(values)


RAT_RE = re.compile(r"^c\s+(\d+)\s+RAT lemmas in core;", re.MULTILINE)
CORE_LOG_RE = re.compile(
    r"^c\s+(\d+)\s+of\s+(\d+)\s+clauses in core\s*$", re.MULTILINE
)
NORMALIZE_RE = re.compile(
    r"^kept_additions=(\d+) retained_deletions=(\d+) "
    r"source_base_clauses=(\d+) checker_base_clauses=(\d+) "
    r"dense_id_range=(\d+)\.\.(\d+) max_certificate_variable=(\d+)\s*$"
)


def validate_log(
    path: Path,
    expected_sha256: object,
    *,
    label: str,
) -> tuple[FileRecord, str]:
    record = file_record(path)
    require_equal(record.sha256, expected_sha256, label=f"{label} SHA-256")
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError) as exc:
        raise AdapterError(f"cannot decode {label}") from exc
    return record, text


def validate_provenance_ingress(
    ingress_dir: Path,
    input_cnf: Path,
) -> dict[str, Any]:
    ingress_dir = ingress_dir.resolve()
    report_record = file_record(ingress_dir / "ingress-report.json")
    report = read_json_object(report_record.path, label="G3 ingress report")
    require_equal(
        report.get("status"),
        "LRAT_MATERIALIZED_LEAN_REPLAY_PENDING",
        label="ingress status",
    )
    audit = report.get("input_audit")
    if not isinstance(audit, dict):
        raise AdapterError("ingress report lacks input_audit")
    require_equal(audit.get("schema"), PROVENANCE_SCHEMA, label="input audit schema")
    require_int(audit.get("variables"), EXPECTED_INPUT_VARIABLES, label="input variables")
    require_int(audit.get("clauses"), EXPECTED_INPUT_CLAUSES, label="input clauses")
    hashes = audit.get("hashes")
    if not isinstance(hashes, dict):
        raise AdapterError("input audit lacks hashes")
    require_equal(hashes.get("input.cnf"), EXPECTED_INPUT_SHA256, label="input report SHA-256")

    counts = report.get("counts")
    if not isinstance(counts, dict):
        raise AdapterError("ingress report lacks counts")
    for key, expected in (
        ("input_variables", EXPECTED_INPUT_VARIABLES),
        ("input_clauses", EXPECTED_INPUT_CLAUSES),
        ("core_variables", EXPECTED_INPUT_VARIABLES),
        ("core_clauses", EXPECTED_CORE_CLAUSES),
        ("checker_base_clauses", EXPECTED_CHECKER_BASE),
        ("certificate_padding_variable", EXPECTED_PADDING_VARIABLE),
        ("max_certificate_variable", EXPECTED_MAX_CERTIFICATE_VARIABLE),
    ):
        require_int(counts.get(key), expected, label=f"counts.{key}")

    input_record = file_record(input_cnf)
    require_equal(input_record.sha256, EXPECTED_INPUT_SHA256, label="input CNF SHA-256")
    require_equal(
        parse_dimacs_header(input_record.path),
        (EXPECTED_INPUT_VARIABLES, EXPECTED_INPUT_CLAUSES),
        label="input CNF header",
    )
    core_record = artifact_from_report(
        ingress_dir, report, "core.cnf", EXPECTED_CORE_SHA256
    )
    require_equal(
        parse_dimacs_header(core_record.path),
        (EXPECTED_INPUT_VARIABLES, EXPECTED_CORE_CLAUSES),
        label="core CNF header",
    )
    rat_lrat_record = artifact_from_report(
        ingress_dir,
        report,
        "core.normalized.lrat",
        EXPECTED_RAT_LRAT_SHA256,
    )
    map_record, map_count = validate_occurrence_map(
        ingress_dir / "core-to-input-clause-id.json"
    )
    artifact_from_report(
        ingress_dir, report, "core-to-input-clause-id.json", EXPECTED_MAP_SHA256
    )

    runs = report.get("runs")
    if not isinstance(runs, dict):
        raise AdapterError("ingress report lacks run records")
    lrat_run = runs.get("verify_core_relative_drat_and_emit_lrat")
    normalize_run = runs.get("normalize_lrat")
    if not isinstance(lrat_run, dict) or not isinstance(normalize_run, dict):
        raise AdapterError("ingress report lacks LRAT run records")
    core_log_record, core_log = validate_log(
        ingress_dir / "core-to-lrat.log",
        lrat_run.get("log_sha256"),
        label="core-to-lrat log",
    )
    normalize_log_record, normalize_log = validate_log(
        ingress_dir / "normalize-lrat.log",
        normalize_run.get("log_sha256"),
        label="normalization log",
    )
    core_match = CORE_LOG_RE.search(core_log)
    rat_match = RAT_RE.search(core_log)
    normalize_match = NORMALIZE_RE.fullmatch(normalize_log)
    if core_match is None or rat_match is None or normalize_match is None:
        raise AdapterError("G3 LRAT logs do not match the exact accepted grammar")
    require_int(int(core_match.group(2)), EXPECTED_CORE_CLAUSES, label="logged core clauses")
    require_int(int(normalize_match.group(3)), EXPECTED_CORE_CLAUSES, label="source base")
    require_int(int(normalize_match.group(4)), EXPECTED_CHECKER_BASE, label="checker base")
    require_int(
        int(normalize_match.group(7)),
        EXPECTED_MAX_CERTIFICATE_VARIABLE,
        label="logged max certificate variable",
    )
    additions = int(normalize_match.group(1))
    first_id = int(normalize_match.group(5))
    final_id = int(normalize_match.group(6))
    require_int(first_id, EXPECTED_CHECKER_BASE + 1, label="first normalized addition")
    require_int(final_id, EXPECTED_CHECKER_BASE + additions, label="final normalized addition")

    return {
        "schema": PROVENANCE_SCHEMA,
        "report": report_record.as_json(),
        "input_cnf": input_record.as_json(),
        "core_cnf": core_record.as_json(),
        "core_to_input_map": {**map_record.as_json(), "entries": map_count},
        "rat_lrat": rat_lrat_record.as_json(),
        "logs": {
            "core_to_lrat": core_log_record.as_json(),
            "normalization": normalize_log_record.as_json(),
        },
        "counts": {
            "additions": additions,
            "deletions": int(normalize_match.group(2)),
            "rat_lemmas": int(rat_match.group(1)),
            "first_addition_id": first_id,
            "final_addition_id": final_id,
        },
    }


def validate_pure_rup_report(
    pure_rup_dir: Path,
    provenance: dict[str, Any],
) -> dict[str, Any]:
    """Validate the future zero-RAT ingress contract without inventing legacy schemas."""

    pure_rup_dir = pure_rup_dir.resolve()
    report_path = pure_rup_dir / "pure-rup-report.json"
    report_record = file_record(report_path)
    report = read_json_object(report_path, label="pure-RUP ingress report")
    require_equal(report.get("schema"), PURE_RUP_SCHEMA, label="pure-RUP report schema")
    require_equal(report.get("status"), "EXTERNALLY_VERIFIED", label="pure-RUP status")
    require_equal(report.get("source_core_sha256"), EXPECTED_CORE_SHA256, label="pure-RUP source core")
    require_int(report.get("source_base_clauses"), EXPECTED_CORE_CLAUSES, label="pure-RUP source base")
    require_int(report.get("checker_base_clauses"), EXPECTED_CHECKER_BASE, label="pure-RUP checker base")
    require_int(report.get("rat_lemmas"), 0, label="pure-RUP RAT count")
    require_equal(report.get("proof_kind"), "PURE_RUP", label="pure-RUP proof kind")

    artifacts = report.get("artifacts")
    if not isinstance(artifacts, dict):
        raise AdapterError("pure-RUP report lacks artifacts")
    drat_expected = artifacts.get("raw_drat")
    raw_lrat_expected = artifacts.get("raw_lrat")
    lrat_expected = artifacts.get("normalized_lrat")
    verification_expected = artifacts.get("verification_log")
    if not all(
        isinstance(item, dict)
        for item in (
            drat_expected,
            raw_lrat_expected,
            lrat_expected,
            verification_expected,
        )
    ):
        raise AdapterError("pure-RUP report lacks raw/normalized proof artifacts")

    def checked_report_artifact(expected: dict[str, Any], label: str) -> FileRecord:
        relative = Path(str(expected.get("path", "")))
        if not relative.parts or relative.is_absolute() or ".." in relative.parts:
            raise AdapterError(f"unsafe {label} path")
        record = file_record(pure_rup_dir / relative)
        require_int(expected.get("byte_count"), record.byte_count, label=f"{label} bytes")
        require_equal(expected.get("sha256"), record.sha256, label=f"{label} SHA-256")
        return record

    drat_record = checked_report_artifact(drat_expected, "pure-RUP raw DRAT")
    raw_lrat_record = checked_report_artifact(
        raw_lrat_expected, "pure-RUP raw LRAT"
    )
    require_equal(
        drat_record.sha256,
        EXPECTED_PURE_RUP_DRAT_SHA256,
        label="pure-RUP raw DRAT SHA-256",
    )
    require_equal(
        raw_lrat_record.sha256,
        EXPECTED_PURE_RUP_RAW_LRAT_SHA256,
        label="pure-RUP raw LRAT SHA-256",
    )
    lrat_record = checked_report_artifact(lrat_expected, "pure-RUP normalized LRAT")
    verification_record = checked_report_artifact(
        verification_expected, "pure-RUP verification log"
    )
    verification_text = verification_record.path.read_text(
        encoding="utf-8", errors="strict"
    )
    if not re.search(r"^s VERIFIED\s*$", verification_text, re.MULTILINE):
        raise AdapterError("pure-RUP verification log lacks exact `s VERIFIED`")
    if re.search(r"^c\s+[1-9]\d*\s+RAT lemmas in core;", verification_text, re.MULTILINE):
        raise AdapterError("pure-RUP verification log reports nonzero RAT lemmas")
    additions = report.get("additions")
    if type(additions) is not int:
        raise AdapterError(f"pure-RUP additions is not an integer: {additions!r}")
    if additions < 2:
        raise AdapterError("pure-RUP proof must contain at least two additions")
    return {
        "schema": PURE_RUP_SCHEMA,
        "report": report_record.as_json(),
        "raw_drat": drat_record.as_json(),
        "raw_lrat": raw_lrat_record.as_json(),
        "normalized_lrat": lrat_record.as_json(),
        "verification_log": verification_record.as_json(),
        "additions": additions,
        "provenance_report_sha256": provenance["report"]["sha256"],
    }


def build_plan(
    provenance: dict[str, Any],
    pure_rup: dict[str, Any] | None,
    *,
    max_actions: int,
    max_lrat_bytes: int,
) -> dict[str, Any]:
    rat_count = int(provenance["counts"]["rat_lemmas"])
    ready = pure_rup is not None
    additions = None if pure_rup is None else int(pure_rup["additions"])
    split = None
    if additions is not None:
        split = EXPECTED_CHECKER_BASE + 1 + additions // 2
    plan: dict[str, Any] = {
        "schema": PLAN_SCHEMA,
        "status": "READY" if ready else "BLOCKED_CURRENT_INGRESS_HAS_RAT",
        "claim_scope": (
            "Window replay authenticates only the frozen G3 core certificate. "
            "It does not provide the source-valuation or selector-coverage bridge."
        ),
        "provenance": provenance,
        "pure_rup": pure_rup,
        "compatibility": {
            "current_ingress_rat_lemmas": rat_count,
            "p5_window_checker_accepts": "PURE_RUP_ONLY",
            "materialization_ready": ready,
        },
        "padding": {
            "kind": "fresh-positive-unit",
            "variable": EXPECTED_PADDING_VARIABLE,
            "base_clause_count": EXPECTED_CHECKER_BASE,
            "semantic_bridge_required": (
                "fresh-unit satisfiability extension transfers UNSAT of "
                "core ∧ padding-unit back to the unpadded core"
            ),
        },
        "window_caps": {
            "max_actions": max_actions,
            "max_lrat_bytes": max_lrat_bytes,
        },
        "second_shard_first_addition": split,
        "compiler_layers": [
            "Common",
            "Checkpoint.* in parallel",
            "Shard*.W* in parallel",
            "Shard1 and Shard2 coordinators after their windows",
            "Compose after both shard coordinators",
        ],
    }
    encoded = json.dumps(plan, separators=(",", ":"), sort_keys=True).encode()
    plan["plan_sha256"] = hashlib.sha256(encoded).hexdigest()
    return plan


def _load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise AdapterError(f"cannot load inherited replay module: {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def write_padded_core(source: Path, target: Path) -> FileRecord:
    """Write the fresh-unit padded core expected by dense normalized LRAT ids."""

    variables, clauses = parse_dimacs_header(source)
    require_equal(
        (variables, clauses),
        (EXPECTED_INPUT_VARIABLES, EXPECTED_CORE_CLAUSES),
        label="unpadded core header",
    )
    with source.open("r", encoding="ascii", newline="") as inp, target.open(
        "x", encoding="ascii", newline="\n"
    ) as out:
        replaced = False
        final_line_ended = True
        for line in inp:
            final_line_ended = line.endswith(("\n", "\r"))
            if not replaced and line.startswith("p cnf "):
                out.write(f"p cnf {EXPECTED_PADDING_VARIABLE} {EXPECTED_CHECKER_BASE}\n")
                replaced = True
            else:
                out.write(line)
        if not replaced:
            raise AdapterError("unpadded core has no DIMACS header")
        if not final_line_ended:
            out.write("\n")
        out.write(f"{EXPECTED_PADDING_VARIABLE} 0\n")
    return file_record(target)


def materialize_pipeline(
    plan: dict[str, Any],
    output_dir: Path,
) -> dict[str, Any]:
    """Run materialization/emission only after the pure-RUP preflight succeeds."""

    if plan["status"] != "READY" or plan["pure_rup"] is None:
        raise AdapterError("refusing materialization without a verified zero-RAT ingress")
    output_dir = output_dir.resolve()
    if output_dir.exists():
        raise AdapterError(f"refusing to overwrite output: {output_dir}")
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(tempfile.mkdtemp(prefix=f".{output_dir.name}.stage-", dir=output_dir.parent))
    try:
        checkpointed = _load_module(
            "materialize_checkpointed_rup",
            P5_DIR / "materialize_checkpointed_rup.py",
        )
        sys.path.insert(0, str(P5_DIR))
        windowed = _load_module(
            "materialize_windowed_rup",
            P5_DIR / "materialize_windowed_rup.py",
        )
        emitter = _load_module(
            "emit_compact_windowed_rup_replay_package",
            P5_DIR / "emit_compact_windowed_rup_replay_package.py",
        )
        padded = write_padded_core(
            Path(plan["provenance"]["core_cnf"]["path"]),
            stage / "padded-core.cnf",
        )
        checkpoint_dir = stage / "checkpointed"
        checkpoint_manifest = checkpointed.materialize(
            cnf_path=padded.path,
            lrat_path=Path(plan["pure_rup"]["normalized_lrat"]["path"]),
            output_dir=checkpoint_dir,
            second_shard_first_addition=int(plan["second_shard_first_addition"]),
            source_certificate=None,
            source_certificate_record=None,
        )
        padded_record = padded.as_json()
        padded_record["path"] = "padded-core.cnf"
        padded_record["path_base"] = "adapter_output_root"
        checkpoint_manifest["g3_adapter"] = {
            "schema": PLAN_SCHEMA,
            "plan_sha256": plan["plan_sha256"],
            "provenance_report_sha256": plan["provenance"]["report"]["sha256"],
            "pure_rup_report_sha256": plan["pure_rup"]["report"]["sha256"],
            "padded_core": padded_record,
        }
        checkpoint_manifest["bindings"]["g3_adapter"] = checkpointed.binding_hash(
            "g3-adapter",
            plan["plan_sha256"],
            plan["provenance"]["report"]["sha256"],
            plan["pure_rup"]["report"]["sha256"],
            padded.sha256,
        )
        checkpoint_manifest["package_sha256"] = checkpointed.compute_package_digest(
            checkpoint_manifest
        )
        (checkpoint_dir / "manifest.json").write_text(
            json.dumps(checkpoint_manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        window_manifest = windowed.materialize_windows(
            package_dir=checkpoint_dir,
            output_dir=stage / "windowed",
            max_actions=int(plan["window_caps"]["max_actions"]),
            max_lrat_bytes=int(plan["window_caps"]["max_lrat_bytes"]),
        )
        compact_manifest = emitter.emit(stage / "windowed", stage / "compact")
        (stage / "adapter-plan.json").write_text(
            json.dumps(plan, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        os.replace(stage, output_dir)
        return {
            "status": "COMPACT_REPLAY_EMITTED_LEAN_NOT_RUN",
            "output_dir": str(output_dir),
            "window_package_sha256": window_manifest["package_sha256"],
            "compact_replay_package_sha256": compact_manifest[
                "compact_replay_package_sha256"
            ],
        }
    except BaseException:
        shutil.rmtree(stage, ignore_errors=True)
        raise


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--provenance-ingress",
        type=Path,
        default=REPO
        / "scratch/card11-exact5-common-fullradius-v7-g3-ingress/g3-ingress",
    )
    parser.add_argument(
        "--input-cnf",
        type=Path,
        default=REPO / "scratch/card11-exact5-common-fullradius-v7-g3/input.cnf",
    )
    parser.add_argument("--pure-rup-dir", type=Path)
    parser.add_argument("--output-dir", type=Path)
    parser.add_argument("--materialize", action="store_true")
    parser.add_argument("--max-actions", type=int, default=4000)
    parser.add_argument("--max-lrat-bytes", type=int, default=4 * 1024 * 1024)
    args = parser.parse_args(argv)
    try:
        if args.max_actions <= 0 or args.max_lrat_bytes <= 0:
            raise AdapterError("window caps must be positive")
        provenance = validate_provenance_ingress(
            args.provenance_ingress, args.input_cnf
        )
        pure_rup = (
            None
            if args.pure_rup_dir is None
            else validate_pure_rup_report(args.pure_rup_dir, provenance)
        )
        plan = build_plan(
            provenance,
            pure_rup,
            max_actions=args.max_actions,
            max_lrat_bytes=args.max_lrat_bytes,
        )
        if args.materialize:
            if args.output_dir is None:
                raise AdapterError("--materialize requires --output-dir")
            result = materialize_pipeline(plan, args.output_dir)
        else:
            result = plan
    except (AdapterError, OSError, ValueError, KeyError, TypeError) as exc:
        parser.exit(1, f"error: {exc}\n")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
