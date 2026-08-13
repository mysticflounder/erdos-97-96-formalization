"""Authenticated structural CEGAR for one exact-12 successor cell.

Every SAT assignment is replayed against the source-faithful candidate
surface, the next-row successor predicate, and the complete current CNF.  The
runner first admits independently replayed, order-independent metric
certificates whose rows are interpreted as selected supports (``exact=False``),
then checks an authenticated bank of exact Lean-backed source-order positive
nogoods.  Each admitted certificate is compiled to a clause over the exact
selected-row choice variables and recorded in a tagged append-only journal.

Discovery UNSAT is terminal only after a fresh identical-CNF run emits a DRAT
proof accepted by the existing solver adapter.  Even that result closes only
one finite placement cell; it is not aggregate coverage, a universal lift, or
a Lean sorry closure.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import io
import json
import os
import shutil
import stat
from collections import Counter
from collections.abc import Callable, Collection, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric

from .candidate_surface import build_model
from .exact12_next_row_cell_run import (
    _artifact,
    _build_job,
    _claim_empty_workdir,
    _sha256_file,
    _write_json,
    cnf_assignment_satisfies,
)
from .exact12_next_row_valuation import (
    CompiledExact12NextRowCell,
    Exact12NextRowValuationError,
    added_constraints_hold,
    cells,
    compile_cell,
    decode_blockers,
    decode_distinguished_d,
)
from .exact12_v14_ordered_cut_adapter import (
    SOURCE_ORDER_CERTIFICATE_KIND,
    AdmittedCut,
    Exact12V14OrderedCutAdapterError,
    detect_proof_backed_source_order_cut,
    replay_proof_backed_source_order_cut,
)
from .exact12_v14_source_order_bank import (
    Exact12V14SourceOrderBankError,
    attest_source_order_bank_live_sources,
    build_source_order_bank,
    snapshot_source_order_bank,
)
from .sat_encoding import CadicalResult, EncodingError, solve_cadical
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
    source_faithful_cube_ok,
)

RUN_SCHEMA = "p97_rigid221_exact12_next_row_tagged_cegar_run.v5"
RECORD_SCHEMA = "p97_rigid221_exact12_next_row_tagged_cut.v5"
LEGACY_RECORD_SCHEMAS = frozenset(
    {
        "p97_rigid221_exact12_next_row_structural_cut.v2",
        "p97_rigid221_exact12_next_row_tagged_cut.v3",
        "p97_rigid221_exact12_next_row_tagged_cut.v4",
    }
)
LEGACY_RECORD_SCHEMA = "p97_rigid221_exact12_next_row_structural_cut.v2"
STRUCTURAL_CERTIFICATE_SCHEMA = "p97_phase3_structural_certificate_payload.v1"
STRUCTURAL_CERTIFICATE_KIND = "structural_metric_core_exact_false"
DETECTOR_CONTRACT = (
    "structural-first exact=False metric replay, then exact Lean-backed "
    "source-order positive-coverage replay"
)
PIQD_DISCOVERY_BACKEND = "piqd"
LEGACY_LOCAL_DISCOVERY_BACKEND = "legacy-local"
DISCOVERY_BACKENDS = (PIQD_DISCOVERY_BACKEND, LEGACY_LOCAL_DISCOVERY_BACKEND)
DEFAULT_PIQD_BASE_URL = "http://127.0.0.1:7272"
SEQUENTIAL_MODE = "sequential"
NEXT_ROW_LEAN_TERMINAL_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "NextRowTerminalBankConsumer.false_of_terminalNextRowSourceOrderBank"
)
DETECTOR_PATHS = (
    "census/card_head/exact12_next_row_structural_cegar.py",
    "census/card_head/exact12_v14_ordered_cut_adapter.py",
    "census/card_head/exact12_v14_ordered_coverage.py",
    "census/card_head/exact12_v14_source_order_bank.py",
    "census/card_head/sat_encoding.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
    "census/p97_search/phase3_classification_context.py",
    "census/p97_search/phase3_order_universe.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowTerminalBankConsumer.lean"
    ),
)


class Exact12NextRowStructuralCegarError(ValueError):
    """The runner input, detector output, journal, or artifact failed closed."""


@dataclass(frozen=True)
class StructuralDiscoveryRequest:
    """Immutable identities for one current structural-CEGAR discovery query."""

    instance: SourceFaithfulCoverInstance
    job: Mapping[str, Any]
    detector_contract_sha256: str
    cell_index: int
    iteration: int
    local_iteration: int
    parent_record_sha256: str
    current_dimacs: bytes
    current_cnf_sha256: str
    num_variables: int
    num_clauses: int


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _cnf_sha256(instance: SourceFaithfulCoverInstance) -> str:
    return hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()


def _reject_json_constant(value: str) -> None:
    raise ValueError(f"non-standard JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _detector_manifest(
    repo_root: Path, paths: tuple[str, ...] | None = None
) -> list[dict[str, Any]]:
    paths = DETECTOR_PATHS if paths is None else paths
    result: list[dict[str, Any]] = []
    for relative in paths:
        path = repo_root / relative
        relative_path = Path(relative)
        if relative_path.is_absolute() or ".." in relative_path.parts:
            raise Exact12NextRowStructuralCegarError(
                f"detector source path is unsafe: {relative}"
            )
        cursor = repo_root
        try:
            for part in relative_path.parts:
                cursor /= part
                if stat.S_ISLNK(cursor.lstat().st_mode):
                    raise Exact12NextRowStructuralCegarError(
                        f"detector source path contains a symlink: {relative}"
                    )
            flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
            descriptor = os.open(path, flags)
            try:
                metadata = os.fstat(descriptor)
                if not stat.S_ISREG(metadata.st_mode):
                    raise Exact12NextRowStructuralCegarError(
                        f"detector source is not a regular file: {relative}"
                    )
                with os.fdopen(descriptor, "rb", closefd=False) as handle:
                    payload = handle.read()
            finally:
                os.close(descriptor)
        except FileNotFoundError as exc:
            raise Exact12NextRowStructuralCegarError(
                f"detector source is missing: {relative}"
            ) from exc
        except OSError as exc:
            raise Exact12NextRowStructuralCegarError(
                f"detector source could not be authenticated: {relative}"
            ) from exc
        result.append(
            {
                "path": relative,
                "bytes": len(payload),
                "sha256": hashlib.sha256(payload).hexdigest(),
            }
        )
    return result


def _canonical_cube(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, list[int]]:
    if not isinstance(cube, Mapping):
        raise Exact12NextRowStructuralCegarError("cube is not a mapping")
    rows: list[Collection[int] | None] = [None] * 12
    for raw_center, support in cube.items():
        if isinstance(raw_center, bool):
            raise Exact12NextRowStructuralCegarError("cube center is malformed")
        try:
            center = int(raw_center)
        except (TypeError, ValueError) as exc:
            raise Exact12NextRowStructuralCegarError(
                "cube center is malformed"
            ) from exc
        if str(center) != str(raw_center) or not 0 <= center < 12:
            raise Exact12NextRowStructuralCegarError("cube center is malformed")
        if rows[center] is not None:
            raise Exact12NextRowStructuralCegarError("cube repeats a center")
        rows[center] = support
    if any(row is None for row in rows):
        raise Exact12NextRowStructuralCegarError("cube omits a center")
    payload: dict[str, list[int]] = {}
    for center, raw_support in enumerate(rows):
        if isinstance(raw_support, (str, bytes)):
            raise Exact12NextRowStructuralCegarError("cube support is malformed")
        try:
            support = sorted(raw_support)  # type: ignore[arg-type]
        except TypeError as exc:
            raise Exact12NextRowStructuralCegarError(
                "cube support is malformed"
            ) from exc
        if (
            len(support) != 4
            or len(set(support)) != 4
            or any(
                isinstance(point, bool)
                or not isinstance(point, int)
                or not 0 <= point < 12
                or point == center
                for point in support
            )
        ):
            raise Exact12NextRowStructuralCegarError("cube support is malformed")
        payload[str(center)] = support
    return payload


def _cube_as_ints(cube: Mapping[int | str, Collection[int]]) -> dict[int, list[int]]:
    payload = _canonical_cube(cube)
    return {center: payload[str(center)] for center in range(12)}


def _canonical_positive_variables(
    positive_variables: Collection[int], *, n_variables: int
) -> list[int]:
    if isinstance(positive_variables, (str, bytes)):
        raise Exact12NextRowStructuralCegarError(
            "positive-variable assignment is malformed"
        )
    try:
        positive = sorted(positive_variables)
    except TypeError as exc:
        raise Exact12NextRowStructuralCegarError(
            "positive-variable assignment is malformed"
        ) from exc
    if len(positive) != len(set(positive)) or any(
        isinstance(variable, bool)
        or not isinstance(variable, int)
        or not 1 <= variable <= n_variables
        for variable in positive
    ):
        raise Exact12NextRowStructuralCegarError(
            "positive-variable assignment is malformed"
        )
    return positive


def _certificate_rows(
    certificate: Mapping[str, Any],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    raw_rows = certificate.get("rows")
    if type(raw_rows) is not list or not raw_rows:
        raise Exact12NextRowStructuralCegarError("certificate rows are malformed")
    rows: list[tuple[int, tuple[int, ...]]] = []
    for raw in raw_rows:
        if type(raw) is not dict or set(raw) != {"center", "support", "exact"}:
            raise Exact12NextRowStructuralCegarError("certificate row is malformed")
        center = raw["center"]
        support = raw["support"]
        if type(center) is not int or not 0 <= center < 12:
            raise Exact12NextRowStructuralCegarError("certificate center is malformed")
        if raw["exact"] is not False:
            raise Exact12NextRowStructuralCegarError(
                "selected-support certificate must have exact=False"
            )
        if (
            type(support) is not list
            or len(support) != 4
            or any(type(point) is not int for point in support)
        ):
            raise Exact12NextRowStructuralCegarError("certificate support is malformed")
        normalized = tuple(sorted(support))
        if len(set(normalized)) != 4:
            raise Exact12NextRowStructuralCegarError(
                "certificate support repeats a point"
            )
        rows.append((center, normalized))
    if len(rows) != len(set(rows)):
        raise Exact12NextRowStructuralCegarError("certificate repeats a row")
    if len({center for center, _support in rows}) != len(rows):
        raise Exact12NextRowStructuralCegarError(
            "certificate repeats a center with different supports"
        )
    return tuple(rows)


def validate_structural_certificate(certificate: Mapping[str, Any]) -> bool:
    """Replay a certificate under the selected-support ``exact=False`` contract."""

    try:
        _certificate_rows(certificate)
        return certificates._validate_certificate(certificate, n=12) is True
    except (KeyError, TypeError, ValueError):
        return False


def detect_structural_certificate(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, Any] | None:
    """Return the first independently replayed order-independent certificate."""

    normalized = _cube_as_ints(cube)
    rows = tuple(
        metric.MetricRow(center, tuple(normalized[center]), False)
        for center in range(12)
    )
    detection = metric._formalized_metric_core(
        rows,
        12,
        (),
        include_extended=True,
        include_ordered=False,
    )
    if detection is None:
        return None
    certificate = certificates._certificate_for_detection(rows, 12, detection)
    if not validate_structural_certificate(certificate):
        raise Exact12NextRowStructuralCegarError(
            "detector certificate failed independent replay"
        )
    return certificate


def learned_clause_for_certificate(
    instance: SourceFaithfulCoverInstance,
    certificate: Mapping[str, Any],
) -> tuple[int, ...]:
    """Compile a replayed metric nogood to exact selected-row literals."""

    if not validate_structural_certificate(certificate):
        raise Exact12NextRowStructuralCegarError("refusing an invalid certificate")
    literals: list[int] = []
    for center, support in _certificate_rows(certificate):
        try:
            candidate_index = instance.candidate_index(center, support)
            variable = instance.choice_variables[(center, candidate_index)]
        except (KeyError, EncodingError, ValueError) as exc:
            raise Exact12NextRowStructuralCegarError(
                f"certificate row ({center}, {support}) is outside the source surface"
            ) from exc
        literals.append(-variable)
    clause = tuple(literals)
    if not clause or len(clause) != len(set(clause)):
        raise Exact12NextRowStructuralCegarError(
            "learned clause is empty or repeats a literal"
        )
    return clause


def _certificate_consumer(admitted_cut: AdmittedCut) -> str | None:
    if admitted_cut.certificate_kind == STRUCTURAL_CERTIFICATE_KIND:
        # The Python certificate replays a finite obstruction, but no generated
        # Lean value currently packages that certificate as a typed learned
        # nogood.  Naming the carrier-level MetricCoreAlternative theorem here
        # would falsely advertise a direct journal-to-Lean consumer.
        return None
    binding = admitted_cut.certificate.get("generated_lean_nogood")
    if not isinstance(binding, Mapping):
        raise Exact12NextRowStructuralCegarError(
            "source-order certificate omitted its generated Lean binding"
        )
    bank_consumer = binding.get("terminal_consumer_declaration")
    if not isinstance(bank_consumer, str) or not bank_consumer:
        raise Exact12NextRowStructuralCegarError(
            "source-order certificate omitted its Lean consumer declaration"
        )
    # The shared bank was originally built for the normalized-v14 formula.
    # Its proof-carrying nogoods are reusable, but its v14 terminal theorem is
    # not: the next-row distinguished-row clauses have different semantics.
    # Record the lane-specific conditional endpoint and authenticate its source
    # through DETECTOR_PATHS instead of silently borrowing the v14 consumer.
    return NEXT_ROW_LEAN_TERMINAL_CONSUMER


def detect_admitted_cut(
    instance: SourceFaithfulCoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    source_order_bank: Mapping[str, Any],
) -> AdmittedCut | None:
    """Prefer legacy-stable structural replay, then a Lean-backed order cut."""

    certificate = detect_structural_certificate(cube)
    if certificate is not None:
        return AdmittedCut(
            certificate_kind=STRUCTURAL_CERTIFICATE_KIND,
            certificate_schema=STRUCTURAL_CERTIFICATE_SCHEMA,
            detector_stage=str(certificate["stage"]),
            certificate=copy.deepcopy(dict(certificate)),
            learned_clause=learned_clause_for_certificate(instance, certificate),
        )
    try:
        return detect_proof_backed_source_order_cut(
            None,
            instance,
            cube,
            source_order_bank=source_order_bank,
        )
    except Exact12V14OrderedCutAdapterError as exc:
        raise Exact12NextRowStructuralCegarError(str(exc)) from exc


def replay_tagged_cut(
    instance: SourceFaithfulCoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    certificate_kind: str,
    certificate_schema: str,
    detector_stage: str,
    certificate: Mapping[str, Any],
    bank_index: int | None,
    source_order_bank: Mapping[str, Any],
) -> tuple[int, ...]:
    """Replay exactly the certificate family declared by one v3 record."""

    if certificate_kind == STRUCTURAL_CERTIFICATE_KIND:
        if bank_index is not None:
            raise Exact12NextRowStructuralCegarError(
                "structural certificate unexpectedly names a source-order bank index"
            )
        if (
            certificate_schema != STRUCTURAL_CERTIFICATE_SCHEMA
            or detector_stage != certificate.get("stage")
            or detect_structural_certificate(cube) != certificate
        ):
            raise Exact12NextRowStructuralCegarError(
                "structural certificate failed exact detector replay"
            )
        return learned_clause_for_certificate(instance, certificate)
    if certificate_kind == SOURCE_ORDER_CERTIFICATE_KIND:
        if detect_structural_certificate(cube) is not None:
            raise Exact12NextRowStructuralCegarError(
                "source-order record bypasses the structural-first detector stage"
            )
        try:
            return replay_proof_backed_source_order_cut(
                None,
                instance,
                cube,
                certificate_schema=certificate_schema,
                detector_stage=detector_stage,
                certificate=certificate,
                bank_index=bank_index,
                source_order_bank=source_order_bank,
            )
        except Exact12V14OrderedCutAdapterError as exc:
            raise Exact12NextRowStructuralCegarError(str(exc)) from exc
    raise Exact12NextRowStructuralCegarError(
        f"unknown tagged certificate family: {certificate_kind!r}"
    )


def _replay_sat_witness(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowCell,
    reported_cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
) -> tuple[dict[int, list[int]], frozenset[int], dict[str, bool]]:
    """Bind the reported cube to its assignment and replay every SAT gate."""

    reported_payload = _canonical_cube(reported_cube)
    positive = frozenset(
        _canonical_positive_variables(
            positive_variables, n_variables=instance.cnf.n_variables
        )
    )
    decoded_cube = instance.decode_model(positive)
    if _canonical_cube(decoded_cube) != reported_payload:
        raise Exact12NextRowStructuralCegarError(
            "reported cube differs from the cube decoded from its assignment"
        )
    blockers = decode_blockers(positive, compiled.blocker_variables)
    distinguished_d = decode_distinguished_d(
        positive, compiled.distinguished_d_variables
    )
    replay = {
        "candidate": source_faithful_cube_ok(instance.model, decoded_cube),
        "added_constraints": added_constraints_hold(
            compiled.cell, decoded_cube, blockers, distinguished_d
        ),
        "exact_cnf": cnf_assignment_satisfies(
            instance.clauses_with(),
            positive,
            n_variables=instance.cnf.n_variables,
        ),
    }
    if not all(replay.values()):
        raise Exact12NextRowStructuralCegarError(
            "SAT assignment failed a source, predicate, or CNF replay gate"
        )
    return decoded_cube, positive, replay


def _make_record(
    *,
    index: int,
    parent_sha256: str,
    job_id: str,
    detector_contract_sha256: str,
    cell_index: int,
    source_order_bank_sha256: str,
    admitted_cut: AdmittedCut,
    pre_cut_cnf_sha256: str,
    post_cut_cnf_sha256: str,
    cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
    n_variables: int,
    record_schema: str = RECORD_SCHEMA,
    cell_binding_field: str = "cell_index",
    cell_binding_value: int | None = None,
) -> dict[str, Any]:
    cube_payload = _canonical_cube(cube)
    assignment_payload = _canonical_positive_variables(
        positive_variables, n_variables=n_variables
    )
    certificate_payload = copy.deepcopy(admitted_cut.certificate)
    if cell_binding_value is None:
        cell_binding_value = cell_index
    body = {
        "schema": record_schema,
        "index": index,
        "parent_sha256": parent_sha256,
        "job_id": job_id,
        "detector_contract_sha256": detector_contract_sha256,
        cell_binding_field: cell_binding_value,
        "detector_contract": DETECTOR_CONTRACT,
        "certificate_kind": admitted_cut.certificate_kind,
        "certificate_schema": admitted_cut.certificate_schema,
        "detector_stage": admitted_cut.detector_stage,
        "general_lean_consumer": _certificate_consumer(admitted_cut),
        "certificate": certificate_payload,
        "certificate_sha256": _sha256_json(certificate_payload),
        "source_order_bank_sha256": source_order_bank_sha256,
        "source_order_bank_index": admitted_cut.bank_index,
        "learned_clause": list(admitted_cut.learned_clause),
        "learned_clause_sha256": _sha256_json(list(admitted_cut.learned_clause)),
        "pre_cut_cnf_sha256": pre_cut_cnf_sha256,
        "post_cut_cnf_sha256": post_cut_cnf_sha256,
        "cube": cube_payload,
        "cube_sha256": _sha256_json(cube_payload),
        "positive_variables": assignment_payload,
        "assignment_sha256": _sha256_json(assignment_payload),
    }
    return {**body, "record_sha256": _sha256_json(body)}


def _append_record(path: Path, record: Mapping[str, Any]) -> None:
    with path.open("ab") as handle:
        handle.write(_canonical_json_bytes(record) + b"\n")
        handle.flush()
        os.fsync(handle.fileno())


def replay_journal(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowCell,
    journal: Path | BinaryIO,
    *,
    repo_root: Path,
    job_id: str,
    detector_contract_sha256: str,
    cell_index: int,
    source_order_bank: Mapping[str, Any],
    record_schema: str = RECORD_SCHEMA,
    cell_binding_field: str = "cell_index",
    cell_binding_value: int | None = None,
    sat_witness_replay: Callable[
        ..., tuple[dict[int, list[int]], frozenset[int], dict[str, bool]]
    ]
    | None = None,
) -> tuple[int, str, frozenset[tuple[int, ...]], tuple[str, ...]]:
    """Atomically replay a live-source-bound journal and install all its cuts."""

    original_cnf_sha256 = _cnf_sha256(instance)
    shadow_instance = copy.deepcopy(instance)
    try:
        replay_bank = snapshot_source_order_bank(shadow_instance, source_order_bank)
        attest_source_order_bank_live_sources(repo_root, replay_bank)
    except Exact12V14SourceOrderBankError as exc:
        raise Exact12NextRowStructuralCegarError(str(exc)) from exc
    source_order_bank_sha256 = replay_bank["bank_sha256"]

    if isinstance(journal, Path):
        if not journal.is_file():
            return 0, job_id, frozenset(), ()
        payload = journal.read_bytes()
        context = io.BytesIO(payload)
    else:
        try:
            journal.seek(0)
            payload = journal.read()
        except (AttributeError, OSError, ValueError) as exc:
            raise Exact12NextRowStructuralCegarError(
                "journal stream could not be snapshotted"
            ) from exc
        if type(payload) is not bytes:
            raise Exact12NextRowStructuralCegarError(
                "journal stream snapshot is not immutable bytes"
            )
        context = io.BytesIO(payload)

    if cell_binding_value is None:
        cell_binding_value = cell_index
    sat_witness_replay = (
        _replay_sat_witness if sat_witness_replay is None else sat_witness_replay
    )
    expected_fields = {
        "schema",
        "index",
        "parent_sha256",
        "job_id",
        "detector_contract_sha256",
        cell_binding_field,
        "detector_contract",
        "certificate_kind",
        "certificate_schema",
        "detector_stage",
        "general_lean_consumer",
        "certificate",
        "certificate_sha256",
        "source_order_bank_sha256",
        "source_order_bank_index",
        "learned_clause",
        "learned_clause_sha256",
        "pre_cut_cnf_sha256",
        "post_cut_cnf_sha256",
        "cube",
        "cube_sha256",
        "positive_variables",
        "assignment_sha256",
        "record_sha256",
    }
    parent = job_id
    count = 0
    seen: set[tuple[int, ...]] = set()
    staged_clauses: list[tuple[int, ...]] = []
    stages: list[str] = []
    with context as handle:
        for line_number, raw in enumerate(handle, 1):
            if not raw.endswith(b"\n"):
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} is not newline terminated"
                )
            try:
                record = json.loads(
                    raw,
                    object_pairs_hook=_reject_duplicate_keys,
                    parse_constant=_reject_json_constant,
                )
            except (UnicodeError, json.JSONDecodeError, ValueError) as exc:
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} is not strict JSON"
                ) from exc
            if (
                isinstance(record, Mapping)
                and record.get("schema") in LEGACY_RECORD_SCHEMAS
            ):
                raise Exact12NextRowStructuralCegarError(
                    "legacy v2/v3 journals require an explicit migration; start a fresh v4 run"
                )
            if type(record) is not dict or set(record) != expected_fields:
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} is malformed"
                )
            body = dict(record)
            record_sha256 = body.pop("record_sha256")
            if (
                record["schema"] != record_schema
                or record["index"] != count
                or record["parent_sha256"] != parent
                or record["job_id"] != job_id
                or record["detector_contract_sha256"] != detector_contract_sha256
                or record[cell_binding_field] != cell_binding_value
                or record["detector_contract"] != DETECTOR_CONTRACT
                or record["source_order_bank_sha256"] != source_order_bank_sha256
                or record_sha256 != _sha256_json(body)
            ):
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} failed chain authentication"
                )
            certificate = record["certificate"]
            certificate_kind = record["certificate_kind"]
            certificate_schema = record["certificate_schema"]
            detector_stage = record["detector_stage"]
            bank_index = record["source_order_bank_index"]
            if (
                type(certificate) is not dict
                or not isinstance(certificate_kind, str)
                or not isinstance(certificate_schema, str)
                or not isinstance(detector_stage, str)
                or (
                    certificate_kind == SOURCE_ORDER_CERTIFICATE_KIND
                    and (
                        isinstance(bank_index, bool)
                        or not isinstance(bank_index, int)
                        or bank_index < 0
                    )
                )
            ):
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} has an invalid certificate"
                )
            if record["certificate_sha256"] != _sha256_json(certificate):
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} certificate metadata drifted"
                )
            cube_payload = _canonical_cube(record["cube"])
            positive = _canonical_positive_variables(
                record["positive_variables"],
                n_variables=shadow_instance.cnf.n_variables,
            )
            if (
                record["cube"] != cube_payload
                or record["cube_sha256"] != _sha256_json(cube_payload)
                or record["positive_variables"] != positive
                or record["assignment_sha256"] != _sha256_json(positive)
            ):
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} witness hash drifted"
                )
            cube = _cube_as_ints(cube_payload)
            try:
                decoded_cube, replayed_positive, _replay = sat_witness_replay(
                    shadow_instance, compiled, cube, positive
                )
            except (
                EncodingError,
                Exact12NextRowStructuralCegarError,
                Exact12NextRowValuationError,
                ValueError,
            ) as exc:
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} SAT witness failed replay"
                ) from exc
            clause = replay_tagged_cut(
                shadow_instance,
                decoded_cube,
                certificate_kind=certificate_kind,
                certificate_schema=certificate_schema,
                detector_stage=detector_stage,
                certificate=certificate,
                bank_index=bank_index,
                source_order_bank=replay_bank,
            )
            replayed_cut = AdmittedCut(
                certificate_kind=certificate_kind,
                certificate_schema=certificate_schema,
                detector_stage=detector_stage,
                certificate=copy.deepcopy(certificate),
                learned_clause=clause,
                bank_index=bank_index,
            )
            pre_cut_cnf_sha256 = _cnf_sha256(shadow_instance)
            post_cut_cnf_sha256 = hashlib.sha256(
                shadow_instance.dimacs((clause,)).encode("ascii")
            ).hexdigest()
            if (
                record["learned_clause"] != list(clause)
                or record["learned_clause_sha256"] != _sha256_json(list(clause))
                or record["general_lean_consumer"]
                != _certificate_consumer(replayed_cut)
                or record["pre_cut_cnf_sha256"] != pre_cut_cnf_sha256
                or record["post_cut_cnf_sha256"] != post_cut_cnf_sha256
                or clause in seen
            ):
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} formula or learned clause drifted"
                )
            if any(
                (literal > 0 and literal in replayed_positive)
                or (literal < 0 and -literal not in replayed_positive)
                for literal in clause
            ):
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} witness does not falsify its cut"
                )
            shadow_instance.cnf.add_clause(clause)
            if _cnf_sha256(shadow_instance) != post_cut_cnf_sha256:
                raise Exact12NextRowStructuralCegarError(
                    f"journal line {line_number} post-cut CNF reconstruction drifted"
                )
            seen.add(clause)
            staged_clauses.append(clause)
            stages.append(detector_stage)
            parent = record_sha256
            count += 1
    if _cnf_sha256(instance) != original_cnf_sha256:
        raise Exact12NextRowStructuralCegarError(
            "replay target CNF changed during transactional validation"
        )
    for clause in staged_clauses:
        instance.cnf.add_clause(clause)
    if _cnf_sha256(instance) != _cnf_sha256(shadow_instance):
        raise Exact12NextRowStructuralCegarError(
            "transactional journal installation drifted from validated shadow CNF"
        )
    return count, parent, frozenset(seen), tuple(stages)


def _nonterminal_status(result: CadicalResult) -> str:
    return (
        result.verdict if result.verdict in {"TIMEOUT", "UNKNOWN"} else "PIPELINE_ERROR"
    )


_MAX_TERMINAL_ARTIFACT_BYTES = 256 * 1024 * 1024


def _reserve_terminal_artifact(path: Path) -> tuple[int, tuple[int, int]]:
    """Create and retain a private terminal artifact descriptor."""

    try:
        descriptor = os.open(
            path,
            os.O_RDWR
            | os.O_CREAT
            | os.O_EXCL
            | os.O_CLOEXEC
            | os.O_NOFOLLOW,
            0o600,
        )
    except FileExistsError as exc:
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact reservation already exists: {path.name}"
        ) from exc
    except OSError as exc:
        raise Exact12NextRowStructuralCegarError(
            f"cannot reserve terminal artifact: {path.name}"
        ) from exc
    try:
        os.fchmod(descriptor, 0o600)
        os.fsync(descriptor)
        metadata = os.fstat(descriptor)
        if (
            not stat.S_ISREG(metadata.st_mode)
            or metadata.st_nlink != 1
            or stat.S_IMODE(metadata.st_mode) != 0o600
        ):
            raise Exact12NextRowStructuralCegarError(
                f"terminal artifact reservation is not private regular: {path.name}"
            )
        try:
            parent_descriptor = os.open(
                path.parent,
                os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW,
            )
        except OSError as exc:
            raise Exact12NextRowStructuralCegarError(
                f"cannot sync terminal artifact directory: {path.parent}"
            ) from exc
        try:
            os.fsync(parent_descriptor)
        finally:
            os.close(parent_descriptor)
        return descriptor, (metadata.st_dev, metadata.st_ino)
    except BaseException:
        os.close(descriptor)
        raise


def _recapture_terminal_artifact(
    path: Path, descriptor: int, expected_identity: tuple[int, int]
) -> str:
    """Hash exact bytes from a held inode and reject pathname replacement."""

    try:
        metadata = os.fstat(descriptor)
    except OSError as exc:
        raise Exact12NextRowStructuralCegarError(
            f"cannot recapture terminal artifact: {path.name}"
        ) from exc
    identity = (metadata.st_dev, metadata.st_ino)
    if identity != expected_identity:
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact descriptor drifted: {path.name}"
        )
    try:
        rebound = os.stat(path, follow_symlinks=False)
    except OSError as exc:
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact pathname disappeared: {path.name}"
        ) from exc
    if (rebound.st_dev, rebound.st_ino) != identity:
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact pathname was rebound: {path.name}"
        )
    if (
        not stat.S_ISREG(metadata.st_mode)
        or metadata.st_nlink != 1
        or stat.S_IMODE(metadata.st_mode) != 0o600
    ):
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact is not private regular: {path.name}"
        )
    if metadata.st_size > _MAX_TERMINAL_ARTIFACT_BYTES:
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact is oversized: {path.name}"
        )
    try:
        os.lseek(descriptor, 0, os.SEEK_SET)
    except OSError as exc:
        raise Exact12NextRowStructuralCegarError(
            f"cannot seek terminal artifact: {path.name}"
        ) from exc
    digest = hashlib.sha256()
    remaining = metadata.st_size
    while remaining:
        try:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
        except OSError as exc:
            raise Exact12NextRowStructuralCegarError(
                f"cannot read terminal artifact: {path.name}"
            ) from exc
        if not chunk:
            raise Exact12NextRowStructuralCegarError(
                f"terminal artifact was truncated: {path.name}"
            )
        digest.update(chunk)
        remaining -= len(chunk)
    try:
        trailing = os.read(descriptor, 1)
        final_metadata = os.fstat(descriptor)
    except OSError as exc:
        raise Exact12NextRowStructuralCegarError(
            f"cannot finalize terminal artifact recapture: {path.name}"
        ) from exc
    if trailing or (
        final_metadata.st_dev,
        final_metadata.st_ino,
        final_metadata.st_mode,
        final_metadata.st_nlink,
        final_metadata.st_size,
    ) != (
        metadata.st_dev,
        metadata.st_ino,
        metadata.st_mode,
        metadata.st_nlink,
        metadata.st_size,
    ):
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact changed during recapture: {path.name}"
        )
    try:
        rebound = os.stat(path, follow_symlinks=False)
    except OSError as exc:
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact pathname disappeared: {path.name}"
        ) from exc
    if (
        rebound.st_dev,
        rebound.st_ino,
        rebound.st_mode,
        rebound.st_nlink,
        rebound.st_size,
    ) != (
        metadata.st_dev,
        metadata.st_ino,
        metadata.st_mode,
        metadata.st_nlink,
        metadata.st_size,
    ):
        raise Exact12NextRowStructuralCegarError(
            f"terminal artifact pathname was rebound: {path.name}"
        )
    return digest.hexdigest()


def run_structural_cegar(
    repo_root: Path,
    workdir: Path,
    cell_index: int,
    *,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
    solver: Callable[..., CadicalResult] = solve_cadical,
    discovery_solver_factory: Callable[
        [StructuralDiscoveryRequest], Callable[..., CadicalResult]
    ]
    | None = None,
    _schedule: tuple[Any, ...] | None = None,
    _compile_selected_cell: Callable[..., Any] | None = None,
    _build_selected_job: Callable[..., dict[str, Any]] | None = None,
    _sat_witness_replay: Callable[
        ..., tuple[dict[int, list[int]], frozenset[int], dict[str, bool]]
    ]
    | None = None,
    _run_schema: str = RUN_SCHEMA,
    _record_schema: str = RECORD_SCHEMA,
    _cell_binding_field: str = "cell_index",
    _scope: str | None = None,
    _detector_paths: tuple[str, ...] = DETECTOR_PATHS,
) -> dict[str, Any]:
    """Run one replay-gated structural CEGAR cell."""

    if type(max_iterations) is not int or max_iterations <= 0:
        raise Exact12NextRowStructuralCegarError(
            "max_iterations must be a positive plain integer"
        )
    schedule = cells() if _schedule is None else _schedule
    sat_witness_replay = (
        _replay_sat_witness if _sat_witness_replay is None else _sat_witness_replay
    )
    compile_selected_cell = (
        compile_cell if _compile_selected_cell is None else _compile_selected_cell
    )
    build_selected_job = (
        (lambda root, index, compiled, cnf: _build_job(root, compiled, cnf))
        if _build_selected_job is None
        else _build_selected_job
    )
    if type(cell_index) is not int or not 0 <= cell_index < len(schedule):
        raise Exact12NextRowStructuralCegarError("cell_index is outside the schedule")
    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise Exact12NextRowStructuralCegarError("timeout_seconds must be positive")
    if type(nice) is not int or not 1 <= nice <= 19:
        raise Exact12NextRowStructuralCegarError("nice must lie in [1, 19]")

    repo_root = repo_root.resolve()
    _claim_empty_workdir(workdir)
    try:
        instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compiled = compile_selected_cell(instance, schedule[cell_index])
        initial_cnf = instance.dimacs().encode("ascii")
        job = build_selected_job(repo_root, cell_index, compiled, initial_cnf)
        detector_manifest = _detector_manifest(repo_root, _detector_paths)
        detector_contract_sha256 = _sha256_json(detector_manifest)
        try:
            source_order_bank = snapshot_source_order_bank(
                instance, build_source_order_bank(repo_root, instance)
            )
        except Exact12V14SourceOrderBankError as exc:
            raise Exact12NextRowStructuralCegarError(str(exc)) from exc

        job_path = workdir / "job.json"
        detector_path = workdir / "detector_contract.json"
        journal_path = workdir / "journal.jsonl"
        _write_json(job_path, job)
        _write_json(
            detector_path,
            {
                "contract": DETECTOR_CONTRACT,
                "sha256": detector_contract_sha256,
                "sources": detector_manifest,
            },
        )
        if seed_journal is None:
            journal_path.touch(exist_ok=False)
        else:
            if not seed_journal.is_file():
                raise Exact12NextRowStructuralCegarError("seed journal is missing")
            shutil.copyfile(seed_journal, journal_path)

        record_count, parent_sha256, seen, stages = replay_journal(
            instance,
            compiled,
            journal_path,
            repo_root=repo_root,
            job_id=job["job_id"],
            detector_contract_sha256=detector_contract_sha256,
            cell_index=cell_index,
            source_order_bank=source_order_bank,
            record_schema=_record_schema,
            cell_binding_field=_cell_binding_field,
            cell_binding_value=cell_index,
            sat_witness_replay=sat_witness_replay,
        )
        seen_clauses = set(seen)
        stage_counts: Counter[str] = Counter(stages)
        status = "ITERATION_LIMIT"
        error: str | None = None
        discovery: CadicalResult | None = None
        terminal: CadicalResult | None = None
        discovery_cnf_sha256: str | None = None
        terminal_cnf_sha256: str | None = None
        replay = {
            "candidate": False,
            "added_constraints": False,
            "exact_cnf": False,
        }

        for local_iteration in range(max_iterations):
            discovery_path = workdir / "discovery.cnf"
            discovery_solver = solver
            if discovery_solver_factory is not None:
                current_dimacs = instance.dimacs().encode("ascii")
                request = StructuralDiscoveryRequest(
                    instance=instance,
                    job=copy.deepcopy(job),
                    detector_contract_sha256=detector_contract_sha256,
                    cell_index=cell_index,
                    iteration=record_count,
                    local_iteration=local_iteration,
                    parent_record_sha256=parent_sha256,
                    current_dimacs=current_dimacs,
                    current_cnf_sha256=hashlib.sha256(current_dimacs).hexdigest(),
                    num_variables=instance.cnf.n_variables,
                    num_clauses=len(instance.cnf.clauses),
                )
                discovery_solver = discovery_solver_factory(request)
                if not callable(discovery_solver):
                    raise Exact12NextRowStructuralCegarError(
                        "discovery solver factory returned a non-callable"
                    )
            discovery = discovery_solver(
                instance,
                discovery_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=None,
            )
            if discovery.verdict == "UNSAT":
                discovery_cnf_sha256 = _sha256_file(discovery_path)
                terminal_path = workdir / "terminal.cnf"
                proof_path = workdir / "terminal.drat"
                terminal_fd, terminal_anchor = _reserve_terminal_artifact(
                    terminal_path
                )
                try:
                    proof_fd, proof_anchor = _reserve_terminal_artifact(proof_path)
                    try:
                        terminal = solver(
                            instance,
                            terminal_path,
                            timeout_seconds=timeout_seconds,
                            nice=nice,
                            proof_path=proof_path,
                            cnf_fd=terminal_fd,
                            proof_fd=proof_fd,
                        )
                        recapture_errors: list[str] = []
                        try:
                            terminal_cnf_sha256 = _recapture_terminal_artifact(
                                terminal_path, terminal_fd, terminal_anchor
                            )
                        except Exact12NextRowStructuralCegarError as exc:
                            recapture_errors.append(str(exc))
                        try:
                            _recapture_terminal_artifact(
                                proof_path, proof_fd, proof_anchor
                            )
                        except Exact12NextRowStructuralCegarError as exc:
                            recapture_errors.append(str(exc))
                        if recapture_errors:
                            error = "; ".join(recapture_errors)
                            status = "DISCOVERY_UNSAT_UNVERIFIED"
                    finally:
                        os.close(proof_fd)
                finally:
                    os.close(terminal_fd)
                if (
                    error is None
                    and terminal.verdict == "UNSAT"
                    and terminal.proof_verified
                    and terminal_cnf_sha256 == discovery_cnf_sha256
                ):
                    status = "UNSAT_DRAT_VERIFIED"
                elif error is None:
                    status = "DISCOVERY_UNSAT_UNVERIFIED"
                    error = "fresh identical-CNF terminal proof rerun failed"
                break
            if discovery.verdict != "SAT":
                status = _nonterminal_status(discovery)
                break
            if discovery.cube is None or discovery.positive_variables is None:
                status = "PIPELINE_ERROR"
                error = "SAT result omitted its cube or positive assignment"
                break

            try:
                cube, positive, replay = sat_witness_replay(
                    instance,
                    compiled,
                    discovery.cube,
                    discovery.positive_variables,
                )
            except (
                Exact12NextRowStructuralCegarError,
                Exact12NextRowValuationError,
                EncodingError,
                ValueError,
            ) as exc:
                status = "SAT_REPLAY_FAILED"
                error = f"SAT replay raised: {exc}"
                break

            admitted_cut = detect_admitted_cut(
                instance,
                cube,
                source_order_bank=source_order_bank,
            )
            if admitted_cut is None:
                status = "STRUCTURALLY_UNRESOLVED"
                _write_json(
                    workdir / "survivor.json",
                    {
                        _cell_binding_field: cell_index,
                        "local_iteration": local_iteration,
                        "cube": _canonical_cube(cube),
                        "positive_variables": sorted(positive),
                        "replay": replay,
                    },
                )
                break
            clause = admitted_cut.learned_clause
            if clause in seen_clauses:
                status = "DETECTOR_REPEAT"
                error = "detector repeated an authenticated learned clause"
                break
            if any(
                (literal > 0 and literal in positive)
                or (literal < 0 and -literal not in positive)
                for literal in clause
            ):
                status = "PIPELINE_ERROR"
                error = "detector learned a clause not falsified by its SAT witness"
                break
            pre_cut_cnf_sha256 = _cnf_sha256(instance)
            post_cut_cnf_sha256 = hashlib.sha256(
                instance.dimacs((clause,)).encode("ascii")
            ).hexdigest()
            record = _make_record(
                index=record_count,
                parent_sha256=parent_sha256,
                job_id=job["job_id"],
                detector_contract_sha256=detector_contract_sha256,
                cell_index=cell_index,
                source_order_bank_sha256=source_order_bank["bank_sha256"],
                admitted_cut=admitted_cut,
                pre_cut_cnf_sha256=pre_cut_cnf_sha256,
                post_cut_cnf_sha256=post_cut_cnf_sha256,
                cube=cube,
                positive_variables=positive,
                n_variables=instance.cnf.n_variables,
                record_schema=_record_schema,
                cell_binding_field=_cell_binding_field,
                cell_binding_value=cell_index,
            )
            _append_record(journal_path, record)
            instance.cnf.add_clause(clause)
            if _cnf_sha256(instance) != post_cut_cnf_sha256:
                status = "PIPELINE_ERROR"
                error = "post-cut CNF reconstruction drifted after append"
                break
            seen_clauses.add(clause)
            stage_counts[admitted_cut.detector_stage] += 1
            parent_sha256 = record["record_sha256"]
            record_count += 1

        audit_instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        audit_compiled = compile_selected_cell(audit_instance, schedule[cell_index])
        audit_initial_cnf = audit_instance.dimacs().encode("ascii")
        audit_job = build_selected_job(
            repo_root, cell_index, audit_compiled, audit_initial_cnf
        )
        audit_count, audit_parent, audit_seen, audit_stages = replay_journal(
            audit_instance,
            audit_compiled,
            journal_path,
            repo_root=repo_root,
            job_id=audit_job["job_id"],
            detector_contract_sha256=detector_contract_sha256,
            cell_index=cell_index,
            source_order_bank=source_order_bank,
            record_schema=_record_schema,
            cell_binding_field=_cell_binding_field,
            cell_binding_value=cell_index,
            sat_witness_replay=sat_witness_replay,
        )
        journal_replayed = (
            audit_job["job_id"] == job["job_id"]
            and audit_count == record_count
            and audit_parent == parent_sha256
            and audit_seen == frozenset(seen_clauses)
            and Counter(audit_stages) == stage_counts
        )
        reconstructed_cnf_sha256 = _cnf_sha256(audit_instance)
        if status == "UNSAT_DRAT_VERIFIED" and (
            discovery_cnf_sha256 is None
            or terminal_cnf_sha256 is None
            or reconstructed_cnf_sha256 != discovery_cnf_sha256
            or reconstructed_cnf_sha256 != terminal_cnf_sha256
        ):
            status = "ARTIFACT_REPLAY_FAILED"
            error = "terminal formula differs from fresh journal reconstruction"
        artifacts = {
            "job": _artifact(job_path),
            "detector_contract": _artifact(detector_path),
            "journal": _artifact(journal_path),
            "discovery_cnf": _artifact(workdir / "discovery.cnf"),
            "terminal_cnf": _artifact(workdir / "terminal.cnf"),
            "proof": _artifact(workdir / "terminal.drat"),
            "survivor": _artifact(workdir / "survivor.json"),
        }
        if (
            artifacts["job"] is None
            or artifacts["detector_contract"] is None
            or artifacts["journal"] is None
            or not journal_replayed
        ):
            status = "ARTIFACT_REPLAY_FAILED"
            error = "job, detector contract, or complete journal failed replay"

        summary = {
            "schema": _run_schema,
            "scope": _scope
            or (
                "one finite next-row-only-hit placement cell; no aggregate "
                "coverage, universal lift, terminal bank, or Lean closure"
            ),
            "job_id": job["job_id"],
            "detector_contract_sha256": detector_contract_sha256,
            "source_order_bank_sha256": source_order_bank["bank_sha256"],
            _cell_binding_field: cell_index,
            "status": status,
            "records": record_count,
            "terminal_record_sha256": parent_sha256 if record_count else None,
            "stage_counts": dict(sorted(stage_counts.items())),
            "discovery_verdict": discovery.verdict if discovery else None,
            "terminal_verdict": terminal.verdict if terminal else None,
            "terminal_proof_verified": terminal.proof_verified if terminal else False,
            "discovery_cnf_sha256": discovery_cnf_sha256,
            "terminal_cnf_sha256": terminal_cnf_sha256,
            "reconstructed_cnf_sha256": reconstructed_cnf_sha256,
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
        # Retain the create-once claim; pathname cleanup could delete a
        # hostile replacement and would make workdir reuse ambiguous.
        pass


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--cell-index", type=int, required=True)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--seed-journal", type=Path)
    parser.add_argument(
        "--solver-backend",
        choices=DISCOVERY_BACKENDS,
        default=PIQD_DISCOVERY_BACKEND,
    )
    parser.add_argument("--piqd-base-url", default=DEFAULT_PIQD_BASE_URL)
    parser.add_argument("--piqd-journal-root", type=Path)
    parser.add_argument("--workers", type=int, choices=(1,), default=1)
    parser.add_argument(
        "--parallel-mode", choices=(SEQUENTIAL_MODE,), default=SEQUENTIAL_MODE
    )
    args = parser.parse_args(argv)
    try:
        if args.solver_backend == LEGACY_LOCAL_DISCOVERY_BACKEND:
            if args.piqd_journal_root is not None:
                raise Exact12NextRowStructuralCegarError(
                    "legacy-local discovery does not accept a PIQD journal root"
                )
            summary = run_structural_cegar(
                args.repo_root.resolve(),
                args.workdir,
                args.cell_index,
                max_iterations=args.max_iterations,
                timeout_seconds=args.timeout_seconds,
                nice=args.nice,
                seed_journal=args.seed_journal,
            )
        else:
            from .exact12_next_row_structural_piqd import (
                run_exact12_next_row_structural_piqd,
            )

            summary = run_exact12_next_row_structural_piqd(
                args.repo_root.resolve(),
                args.workdir,
                args.cell_index,
                piqd_base_url=args.piqd_base_url,
                piqd_journal_root=(
                    args.piqd_journal_root
                    if args.piqd_journal_root is not None
                    else args.workdir / "piqd-discovery"
                ),
                max_iterations=args.max_iterations,
                timeout_seconds=args.timeout_seconds,
                nice=args.nice,
                seed_journal=args.seed_journal,
                workers=args.workers,
                parallel_mode=args.parallel_mode,
            )
    except (
        EncodingError,
        Exact12NextRowStructuralCegarError,
        Exact12NextRowValuationError,
        OSError,
        ValueError,
    ) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0 if summary["status"] == "UNSAT_DRAT_VERIFIED" else 2


if __name__ == "__main__":
    raise SystemExit(main())
