"""Fresh-schema exact-12 next-row CEGAR with static convex closure.

The formula is the source-faithful next-row cell plus deterministic static
duplicate-center, equilateral-bisector, and perpendicular-bisector extensions,
followed by the complete authenticated 24-role block-spanning membership family,
its source-proved cell-1 ThreeTriad supplemental cut, and the exact authenticated
generated Lean-backed source-order bank.  The source-order bank is installed as
one checked CNF suffix before the job identity and discovery formula are
materialized.  Any source-order detector hit after SAT replay is therefore a
formula invariant failure; every untyped structural hit is preserved as a
survivor for theorem mining outside this static run.

A verified terminal DRAT result is still conditional infrastructure until it is
converted into a Lean `DimacsUnsatisfiable` theorem.  The static parent ingress
is ready, but this module does not advertise aggregate coverage, a universal
lift, or live closure.
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
from collections.abc import Callable, Collection, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric

from .candidate_surface import build_model
from .exact12_block_spanning_membership_family_bank import (
    Exact12BlockSpanningMembershipFamilyBankError,
    install_block_spanning_membership_family_bank,
    production_family_id_for_cell,
)
from .exact12_next_row_cell_run import (
    _artifact,
    _claim_empty_workdir,
    _sha256_file,
    _write_json,
    cnf_assignment_satisfies,
)
from .exact12_next_row_static_convex import (
    STATIC_CONVEX_SCHEMA,
    StaticConvexLayout,
    canonical_extension_satisfies_delta,
    install_static_convex_extension,
)
from .exact12_next_row_valuation import (
    COMPILER_SCHEMA,
    CompiledExact12NextRowCell,
    Exact12NextRowValuationError,
    added_constraints_hold,
    cells,
    compile_cell,
    decode_blockers,
    decode_distinguished_d,
)
from .exact12_three_triad_membership_bank import (
    BANK_SCHEMA as POSITIVE_MEMBERSHIP_BANK_SCHEMA,
)
from .exact12_three_triad_membership_bank import (
    LEAN_TERMINAL_CONSUMER as THREE_TRIAD_LEAN_TERMINAL_CONSUMER,
)
from .exact12_three_triad_membership_bank import (
    Exact12ThreeTriadMembershipBankError,
    attest_three_triad_membership_bank_live_sources,
    install_three_triad_membership_bank,
    production_cut_id_for_cell,
)
from .exact12_v14_ordered_cut_adapter import (
    SOURCE_ORDER_CERTIFICATE_KIND,
    SOURCE_ORDER_DETECTOR_STAGE,
    SOURCE_ORDER_INSTALLATION_SCHEMA,
    AdmittedCut,
    Exact12V14OrderedCutAdapterError,
    PreparedSourceOrderBank,
    attest_prepared_source_order_bank_installed,
    clone_installed_source_order_bank,
    detect_proof_backed_source_order_cut,
    install_prepared_source_order_bank,
    prepare_proof_backed_source_order_bank,
    replay_proof_backed_source_order_cut,
)
from .exact12_v14_source_order_bank import (
    Exact12V14SourceOrderBankError,
    attest_source_order_bank_live_sources,
    build_source_order_bank,
)
from .sat_encoding import CadicalResult, EncodingError, solve_cadical
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
    source_faithful_cube_ok,
)

RUN_SCHEMA = "p97_rigid221_exact12_next_row_static_convex_cegar_run.v8"
JOB_SCHEMA = "p97_rigid221_exact12_next_row_static_convex_cegar_job.v8"
RECORD_SCHEMA = "p97_rigid221_exact12_next_row_static_convex_source_order_cut.v8"
SURVIVOR_SCHEMA = "p97_rigid221_exact12_next_row_static_convex_survivor.v8"
LEAN_INGRESS_THEOREM = THREE_TRIAD_LEAN_TERMINAL_CONSUMER
TERMINAL_FORMULA_CONSUMER = LEAN_INGRESS_THEOREM
DETECTOR_CONTRACT = (
    "eager exact source-order-bank installation over static duplicate-center, "
    "equilateral-bisector, and perpendicular-bisector equality closure plus "
    "the complete cell-1 authenticated 24-role block-spanning membership family "
    "and source-proved ThreeTriad supplemental cut; a post-SAT source-order hit "
    "is an invariant failure and all other structural stages fail closed"
)
TERMINAL_PROMOTION_STATUS = (
    "UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE"
)
STATIC_STAGES = frozenset(
    {
        "equality-duplicate-center",
        "equality-equilateral-bisector-collision",
        "equality-perpendicular-bisector-convex",
    }
)

SOURCE_PATHS = (
    "census/card_head/exact12_next_row_static_cegar.py",
    "census/card_head/exact12_next_row_static_equality.py",
    "census/card_head/exact12_next_row_static_geometry.py",
    "census/card_head/exact12_next_row_static_convex.py",
    "census/card_head/exact12_next_row_valuation.py",
    "census/card_head/exact12_positive_membership_cnf.py",
    "census/card_head/exact12_block_spanning_membership_family_bank.py",
    "census/card_head/exact12_three_triad_membership_bank.py",
    "census/card_head/exact12_positive_membership_source_order_bank.py",
    "census/card_head/exact12_v14_ordered_cut_adapter.py",
    "census/card_head/exact12_v14_ordered_coverage.py",
    "census/card_head/exact12_v14_source_order_bank.py",
    "census/card_head/source_faithful_candidate_surface.py",
    "census/card_head/sat_encoding.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/p97_search/phase3_classification_context.py",
    "census/p97_search/phase3_order_universe.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowTerminalBankConsumer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericEquilateralBisectorNogoodCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericPerpBisectorNogoodCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericRowNogoodCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221SourceOrderTerminalBankConsumer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BlockSpanningCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BlockSpanningMembershipFamilyCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BlockSpanningMembershipFamilyTerminalConsumer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BlockSpanningCommonFiveCertificate.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticCell1ThirdBlockSpanningPositiveCut.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221PositiveMembershipCnfBridge.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticCell1ThirdBlockSpanningMembershipCnf.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticConvexSourceOrderConsumer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticTerminalConsumer.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221StaticPositiveMembershipTerminalConsumer.lean"
    ),
    "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
    "lean/Erdos9796Proof/P97/Census554/FivePointCollision.lean",
)


class Exact12NextRowStaticCegarError(ValueError):
    """The fresh formula, typed cut, journal, or artifact failed closed."""


@dataclass(frozen=True)
class StaticDiscoveryRequest:
    """Immutable per-formula input to an optional discovery-only solver factory."""

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


def _read_strict_json(path: Path) -> Any:
    try:
        payload = path.read_bytes().decode("utf-8")
        return json.loads(
            payload,
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_json_constant,
        )
    except (OSError, UnicodeError, json.JSONDecodeError, ValueError) as exc:
        raise Exact12NextRowStaticCegarError(
            f"persisted JSON artifact is not strict JSON: {path.name}"
        ) from exc


def _authenticate_persisted_contracts(
    job_path: Path,
    expected_job: Mapping[str, Any],
    detector_path: Path,
    expected_detector_payload: Mapping[str, Any],
    expected_detector_sha256: str,
) -> None:
    """Authenticate the persisted contract files against this run's inputs."""

    observed_job = _read_strict_json(job_path)
    if observed_job != dict(expected_job) or type(observed_job) is not dict:
        raise Exact12NextRowStaticCegarError(
            "persisted job.json differs from the canonical in-memory job"
        )
    job_payload = dict(observed_job)
    observed_job_id = job_payload.pop("job_id", None)
    if observed_job_id != _sha256_json(job_payload):
        raise Exact12NextRowStaticCegarError(
            "persisted job.json job_id failed canonical authentication"
        )

    observed_detector = _read_strict_json(detector_path)
    expected_detector = {
        **dict(expected_detector_payload),
        "sha256": expected_detector_sha256,
    }
    if observed_detector != expected_detector or type(observed_detector) is not dict:
        raise Exact12NextRowStaticCegarError(
            "persisted detector_contract.json differs from the canonical contract"
        )
    detector_payload = dict(observed_detector)
    observed_detector_sha256 = detector_payload.pop("sha256", None)
    if (
        observed_detector_sha256 != _sha256_json(detector_payload)
        or observed_detector_sha256 != expected_detector_sha256
    ):
        raise Exact12NextRowStaticCegarError(
            "persisted detector_contract.json hash failed authentication"
        )


def _canonical_cube(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, list[int]]:
    if not isinstance(cube, Mapping):
        raise Exact12NextRowStaticCegarError("cube is not a mapping")
    rows: list[Collection[int] | None] = [None] * 12
    for raw_center, support in cube.items():
        if isinstance(raw_center, bool):
            raise Exact12NextRowStaticCegarError("cube center is malformed")
        try:
            center = int(raw_center)
        except (TypeError, ValueError) as exc:
            raise Exact12NextRowStaticCegarError("cube center is malformed") from exc
        if str(center) != str(raw_center) or not 0 <= center < 12:
            raise Exact12NextRowStaticCegarError("cube center is malformed")
        if rows[center] is not None:
            raise Exact12NextRowStaticCegarError("cube repeats a center")
        rows[center] = support
    if any(row is None for row in rows):
        raise Exact12NextRowStaticCegarError("cube omits a center")
    payload: dict[str, list[int]] = {}
    for center, raw_support in enumerate(rows):
        if isinstance(raw_support, (str, bytes)):
            raise Exact12NextRowStaticCegarError("cube support is malformed")
        try:
            support = sorted(raw_support)  # type: ignore[arg-type]
        except TypeError as exc:
            raise Exact12NextRowStaticCegarError("cube support is malformed") from exc
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
            raise Exact12NextRowStaticCegarError("cube support is malformed")
        payload[str(center)] = support
    return payload


def _cube_as_ints(
    cube: Mapping[int | str, Collection[int]],
) -> dict[int, list[int]]:
    payload = _canonical_cube(cube)
    return {center: payload[str(center)] for center in range(12)}


def _canonical_positive_variables(
    positive_variables: Collection[int], *, n_variables: int
) -> list[int]:
    if isinstance(positive_variables, (str, bytes)):
        raise Exact12NextRowStaticCegarError(
            "positive-variable assignment is malformed"
        )
    try:
        positive = sorted(positive_variables)
    except TypeError as exc:
        raise Exact12NextRowStaticCegarError(
            "positive-variable assignment is malformed"
        ) from exc
    if len(positive) != len(set(positive)) or any(
        isinstance(variable, bool)
        or not isinstance(variable, int)
        or not 1 <= variable <= n_variables
        for variable in positive
    ):
        raise Exact12NextRowStaticCegarError(
            "positive-variable assignment is malformed"
        )
    return positive


def _certificate_rows(
    certificate: Mapping[str, Any],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    raw_rows = certificate.get("rows")
    if type(raw_rows) is not list or not raw_rows:
        raise Exact12NextRowStaticCegarError("certificate rows are malformed")
    rows: list[tuple[int, tuple[int, ...]]] = []
    for raw in raw_rows:
        if type(raw) is not dict or set(raw) != {"center", "support", "exact"}:
            raise Exact12NextRowStaticCegarError("certificate row is malformed")
        center = raw["center"]
        support = raw["support"]
        if type(center) is not int or not 0 <= center < 12:
            raise Exact12NextRowStaticCegarError("certificate center is malformed")
        if raw["exact"] is not False:
            raise Exact12NextRowStaticCegarError(
                "selected-support certificate must have exact=False"
            )
        if (
            type(support) is not list
            or len(support) != 4
            or any(type(point) is not int for point in support)
        ):
            raise Exact12NextRowStaticCegarError("certificate support is malformed")
        normalized = tuple(sorted(support))
        if len(set(normalized)) != 4:
            raise Exact12NextRowStaticCegarError("certificate support repeats a point")
        rows.append((center, normalized))
    if len(rows) != len(set(rows)) or len({center for center, _ in rows}) != len(rows):
        raise Exact12NextRowStaticCegarError("certificate repeats a selected row")
    return tuple(rows)


def _validate_structural_certificate(certificate: Mapping[str, Any]) -> bool:
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
    if not _validate_structural_certificate(certificate):
        raise Exact12NextRowStaticCegarError(
            "detector certificate failed independent replay"
        )
    return certificate


def replay_static_convex_sat_witness(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowCell,
    layout: StaticConvexLayout,
    reported_cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
) -> tuple[dict[int, list[int]], frozenset[int], dict[str, bool]]:
    """Replay the source gates, full auxiliary CNF, and canonical static closure."""

    reported_payload = _canonical_cube(reported_cube)
    positive = frozenset(
        _canonical_positive_variables(
            positive_variables, n_variables=instance.cnf.n_variables
        )
    )
    decoded_cube = instance.decode_model(positive)
    if _canonical_cube(decoded_cube) != reported_payload:
        raise Exact12NextRowStaticCegarError(
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
        "canonical_static_extension": canonical_extension_satisfies_delta(
            instance, layout, decoded_cube
        ),
    }
    if not all(replay.values()):
        raise Exact12NextRowStaticCegarError(
            "SAT assignment failed a source, predicate, CNF, or static-closure gate"
        )
    return decoded_cube, positive, replay


def _source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    for relative in SOURCE_PATHS:
        relative_path = Path(relative)
        if relative_path.is_absolute() or ".." in relative_path.parts:
            raise Exact12NextRowStaticCegarError(f"unsafe source path: {relative}")
        cursor = repo_root
        try:
            for part in relative_path.parts:
                cursor /= part
                if stat.S_ISLNK(cursor.lstat().st_mode):
                    raise Exact12NextRowStaticCegarError(
                        f"source path contains a symlink: {relative}"
                    )
            descriptor = os.open(
                repo_root / relative,
                os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0),
            )
            try:
                metadata = os.fstat(descriptor)
                if not stat.S_ISREG(metadata.st_mode):
                    raise Exact12NextRowStaticCegarError(
                        f"source is not a regular file: {relative}"
                    )
                payload = b""
                chunks: list[bytes] = []
                while chunk := os.read(descriptor, 1 << 20):
                    chunks.append(chunk)
                payload = b"".join(chunks)
            finally:
                os.close(descriptor)
        except OSError as exc:
            raise Exact12NextRowStaticCegarError(
                f"required source is unreadable: {relative}"
            ) from exc
        result.append(
            {
                "path": relative,
                "bytes": len(payload),
                "sha256": hashlib.sha256(payload).hexdigest(),
            }
        )
    return result


def materialize_static_cell(
    cell_index: int,
) -> tuple[
    SourceFaithfulCoverInstance, CompiledExact12NextRowCell, StaticConvexLayout
]:
    if type(cell_index) is not int or not 0 <= cell_index < len(cells()):
        raise Exact12NextRowStaticCegarError("cell_index is outside the schedule")
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, cells()[cell_index])
    layout = install_static_convex_extension(instance, compiled)
    return instance, compiled, layout


def materialize_positive_membership_static_cell(
    repo_root: Path, cell_index: int
) -> tuple[
    SourceFaithfulCoverInstance,
    CompiledExact12NextRowCell,
    StaticConvexLayout,
    dict[str, Any],
]:
    """Install the block-spanning family and cell-1 ThreeTriad supplement."""

    instance, compiled, layout = materialize_static_cell(cell_index)
    try:
        production_family_id_for_cell(cell_index)
        family_bank = install_block_spanning_membership_family_bank(
            repo_root.resolve(), instance, layout, cell_index=cell_index
        )
        production_cut_id_for_cell(cell_index)
        bank = install_three_triad_membership_bank(
            repo_root.resolve(),
            instance,
            layout,
            family_bank,
            cell_index=cell_index,
        )
        attest_three_triad_membership_bank_live_sources(repo_root, bank)
    except Exact12BlockSpanningMembershipFamilyBankError as exc:
        raise Exact12NextRowStaticCegarError(str(exc)) from exc
    except Exact12ThreeTriadMembershipBankError as exc:
        raise Exact12NextRowStaticCegarError(str(exc)) from exc
    return instance, compiled, layout, bank


def _build_job(
    repo_root: Path,
    compiled: CompiledExact12NextRowCell,
    layout: StaticConvexLayout,
    instance: SourceFaithfulCoverInstance,
    positive_membership_bank: Mapping[str, Any],
    source_order_bank: Mapping[str, Any],
    prepared_source_order_bank: PreparedSourceOrderBank,
) -> dict[str, Any]:
    membership_sha256 = positive_membership_bank.get("bank_sha256")
    membership_schema = positive_membership_bank.get("schema")
    membership_cut_id = positive_membership_bank.get("cut_id")
    family_bank = positive_membership_bank.get("block_spanning_family_bank")
    membership_family_id = (
        family_bank.get("family_id") if isinstance(family_bank, Mapping) else None
    )
    membership_entries = positive_membership_bank.get("entries")
    if (
        membership_schema != POSITIVE_MEMBERSHIP_BANK_SCHEMA
        or not isinstance(membership_sha256, str)
        or len(membership_sha256) != 64
        or any(
            character not in "0123456789abcdef"
            for character in membership_sha256
        )
        or not isinstance(membership_cut_id, str)
        or not membership_cut_id
        or not isinstance(membership_family_id, str)
        or not membership_family_id
        or type(membership_entries) is not list
        or len(membership_entries) != 1
    ):
        raise Exact12NextRowStaticCegarError(
            "positive-membership bank metadata is malformed"
        )
    bank_sha256 = source_order_bank.get("bank_sha256")
    bank_schema = source_order_bank.get("schema")
    bank_entries = source_order_bank.get("entries")
    if (
        not isinstance(bank_sha256, str)
        or len(bank_sha256) != 64
        or any(character not in "0123456789abcdef" for character in bank_sha256)
        or not isinstance(bank_schema, str)
        or type(bank_entries) is not list
    ):
        raise Exact12NextRowStaticCegarError("source-order bank metadata is malformed")
    try:
        installation = attest_prepared_source_order_bank_installed(
            instance, prepared_source_order_bank
        )
    except Exact12V14OrderedCutAdapterError as exc:
        raise Exact12NextRowStaticCegarError(str(exc)) from exc
    if (
        prepared_source_order_bank.snapshot() != source_order_bank
        or installation.get("schema") != SOURCE_ORDER_INSTALLATION_SCHEMA
        or installation.get("bank_sha256") != bank_sha256
        or installation.get("suffix_n_clauses") != len(bank_entries)
    ):
        raise Exact12NextRowStaticCegarError(
            "installed source-order bank differs from the authenticated snapshot"
        )
    cnf_bytes = instance.dimacs().encode("ascii")
    cnf_sha256 = hashlib.sha256(cnf_bytes).hexdigest()
    if cnf_sha256 != installation["final_cnf_sha256"]:
        raise Exact12NextRowStaticCegarError(
            "job CNF differs from the authenticated source-order installation"
        )
    payload = {
        "schema": JOB_SCHEMA,
        "scope": (
            "one finite exact-12 next-row placement cell with a static convex "
            "extension, the authenticated 24-role membership family, and its "
            "source-proved ThreeTriad supplement; terminal "
            "Lean ingress is ready, but terminal DRAT conversion is pending; no "
            "aggregate coverage, universal lift, or live closure"
        ),
        "compiler_schema": COMPILER_SCHEMA,
        "static_convex_schema": STATIC_CONVEX_SCHEMA,
        "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
        "candidate_profile": list(SOURCE_FAITHFUL_PYTHON_PROFILE),
        "lean_ingress_theorem": LEAN_INGRESS_THEOREM,
        "lean_terminal_ingress_ready": True,
        "terminal_promotion_status": TERMINAL_PROMOTION_STATUS,
        "positive_membership_bank": {
            "schema": membership_schema,
            "sha256": membership_sha256,
            "family_id": membership_family_id,
            "three_triad_cut_id": membership_cut_id,
            "entries": len(membership_entries),
        },
        "source_order_bank": {
            "schema": bank_schema,
            "sha256": bank_sha256,
            "entries": len(bank_entries),
            "installation": installation,
        },
        "compiler_manifest": compiled.manifest(),
        "static_convex_manifest": layout.manifest(),
        "cnf": {
            "bytes": len(cnf_bytes),
            "sha256": cnf_sha256,
            "variables": instance.cnf.n_variables,
            "clauses": len(instance.cnf.clauses),
        },
        "sources": _source_manifest(repo_root),
    }
    return {**payload, "job_id": _sha256_json(payload)}


def detect_typed_source_order_cut(
    instance: SourceFaithfulCoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    source_order_bank: Mapping[str, Any] | PreparedSourceOrderBank,
) -> tuple[AdmittedCut | None, str, dict[str, Any] | None]:
    """Return one typed cut or an exact fail-closed survivor classification."""

    try:
        admitted = detect_proof_backed_source_order_cut(
            None, instance, cube, source_order_bank=source_order_bank
        )
    except Exact12V14OrderedCutAdapterError as exc:
        raise Exact12NextRowStaticCegarError(str(exc)) from exc
    if admitted is not None:
        return admitted, "SOURCE_ORDER_CUT", None

    structural = detect_structural_certificate(cube)
    if structural is None:
        return None, "STRUCTURALLY_UNRESOLVED", None
    stage = structural.get("stage")
    if stage in STATIC_STAGES:
        return None, "STATIC_CONVEX_INVARIANT_FAILED", structural
    return None, "UNADMITTED_STRUCTURAL_SURVIVOR", structural


def _cut_binding(admitted: AdmittedCut) -> dict[str, Any]:
    if (
        admitted.certificate_kind != SOURCE_ORDER_CERTIFICATE_KIND
        or admitted.detector_stage != SOURCE_ORDER_DETECTOR_STAGE
        or isinstance(admitted.bank_index, bool)
        or not isinstance(admitted.bank_index, int)
        or admitted.bank_index < 0
    ):
        raise Exact12NextRowStaticCegarError(
            "dynamic admission is restricted to typed source-order bank cuts"
        )
    binding = admitted.certificate.get("generated_lean_nogood")
    if not isinstance(binding, Mapping):
        raise Exact12NextRowStaticCegarError(
            "source-order certificate omitted its generated Lean binding"
        )
    declaration = binding.get("nogood_declaration")
    source_path = binding.get("source_path")
    if not isinstance(declaration, str) or not declaration:
        raise Exact12NextRowStaticCegarError("generated Lean nogood is unnamed")
    if not isinstance(source_path, str) or not source_path:
        raise Exact12NextRowStaticCegarError("generated Lean nogood source is unnamed")
    return copy.deepcopy(dict(binding))


def _make_record(
    *,
    index: int,
    parent_sha256: str,
    job_id: str,
    detector_contract_sha256: str,
    static_convex_manifest_sha256: str,
    cell_index: int,
    positive_membership_bank_sha256: str,
    positive_membership_family_id: str,
    three_triad_membership_cut_id: str,
    source_order_bank_sha256: str,
    admitted_cut: AdmittedCut,
    pre_cut_cnf_sha256: str,
    post_cut_cnf_sha256: str,
    cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
    n_variables: int,
) -> dict[str, Any]:
    cube_payload = _canonical_cube(cube)
    assignment_payload = _canonical_positive_variables(
        positive_variables, n_variables=n_variables
    )
    certificate = copy.deepcopy(admitted_cut.certificate)
    binding = _cut_binding(admitted_cut)
    body = {
        "schema": RECORD_SCHEMA,
        "index": index,
        "parent_sha256": parent_sha256,
        "job_id": job_id,
        "detector_contract_sha256": detector_contract_sha256,
        "static_convex_manifest_sha256": static_convex_manifest_sha256,
        "cell_index": cell_index,
        "positive_membership_bank_sha256": positive_membership_bank_sha256,
        "positive_membership_family_id": positive_membership_family_id,
        "three_triad_membership_cut_id": three_triad_membership_cut_id,
        "detector_contract": DETECTOR_CONTRACT,
        "certificate_kind": admitted_cut.certificate_kind,
        "certificate_schema": admitted_cut.certificate_schema,
        "detector_stage": admitted_cut.detector_stage,
        "generated_lean_nogood": binding,
        "terminal_formula_consumer": TERMINAL_FORMULA_CONSUMER,
        "terminal_promotion_status": TERMINAL_PROMOTION_STATUS,
        "certificate": certificate,
        "certificate_sha256": _sha256_json(certificate),
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


def _make_survivor(
    *,
    job_id: str,
    cell_index: int,
    local_iteration: int,
    layout: StaticConvexLayout,
    positive_membership_bank: Mapping[str, Any],
    classification: str,
    cube: Mapping[int | str, Collection[int]],
    positive_variables: Collection[int],
    n_variables: int,
    cnf_sha256: str,
    replay: Mapping[str, bool],
    structural: Mapping[str, Any] | None,
) -> dict[str, Any]:
    reasons = {
        "STATIC_CONVEX_INVARIANT_FAILED": (
            "a static convex detector hit contradicts the installed formula"
        ),
        "UNADMITTED_STRUCTURAL_SURVIVOR": (
            "detected structural stage has no admitted generated Lean cut"
        ),
        "STRUCTURALLY_UNRESOLVED": (
            "no authenticated source-order cut or structural certificate matched"
        ),
    }
    if classification not in reasons:
        raise Exact12NextRowStaticCegarError(
            "survivor classification is outside the fresh contract"
        )
    cube_payload = _canonical_cube(cube)
    positive_payload = _canonical_positive_variables(
        positive_variables, n_variables=n_variables
    )
    structural_payload = copy.deepcopy(dict(structural)) if structural else None
    family_bank = positive_membership_bank["block_spanning_family_bank"]
    body = {
        "schema": SURVIVOR_SCHEMA,
        "job_id": job_id,
        "cell_index": cell_index,
        "local_iteration": local_iteration,
        "formula_schema": STATIC_CONVEX_SCHEMA,
        "static_convex_manifest_sha256": _sha256_json(layout.manifest()),
        "positive_membership_bank_sha256": positive_membership_bank[
            "bank_sha256"
        ],
        "positive_membership_family_id": family_bank["family_id"],
        "three_triad_membership_cut_id": positive_membership_bank["cut_id"],
        "classification": classification,
        "reason": reasons[classification],
        "structural_stage": (
            structural_payload.get("stage") if structural_payload else None
        ),
        "cube": cube_payload,
        "cube_sha256": _sha256_json(cube_payload),
        "positive_variables": positive_payload,
        "assignment_sha256": _sha256_json(positive_payload),
        "cnf_sha256": cnf_sha256,
        "replay": copy.deepcopy(dict(replay)),
        "unadmitted_structural_certificate": structural_payload,
    }
    return {**body, "survivor_sha256": _sha256_json(body)}


def _append_record(path: Path, record: Mapping[str, Any]) -> None:
    with path.open("ab") as handle:
        handle.write(_canonical_json_bytes(record) + b"\n")
        handle.flush()
        os.fsync(handle.fileno())


def replay_journal(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowCell,
    layout: StaticConvexLayout,
    journal: Path | BinaryIO,
    *,
    repo_root: Path,
    job_id: str,
    detector_contract_sha256: str,
    cell_index: int,
    positive_membership_bank: Mapping[str, Any],
    source_order_bank: Mapping[str, Any],
    prepared_source_order_bank: PreparedSourceOrderBank,
) -> tuple[int, str, frozenset[tuple[int, ...]]]:
    """Replay and transactionally install a source-order-only journal."""

    try:
        attest_three_triad_membership_bank_live_sources(
            repo_root, positive_membership_bank
        )
    except Exact12ThreeTriadMembershipBankError as exc:
        raise Exact12NextRowStaticCegarError(str(exc)) from exc
    membership_sha256 = positive_membership_bank.get("bank_sha256")
    membership_cut_id = positive_membership_bank.get("cut_id")
    family_bank = positive_membership_bank.get("block_spanning_family_bank")
    membership_family_id = (
        family_bank.get("family_id") if isinstance(family_bank, Mapping) else None
    )
    membership_body = dict(positive_membership_bank)
    membership_body.pop("bank_sha256", None)
    membership_entries = positive_membership_bank.get("entries")
    try:
        expected_family_id = production_family_id_for_cell(cell_index)
        expected_cut_id = production_cut_id_for_cell(cell_index)
    except (
        Exact12BlockSpanningMembershipFamilyBankError,
        Exact12ThreeTriadMembershipBankError,
    ) as exc:
        raise Exact12NextRowStaticCegarError(str(exc)) from exc
    if (
        positive_membership_bank.get("schema") != POSITIVE_MEMBERSHIP_BANK_SCHEMA
        or not isinstance(membership_sha256, str)
        or not isinstance(membership_family_id, str)
        or membership_family_id != expected_family_id
        or not isinstance(membership_cut_id, str)
        or membership_cut_id != expected_cut_id
        or membership_sha256 != _sha256_json(membership_body)
        or type(membership_entries) is not list
        or len(membership_entries) != 1
        or not getattr(
            instance, "_block_spanning_membership_family_bank_installed", False
        )
        or not getattr(instance, "_three_triad_membership_bank_installed", False)
    ):
        raise Exact12NextRowStaticCegarError(
            "installed positive-membership bank metadata is malformed"
        )
    membership_compiled = positive_membership_bank.get("compiled")
    source_order_entries = source_order_bank.get("entries")
    if (
        type(membership_compiled) is not dict
        or type(source_order_entries) is not list
        or membership_compiled.get("final_n_variables")
        != instance.cnf.n_variables
        or membership_compiled.get("final_n_clauses")
        != len(instance.cnf.clauses) - len(source_order_entries)
    ):
        raise Exact12NextRowStaticCegarError(
            "installed formula differs from the authenticated membership bank"
        )
    original_cnf_sha256 = _cnf_sha256(instance)
    try:
        replay_bank = prepared_source_order_bank.snapshot()
        if replay_bank != source_order_bank:
            raise Exact12NextRowStaticCegarError(
                "prepared source-order bank snapshot drifted"
            )
        attest_source_order_bank_live_sources(repo_root, replay_bank)
        source_order_installation = attest_prepared_source_order_bank_installed(
            instance, prepared_source_order_bank
        )
        shadow, prepared_replay_bank = clone_installed_source_order_bank(
            instance, prepared_source_order_bank
        )
    except (
        Exact12V14OrderedCutAdapterError,
        Exact12V14SourceOrderBankError,
    ) as exc:
        raise Exact12NextRowStaticCegarError(str(exc)) from exc
    bank_sha256 = replay_bank["bank_sha256"]
    if (
        membership_compiled["final_n_clauses"]
        != source_order_installation["base_n_clauses"]
    ):
        raise Exact12NextRowStaticCegarError(
            "membership/source-order CNF installation boundary drifted"
        )
    installed_source_order_clauses = {
        entry.learned_clause for entry in prepared_replay_bank.entries
    }
    static_manifest_sha256 = _sha256_json(layout.manifest())

    if isinstance(journal, Path):
        if not journal.is_file():
            return 0, job_id, frozenset()
        context = io.BytesIO(journal.read_bytes())
    else:
        try:
            journal.seek(0)
            payload = journal.read()
        except (AttributeError, OSError, ValueError) as exc:
            raise Exact12NextRowStaticCegarError(
                "journal stream could not be snapshotted"
            ) from exc
        if type(payload) is not bytes:
            raise Exact12NextRowStaticCegarError(
                "journal stream snapshot is not immutable bytes"
            )
        context = io.BytesIO(payload)

    expected_fields = {
        "schema",
        "index",
        "parent_sha256",
        "job_id",
        "detector_contract_sha256",
        "static_convex_manifest_sha256",
        "cell_index",
        "positive_membership_bank_sha256",
        "positive_membership_family_id",
        "three_triad_membership_cut_id",
        "detector_contract",
        "certificate_kind",
        "certificate_schema",
        "detector_stage",
        "generated_lean_nogood",
        "terminal_formula_consumer",
        "terminal_promotion_status",
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
    staged: list[tuple[int, ...]] = []
    with context as handle:
        for line_number, raw in enumerate(handle, 1):
            if not raw.endswith(b"\n"):
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} is not newline terminated"
                )
            try:
                record = json.loads(
                    raw,
                    object_pairs_hook=_reject_duplicate_keys,
                    parse_constant=_reject_json_constant,
                )
            except (UnicodeError, json.JSONDecodeError, ValueError) as exc:
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} is not strict JSON"
                ) from exc
            if type(record) is not dict or set(record) != expected_fields:
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} is malformed"
                )
            body = dict(record)
            record_sha256 = body.pop("record_sha256")
            if (
                record["schema"] != RECORD_SCHEMA
                or record["index"] != count
                or record["parent_sha256"] != parent
                or record["job_id"] != job_id
                or record["detector_contract_sha256"] != detector_contract_sha256
                or record["static_convex_manifest_sha256"] != static_manifest_sha256
                or record["cell_index"] != cell_index
                or record["positive_membership_bank_sha256"]
                != membership_sha256
                or record["positive_membership_family_id"]
                != membership_family_id
                or record["three_triad_membership_cut_id"]
                != membership_cut_id
                or record["detector_contract"] != DETECTOR_CONTRACT
                or record["source_order_bank_sha256"] != bank_sha256
                or record["terminal_formula_consumer"] != TERMINAL_FORMULA_CONSUMER
                or record["terminal_promotion_status"] != TERMINAL_PROMOTION_STATUS
                or record_sha256 != _sha256_json(body)
            ):
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} failed chain authentication"
                )
            certificate = record["certificate"]
            bank_index = record["source_order_bank_index"]
            if (
                type(certificate) is not dict
                or record["certificate_kind"] != SOURCE_ORDER_CERTIFICATE_KIND
                or record["detector_stage"] != SOURCE_ORDER_DETECTOR_STAGE
                or isinstance(bank_index, bool)
                or not isinstance(bank_index, int)
                or bank_index < 0
                or record["certificate_sha256"] != _sha256_json(certificate)
            ):
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} has an invalid typed certificate"
                )
            cube_payload = _canonical_cube(record["cube"])
            positive = _canonical_positive_variables(
                record["positive_variables"], n_variables=shadow.cnf.n_variables
            )
            if (
                record["cube"] != cube_payload
                or record["cube_sha256"] != _sha256_json(cube_payload)
                or record["positive_variables"] != positive
                or record["assignment_sha256"] != _sha256_json(positive)
            ):
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} witness metadata drifted"
                )
            try:
                decoded_cube, replayed_positive, _ = replay_static_convex_sat_witness(
                    shadow,
                    compiled,
                    layout,
                    _cube_as_ints(cube_payload),
                    positive,
                )
                clause = replay_proof_backed_source_order_cut(
                    None,
                    shadow,
                    decoded_cube,
                    certificate_schema=record["certificate_schema"],
                    detector_stage=record["detector_stage"],
                    certificate=certificate,
                    bank_index=bank_index,
                    source_order_bank=prepared_replay_bank,
                )
            except (
                EncodingError,
                Exact12NextRowValuationError,
                Exact12V14OrderedCutAdapterError,
                ValueError,
            ) as exc:
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} failed exact replay"
                ) from exc
            replayed = AdmittedCut(
                certificate_kind=record["certificate_kind"],
                certificate_schema=record["certificate_schema"],
                detector_stage=record["detector_stage"],
                certificate=copy.deepcopy(certificate),
                learned_clause=clause,
                bank_index=bank_index,
            )
            pre_sha = _cnf_sha256(shadow)
            post_sha = hashlib.sha256(
                shadow.dimacs((clause,)).encode("ascii")
            ).hexdigest()
            if (
                record["generated_lean_nogood"] != _cut_binding(replayed)
                or record["learned_clause"] != list(clause)
                or record["learned_clause_sha256"] != _sha256_json(list(clause))
                or record["pre_cut_cnf_sha256"] != pre_sha
                or record["post_cut_cnf_sha256"] != post_sha
                or clause in seen
                or clause in installed_source_order_clauses
                or any(
                    (literal > 0 and literal in replayed_positive)
                    or (literal < 0 and -literal not in replayed_positive)
                    for literal in clause
                )
            ):
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} formula or eager-bank cut drifted"
                )
            shadow.cnf.add_clause(clause)
            if _cnf_sha256(shadow) != post_sha:
                raise Exact12NextRowStaticCegarError(
                    f"journal line {line_number} post-cut formula drifted"
                )
            seen.add(clause)
            staged.append(clause)
            parent = record_sha256
            count += 1

    if _cnf_sha256(instance) != original_cnf_sha256:
        raise Exact12NextRowStaticCegarError(
            "replay target changed during transactional validation"
        )
    for clause in staged:
        instance.cnf.add_clause(clause)
    if _cnf_sha256(instance) != _cnf_sha256(shadow):
        raise Exact12NextRowStaticCegarError(
            "transactional installation drifted from the validated formula"
        )
    return count, parent, frozenset(seen)


def _nonterminal_status(result: CadicalResult) -> str:
    return (
        result.verdict if result.verdict in {"TIMEOUT", "UNKNOWN"} else "PIPELINE_ERROR"
    )


def _terminal_proof_authenticated(
    solver: Callable[..., CadicalResult],
    certifier: Callable[..., bool] | None,
    instance: SourceFaithfulCoverInstance,
    terminal_path: Path,
    proof_path: Path,
    terminal: CadicalResult,
) -> bool:
    """Cross an explicit trust boundary before accepting terminal proof state."""

    if solver is solve_cadical:
        return terminal.proof_verified is True
    if certifier is None:
        return False
    try:
        return (
            certifier(instance, terminal_path, proof_path, terminal) is True
        )
    except Exception:  # noqa: BLE001 - an untrusted certifier must fail closed
        return False


def run_static_cegar(
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
        [StaticDiscoveryRequest], Callable[..., CadicalResult]
    ]
    | None = None,
    terminal_proof_certifier: Callable[..., bool] | None = None,
) -> dict[str, Any]:
    """Run one fresh fixed-membership, source-order-only placement cell."""

    if type(max_iterations) is not int or max_iterations <= 0:
        raise Exact12NextRowStaticCegarError("max_iterations must be positive")
    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise Exact12NextRowStaticCegarError("timeout_seconds must be positive")
    if type(nice) is not int or not 1 <= nice <= 19:
        raise Exact12NextRowStaticCegarError("nice must lie in [1, 19]")

    repo_root = repo_root.resolve()
    lock = _claim_empty_workdir(workdir)
    try:
        (
            instance,
            compiled,
            layout,
            positive_membership_bank,
        ) = materialize_positive_membership_static_cell(repo_root, cell_index)
        source_manifest = _source_manifest(repo_root)
        detector_contract_payload = {
            "contract": DETECTOR_CONTRACT,
            "sources": source_manifest,
        }
        detector_contract_sha256 = _sha256_json(detector_contract_payload)
        try:
            prepared_source_order_bank = prepare_proof_backed_source_order_bank(
                instance, build_source_order_bank(repo_root, instance)
            )
            source_order_bank = prepared_source_order_bank.snapshot()
            attest_source_order_bank_live_sources(repo_root, source_order_bank)
            install_prepared_source_order_bank(
                instance, prepared_source_order_bank
            )
        except (
            Exact12V14OrderedCutAdapterError,
            Exact12V14SourceOrderBankError,
        ) as exc:
            raise Exact12NextRowStaticCegarError(str(exc)) from exc
        job = _build_job(
            repo_root,
            compiled,
            layout,
            instance,
            positive_membership_bank,
            source_order_bank,
            prepared_source_order_bank,
        )

        job_path = workdir / "job.json"
        detector_path = workdir / "detector_contract.json"
        journal_path = workdir / "journal.jsonl"
        _write_json(job_path, job)
        _write_json(
            detector_path,
            {
                **detector_contract_payload,
                "sha256": detector_contract_sha256,
            },
        )
        if seed_journal is None:
            journal_path.touch(exist_ok=False)
        else:
            if not seed_journal.is_file():
                raise Exact12NextRowStaticCegarError("seed journal is missing")
            shutil.copyfile(seed_journal, journal_path)

        record_count, parent_sha256, seen = replay_journal(
            instance,
            compiled,
            layout,
            journal_path,
            repo_root=repo_root,
            job_id=job["job_id"],
            detector_contract_sha256=detector_contract_sha256,
            cell_index=cell_index,
            positive_membership_bank=positive_membership_bank,
            source_order_bank=source_order_bank,
            prepared_source_order_bank=prepared_source_order_bank,
        )
        seen_clauses = set(seen)
        status = "ITERATION_LIMIT"
        error: str | None = None
        discovery: CadicalResult | None = None
        terminal: CadicalResult | None = None
        terminal_proof_authenticated = False
        discovery_sha: str | None = None
        terminal_sha: str | None = None
        last_replay = {
            "candidate": False,
            "added_constraints": False,
            "exact_cnf": False,
            "canonical_static_extension": False,
        }

        for local_iteration in range(max_iterations):
            discovery_path = workdir / "discovery.cnf"
            discovery_solver = solver
            if discovery_solver_factory is not None:
                current_dimacs = instance.dimacs().encode("ascii")
                request = StaticDiscoveryRequest(
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
                    num_clauses=len(instance.clauses_with()),
                )
                discovery_solver = discovery_solver_factory(request)
                if not callable(discovery_solver):
                    raise Exact12NextRowStaticCegarError(
                        "discovery solver factory returned a non-callable value"
                    )
            discovery = discovery_solver(
                instance,
                discovery_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=None,
            )
            if (
                discovery_solver_factory is not None
                and type(discovery) is not CadicalResult
            ):
                raise Exact12NextRowStaticCegarError(
                    "discovery solver returned a non-exact CadicalResult"
                )
            if discovery.verdict == "UNSAT":
                discovery_sha = _sha256_file(discovery_path)
                terminal_path = workdir / "terminal.cnf"
                proof_path = workdir / "terminal.drat"
                terminal = solver(
                    instance,
                    terminal_path,
                    timeout_seconds=timeout_seconds,
                    nice=nice,
                    proof_path=proof_path,
                )
                terminal_proof_authenticated = _terminal_proof_authenticated(
                    solver,
                    terminal_proof_certifier,
                    instance,
                    terminal_path,
                    proof_path,
                    terminal,
                )
                if (
                    terminal.verdict == "UNSAT"
                    and terminal_proof_authenticated
                    and proof_path.is_file()
                    and (terminal_sha := _sha256_file(terminal_path)) == discovery_sha
                ):
                    status = TERMINAL_PROMOTION_STATUS
                else:
                    status = "DISCOVERY_UNSAT_UNVERIFIED"
                    error = (
                        "fresh identical-CNF terminal proof rerun failed or lacked "
                        "an authenticated solver/certifier boundary"
                    )
                break
            if discovery.verdict != "SAT":
                status = _nonterminal_status(discovery)
                break
            if discovery.cube is None or discovery.positive_variables is None:
                status = "PIPELINE_ERROR"
                error = "SAT result omitted its cube or complete assignment"
                break
            try:
                cube, positive, last_replay = replay_static_convex_sat_witness(
                    instance,
                    compiled,
                    layout,
                    discovery.cube,
                    discovery.positive_variables,
                )
                admitted, classification, structural = detect_typed_source_order_cut(
                    instance, cube, source_order_bank=prepared_source_order_bank
                )
            except (
                EncodingError,
                Exact12NextRowStaticCegarError,
                Exact12NextRowValuationError,
                ValueError,
            ) as exc:
                status = "SAT_REPLAY_FAILED"
                error = str(exc)
                break
            if admitted is None:
                status = classification
                _write_json(
                    workdir / "survivor.json",
                    _make_survivor(
                        job_id=job["job_id"],
                        cell_index=cell_index,
                        local_iteration=local_iteration,
                        layout=layout,
                        positive_membership_bank=positive_membership_bank,
                        classification=classification,
                        cube=cube,
                        positive_variables=positive,
                        n_variables=instance.cnf.n_variables,
                        cnf_sha256=_cnf_sha256(instance),
                        replay=last_replay,
                        structural=structural,
                    ),
                )
                break
            status = "STATIC_SOURCE_ORDER_INVARIANT_FAILED"
            error = (
                "SAT replay falsified a source-order clause already installed "
                "in the authenticated CNF suffix"
            )
            break

        (
            audit_instance,
            audit_compiled,
            audit_layout,
            audit_positive_membership_bank,
        ) = materialize_positive_membership_static_cell(repo_root, cell_index)
        try:
            attest_source_order_bank_live_sources(repo_root, source_order_bank)
            audit_prepared_source_order_bank = prepare_proof_backed_source_order_bank(
                audit_instance, source_order_bank
            )
            if audit_prepared_source_order_bank.snapshot() != source_order_bank:
                raise Exact12NextRowStaticCegarError(
                    "fresh source-order bank snapshot drifted"
                )
            install_prepared_source_order_bank(
                audit_instance, audit_prepared_source_order_bank
            )
        except Exact12V14OrderedCutAdapterError as exc:
            raise Exact12NextRowStaticCegarError(str(exc)) from exc
        audit_job = _build_job(
            repo_root,
            audit_compiled,
            audit_layout,
            audit_instance,
            audit_positive_membership_bank,
            source_order_bank,
            audit_prepared_source_order_bank,
        )
        audit_count, audit_parent, audit_seen = replay_journal(
            audit_instance,
            audit_compiled,
            audit_layout,
            journal_path,
            repo_root=repo_root,
            job_id=audit_job["job_id"],
            detector_contract_sha256=detector_contract_sha256,
            cell_index=cell_index,
            positive_membership_bank=audit_positive_membership_bank,
            source_order_bank=source_order_bank,
            prepared_source_order_bank=audit_prepared_source_order_bank,
        )
        journal_replayed = (
            audit_job["job_id"] == job["job_id"]
            and audit_count == record_count
            and audit_parent == parent_sha256
            and audit_seen == frozenset(seen_clauses)
        )
        reconstructed_sha = _cnf_sha256(audit_instance)
        if status == TERMINAL_PROMOTION_STATUS and (
            discovery_sha is None
            or terminal_sha is None
            or reconstructed_sha != discovery_sha
            or reconstructed_sha != terminal_sha
        ):
            status = "ARTIFACT_REPLAY_FAILED"
            error = "terminal formula differs from fresh journal reconstruction"
        artifacts = {
            name: _artifact(workdir / filename)
            for name, filename in {
                "job": "job.json",
                "detector_contract": "detector_contract.json",
                "journal": "journal.jsonl",
                "discovery_cnf": "discovery.cnf",
                "terminal_cnf": "terminal.cnf",
                "proof": "terminal.drat",
                "survivor": "survivor.json",
            }.items()
        }
        contracts_authenticated = True
        try:
            _authenticate_persisted_contracts(
                job_path,
                job,
                detector_path,
                detector_contract_payload,
                detector_contract_sha256,
            )
        except Exact12NextRowStaticCegarError as exc:
            contracts_authenticated = False
            status = "ARTIFACT_REPLAY_FAILED"
            error = str(exc)
        if (
            artifacts["job"] is None
            or artifacts["detector_contract"] is None
            or artifacts["journal"] is None
            or not contracts_authenticated
            or not journal_replayed
        ):
            status = "ARTIFACT_REPLAY_FAILED"
            if error is None:
                error = "job, detector contract, or journal failed replay"
        summary = {
            "schema": RUN_SCHEMA,
            "scope": (
                "one finite exact-12 next-row cell with the authenticated 24-role "
                "membership family and source-proved ThreeTriad supplement; "
                "terminal Lean ingress is ready, but "
                "the terminal DRAT has not been converted into a Lean "
                "DimacsUnsatisfiable theorem; no aggregate coverage, universal "
                "lift, or live closure"
            ),
            "job_id": job["job_id"],
            "cell_index": cell_index,
            "status": status,
            "terminal_promotion_status": TERMINAL_PROMOTION_STATUS,
            "lean_terminal_ingress_ready": True,
            "positive_membership_bank_sha256": positive_membership_bank[
                "bank_sha256"
            ],
            "positive_membership_family_id": positive_membership_bank[
                "block_spanning_family_bank"
            ]["family_id"],
            "three_triad_membership_cut_id": positive_membership_bank["cut_id"],
            "records": record_count,
            "terminal_record_sha256": parent_sha256 if record_count else None,
            "stage_counts": dict(Counter({SOURCE_ORDER_DETECTOR_STAGE: record_count})),
            "discovery_verdict": discovery.verdict if discovery else None,
            "terminal_verdict": terminal.verdict if terminal else None,
            "terminal_proof_verified": terminal_proof_authenticated,
            "discovery_cnf_sha256": discovery_sha,
            "terminal_cnf_sha256": terminal_sha,
            "reconstructed_cnf_sha256": reconstructed_sha,
            "journal_replayed": journal_replayed,
            "last_replay": last_replay,
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
        summary = run_static_cegar(
            args.repo_root,
            args.workdir,
            args.cell_index,
            max_iterations=args.max_iterations,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
            seed_journal=args.seed_journal,
        )
    except (
        EncodingError,
        Exact12NextRowStaticCegarError,
        Exact12NextRowValuationError,
        OSError,
    ) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
