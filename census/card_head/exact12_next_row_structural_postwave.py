"""Replay and classify an exact-12 next-row structural CEGAR wave.

This is a theorem-mining audit, not a promotion adapter.  It reconstructs each
cell from the source-faithful compiler, semantically replays every authenticated
cut, verifies any persisted unresolved survivor against the resulting current
CNF, and reports recurring certificate families.  Exact-false certificates and
iteration limits remain finite evidence; they are not universal Lean producers.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import stat
import subprocess
from collections import Counter, defaultdict
from collections.abc import Callable, Mapping
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .exact12_next_row_cell_run import _artifact, _build_job, _write_json
from .exact12_next_row_structural_cegar import (
    DETECTOR_CONTRACT,
    RUN_SCHEMA,
    STRUCTURAL_CERTIFICATE_KIND,
    Exact12NextRowStructuralCegarError,
    _cnf_sha256,
    _detector_manifest,
    _reject_duplicate_keys,
    _reject_json_constant,
    _replay_sat_witness,
    _sha256_json,
    detect_admitted_cut,
    replay_journal,
)
from .exact12_next_row_valuation import cells, compile_cell
from .exact12_v14_ordered_cut_adapter import (
    SOURCE_ORDER_CERTIFICATE_KIND,
    SOURCE_ORDER_DETECTOR_STAGE,
)
from .exact12_v14_source_order_bank import (
    Exact12V14SourceOrderBankError,
    build_source_order_bank,
)
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

POSTWAVE_SCHEMA = "p97_rigid221_exact12_next_row_tagged_postwave.v3"
STRUCTURAL_OBSTRUCTION_FAMILY = (
    "Problem97.Census554.GeneralCarrierBridge.MetricCoreAlternative"
)
ACCEPTED_RUN_STATUSES = frozenset(
    {"ITERATION_LIMIT", "STRUCTURALLY_UNRESOLVED", "UNSAT_DRAT_VERIFIED"}
)


class Exact12NextRowStructuralPostwaveError(ValueError):
    """A wave artifact or its semantic replay failed closed."""


ProofVerifier = Callable[[Path, Path], bool]


def _verify_drat(cnf_path: Path, proof_path: Path) -> bool:
    """Replay a terminal proof and require drat-trim's exact success marker."""

    try:
        checked = subprocess.run(
            ["drat-trim", str(cnf_path), str(proof_path)],
            capture_output=True,
            text=True,
            timeout=600,
            check=False,
        )
    except (OSError, subprocess.TimeoutExpired):
        return False
    return checked.returncode == 0 and any(
        line.strip() == "s VERIFIED" for line in checked.stdout.splitlines()
    )


def _read_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(
            path.read_bytes(),
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_json_constant,
        )
    except (OSError, UnicodeError, json.JSONDecodeError, ValueError) as exc:
        raise Exact12NextRowStructuralPostwaveError(
            f"invalid JSON artifact: {path}"
        ) from exc
    if type(value) is not dict:
        raise Exact12NextRowStructuralPostwaveError(
            f"JSON artifact is not an object: {path}"
        )
    return value


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _verify_artifact(
    cell_dir: Path,
    summary: Mapping[str, Any],
    *,
    key: str,
    filename: str,
    required: bool,
) -> Path | None:
    artifacts = summary.get("artifacts")
    if type(artifacts) is not dict:
        raise Exact12NextRowStructuralPostwaveError("summary artifacts are malformed")
    entry = artifacts.get(key)
    path = cell_dir / filename
    if entry is None:
        if required or path.exists():
            raise Exact12NextRowStructuralPostwaveError(
                f"cell artifact {key} is missing or unreported"
            )
        return None
    try:
        cell_metadata = cell_dir.lstat()
        path_metadata = path.lstat()
        if stat.S_ISLNK(cell_metadata.st_mode) or stat.S_ISLNK(path_metadata.st_mode):
            raise Exact12NextRowStructuralPostwaveError(
                f"cell artifact {key} traverses a symlink"
            )
        if not stat.S_ISREG(path_metadata.st_mode):
            raise Exact12NextRowStructuralPostwaveError(
                f"cell artifact {key} is not a regular file"
            )
        if path_metadata.st_nlink != 1:
            raise Exact12NextRowStructuralPostwaveError(
                f"cell artifact {key} is hard-linked"
            )
    except FileNotFoundError as exc:
        raise Exact12NextRowStructuralPostwaveError(
            f"cell artifact {key} is missing"
        ) from exc
    if (
        type(entry) is not dict
        or entry.get("path") != filename
        or type(entry.get("bytes")) is not int
        or type(entry.get("sha256")) is not str
        or _artifact(path) != entry
    ):
        raise Exact12NextRowStructuralPostwaveError(
            f"cell artifact {key} failed authentication"
        )
    return path


def _verify_terminal_artifacts(
    cell_dir: Path,
    summary: Mapping[str, Any],
    *,
    status: str,
    reconstructed_cnf_sha256: str,
    proof_verifier: ProofVerifier = _verify_drat,
) -> None:
    """Authenticate terminal custody before accepting an UNSAT status."""

    terminal_artifacts = (
        ("discovery_cnf", "discovery.cnf"),
        ("terminal_cnf", "terminal.cnf"),
        ("proof", "terminal.drat"),
    )
    artifacts = summary.get("artifacts")
    if type(artifacts) is not dict:
        raise Exact12NextRowStructuralPostwaveError("summary artifacts are malformed")

    if status != "UNSAT_DRAT_VERIFIED":
        if (
            summary.get("terminal_verdict") is not None
            or summary.get("terminal_proof_verified") is not False
            or summary.get("terminal_cnf_sha256") is not None
        ):
            raise Exact12NextRowStructuralPostwaveError(
                "non-terminal cell carries stale terminal proof metadata"
            )
        for key, filename in terminal_artifacts[1:]:
            if artifacts.get(key) is not None or (cell_dir / filename).exists():
                raise Exact12NextRowStructuralPostwaveError(
                    f"non-terminal cell carries stale {key} artifact"
                )
        return

    if (
        summary.get("discovery_verdict") != "UNSAT"
        or summary.get("terminal_verdict") != "UNSAT"
        or summary.get("terminal_proof_verified") is not True
        or summary.get("reconstructed_cnf_sha256") != reconstructed_cnf_sha256
    ):
        raise Exact12NextRowStructuralPostwaveError(
            "terminal verdict or reconstructed CNF metadata failed authentication"
        )

    verified: dict[str, Path] = {}
    for key, filename in terminal_artifacts:
        path = _verify_artifact(
            cell_dir, summary, key=key, filename=filename, required=True
        )
        assert path is not None
        verified[key] = path

    discovery_sha256 = _sha256_file(verified["discovery_cnf"])
    terminal_sha256 = _sha256_file(verified["terminal_cnf"])
    if (
        discovery_sha256 != reconstructed_cnf_sha256
        or terminal_sha256 != reconstructed_cnf_sha256
        or discovery_sha256 != terminal_sha256
        or summary.get("discovery_cnf_sha256") != discovery_sha256
        or summary.get("terminal_cnf_sha256") != terminal_sha256
    ):
        raise Exact12NextRowStructuralPostwaveError(
            "terminal CNF bytes or metadata do not match the reconstructed CNF"
        )
    if verified["proof"].stat().st_size == 0:
        raise Exact12NextRowStructuralPostwaveError("terminal proof artifact is empty")
    if not proof_verifier(verified["terminal_cnf"], verified["proof"]):
        raise Exact12NextRowStructuralPostwaveError(
            "independent drat-trim replay did not report exact line 's VERIFIED'"
        )


def _counter_payload(counter: Counter[Any], *, key: str) -> list[dict[str, Any]]:
    return [
        {key: value, "count": count}
        for value, count in sorted(counter.items(), key=lambda item: item[0])
    ]


def _aggregate_record(
    record: Mapping[str, Any],
    *,
    cell_index: int,
    stages: Counter[str],
    minimum_rows: Counter[int],
    certificate_rows: Counter[int],
    maximum_paths: Counter[int],
    side_conditions: Counter[str],
    core_shapes: Counter[tuple[str, str]],
    stage_cells: dict[str, set[int]],
    proof_hashes: set[str],
    nogood_hashes: set[str],
    certificate_kinds: Counter[str],
    source_order_bank_indices: Counter[int],
    source_order_rules: Counter[str],
    source_order_consumers: Counter[str],
) -> None:
    certificate = record.get("certificate")
    if type(certificate) is not dict:
        raise Exact12NextRowStructuralPostwaveError("record certificate is malformed")
    certificate_kind = record.get("certificate_kind")
    stage = record.get("detector_stage")
    if type(certificate_kind) is not str or type(stage) is not str:
        raise Exact12NextRowStructuralPostwaveError(
            "record certificate family metadata is malformed"
        )
    certificate_kinds[certificate_kind] += 1
    stages[stage] += 1
    stage_cells[stage].add(cell_index)

    if certificate_kind == SOURCE_ORDER_CERTIFICATE_KIND:
        bank_index = record.get("source_order_bank_index")
        coverage = certificate.get("coverage")
        consumer = record.get("general_lean_consumer")
        if (
            stage != SOURCE_ORDER_DETECTOR_STAGE
            or isinstance(bank_index, bool)
            or not isinstance(bank_index, int)
            or bank_index < 0
            or type(coverage) is not list
            or not coverage
            or type(consumer) is not str
            or not consumer
        ):
            raise Exact12NextRowStructuralPostwaveError(
                "source-order record lacks replayed coverage metadata"
            )
        for entry in coverage:
            if type(entry) is not dict or type(entry.get("rule")) is not str:
                raise Exact12NextRowStructuralPostwaveError(
                    "source-order coverage entry is malformed"
                )
            source_order_rules[entry["rule"]] += 1
        source_order_bank_indices[bank_index] += 1
        source_order_consumers[consumer] += 1
        return

    if certificate_kind != STRUCTURAL_CERTIFICATE_KIND:
        raise Exact12NextRowStructuralPostwaveError(
            f"unknown replayed certificate family: {certificate_kind!r}"
        )

    if record.get("general_lean_consumer") is not None:
        raise Exact12NextRowStructuralPostwaveError(
            "structural record falsely names a direct Lean consumer"
        )

    minimum = certificate.get("minimum")
    rows = certificate.get("rows")
    side = certificate.get("side_conditions")
    core = certificate.get("core")
    maximum_path = certificate.get("max_closure_path_length")
    proof = certificate.get("proof_sha256")
    nogood = certificate.get("nogood_sha256")
    if (
        type(stage) is not str
        or type(minimum) is not dict
        or type(minimum.get("minimum_row_count")) is not int
        or type(rows) is not list
        or type(side) is not list
        or type(core) is not dict
        or type(maximum_path) is not int
        or type(proof) is not str
        or type(nogood) is not str
        or certificate.get("direct_row_equality_replay") is not True
    ):
        raise Exact12NextRowStructuralPostwaveError(
            "record lacks replayed theorem-family metadata"
        )
    minimum_rows[minimum["minimum_row_count"]] += 1
    certificate_rows[len(rows)] += 1
    maximum_paths[maximum_path] += 1
    side_conditions[json.dumps(side, sort_keys=True, separators=(",", ":"))] += 1
    core_shapes[(stage, json.dumps(core, sort_keys=True, separators=(",", ":")))] += 1
    proof_hashes.add(proof)
    nogood_hashes.add(nogood)


def analyze_wave(
    repo_root: Path,
    wave_dir: Path,
    *,
    proof_verifier: ProofVerifier = _verify_drat,
) -> dict[str, Any]:
    """Replay all twelve cells and emit bounded theorem-family aggregates."""

    repo_root = repo_root.resolve()
    wave_dir = wave_dir.resolve()
    schedule = cells()
    if len(schedule) != 12:
        raise Exact12NextRowStructuralPostwaveError(
            "next-row placement schedule does not have twelve cells"
        )

    current_detector_manifest = _detector_manifest(repo_root)
    current_detector_sha256 = _sha256_json(current_detector_manifest)
    try:
        bank_instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        source_order_bank = build_source_order_bank(repo_root, bank_instance)
    except Exact12V14SourceOrderBankError as exc:
        raise Exact12NextRowStructuralPostwaveError(
            "source-order bank failed authenticated reconstruction"
        ) from exc
    source_order_bank_sha256 = source_order_bank.get("bank_sha256")
    if type(source_order_bank_sha256) is not str:
        raise Exact12NextRowStructuralPostwaveError(
            "source-order bank omitted its authenticated digest"
        )
    statuses: Counter[str] = Counter()
    stages: Counter[str] = Counter()
    certificate_kinds: Counter[str] = Counter()
    minimum_rows: Counter[int] = Counter()
    certificate_rows: Counter[int] = Counter()
    maximum_paths: Counter[int] = Counter()
    side_conditions: Counter[str] = Counter()
    core_shapes: Counter[tuple[str, str]] = Counter()
    stage_cells: dict[str, set[int]] = defaultdict(set)
    proof_hashes: set[str] = set()
    nogood_hashes: set[str] = set()
    source_order_bank_indices: Counter[int] = Counter()
    source_order_rules: Counter[str] = Counter()
    source_order_consumers: Counter[str] = Counter()
    per_cell: list[dict[str, Any]] = []
    survivors: list[dict[str, Any]] = []
    total_records = 0

    for cell_index, cell in enumerate(schedule):
        cell_dir = wave_dir / f"cell-{cell_index}"
        summary = _read_json(cell_dir / "summary.json")
        job_path = _verify_artifact(
            cell_dir, summary, key="job", filename="job.json", required=True
        )
        detector_path = _verify_artifact(
            cell_dir,
            summary,
            key="detector_contract",
            filename="detector_contract.json",
            required=True,
        )
        journal_path = _verify_artifact(
            cell_dir,
            summary,
            key="journal",
            filename="journal.jsonl",
            required=True,
        )
        assert job_path is not None and detector_path is not None
        assert journal_path is not None
        job = _read_json(job_path)
        detector = _read_json(detector_path)
        status = summary.get("status")
        if (
            summary.get("schema") != RUN_SCHEMA
            or summary.get("cell_index") != cell_index
            or status not in ACCEPTED_RUN_STATUSES
            or summary.get("journal_replayed") is not True
            or summary.get("source_order_bank_sha256") != source_order_bank_sha256
            or detector
            != {
                "contract": DETECTOR_CONTRACT,
                "sha256": current_detector_sha256,
                "sources": current_detector_manifest,
            }
        ):
            raise Exact12NextRowStructuralPostwaveError(
                f"cell {cell_index} summary or detector contract drifted"
            )

        instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compiled = compile_cell(instance, cell)
        rebuilt_job = _build_job(repo_root, compiled, instance.dimacs().encode("ascii"))
        if job != rebuilt_job or summary.get("job_id") != rebuilt_job["job_id"]:
            raise Exact12NextRowStructuralPostwaveError(
                f"cell {cell_index} source job failed reconstruction"
            )
        try:
            count, parent, _seen, replayed_stages = replay_journal(
                instance,
                compiled,
                journal_path,
                repo_root=repo_root,
                job_id=rebuilt_job["job_id"],
                detector_contract_sha256=current_detector_sha256,
                cell_index=cell_index,
                source_order_bank=source_order_bank,
            )
        except Exact12NextRowStructuralCegarError as exc:
            raise Exact12NextRowStructuralPostwaveError(
                f"cell {cell_index} journal failed semantic replay: {exc}"
            ) from exc
        replayed_stage_counts = Counter(replayed_stages)
        if (
            summary.get("records") != count
            or summary.get("terminal_record_sha256") != (parent if count else None)
            or summary.get("stage_counts") != dict(sorted(replayed_stage_counts.items()))
            or summary.get("reconstructed_cnf_sha256") != _cnf_sha256(instance)
        ):
            raise Exact12NextRowStructuralPostwaveError(
                f"cell {cell_index} replay summary drifted"
            )
        _verify_terminal_artifacts(
            cell_dir,
            summary,
            status=status,
            reconstructed_cnf_sha256=_cnf_sha256(instance),
            proof_verifier=proof_verifier,
        )

        with journal_path.open("rb") as handle:
            for raw in handle:
                record = json.loads(
                    raw,
                    object_pairs_hook=_reject_duplicate_keys,
                    parse_constant=_reject_json_constant,
                )
                if type(record) is not dict:
                    raise Exact12NextRowStructuralPostwaveError(
                        f"cell {cell_index} journal record is malformed"
                    )
                _aggregate_record(
                    record,
                    cell_index=cell_index,
                    stages=stages,
                    minimum_rows=minimum_rows,
                    certificate_rows=certificate_rows,
                    maximum_paths=maximum_paths,
                    side_conditions=side_conditions,
                    core_shapes=core_shapes,
                    stage_cells=stage_cells,
                    proof_hashes=proof_hashes,
                    nogood_hashes=nogood_hashes,
                    certificate_kinds=certificate_kinds,
                    source_order_bank_indices=source_order_bank_indices,
                    source_order_rules=source_order_rules,
                    source_order_consumers=source_order_consumers,
                )

        survivor_path = _verify_artifact(
            cell_dir,
            summary,
            key="survivor",
            filename="survivor.json",
            required=status == "STRUCTURALLY_UNRESOLVED",
        )
        if survivor_path is not None:
            survivor = _read_json(survivor_path)
            try:
                decoded_cube, positive, replay = _replay_sat_witness(
                    instance,
                    compiled,
                    survivor.get("cube"),
                    survivor.get("positive_variables"),
                )
            except (
                Exact12NextRowStructuralCegarError,
                TypeError,
                ValueError,
            ) as exc:
                raise Exact12NextRowStructuralPostwaveError(
                    f"cell {cell_index} survivor failed semantic replay"
                ) from exc
            if (
                detect_admitted_cut(
                    instance,
                    decoded_cube,
                    source_order_bank=source_order_bank,
                )
                is not None
            ):
                raise Exact12NextRowStructuralPostwaveError(
                    f"cell {cell_index} survivor is no longer unresolved by the tagged detector"
                )
            survivors.append(
                {
                    "cell_index": cell_index,
                    "local_iteration": survivor.get("local_iteration"),
                    "artifact": _artifact(survivor_path),
                    "cube_sha256": _sha256_json(
                        {str(center): support for center, support in decoded_cube.items()}
                    ),
                    "positive_variable_count": len(positive),
                    "replay": replay,
                    "order_independent_metric_core": None,
                }
            )

        statuses[status] += 1
        total_records += count
        per_cell.append(
            {
                "cell_index": cell_index,
                "status": status,
                "records": count,
                "stage_counts": dict(sorted(replayed_stage_counts.items())),
                "current_cnf_sha256": _cnf_sha256(instance),
            }
        )

    top_cores = [
        {
            "stage": stage,
            "core": json.loads(core),
            "count": count,
        }
        for (stage, core), count in sorted(
            core_shapes.items(), key=lambda item: (-item[1], item[0])
        )[:30]
    ]
    return {
        "schema": POSTWAVE_SCHEMA,
        "scope": (
            "authenticated finite exact-12 theorem-mining audit; not terminal "
            "coverage, a universal producer/lift, or a Lean sorry closure"
        ),
        "wave_dir": str(wave_dir.relative_to(repo_root)),
        "cells": len(schedule),
        "status_counts": dict(sorted(statuses.items())),
        "records": total_records,
        "certificate_kind_counts": dict(sorted(certificate_kinds.items())),
        "stage_counts": dict(sorted(stages.items())),
        "stage_cell_counts": {
            stage: len(cell_indexes) for stage, cell_indexes in sorted(stage_cells.items())
        },
        "minimum_row_counts": _counter_payload(minimum_rows, key="rows"),
        "certificate_row_counts": _counter_payload(certificate_rows, key="rows"),
        "maximum_closure_path_lengths": _counter_payload(
            maximum_paths, key="length"
        ),
        "side_condition_sets": [
            {"side_conditions": json.loads(value), "count": count}
            for value, count in sorted(side_conditions.items())
        ],
        "top_labeled_core_shapes": top_cores,
        "unique_proof_sha256": len(proof_hashes),
        "unique_nogood_sha256": len(nogood_hashes),
        "all_structural_direct_row_equality_replay": True,
        "structural_direct_lean_consumer": None,
        "structural_obstruction_family": STRUCTURAL_OBSTRUCTION_FAMILY,
        "source_order_bank_sha256": source_order_bank_sha256,
        "source_order_bank_indices": _counter_payload(
            source_order_bank_indices, key="bank_index"
        ),
        "source_order_coverage_rule_counts": dict(sorted(source_order_rules.items())),
        "source_order_consumer_counts": dict(sorted(source_order_consumers.items())),
        "finite_records_are_universal_producers": False,
        "all_cells_terminal_unsat": statuses == Counter({"UNSAT_DRAT_VERIFIED": 12}),
        "survivors": survivors,
        "per_cell": per_cell,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--wave-dir", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    try:
        report = analyze_wave(args.repo_root, args.wave_dir)
        _write_json(args.output, report)
    except (Exact12NextRowStructuralPostwaveError, OSError, ValueError) as exc:
        print(f"ERROR: {exc}")
        return 1
    print(
        json.dumps(
            {
                "output": str(args.output),
                "cells": report["cells"],
                "records": report["records"],
                "status_counts": report["status_counts"],
                "stage_counts": report["stage_counts"],
                "survivors": len(report["survivors"]),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
