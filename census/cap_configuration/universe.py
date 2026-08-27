"""Deterministic fixture universe, cells, and census manifest for CE search.

The v1 fixture is deliberately small and producer-neutral.  It exercises SAT,
UNSAT, and UNKNOWN control branches without invoking a solver, has a nontrivial
two-element symmetry action, and retains one deliberately omitted source
predicate.  Every claim flag remains diagnostic or false.
"""

from __future__ import annotations

import copy
import re
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from typing import Any, NoReturn

from .encode import (
    POLYNOMIAL_SYSTEM_SCHEMA,
    CapConfigurationEncodingError,
    NamedPolynomialAtom,
    PolynomialSystem,
    SparsePolynomial,
    SparseTerm,
)
from .schema import (
    CapConfigurationSchemaError,
    canonical_text,
    exact_int,
    exact_keys,
    exact_list,
    raw_sha256,
    stored_json_bytes,
    structured_hash,
)
from .symmetry import (
    FIXTURE_ACTION_VERSION,
    FIXTURE_CONTROLS,
    FIXTURE_GROUP_VERSION,
    ORBIT_LEDGER_SCHEMA,
    CapConfigurationSymmetryError,
    FixtureRepresentative,
    ValidatedOrbitLedger,
    build_orbit_ledger,
    fixture_symmetry_group,
    validate_orbit_ledger,
)

MANIFEST_SCHEMA = "cap-configuration-census-manifest/v1"
CAMPAIGN_IDENTITY_SCHEMA = "cap-configuration-campaign-identity/v1"
CELL_SCHEMA = "cap-configuration-cell/v1"
FIXTURE_INGRESS_SCHEMA = "cap-configuration-fixture-ingress/v1"
FIXTURE_TARGET_SCHEMA = "cap-configuration-fixture-target/v1"
FIXTURE_NORMALIZATION_VERSION = "cap-configuration-state-journal-normalization/v1"
FIXTURE_CLASSIFICATION_POLICY = "cap-configuration-fixture-classification/v1"
FIXTURE_RESULT_ADMISSION_POLICY = "cap-configuration-fixture-result-admission/v1"
FIXTURE_RETRY_POLICY = "cap-configuration-fixture-retry/v1"

MANIFEST_PATH = "manifest.json"
FINITE_INGRESS_PATH = "finite-ingress.json"
ORBIT_LEDGER_PATH = "orbit-ledger.json"

FIXTURE_SOURCE_HYPOTHESIS = "fixture source hypothesis: exactly one marked slot"
FIXTURE_OMITTED_SOURCE_PREDICATE = (
    "fixture source predicate: the two slot values sum to one"
)

_SHA256 = re.compile(r"[0-9a-f]{64}")
_REVISION = re.compile(r"[0-9a-f]{40}")
_CELL_ID = re.compile(r"[a-z0-9][a-z0-9-]*")
_SAFE_PATH = re.compile(r"[A-Za-z0-9._/-]+")
_CREATED_UTC = re.compile(r"[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z")

_CONTROL_TO_CELL = {
    "SAT": (0, "fixture-sat-0000", "SAT_EXACT_RATIONAL_CONTROL"),
    "UNSAT": (1, "fixture-unsat-0001", "UNSAT_SYNTACTIC_CONTRADICTION_CONTROL"),
    "UNKNOWN": (2, "fixture-unknown-0002", "INCONCLUSIVE_UNKNOWN_CONTROL"),
}


class CapConfigurationUniverseError(ValueError):
    """Raised when a cell universe or manifest violates its v1 contract."""


def _fail(message: str) -> NoReturn:
    raise CapConfigurationUniverseError(message)


def _record(value: Any, expected: set[str], path: str) -> dict[str, Any]:
    try:
        return exact_keys(value, expected, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationUniverseError(str(exc)) from exc


def _array(value: Any, path: str) -> list[Any]:
    try:
        return exact_list(value, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationUniverseError(str(exc)) from exc


def _integer(value: Any, path: str, *, minimum: int | None = None) -> int:
    try:
        return exact_int(value, path, minimum=minimum)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationUniverseError(str(exc)) from exc


def _text(value: Any, path: str) -> str:
    try:
        return canonical_text(value, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationUniverseError(str(exc)) from exc


def _sha256(value: Any, path: str) -> str:
    if type(value) is not str or _SHA256.fullmatch(value) is None:
        _fail(f"{path} must be a lowercase SHA-256 digest")
    return value


def _revision(value: Any, path: str) -> str:
    if type(value) is not str or _REVISION.fullmatch(value) is None:
        _fail(f"{path} must be a 40-character lowercase Git revision")
    return value


def safe_relative_path(value: Any, path: str = "path") -> str:
    """Validate one ASCII, canonical, component-wise safe relative path."""

    if type(value) is not str or _SAFE_PATH.fullmatch(value) is None:
        _fail(f"{path} must be a nonempty ASCII relative path")
    if value.startswith("/") or value.endswith("/") or "//" in value or "\\" in value:
        _fail(f"{path} is not a canonical relative path")
    components = value.split("/")
    if any(component in {"", ".", ".."} for component in components):
        _fail(f"{path} contains an unsafe path component")
    return value


def canonical_cell_path(ordinal: int, cell_id: str) -> str:
    """Return the sole admitted relative path spelling for one cell."""

    checked_ordinal = _integer(ordinal, "ordinal", minimum=0)
    if type(cell_id) is not str or _CELL_ID.fullmatch(cell_id) is None:
        _fail("cell_id must be a lowercase canonical token")
    return safe_relative_path(
        f"cells/{checked_ordinal:04d}-{cell_id}.json", "cell path"
    )


def _source_file_record(value: Any, *, path: str) -> dict[str, str]:
    record = _record(value, {"path", "raw_sha256"}, path)
    return {
        "path": safe_relative_path(record["path"], f"{path}.path"),
        "raw_sha256": _sha256(record["raw_sha256"], f"{path}.raw_sha256"),
    }


def _source_manifest(
    value: Sequence[Mapping[str, Any]], *, path: str
) -> list[dict[str, str]]:
    if isinstance(value, (str, bytes)) or not isinstance(value, Sequence):
        _fail(f"{path} must be an ordered source-file sequence")
    records = [
        _source_file_record(item, path=f"{path}[{index}]")
        for index, item in enumerate(value)
    ]
    if not records:
        _fail(f"{path} must be nonempty")
    paths = [record["path"] for record in records]
    if len(paths) != len(set(paths)):
        _fail(f"{path} contains duplicate paths")
    if paths != sorted(paths):
        _fail(f"{path} paths must be in ascending byte order")
    return records


def _publication(value: Any) -> dict[str, object]:
    record = _record(value, {"created_utc", "metadata"}, "publication")
    created = record["created_utc"]
    if type(created) is not str or _CREATED_UTC.fullmatch(created) is None:
        _fail("publication.created_utc must use YYYY-MM-DDTHH:MM:SSZ")
    try:
        datetime.strptime(created, "%Y-%m-%dT%H:%M:%SZ").replace(tzinfo=UTC)
    except ValueError as exc:
        raise CapConfigurationUniverseError(
            "publication.created_utc is not a real UTC date/time"
        ) from exc
    if type(record["metadata"]) is not dict:
        _fail("publication.metadata must be an object")
    try:
        # Validate JSON types and Unicode without changing caller-provided data.
        stored_json_bytes(record["metadata"])
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationUniverseError(str(exc)) from exc
    return {"created_utc": created, "metadata": copy.deepcopy(record["metadata"])}


def _fixture_representatives() -> tuple[FixtureRepresentative, ...]:
    return tuple(
        FixtureRepresentative(control, slots)
        for control in FIXTURE_CONTROLS
        for slots in ((1, 0), (0, 1))
    )


def _fixture_ingress() -> dict[str, object]:
    return {
        "diagnostic_only": True,
        "omitted_source_predicates": [FIXTURE_OMITTED_SOURCE_PREDICATE],
        "raw_representatives": [
            representative.to_record() for representative in _fixture_representatives()
        ],
        "schema": FIXTURE_INGRESS_SCHEMA,
        "source_hypotheses": [FIXTURE_SOURCE_HYPOTHESIS],
    }


def _target_record() -> dict[str, object]:
    return {
        "claim_flags": {
            "lean_closure": False,
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
        },
        "final_consumer": None,
        "identifier": "phase0-three-outcome-control",
        "immediate_consumer": None,
        "kind": "fixture",
        "mode": "DIAGNOSTIC_OBSTRUCTION_MINING",
        "polarity": "diagnostic",
        "proposition": "fixture-only control surface; no mathematical proposition",
        "required_branch_results": ["SAT", "UNSAT", "UNKNOWN"],
        "source_theorem": None,
        "termination_policy": "EXHAUSTIVE_FIXTURE",
    }


def _fixture_atoms() -> tuple[NamedPolynomialAtom, ...]:
    variable_order = ("x", "y")

    def polynomial(*terms: tuple[Fraction, tuple[int, int]]) -> SparsePolynomial:
        return SparsePolynomial(
            variable_order,
            tuple(SparseTerm(coefficient, powers) for coefficient, powers in terms),
        )

    return (
        NamedPolynomialAtom(
            atom_id="fix_x_zero",
            relation="eq",
            polynomials=(polynomial((Fraction(1), (1, 0))),),
            family="fixture assignment",
            source_provenance="fixture/v1 declared control atom x = 0",
        ),
        NamedPolynomialAtom(
            atom_id="fix_y_one",
            relation="eq",
            polynomials=(
                polynomial(
                    (Fraction(1), (0, 1)),
                    (Fraction(-1), (0, 0)),
                ),
            ),
            family="fixture assignment",
            source_provenance="fixture/v1 declared control atom y = 1",
        ),
        NamedPolynomialAtom(
            atom_id="contradict_x_one",
            relation="eq",
            polynomials=(
                polynomial(
                    (Fraction(1), (1, 0)),
                    (Fraction(-1), (0, 0)),
                ),
            ),
            family="fixture contradiction",
            source_provenance="fixture/v1 UNSAT control atom x = 1",
        ),
        NamedPolynomialAtom(
            atom_id="omitted_slot_sum_one",
            relation="eq",
            polynomials=(
                polynomial(
                    (Fraction(1), (1, 0)),
                    (Fraction(1), (0, 1)),
                    (Fraction(-1), (0, 0)),
                ),
            ),
            family="fixture omitted source fact",
            source_provenance="fixture/v1 deliberately omitted source predicate",
        ),
    )


def _fixture_system(control: str) -> PolynomialSystem:
    if control not in FIXTURE_CONTROLS:
        _fail(f"unsupported fixture control {control!r}")
    enabled = (
        ("fix_x_zero", "fix_y_one", "contradict_x_one")
        if control == "UNSAT"
        else ("fix_x_zero", "fix_y_one")
    )
    atom_ids = tuple(atom.atom_id for atom in _fixture_atoms())
    enabled_set = set(enabled)
    return PolynomialSystem(
        variable_order=("x", "y"),
        atoms=_fixture_atoms(),
        enabled_atom_order=enabled,
        omitted_atom_order=tuple(
            atom_id for atom_id in atom_ids if atom_id not in enabled_set
        ),
        omitted_source_predicates=(FIXTURE_OMITTED_SOURCE_PREDICATE,),
    )


def _orbit_by_control(orbit_ledger: Mapping[str, Any]) -> dict[str, dict[str, Any]]:
    result: dict[str, dict[str, Any]] = {}
    for raw_orbit in orbit_ledger["orbits"]:
        orbit = raw_orbit
        representative = FixtureRepresentative.from_record(
            orbit["canonical_representative"]
        )
        result[representative.control] = orbit
    if tuple(result) != FIXTURE_CONTROLS:
        _fail("fixture orbit order does not match the control order")
    return result


def _build_cells(
    orbit_ledger: Mapping[str, Any], ingress_sha256: str
) -> tuple[dict[str, object], ...]:
    target_identity = structured_hash(FIXTURE_TARGET_SCHEMA, _target_record())
    orbits = _orbit_by_control(orbit_ledger)
    cells: list[dict[str, object]] = []
    for control in FIXTURE_CONTROLS:
        ordinal, cell_id, expected_outcome = _CONTROL_TO_CELL[control]
        orbit = orbits[control]
        raw_representative = FixtureRepresentative(control, (1, 0))
        canonical_representative = FixtureRepresentative.from_record(
            orbit["canonical_representative"]
        )
        member = next(
            item
            for item in orbit["members"]
            if item["representative"] == raw_representative.to_record()
        )
        system = _fixture_system(control)
        journal = system.state_smt2_bytes()
        source_provenance = [
            {
                "atom_id": atom.atom_id,
                "source_provenance": atom.source_provenance,
            }
            for atom in system.atoms
        ]
        body: dict[str, object] = {
            "atoms": [atom.to_record() for atom in system.atoms],
            "canonical_representative": canonical_representative.to_record(),
            "canonical_smt_journal_raw_sha256": raw_sha256(journal),
            "cap_profile": "fixture-two-slot",
            "cell_id": cell_id,
            "cyclic_order": [0, 1],
            "enabled_atom_order": list(system.enabled_atom_order),
            "finite_ingress_identity": {
                "payload_sha256": ingress_sha256,
                "schema": FIXTURE_INGRESS_SCHEMA,
            },
            "fixture_expected_outcome": expected_outcome,
            "incidence_mask": list(canonical_representative.slots),
            "metric_choices": {"control": control, "slot_sum": 1},
            "normalization": {
                "algorithm": "reconstruct-polynomial-system-state-commands",
                "schema": POLYNOMIAL_SYSTEM_SCHEMA,
                "version": FIXTURE_NORMALIZATION_VERSION,
            },
            "omitted_atom_order": list(system.omitted_atom_order),
            "omitted_source_predicates": list(system.omitted_source_predicates),
            "orbit": {
                "orbit_id": orbit["orbit_id"],
                "stabilizer_elements": list(orbit["stabilizer_elements"]),
                "witness_to_canonical": member["witness_to_canonical"],
            },
            "ordinal": ordinal,
            "original_smt2_raw_sha256": raw_sha256(journal),
            "polarity": "diagnostic",
            "polynomial_system": system.to_record(),
            "raw_representative": raw_representative.to_record(),
            "schema": CELL_SCHEMA,
            "source_provenance": source_provenance,
            "target_identity": {
                "identity_sha256": target_identity,
                "identifier": _target_record()["identifier"],
                "kind": "fixture",
                "mode": "DIAGNOSTIC_OBSTRUCTION_MINING",
            },
            "variable_order": list(system.variable_order),
        }
        cells.append({**body, "cell_sha256": structured_hash(CELL_SCHEMA, body)})
    return tuple(cells)


def _variable_map() -> list[dict[str, object]]:
    return [
        {"meaning": "fixture left slot value", "ordinal": 0, "variable": "x"},
        {"meaning": "fixture right slot value", "ordinal": 1, "variable": "y"},
    ]


def _build_identity(
    *,
    repository_revision: str,
    generator_source_manifest: list[dict[str, str]],
    validator_source_manifest: list[dict[str, str]],
    finite_ingress: Mapping[str, Any],
    orbit_ledger: Mapping[str, Any],
    cells: Sequence[Mapping[str, Any]],
) -> dict[str, object]:
    ingress_sha256 = structured_hash(FIXTURE_INGRESS_SCHEMA, finite_ingress)
    common_atoms = _fixture_atoms()
    return {
        "atom_ledger": [atom.to_record() for atom in common_atoms],
        "canonical_cell_count": len(cells),
        "cells": [
            {
                "cell_id": cell["cell_id"],
                "cell_sha256": cell["cell_sha256"],
                "ordinal": cell["ordinal"],
                "path": canonical_cell_path(cell["ordinal"], cell["cell_id"]),
                "stored_raw_sha256": raw_sha256(stored_json_bytes(cell)),
            }
            for cell in cells
        ],
        "enabled_atom_inventory": [
            {"atom_ids": list(cell["enabled_atom_order"]), "cell_id": cell["cell_id"]}
            for cell in cells
        ],
        "expected_artifact_schemas": {
            "cell": CELL_SCHEMA,
            "finite_ingress": FIXTURE_INGRESS_SCHEMA,
            "orbit_ledger": ORBIT_LEDGER_SCHEMA,
            "polynomial_system": POLYNOMIAL_SYSTEM_SCHEMA,
        },
        "finite_ingress": {
            "path": FINITE_INGRESS_PATH,
            "payload_sha256": ingress_sha256,
            "schema": FIXTURE_INGRESS_SCHEMA,
            "stored_raw_sha256": raw_sha256(stored_json_bytes(finite_ingress)),
        },
        "omitted_atom_inventory": [
            {"atom_ids": list(cell["omitted_atom_order"]), "cell_id": cell["cell_id"]}
            for cell in cells
        ],
        "omitted_source_predicate_inventory": [FIXTURE_OMITTED_SOURCE_PREDICATE],
        "orbit_count": orbit_ledger["orbit_count"],
        "policy_versions": {
            "classification": FIXTURE_CLASSIFICATION_POLICY,
            "result_admission": FIXTURE_RESULT_ADMISSION_POLICY,
            "retry": FIXTURE_RETRY_POLICY,
        },
        "raw_cell_count": finite_ingress["raw_representatives"].__len__(),
        "repository_revision": repository_revision,
        "resource_limits": {
            "max_attempts": 0,
            "memory_bytes": 0,
            "wall_seconds": 0,
        },
        "solver": {
            "backend": "none",
            "identity": "producer-neutral-offline-fixture/v1",
            "profile": "none",
        },
        "source_hypotheses": [FIXTURE_SOURCE_HYPOTHESIS],
        "source_manifests": {
            "generator": generator_source_manifest,
            "validator": validator_source_manifest,
        },
        "source_provenance_inventory": [
            {
                "atom_id": atom.atom_id,
                "source_provenance": atom.source_provenance,
            }
            for atom in common_atoms
        ],
        "symmetry": {
            "action_version": FIXTURE_ACTION_VERSION,
            "group_version": FIXTURE_GROUP_VERSION,
            "orbit_ledger_raw_sha256": raw_sha256(stored_json_bytes(orbit_ledger)),
            "orbit_ledger_sha256": orbit_ledger["orbit_ledger_sha256"],
            "path": ORBIT_LEDGER_PATH,
        },
        "target": _target_record(),
        "variable_map": _variable_map(),
    }


@dataclass(frozen=True, slots=True)
class FixtureBundle:
    """In-memory canonical records for the complete phase-zero fixture."""

    manifest: dict[str, object]
    cells: tuple[dict[str, object], ...]
    orbit_ledger: dict[str, object]
    finite_ingress: dict[str, object]

    def stored_files(self) -> dict[str, bytes]:
        """Return every artifact at its authenticated canonical relative path."""

        files = {
            MANIFEST_PATH: stored_json_bytes(self.manifest),
            FINITE_INGRESS_PATH: stored_json_bytes(self.finite_ingress),
            ORBIT_LEDGER_PATH: stored_json_bytes(self.orbit_ledger),
        }
        for cell in self.cells:
            path = canonical_cell_path(cell["ordinal"], cell["cell_id"])
            files[path] = stored_json_bytes(cell)
        return files


def build_fixture_bundle(
    *,
    repository_revision: str,
    generator_source_manifest: Sequence[Mapping[str, Any]],
    validator_source_manifest: Sequence[Mapping[str, Any]],
    publication: Mapping[str, Any],
) -> FixtureBundle:
    """Build the byte-stable SAT/UNSAT/UNKNOWN diagnostic fixture bundle.

    The source-manifest hashes are frozen declarations at this pure layer.  The
    campaign planner must authenticate those declarations against the actual
    held source bytes before admitting a run; this builder does no filesystem
    access and makes no source-custody claim.
    """

    revision = _revision(repository_revision, "repository_revision")
    generator = _source_manifest(
        generator_source_manifest, path="generator_source_manifest"
    )
    validator = _source_manifest(
        validator_source_manifest, path="validator_source_manifest"
    )
    frozen_publication = _publication(publication)
    finite_ingress = _fixture_ingress()
    representatives = _fixture_representatives()
    orbit_ledger = build_orbit_ledger(representatives)
    ingress_sha256 = structured_hash(FIXTURE_INGRESS_SCHEMA, finite_ingress)
    cells = _build_cells(orbit_ledger, ingress_sha256)
    identity = _build_identity(
        repository_revision=revision,
        generator_source_manifest=generator,
        validator_source_manifest=validator,
        finite_ingress=finite_ingress,
        orbit_ledger=orbit_ledger,
        cells=cells,
    )
    campaign_id = structured_hash(CAMPAIGN_IDENTITY_SCHEMA, identity)
    body: dict[str, object] = {
        "campaign_id": campaign_id,
        "identity": identity,
        "publication": frozen_publication,
        "schema": MANIFEST_SCHEMA,
    }
    manifest = {
        **body,
        "manifest_sha256": structured_hash(MANIFEST_SCHEMA, body),
    }
    return FixtureBundle(
        manifest=manifest,
        cells=cells,
        orbit_ledger=orbit_ledger,
        finite_ingress=finite_ingress,
    )


@dataclass(frozen=True, slots=True)
class ValidatedCell:
    """Typed summary of a fully reconstructed v1 fixture cell."""

    cell_id: str
    ordinal: int
    control: str
    cell_sha256: str
    system: PolynomialSystem


def validate_cell(value: Any) -> ValidatedCell:
    """Validate one exact cell, including its atom and SMT byte identities."""

    expected_keys = {
        "atoms",
        "canonical_representative",
        "canonical_smt_journal_raw_sha256",
        "cap_profile",
        "cell_id",
        "cell_sha256",
        "cyclic_order",
        "enabled_atom_order",
        "finite_ingress_identity",
        "fixture_expected_outcome",
        "incidence_mask",
        "metric_choices",
        "normalization",
        "omitted_atom_order",
        "omitted_source_predicates",
        "orbit",
        "ordinal",
        "original_smt2_raw_sha256",
        "polarity",
        "polynomial_system",
        "raw_representative",
        "schema",
        "source_provenance",
        "target_identity",
        "variable_order",
    }
    cell = _record(value, expected_keys, "cell")
    if cell["schema"] != CELL_SCHEMA:
        _fail("cell.schema is unsupported")
    digest = _sha256(cell["cell_sha256"], "cell.cell_sha256")
    body = {key: item for key, item in cell.items() if key != "cell_sha256"}
    if structured_hash(CELL_SCHEMA, body) != digest:
        _fail("cell self-hash mismatch")
    cell_id = cell["cell_id"]
    if type(cell_id) is not str or _CELL_ID.fullmatch(cell_id) is None:
        _fail("cell.cell_id is not canonical")
    ordinal = _integer(cell["ordinal"], "cell.ordinal", minimum=0)

    raw = FixtureRepresentative.from_record(
        cell["raw_representative"], path="cell.raw_representative"
    )
    canonical = FixtureRepresentative.from_record(
        cell["canonical_representative"], path="cell.canonical_representative"
    )
    expected_ordinal, expected_id, expected_outcome = _CONTROL_TO_CELL[raw.control]
    if (ordinal, cell_id, cell["fixture_expected_outcome"]) != (
        expected_ordinal,
        expected_id,
        expected_outcome,
    ):
        _fail("cell identity or control outcome is relabeled")
    if raw.slots != (1, 0) or canonical.slots != (0, 1):
        _fail("cell representatives differ from the frozen fixture orbit anchors")
    if cell["cap_profile"] != "fixture-two-slot":
        _fail("cell.cap_profile is unsupported")
    if cell["incidence_mask"] != [0, 1] or cell["cyclic_order"] != [0, 1]:
        _fail("cell incidence mask or cyclic order is noncanonical")
    if cell["metric_choices"] != {"control": raw.control, "slot_sum": 1}:
        _fail("cell.metric_choices disagree with the control representative")
    if cell["polarity"] != "diagnostic":
        _fail("fixture cell polarity must remain diagnostic")
    if cell["orbit"] != {
        "orbit_id": f"fixture-orbit-{ordinal:04d}",
        "stabilizer_elements": ["identity"],
        "witness_to_canonical": "swap",
    }:
        _fail("cell orbit witness or stabilizer data is noncanonical")

    target = _record(
        cell["target_identity"],
        {"identity_sha256", "identifier", "kind", "mode"},
        "cell.target_identity",
    )
    expected_target = {
        "identity_sha256": structured_hash(FIXTURE_TARGET_SCHEMA, _target_record()),
        "identifier": "phase0-three-outcome-control",
        "kind": "fixture",
        "mode": "DIAGNOSTIC_OBSTRUCTION_MINING",
    }
    if target != expected_target:
        _fail("cell target identity is unsupported")
    ingress = _record(
        cell["finite_ingress_identity"],
        {"payload_sha256", "schema"},
        "cell.finite_ingress_identity",
    )
    if ingress["schema"] != FIXTURE_INGRESS_SCHEMA:
        _fail("cell finite-ingress schema is unsupported")
    _sha256(ingress["payload_sha256"], "cell.finite_ingress_identity.payload_sha256")
    expected_ingress = {
        "payload_sha256": structured_hash(FIXTURE_INGRESS_SCHEMA, _fixture_ingress()),
        "schema": FIXTURE_INGRESS_SCHEMA,
    }
    if ingress != expected_ingress:
        _fail("cell finite-ingress identity differs from the frozen fixture ingress")

    try:
        system = PolynomialSystem.from_record(cell["polynomial_system"])
    except CapConfigurationEncodingError as exc:
        raise CapConfigurationUniverseError(str(exc)) from exc
    if system != _fixture_system(raw.control):
        _fail("cell polynomial system differs from its fixture control")
    if cell["variable_order"] != list(system.variable_order):
        _fail("cell variable order differs from the polynomial system")
    if cell["atoms"] != [atom.to_record() for atom in system.atoms]:
        _fail("cell atom ledger differs from the polynomial system")
    if cell["enabled_atom_order"] != list(system.enabled_atom_order):
        _fail("cell enabled atom order differs from the polynomial system")
    if cell["omitted_atom_order"] != list(system.omitted_atom_order):
        _fail("cell omitted atom order differs from the polynomial system")
    if cell["omitted_source_predicates"] != [FIXTURE_OMITTED_SOURCE_PREDICATE]:
        _fail("cell omitted-source predicate inventory is noncanonical")
    provenance = [
        {"atom_id": atom.atom_id, "source_provenance": atom.source_provenance}
        for atom in system.atoms
    ]
    if cell["source_provenance"] != provenance:
        _fail("cell source-provenance ledger differs from its atom ledger")

    normalization = _record(
        cell["normalization"],
        {"algorithm", "schema", "version"},
        "cell.normalization",
    )
    if normalization != {
        "algorithm": "reconstruct-polynomial-system-state-commands",
        "schema": POLYNOMIAL_SYSTEM_SCHEMA,
        "version": FIXTURE_NORMALIZATION_VERSION,
    }:
        _fail("cell normalization contract is unsupported")
    journal_hash = raw_sha256(system.state_smt2_bytes())
    if (
        _sha256(
            cell["canonical_smt_journal_raw_sha256"],
            "cell.canonical_smt_journal_raw_sha256",
        )
        != journal_hash
    ):
        _fail("cell canonical SMT journal hash mismatch")
    if (
        _sha256(cell["original_smt2_raw_sha256"], "cell.original_smt2_raw_sha256")
        != journal_hash
    ):
        _fail("cell original SMT byte hash mismatch")
    return ValidatedCell(cell_id, ordinal, raw.control, digest, system)


@dataclass(frozen=True, slots=True)
class ValidatedManifest:
    """Typed summary of a structurally and cryptographically valid manifest."""

    campaign_id: str
    manifest_sha256: str
    repository_revision: str
    cell_ids: tuple[str, ...]


_IDENTITY_KEYS = {
    "atom_ledger",
    "canonical_cell_count",
    "cells",
    "enabled_atom_inventory",
    "expected_artifact_schemas",
    "finite_ingress",
    "omitted_atom_inventory",
    "omitted_source_predicate_inventory",
    "orbit_count",
    "policy_versions",
    "raw_cell_count",
    "repository_revision",
    "resource_limits",
    "solver",
    "source_hypotheses",
    "source_manifests",
    "source_provenance_inventory",
    "symmetry",
    "target",
    "variable_map",
}


def validate_manifest(value: Any) -> ValidatedManifest:
    """Validate the exact fixture manifest and every identity projection.

    Source-manifest digests are declarations here.  Filesystem custody and
    comparison with actual held source bytes belong to campaign planning.
    """

    manifest = _record(
        value,
        {"campaign_id", "identity", "manifest_sha256", "publication", "schema"},
        "manifest",
    )
    if manifest["schema"] != MANIFEST_SCHEMA:
        _fail("manifest.schema is unsupported")
    identity = _record(manifest["identity"], _IDENTITY_KEYS, "manifest.identity")
    campaign_id = _sha256(manifest["campaign_id"], "manifest.campaign_id")
    if structured_hash(CAMPAIGN_IDENTITY_SCHEMA, identity) != campaign_id:
        _fail("manifest campaign identity mismatch")
    manifest_sha256 = _sha256(manifest["manifest_sha256"], "manifest.manifest_sha256")
    body = {key: item for key, item in manifest.items() if key != "manifest_sha256"}
    if structured_hash(MANIFEST_SCHEMA, body) != manifest_sha256:
        _fail("manifest self-hash mismatch")
    _publication(manifest["publication"])
    repository_revision = _revision(
        identity["repository_revision"], "manifest.identity.repository_revision"
    )

    source_manifests = _record(
        identity["source_manifests"],
        {"generator", "validator"},
        "manifest.identity.source_manifests",
    )
    _source_manifest(
        _array(
            source_manifests["generator"],
            "manifest.identity.source_manifests.generator",
        ),
        path="manifest.identity.source_manifests.generator",
    )
    _source_manifest(
        _array(
            source_manifests["validator"],
            "manifest.identity.source_manifests.validator",
        ),
        path="manifest.identity.source_manifests.validator",
    )
    if identity["target"] != _target_record():
        _fail("manifest target contract is not the diagnostic fixture contract")
    if identity["source_hypotheses"] != [FIXTURE_SOURCE_HYPOTHESIS]:
        _fail("manifest source-hypothesis inventory is noncanonical")
    if identity["omitted_source_predicate_inventory"] != [
        FIXTURE_OMITTED_SOURCE_PREDICATE
    ]:
        _fail("manifest omitted-source predicate inventory is noncanonical")
    if identity["variable_map"] != _variable_map():
        _fail("manifest variable map is noncanonical")
    if identity["atom_ledger"] != [atom.to_record() for atom in _fixture_atoms()]:
        _fail("manifest atom ledger is noncanonical")
    if identity["source_provenance_inventory"] != [
        {"atom_id": atom.atom_id, "source_provenance": atom.source_provenance}
        for atom in _fixture_atoms()
    ]:
        _fail("manifest source-provenance inventory is noncanonical")
    if identity["solver"] != {
        "backend": "none",
        "identity": "producer-neutral-offline-fixture/v1",
        "profile": "none",
    }:
        _fail("fixture manifest must not authorize a solver")
    if identity["resource_limits"] != {
        "max_attempts": 0,
        "memory_bytes": 0,
        "wall_seconds": 0,
    }:
        _fail("fixture manifest resource limits must remain zero")
    if identity["policy_versions"] != {
        "classification": FIXTURE_CLASSIFICATION_POLICY,
        "result_admission": FIXTURE_RESULT_ADMISSION_POLICY,
        "retry": FIXTURE_RETRY_POLICY,
    }:
        _fail("manifest policy versions are unsupported")
    if identity["expected_artifact_schemas"] != {
        "cell": CELL_SCHEMA,
        "finite_ingress": FIXTURE_INGRESS_SCHEMA,
        "orbit_ledger": ORBIT_LEDGER_SCHEMA,
        "polynomial_system": POLYNOMIAL_SYSTEM_SCHEMA,
    }:
        _fail("manifest expected artifact schemas are unsupported")

    ingress = _record(
        identity["finite_ingress"],
        {"path", "payload_sha256", "schema", "stored_raw_sha256"},
        "manifest.identity.finite_ingress",
    )
    if (
        ingress["path"] != FINITE_INGRESS_PATH
        or ingress["schema"] != FIXTURE_INGRESS_SCHEMA
    ):
        _fail("manifest finite-ingress path or schema is unsupported")
    _sha256(
        ingress["payload_sha256"], "manifest.identity.finite_ingress.payload_sha256"
    )
    _sha256(
        ingress["stored_raw_sha256"],
        "manifest.identity.finite_ingress.stored_raw_sha256",
    )
    symmetry = _record(
        identity["symmetry"],
        {
            "action_version",
            "group_version",
            "orbit_ledger_raw_sha256",
            "orbit_ledger_sha256",
            "path",
        },
        "manifest.identity.symmetry",
    )
    if (
        symmetry["action_version"] != FIXTURE_ACTION_VERSION
        or symmetry["group_version"] != FIXTURE_GROUP_VERSION
        or symmetry["path"] != ORBIT_LEDGER_PATH
    ):
        _fail("manifest symmetry identity is unsupported")
    _sha256(
        symmetry["orbit_ledger_sha256"],
        "manifest.identity.symmetry.orbit_ledger_sha256",
    )
    _sha256(
        symmetry["orbit_ledger_raw_sha256"],
        "manifest.identity.symmetry.orbit_ledger_raw_sha256",
    )

    if (
        _integer(
            identity["raw_cell_count"], "manifest.identity.raw_cell_count", minimum=1
        )
        != 6
    ):
        _fail("manifest raw cell count differs from the fixture universe")
    if (
        _integer(
            identity["canonical_cell_count"],
            "manifest.identity.canonical_cell_count",
            minimum=1,
        )
        != 3
    ):
        _fail("manifest canonical cell count differs from the fixture universe")
    if (
        _integer(identity["orbit_count"], "manifest.identity.orbit_count", minimum=1)
        != 3
    ):
        _fail("manifest orbit count differs from the fixture universe")

    raw_cells = _array(identity["cells"], "manifest.identity.cells")
    if len(raw_cells) != 3:
        _fail("manifest must enumerate exactly three canonical fixture cells")
    cell_ids: list[str] = []
    for index, raw_entry in enumerate(raw_cells):
        entry = _record(
            raw_entry,
            {"cell_id", "cell_sha256", "ordinal", "path", "stored_raw_sha256"},
            f"manifest.identity.cells[{index}]",
        )
        expected_control = FIXTURE_CONTROLS[index]
        expected_ordinal, expected_id, _ = _CONTROL_TO_CELL[expected_control]
        ordinal = _integer(
            entry["ordinal"], f"manifest.identity.cells[{index}].ordinal", minimum=0
        )
        if ordinal != expected_ordinal or entry["cell_id"] != expected_id:
            _fail("manifest cell list is missing, reordered, or relabeled")
        if entry["path"] != canonical_cell_path(ordinal, expected_id):
            _fail("manifest cell path is unsafe or noncanonical")
        _sha256(entry["cell_sha256"], f"manifest.identity.cells[{index}].cell_sha256")
        _sha256(
            entry["stored_raw_sha256"],
            f"manifest.identity.cells[{index}].stored_raw_sha256",
        )
        cell_ids.append(expected_id)
    if len(cell_ids) != len(set(cell_ids)):
        _fail("manifest cell identifiers contain duplicates")

    expected_enabled = [
        {
            "atom_ids": list(_fixture_system(control).enabled_atom_order),
            "cell_id": _CONTROL_TO_CELL[control][1],
        }
        for control in FIXTURE_CONTROLS
    ]
    expected_omitted = [
        {
            "atom_ids": list(_fixture_system(control).omitted_atom_order),
            "cell_id": _CONTROL_TO_CELL[control][1],
        }
        for control in FIXTURE_CONTROLS
    ]
    if identity["enabled_atom_inventory"] != expected_enabled:
        _fail("manifest enabled-atom inventory is noncanonical")
    if identity["omitted_atom_inventory"] != expected_omitted:
        _fail("manifest omitted-atom inventory is noncanonical")
    return ValidatedManifest(
        campaign_id=campaign_id,
        manifest_sha256=manifest_sha256,
        repository_revision=repository_revision,
        cell_ids=tuple(cell_ids),
    )


@dataclass(frozen=True, slots=True)
class ValidatedUniverse:
    """Cross-artifact result of complete offline universe validation."""

    campaign_id: str
    manifest_sha256: str
    orbit_ledger_sha256: str
    raw_cell_count: int
    canonical_cell_count: int
    orbit_count: int
    cells: tuple[ValidatedCell, ...]


def validate_universe(
    manifest_or_bundle: Any,
    cells: Sequence[Mapping[str, Any]] | None = None,
    orbit_ledger: Mapping[str, Any] | None = None,
    finite_ingress: Mapping[str, Any] | None = None,
) -> ValidatedUniverse:
    """Rebuild and cross-check all fixture universe records without a solver.

    This pure validator does not read source files.  It validates the declared
    source-manifest syntax and identity binding; campaign planning must
    authenticate each declaration against the actual held source bytes.
    """

    if type(manifest_or_bundle) is FixtureBundle:
        if any(item is not None for item in (cells, orbit_ledger, finite_ingress)):
            _fail("bundle validation does not accept duplicate artifact arguments")
        bundle = manifest_or_bundle
        manifest = bundle.manifest
        cells = bundle.cells
        orbit_ledger = bundle.orbit_ledger
        finite_ingress = bundle.finite_ingress
    else:
        manifest = manifest_or_bundle
    if cells is None or orbit_ledger is None or finite_ingress is None:
        _fail("manifest, cells, orbit ledger, and finite ingress are all required")
    if isinstance(cells, (str, bytes)) or not isinstance(cells, Sequence):
        _fail("cells must be an ordered sequence")

    validated_manifest = validate_manifest(manifest)
    if finite_ingress != _fixture_ingress():
        _fail("finite ingress differs from independent fixture enumeration")
    ingress_sha256 = structured_hash(FIXTURE_INGRESS_SCHEMA, finite_ingress)
    identity = manifest["identity"]
    if identity["finite_ingress"] != {
        "path": FINITE_INGRESS_PATH,
        "payload_sha256": ingress_sha256,
        "schema": FIXTURE_INGRESS_SCHEMA,
        "stored_raw_sha256": raw_sha256(stored_json_bytes(finite_ingress)),
    }:
        _fail("manifest finite-ingress identity is stale")

    try:
        validated_orbits: ValidatedOrbitLedger = validate_orbit_ledger(
            orbit_ledger,
            expected_representatives=_fixture_representatives(),
            expected_group=fixture_symmetry_group(),
        )
    except CapConfigurationSymmetryError as exc:
        raise CapConfigurationUniverseError(str(exc)) from exc
    symmetry_identity = identity["symmetry"]
    if symmetry_identity["orbit_ledger_sha256"] != validated_orbits.orbit_ledger_sha256:
        _fail("manifest orbit-ledger structured hash is stale")
    if symmetry_identity["orbit_ledger_raw_sha256"] != raw_sha256(
        stored_json_bytes(orbit_ledger)
    ):
        _fail("manifest orbit-ledger retained-byte hash is stale")

    parsed_cells = tuple(validate_cell(cell) for cell in cells)
    if tuple(cell.cell_id for cell in parsed_cells) != validated_manifest.cell_ids:
        _fail("cell sequence is missing, extra, or reordered")
    expected_cells = _build_cells(orbit_ledger, ingress_sha256)
    if tuple(cells) != expected_cells:
        _fail("cell records differ from independent fixture reconstruction")
    manifest_entries = identity["cells"]
    for entry, cell in zip(manifest_entries, cells, strict=True):
        if entry != {
            "cell_id": cell["cell_id"],
            "cell_sha256": cell["cell_sha256"],
            "ordinal": cell["ordinal"],
            "path": canonical_cell_path(cell["ordinal"], cell["cell_id"]),
            "stored_raw_sha256": raw_sha256(stored_json_bytes(cell)),
        }:
            _fail("manifest cell entry is stale")

    source_manifests = identity["source_manifests"]
    expected_identity = _build_identity(
        repository_revision=validated_manifest.repository_revision,
        generator_source_manifest=source_manifests["generator"],
        validator_source_manifest=source_manifests["validator"],
        finite_ingress=finite_ingress,
        orbit_ledger=orbit_ledger,
        cells=cells,
    )
    if identity != expected_identity:
        _fail("manifest identity differs from complete universe reconstruction")
    if (
        structured_hash(CAMPAIGN_IDENTITY_SCHEMA, expected_identity)
        != validated_manifest.campaign_id
    ):
        _fail("manifest campaign ID is stale after universe reconstruction")
    return ValidatedUniverse(
        campaign_id=validated_manifest.campaign_id,
        manifest_sha256=validated_manifest.manifest_sha256,
        orbit_ledger_sha256=validated_orbits.orbit_ledger_sha256,
        raw_cell_count=6,
        canonical_cell_count=3,
        orbit_count=3,
        cells=parsed_cells,
    )
