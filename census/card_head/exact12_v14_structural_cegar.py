"""Order-independent geometric CEGAR for one bound exact-12 v14 cell.

Each SAT survivor is independently replayed against the complete current CNF
and the source/added-predicate validators.  The first formalized metric core is
then exported through the existing exact certificate checker, converted to a
clause over the exact selected-row variables, and recorded in an authenticated
append-only journal.  A discovery UNSAT is terminal only after a fresh
identical-CNF DRAT-producing run verifies.

This module proves at most finite closure of one normalized schedule cell.  It
does not establish 648-cell coverage, the universal lift, or Lean closure.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import io
import json
import os
import shutil
from collections.abc import Collection, Mapping
from pathlib import Path
from typing import Any, BinaryIO

from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric

from .exact12_v14_bound_jobs import (
    BOUND_JOB_SCHEMA,
    build_bound_job,
    instantiate_validated_bound_job,
)
from .exact12_v14_cell_run import cnf_assignment_satisfies
from .exact12_v14_ordered_cut_adapter import (
    SOURCE_ORDER_CERTIFICATE_KIND,
    AdmittedCut,
    Exact12V14OrderedCutAdapterError,
    detect_proof_backed_source_order_cut,
    replay_proof_backed_source_order_cut,
)
from .exact12_v14_schedule import build_manifest, json_sha256
from .exact12_v14_source_order_bank import (
    Exact12V14SourceOrderBankError,
    _source_record,
    build_source_order_bank,
    snapshot_source_order_bank,
)
from .exact12_v14_valuation import added_constraints_hold, decode_blockers
from .sat_encoding import CadicalResult, CoverInstance, EncodingError, solve_cadical
from .source_faithful_candidate_surface import source_faithful_cube_ok

RUN_SCHEMA = "p97_rigid221_exact12_full_v14_structural_cegar_run.v4"
RECORD_SCHEMA = "p97_rigid221_exact12_full_v14_tagged_cut.v4"
LEGACY_RECORD_SCHEMA = "p97_rigid221_exact12_full_v14_structural_cut.v2"
STRUCTURAL_CERTIFICATE_KIND = "structural_metric_core"
STRUCTURAL_CERTIFICATE_SCHEMA = "p97_phase3_structural_certificate_payload.v1"
DETECTOR_CONTRACT = (
    "tagged structural replay or exact Lean-backed source-order bank replay"
)
# Complete semantic source closure for certificate detection, replay, and
# selected-row clause compilation.  This intentionally excludes eager imports
# which are not reached by that contract.
DETECTOR_FILES: tuple[str, ...] = (
    "census/card_head/exact12_v14_structural_cegar.py",
    "census/card_head/exact12_v14_ordered_cut_adapter.py",
    "census/card_head/exact12_v14_ordered_coverage.py",
    "census/card_head/exact12_v14_source_order_bank.py",
    "census/card_head/sat_encoding.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
    "census/p97_search/phase3_classification_context.py",
    "census/p97_search/phase3_order_universe.py",
)


class Exact12V14StructuralCegarError(ValueError):
    """The runner input, journal, detector output, or artifact is malformed."""


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _canonical_cube_payload(
    cube: Mapping[int | str, Collection[int]], *, cardinality: int = 12
) -> dict[str, list[int]]:
    """Normalize a complete exact-cardinality cube for durable replay."""

    if not isinstance(cube, Mapping):
        raise Exact12V14StructuralCegarError("journal cube is malformed")
    integer_keys = set(range(cardinality))
    string_keys = {str(center) for center in range(cardinality)}
    if set(cube) == integer_keys:
        rows = (cube[center] for center in range(cardinality))
    elif set(cube) == string_keys:
        rows = (cube[str(center)] for center in range(cardinality))
    else:
        raise Exact12V14StructuralCegarError(
            "journal cube must contain every center exactly once"
        )
    payload: dict[str, list[int]] = {}
    for center, support in enumerate(rows):
        if isinstance(support, (str, bytes)):
            raise Exact12V14StructuralCegarError("journal cube support is malformed")
        try:
            normalized = sorted(support)
        except TypeError as exc:
            raise Exact12V14StructuralCegarError(
                "journal cube support is malformed"
            ) from exc
        if (
            any(
                isinstance(point, bool) or not isinstance(point, int)
                for point in normalized
            )
            or len(normalized) != len(set(normalized))
            or any(
                not 0 <= point < cardinality or point == center for point in normalized
            )
        ):
            raise Exact12V14StructuralCegarError("journal cube support is malformed")
        payload[str(center)] = normalized
    return payload


def _canonical_positive_variables(
    positive_variables: Collection[int], *, n_variables: int | None = None
) -> list[int]:
    """Normalize the true-variable half of a DIMACS assignment."""

    if isinstance(positive_variables, (str, bytes)):
        raise Exact12V14StructuralCegarError(
            "journal positive-variable assignment is malformed"
        )
    try:
        positive = sorted(positive_variables)
    except TypeError as exc:
        raise Exact12V14StructuralCegarError(
            "journal positive-variable assignment is malformed"
        ) from exc
    if any(
        isinstance(variable, bool)
        or not isinstance(variable, int)
        or variable <= 0
        or (n_variables is not None and variable > n_variables)
        for variable in positive
    ) or len(positive) != len(set(positive)):
        raise Exact12V14StructuralCegarError(
            "journal positive-variable assignment is malformed"
        )
    return positive


def _json_object_without_duplicates(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _reject_json_constant(value: str) -> Any:
    raise ValueError(f"non-finite JSON constant: {value}")


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _write_json(path: Path, value: Any) -> None:
    payload = json.dumps(value, sort_keys=True, indent=2) + "\n"
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_text(payload, encoding="utf-8")
    temporary.replace(path)


def _artifact(path: Path) -> dict[str, Any] | None:
    if not path.is_file():
        return None
    return {
        "path": path.name,
        "bytes": path.stat().st_size,
        "sha256": _sha256_file(path),
    }


def _detector_manifest(repo_root: Path) -> list[dict[str, Any]]:
    try:
        return [_source_record(repo_root, relative) for relative in DETECTOR_FILES]
    except Exact12V14SourceOrderBankError as exc:
        raise Exact12V14StructuralCegarError(
            "detector contract source snapshot failed"
        ) from exc


def _claim_workdir(workdir: Path) -> Path:
    try:
        workdir.mkdir(parents=True, exist_ok=False)
    except FileExistsError as exc:
        raise Exact12V14StructuralCegarError(
            f"workdir must not already exist: {workdir}"
        ) from exc
    lock = workdir / ".exact12_v14_structural_cegar.lock"
    lock.touch(exist_ok=False)
    return lock


def _strict_rows(
    certificate: Mapping[str, Any],
) -> tuple[tuple[int, tuple[int, ...], bool], ...]:
    raw_rows = certificate.get("rows")
    if not isinstance(raw_rows, list) or not raw_rows:
        raise Exact12V14StructuralCegarError("certificate rows must be nonempty")
    rows: list[tuple[int, tuple[int, ...], bool]] = []
    for raw in raw_rows:
        if not isinstance(raw, Mapping) or set(raw) != {"center", "support", "exact"}:
            raise Exact12V14StructuralCegarError("certificate row is malformed")
        center = raw["center"]
        support = raw["support"]
        exact = raw["exact"]
        if isinstance(center, bool) or not isinstance(center, int):
            raise Exact12V14StructuralCegarError("row center is not a plain integer")
        if not isinstance(exact, bool):
            raise Exact12V14StructuralCegarError("row exact flag is not Boolean")
        if not isinstance(support, list) or any(
            isinstance(point, bool) or not isinstance(point, int) for point in support
        ):
            raise Exact12V14StructuralCegarError("row support is malformed")
        normalized = tuple(sorted(support))
        if len(normalized) != len(set(normalized)):
            raise Exact12V14StructuralCegarError("row support contains duplicates")
        rows.append((center, normalized, exact))
    result = tuple(rows)
    if len(result) != len(set(result)):
        raise Exact12V14StructuralCegarError("certificate repeats a row")
    return result


def validate_structural_certificate(
    certificate: Mapping[str, Any], *, n: int = 12
) -> bool:
    """Strictly validate one existing formalized metric certificate."""

    try:
        _strict_rows(certificate)
        return certificates._validate_certificate(certificate, n=n) is True
    except (KeyError, TypeError, ValueError):
        return False


def detect_structural_certificate(
    cube: Mapping[int, Collection[int]], *, n: int = 12
) -> dict[str, Any] | None:
    """Return the first replay-valid order-independent certificate for a cube."""

    if (
        isinstance(n, bool)
        or not isinstance(n, int)
        or n <= 0
        or set(cube) != set(range(n))
        or any(
            isinstance(center, bool) or not isinstance(center, int) for center in cube
        )
    ):
        raise Exact12V14StructuralCegarError("cube does not contain every center")
    rows = tuple(
        metric.MetricRow(center, tuple(sorted(cube[center])), False)
        for center in range(n)
    )
    detection = metric._formalized_metric_core(
        rows,
        n,
        (),
        include_extended=True,
        include_ordered=False,
    )
    if detection is None:
        return None
    certificate = certificates._certificate_for_detection(rows, n, detection)
    if not validate_structural_certificate(certificate, n=n):
        raise Exact12V14StructuralCegarError(
            "detector produced a certificate that failed independent replay"
        )
    return certificate


def learned_clause_for_certificate(
    instance: CoverInstance, certificate: Mapping[str, Any]
) -> tuple[int, ...]:
    """Compile a replayed metric nogood to exact selected-row literals."""

    if not validate_structural_certificate(certificate, n=instance.model.cardinality):
        raise Exact12V14StructuralCegarError("refusing an invalid certificate")
    literals: list[int] = []
    for center, support, _exact in _strict_rows(certificate):
        try:
            candidate_index = instance.candidate_index(center, support)
            variable = instance.choice_variables[(center, candidate_index)]
        except (KeyError, ValueError) as exc:
            raise Exact12V14StructuralCegarError(
                f"certificate row ({center}, {support}) is outside the bound model"
            ) from exc
        literals.append(-variable)
    clause = tuple(literals)
    if len(clause) != len(set(clause)):
        raise Exact12V14StructuralCegarError("learned clause repeats a literal")
    return clause


def detect_admitted_cut(
    repo_root: Path | None,
    instance: CoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    source_order_bank: Mapping[str, Any] | None = None,
) -> AdmittedCut | None:
    """Prefer a theorem-backed source-order cut, then structural replay."""

    try:
        ordered = detect_proof_backed_source_order_cut(
            repo_root,
            instance,
            cube,
            source_order_bank=source_order_bank,
        )
    except Exact12V14OrderedCutAdapterError as exc:
        raise Exact12V14StructuralCegarError(str(exc)) from exc
    if ordered is not None:
        return ordered
    certificate = detect_structural_certificate(cube, n=instance.model.cardinality)
    if certificate is None:
        return None
    return AdmittedCut(
        certificate_kind=STRUCTURAL_CERTIFICATE_KIND,
        certificate_schema=STRUCTURAL_CERTIFICATE_SCHEMA,
        detector_stage=certificate["stage"],
        certificate=copy.deepcopy(dict(certificate)),
        learned_clause=learned_clause_for_certificate(instance, certificate),
    )


def replay_tagged_cut(
    repo_root: Path | None,
    instance: CoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    certificate_kind: str,
    certificate_schema: str,
    detector_stage: str,
    certificate: Mapping[str, Any],
    bank_index: int | None = None,
    source_order_bank: Mapping[str, Any] | None = None,
) -> tuple[int, ...]:
    """Replay one tagged certificate through only its declared family."""

    if certificate_kind == STRUCTURAL_CERTIFICATE_KIND:
        if (
            certificate_schema != STRUCTURAL_CERTIFICATE_SCHEMA
            or detector_stage != certificate.get("stage")
        ):
            raise Exact12V14StructuralCegarError(
                "recorded structural certificate tag drifted"
            )
        return learned_clause_for_certificate(instance, certificate)
    if certificate_kind == SOURCE_ORDER_CERTIFICATE_KIND:
        try:
            return replay_proof_backed_source_order_cut(
                repo_root,
                instance,
                cube,
                certificate_schema=certificate_schema,
                detector_stage=detector_stage,
                certificate=certificate,
                bank_index=bank_index,
                source_order_bank=source_order_bank,
            )
        except Exact12V14OrderedCutAdapterError as exc:
            raise Exact12V14StructuralCegarError(str(exc)) from exc
    raise Exact12V14StructuralCegarError(
        f"unknown tagged certificate family: {certificate_kind!r}"
    )


def _record_body(
    *,
    index: int,
    parent_sha256: str,
    job_sha256: str,
    detector_contract_sha256: str,
    cell_index: int,
    admitted_cut: AdmittedCut,
    cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
) -> dict[str, Any]:
    cube_payload = _canonical_cube_payload(cube)
    assignment_payload = _canonical_positive_variables(positive_variables)
    certificate_payload = copy.deepcopy(admitted_cut.certificate)
    return {
        "schema": RECORD_SCHEMA,
        "index": index,
        "parent_sha256": parent_sha256,
        "job_sha256": job_sha256,
        "detector_contract_sha256": detector_contract_sha256,
        "cell_index": cell_index,
        "detector_contract": DETECTOR_CONTRACT,
        "certificate_kind": admitted_cut.certificate_kind,
        "certificate_schema": admitted_cut.certificate_schema,
        "detector_stage": admitted_cut.detector_stage,
        "certificate": certificate_payload,
        "certificate_sha256": _sha256_json(certificate_payload),
        "source_order_bank_index": admitted_cut.bank_index,
        "learned_clause": list(admitted_cut.learned_clause),
        "cube": cube_payload,
        "cube_sha256": _sha256_json(cube_payload),
        "positive_variables": assignment_payload,
        "assignment_sha256": _sha256_json(assignment_payload),
    }


def _make_record(**kwargs: Any) -> dict[str, Any]:
    body = _record_body(**kwargs)
    return {**body, "record_sha256": _sha256_json(body)}


def _append_record(path: Path, record: Mapping[str, Any]) -> None:
    payload = _canonical_json_bytes(record) + b"\n"
    with path.open("ab") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())


def replay_journal(
    repo_root: Path | None,
    instance: CoverInstance,
    journal_path: Path | BinaryIO,
    *,
    job_sha256: str,
    detector_contract_sha256: str,
    cell_index: int,
    source_order_bank: Mapping[str, Any] | None = None,
) -> tuple[int, str, frozenset[tuple[int, ...]]]:
    """Authenticate, replay, and install every durable learned clause."""

    try:
        replay_bank = (
            None
            if source_order_bank is None
            else snapshot_source_order_bank(instance, source_order_bank)
        )
    except Exact12V14SourceOrderBankError as exc:
        raise Exact12V14StructuralCegarError(str(exc)) from exc
    if isinstance(journal_path, Path):
        if not journal_path.is_file():
            return 0, job_sha256, frozenset()
        try:
            with journal_path.open("rb") as journal_handle:
                journal_payload = journal_handle.read()
        except OSError as exc:
            raise Exact12V14StructuralCegarError(
                "journal path could not be snapshotted"
            ) from exc
        journal_context = io.BytesIO(journal_payload)
    else:
        try:
            journal_path.seek(0)
            journal_payload = journal_path.read()
        except (AttributeError, OSError, ValueError) as exc:
            raise Exact12V14StructuralCegarError(
                "journal stream could not be snapshotted"
            ) from exc
        if type(journal_payload) is not bytes:
            raise Exact12V14StructuralCegarError(
                "journal stream snapshot is not immutable bytes"
            )
        journal_context = io.BytesIO(journal_payload)
    parent = job_sha256
    seen: set[tuple[int, ...]] = set()
    pending_clauses: list[tuple[int, ...]] = []
    count = 0
    with journal_context as handle:
        for line_number, raw in enumerate(handle, 1):
            if not raw.endswith(b"\n"):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} is not newline terminated"
                )
            try:
                record = json.loads(
                    raw,
                    object_pairs_hook=_json_object_without_duplicates,
                    parse_constant=_reject_json_constant,
                )
            except (json.JSONDecodeError, ValueError) as exc:
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} is not strict JSON"
                ) from exc
            if (
                isinstance(record, Mapping)
                and record.get("schema") == LEGACY_RECORD_SCHEMA
            ):
                raise Exact12V14StructuralCegarError(
                    "legacy v2 journals require an explicit migration; start a fresh v4 run"
                )
            expected_fields = {
                "schema",
                "index",
                "parent_sha256",
                "job_sha256",
                "detector_contract_sha256",
                "cell_index",
                "detector_contract",
                "certificate_kind",
                "certificate_schema",
                "detector_stage",
                "certificate",
                "certificate_sha256",
                "source_order_bank_index",
                "learned_clause",
                "cube",
                "cube_sha256",
                "positive_variables",
                "assignment_sha256",
                "record_sha256",
            }
            if not isinstance(record, Mapping) or set(record) != expected_fields:
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} is malformed"
                )
            body = dict(record)
            record_sha256 = body.pop("record_sha256")
            if (
                record.get("schema") != RECORD_SCHEMA
                or record.get("index") != count
                or record.get("parent_sha256") != parent
                or record.get("job_sha256") != job_sha256
                or record.get("detector_contract_sha256") != detector_contract_sha256
                or record.get("cell_index") != cell_index
                or record.get("detector_contract") != DETECTOR_CONTRACT
                or record_sha256 != _sha256_json(body)
            ):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} failed chain authentication"
                )
            certificate = record.get("certificate")
            if not isinstance(certificate, Mapping):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} omitted its certificate"
                )
            if record.get("certificate_sha256") != _sha256_json(certificate):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} certificate hash drifted"
                )
            cube = _canonical_cube_payload(
                record.get("cube"), cardinality=instance.model.cardinality
            )
            positive_variables = _canonical_positive_variables(
                record.get("positive_variables"),
                n_variables=instance.cnf.n_variables,
            )
            if record.get("cube") != cube or record.get("cube_sha256") != _sha256_json(
                cube
            ):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} cube hash drifted"
                )
            if record.get("positive_variables") != positive_variables or record.get(
                "assignment_sha256"
            ) != _sha256_json(positive_variables):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} assignment hash drifted"
                )
            decoded_cube = instance.decode_model(positive_variables)
            if _canonical_cube_payload(decoded_cube) != cube:
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} assignment/cube witness drifted"
                )
            for hash_field in ("cube_sha256", "assignment_sha256", "record_sha256"):
                value = record.get(hash_field)
                if (
                    not isinstance(value, str)
                    or len(value) != 64
                    or any(character not in "0123456789abcdef" for character in value)
                ):
                    raise Exact12V14StructuralCegarError(
                        f"journal line {line_number} has malformed {hash_field}"
                    )
            certificate_kind = record.get("certificate_kind")
            certificate_schema = record.get("certificate_schema")
            detector_stage = record.get("detector_stage")
            if not all(
                isinstance(value, str)
                for value in (certificate_kind, certificate_schema, detector_stage)
            ):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} has malformed certificate tags"
                )
            assert isinstance(certificate_kind, str)
            assert isinstance(certificate_schema, str)
            assert isinstance(detector_stage, str)
            bank_index = record.get("source_order_bank_index")
            if certificate_kind == SOURCE_ORDER_CERTIFICATE_KIND:
                if (
                    isinstance(bank_index, bool)
                    or not isinstance(bank_index, int)
                    or bank_index < 0
                ):
                    raise Exact12V14StructuralCegarError(
                        f"journal line {line_number} has malformed source-order bank index"
                    )
                if replay_bank is None and repo_root is not None:
                    try:
                        replay_bank = snapshot_source_order_bank(
                            instance, build_source_order_bank(repo_root, instance)
                        )
                    except Exact12V14SourceOrderBankError as exc:
                        raise Exact12V14StructuralCegarError(str(exc)) from exc
            elif bank_index is not None:
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} has an unexpected source-order bank index"
                )
            clause = replay_tagged_cut(
                repo_root,
                instance,
                cube,
                certificate_kind=certificate_kind,
                certificate_schema=certificate_schema,
                detector_stage=detector_stage,
                certificate=certificate,
                bank_index=bank_index,
                source_order_bank=replay_bank,
            )
            if record.get("learned_clause") != list(clause) or clause in seen:
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} learned clause drifted or repeated"
                )
            if any(
                (literal > 0 and literal in positive_variables)
                or (literal < 0 and -literal not in positive_variables)
                for literal in clause
            ):
                raise Exact12V14StructuralCegarError(
                    f"journal line {line_number} witness does not falsify its cut"
                )
            seen.add(clause)
            pending_clauses.append(clause)
            parent = record_sha256
            count += 1
    for clause in pending_clauses:
        instance.cnf.add_clause(clause)
    return count, parent, frozenset(seen)


def _nonterminal_status(result: CadicalResult) -> str:
    return (
        result.verdict if result.verdict in {"TIMEOUT", "UNKNOWN"} else "PIPELINE_ERROR"
    )


def run_structural_cegar(
    repo_root: Path,
    workdir: Path,
    cell_index: int,
    *,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
) -> dict[str, Any]:
    """Run replay-gated order-independent CEGAR for one finite cell."""

    if (
        isinstance(max_iterations, bool)
        or not isinstance(max_iterations, int)
        or max_iterations <= 0
    ):
        raise Exact12V14StructuralCegarError("max_iterations must be positive")
    if (
        isinstance(timeout_seconds, bool)
        or not isinstance(timeout_seconds, int)
        or timeout_seconds <= 0
        or isinstance(nice, bool)
        or not isinstance(nice, int)
        or not 1 <= nice <= 19
    ):
        raise Exact12V14StructuralCegarError("invalid solver timeout or nice value")

    repo_root = repo_root.resolve()
    lock = _claim_workdir(workdir)
    try:
        schedule_manifest = build_manifest(repo_root)
        job = build_bound_job(schedule_manifest, repo_root, cell_index)
        materialized = instantiate_validated_bound_job(
            job, schedule_manifest, repo_root
        )
        instance = materialized.instance
        compiled = materialized.compiled
        job_sha256 = json_sha256(job)
        detector_manifest = _detector_manifest(repo_root)
        detector_contract_sha256 = _sha256_json(detector_manifest)
        try:
            source_order_bank = snapshot_source_order_bank(
                instance, build_source_order_bank(repo_root, instance)
            )
        except Exact12V14SourceOrderBankError as exc:
            raise Exact12V14StructuralCegarError(str(exc)) from exc
        job_path = workdir / "job.json"
        _write_json(job_path, job)
        expected_job_artifact_sha256 = _sha256_file(job_path)
        journal_path = workdir / "journal.jsonl"
        if seed_journal is not None:
            if not seed_journal.is_file():
                raise Exact12V14StructuralCegarError("seed journal is missing")
            shutil.copyfile(seed_journal, journal_path)
        record_count, parent_sha256, seen = replay_journal(
            repo_root,
            instance,
            journal_path,
            job_sha256=job_sha256,
            detector_contract_sha256=detector_contract_sha256,
            cell_index=cell_index,
            source_order_bank=source_order_bank,
        )
        seen_clauses = set(seen)
        status = "ITERATION_LIMIT"
        error: str | None = None
        discovery: CadicalResult | None = None
        terminal: CadicalResult | None = None
        replay = {"candidate": False, "added_constraints": False, "exact_cnf": False}

        for local_iteration in range(max_iterations):
            discovery_path = workdir / "discovery.cnf"
            discovery = solve_cadical(
                instance,
                discovery_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=None,
            )
            if discovery.verdict == "UNSAT":
                discovery_sha256 = _sha256_file(discovery_path)
                terminal_path = workdir / "terminal.cnf"
                proof_path = workdir / "terminal.drat"
                terminal = solve_cadical(
                    instance,
                    terminal_path,
                    timeout_seconds=timeout_seconds,
                    nice=nice,
                    proof_path=proof_path,
                )
                if (
                    terminal.verdict == "UNSAT"
                    and terminal.proof_verified
                    and proof_path.is_file()
                    and _sha256_file(terminal_path) == discovery_sha256
                ):
                    status = "UNSAT_DRAT_VERIFIED"
                else:
                    status = "DISCOVERY_UNSAT_UNVERIFIED"
                    error = "fresh identical-CNF terminal proof rerun failed"
                break
            if discovery.verdict != "SAT":
                status = _nonterminal_status(discovery)
                break
            if discovery.cube is None or discovery.positive_variables is None:
                status = "PIPELINE_ERROR"
                error = "SAT result omitted cube or positive assignment"
                break

            cube = discovery.cube
            positive = discovery.positive_variables
            replay = {
                "candidate": source_faithful_cube_ok(instance.model, cube),
                "added_constraints": added_constraints_hold(
                    compiled.cell,
                    cube,
                    decode_blockers(positive, compiled.blocker_variables),
                ),
                "exact_cnf": cnf_assignment_satisfies(
                    instance.cnf.clauses,
                    positive,
                    n_variables=instance.cnf.n_variables,
                ),
            }
            if not all(replay.values()):
                status = "SAT_REPLAY_FAILED"
                error = "SAT assignment failed a source, predicate, or CNF replay gate"
                break

            admitted_cut = detect_admitted_cut(
                None,
                instance,
                cube,
                source_order_bank=source_order_bank,
            )
            if admitted_cut is None:
                status = "STRUCTURALLY_UNRESOLVED"
                _write_json(
                    workdir / "survivor.json",
                    {
                        "cell_index": cell_index,
                        "local_iteration": local_iteration,
                        "cube": {
                            str(center): list(cube[center]) for center in sorted(cube)
                        },
                        "replay": replay,
                    },
                )
                break
            clause = admitted_cut.learned_clause
            if clause in seen_clauses:
                status = "DETECTOR_REPEAT"
                error = "detector repeated a replayed learned clause"
                break
            record = _make_record(
                index=record_count,
                parent_sha256=parent_sha256,
                job_sha256=job_sha256,
                detector_contract_sha256=detector_contract_sha256,
                cell_index=cell_index,
                admitted_cut=admitted_cut,
                cube=cube,
                positive_variables=positive,
            )
            _append_record(journal_path, record)
            instance.cnf.add_clause(clause)
            seen_clauses.add(clause)
            parent_sha256 = record["record_sha256"]
            record_count += 1

        audit_materialized = instantiate_validated_bound_job(
            job, schedule_manifest, repo_root
        )
        audit_count, audit_parent, audit_seen = replay_journal(
            repo_root,
            audit_materialized.instance,
            journal_path,
            job_sha256=job_sha256,
            detector_contract_sha256=detector_contract_sha256,
            cell_index=cell_index,
            source_order_bank=source_order_bank,
        )
        journal_replayed = (
            audit_count == record_count
            and audit_parent == parent_sha256
            and audit_seen == frozenset(seen_clauses)
        )
        artifacts = {
            "job": _artifact(job_path),
            "journal": _artifact(journal_path),
            "discovery_cnf": _artifact(workdir / "discovery.cnf"),
            "terminal_cnf": _artifact(workdir / "terminal.cnf"),
            "proof": _artifact(workdir / "terminal.drat"),
            "survivor": _artifact(workdir / "survivor.json"),
        }
        if (
            artifacts["job"] is None
            or artifacts["job"]["sha256"] != expected_job_artifact_sha256
            or not journal_replayed
        ):
            status = "ARTIFACT_REPLAY_FAILED"
            error = "job artifact or complete structural journal failed replay"
        summary = {
            "schema": RUN_SCHEMA,
            "scope": (
                "one finite normalized-v14 cell under tagged structural and "
                "proof-backed source-order CEGAR; no aggregate coverage, "
                "universal lift, or Lean closure"
            ),
            "bound_job_schema": BOUND_JOB_SCHEMA,
            "job_sha256": job_sha256,
            "detector_contract_manifest": detector_manifest,
            "detector_contract_sha256": detector_contract_sha256,
            "cell_index": cell_index,
            "status": status,
            "records": record_count,
            "terminal_record_sha256": parent_sha256 if record_count else None,
            "discovery_verdict": discovery.verdict if discovery else None,
            "terminal_verdict": terminal.verdict if terminal else None,
            "terminal_proof_verified": terminal.proof_verified if terminal else False,
            "replay": replay,
            "journal_replayed": journal_replayed,
            "max_iterations": max_iterations,
            "timeout_seconds": timeout_seconds,
            "artifacts": artifacts,
            "error": error,
        }
        _write_json(workdir / "summary.json", summary)
        return summary
    finally:
        lock.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--cell-index", type=int, required=True)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--seed-journal", type=Path)
    args = parser.parse_args()
    try:
        summary = run_structural_cegar(
            args.repo_root.resolve(),
            args.workdir,
            args.cell_index,
            max_iterations=args.max_iterations,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
            seed_journal=args.seed_journal,
        )
    except (EncodingError, Exact12V14StructuralCegarError, OSError) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0 if summary["status"] == "UNSAT_DRAT_VERIFIED" else 2


if __name__ == "__main__":
    raise SystemExit(main())
