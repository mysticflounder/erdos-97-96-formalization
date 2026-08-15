"""Registered one-session, one-solve SMT engine with offline semantic replay."""

from __future__ import annotations

import json
import os
import stat
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path
from types import MappingProxyType
from typing import Any

from census.p97_search.phase3_cegar_runtime import (
    ExactFileCaptureError,
    capture_exact_regular_file,
)
from census.p97_search.phase3_cegar_wave import sha256_bytes
from census.p97_search.phase3_cegar_wave_control import (
    SmtOneshotBinding,
    SmtOneshotControl,
    SmtSemanticProfileIdentity,
    WaveControlError,
    bind_smt_oneshot,
)
from census.p97_search.phase3_piqd_smt_source_adapter import (
    FALSE_CLAIMS,
    MAX_OUTPUT_BYTES,
    PiqdTransport,
    SemanticVerification,
    SemanticVerifier,
    SmtOutputTransaction,
    SmtSourceAdapterError,
    SourceSemanticQuery,
    SourceSnapshot,
    UrllibPiqdTransport,
    run_authenticated_single_solver_query,
)

ENGINE_SCHEMA = "p97-cegar-smt-oneshot-engine/v1"
SOURCE_MANIFEST_SCHEMA = "p97-cegar-smt-oneshot-source-manifest/v1"
ENGINE_FALSE_CLAIMS = {**FALSE_CLAIMS, "proof": False}
_NATIVE_PATH_TYPE = type(Path())
_CLASSIFICATIONS = frozenset(
    {
        "SAT_SEMANTICALLY_REPLAYED",
        "UNSAT_DISCOVERY_ONLY",
        "INCONCLUSIVE_UNKNOWN",
        "INCONCLUSIVE_TRANSPORT_LOSS",
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
    }
)


class SmtOneshotEngineError(RuntimeError):
    """The registered one-shot SMT custody contract failed closed."""


QueryValidator = Callable[[SourceSemanticQuery], SourceSemanticQuery]

_ATAIL_PROFILE_IDENTITY = ("atail-exact-rational-atom-replay", "v1")


def _validate_atail_geometry_query(
    query: SourceSemanticQuery,
) -> SourceSemanticQuery:
    from census.atail_force import piqd_cvc5_adapter

    return piqd_cvc5_adapter.validate_smt_oneshot_query(query)


def _verify_atail_geometry_sat(
    query: SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> SemanticVerification:
    from census.atail_force import piqd_cvc5_adapter

    return piqd_cvc5_adapter.verify_sat_model(query, solver, model, values)


@dataclass(frozen=True)
class SmtOneshotSemanticProfile:
    """One code-defined source semantics and solver contract."""

    identity: tuple[str, str]
    descriptor_schema: str
    solver_profile_schema: str
    solver: str
    query_validator: QueryValidator
    semantic_verifier: SemanticVerifier

    def as_dict(self) -> dict[str, str]:
        return {
            "id": self.identity[0],
            "version": self.identity[1],
            "descriptor_schema": self.descriptor_schema,
            "solver_profile_schema": self.solver_profile_schema,
            "solver": self.solver,
        }


# Production integrations add reviewed fixed rows here. Control JSON can name
# a row but cannot provide code, imports, commands, credentials, or transport.
# Lazy callbacks keep unrelated wave kinds from importing producer dependencies.
SMT_ONESHOT_SEMANTIC_PROFILES: Mapping[tuple[str, str], SmtOneshotSemanticProfile] = (
    MappingProxyType(
        {
            _ATAIL_PROFILE_IDENTITY: SmtOneshotSemanticProfile(
                identity=_ATAIL_PROFILE_IDENTITY,
                descriptor_schema="atail-piqd-cvc5-geometry-query/v1",
                solver_profile_schema="atail-piqd-cvc5/v1",
                solver="cvc5",
                query_validator=_validate_atail_geometry_query,
                semantic_verifier=_verify_atail_geometry_sat,
            )
        }
    )
)


def resolve_smt_oneshot_semantic_profile(
    identity: SmtSemanticProfileIdentity | tuple[str, str],
) -> SmtOneshotSemanticProfile:
    if type(identity) is SmtSemanticProfileIdentity:
        key = (identity.id, identity.version)
    elif (
        type(identity) is tuple
        and len(identity) == 2
        and all(type(item) is str and item for item in identity)
    ):
        key = identity
    else:
        raise SmtOneshotEngineError("SMT semantic profile identity is invalid")
    profile = SMT_ONESHOT_SEMANTIC_PROFILES.get(key)
    if type(profile) is not SmtOneshotSemanticProfile or profile.identity != key:
        raise SmtOneshotEngineError("SMT semantic profile is not code-registered")
    if (
        profile.solver not in {"z3", "cvc5"}
        or not profile.descriptor_schema
        or not profile.solver_profile_schema
        or not callable(profile.query_validator)
        or not callable(profile.semantic_verifier)
    ):
        raise SmtOneshotEngineError("SMT semantic profile row is invalid")
    return profile


@dataclass(frozen=True)
class SmtOneshotEngineResult:
    classification: str
    envelope_path: Path
    envelope: dict[str, Any]


def _canonical_json(value: object) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as error:
        raise SmtOneshotEngineError("SMT envelope is not canonical JSON") from error


def _artifact_name(index: int, source: SourceSnapshot) -> str:
    return f"source-{index:04d}-{sha256_bytes(source.payload)[:16]}.bin"


def _source_manifest(query: SourceSemanticQuery) -> dict[str, Any]:
    return {
        "schema": SOURCE_MANIFEST_SCHEMA,
        "producer": query.descriptor["producer"],
        "semantic_verifier": query.descriptor["semantic_verifier"],
        "stage_id": query.descriptor["stage_id"],
        "query_id": query.descriptor["query_id"],
        "descriptor_sha256": sha256_bytes(query.descriptor_bytes),
        "semantic_sha256": query.descriptor["semantic_sha256"],
        "original_smt2_sha256": sha256_bytes(query.original_smt2),
        "journal_sha256": sha256_bytes(query.journal_smt2),
        "journal_commands": len(query.journal_commands),
        "sources": [
            {
                "path": source.path,
                "bytes": len(source.payload),
                "sha256": sha256_bytes(source.payload),
                "custody_artifact": _artifact_name(index, source),
            }
            for index, source in enumerate(query.source_files)
        ],
        "claims": dict(ENGINE_FALSE_CLAIMS),
    }


def _clone_query(query: SourceSemanticQuery) -> SourceSemanticQuery:
    return SourceSemanticQuery(
        descriptor=json.loads(_canonical_json(query.descriptor).decode("utf-8")),
        descriptor_bytes=query.descriptor_bytes,
        original_smt2=query.original_smt2,
        journal_commands=query.journal_commands,
        journal_smt2=query.journal_smt2,
        source_files=tuple(
            SourceSnapshot(source.path, source.payload) for source in query.source_files
        ),
    )


def _validated_profile_query(
    control: SmtOneshotControl,
    package_root: Path,
    profile: SmtOneshotSemanticProfile,
) -> tuple[SmtOneshotBinding, SourceSemanticQuery]:
    if profile.identity != (
        control.semantic_profile.id,
        control.semantic_profile.version,
    ):
        raise SmtOneshotEngineError("SMT profile is crossed with its control")
    try:
        binding = bind_smt_oneshot(
            control,
            package_root,
            solver=profile.solver,
            descriptor_schema=profile.descriptor_schema,
            solver_profile_schema=profile.solver_profile_schema,
        )
        validated = profile.query_validator(_clone_query(binding.query))
    except (SmtSourceAdapterError, WaveControlError) as error:
        raise SmtOneshotEngineError(
            "SMT query failed pre-transport validation"
        ) from error
    except Exception as error:
        raise SmtOneshotEngineError(
            "SMT semantic query validator rejected input"
        ) from error
    if type(validated) is not SourceSemanticQuery or validated != binding.query:
        raise SmtOneshotEngineError("SMT query validator altered authenticated input")
    return binding, validated


def authenticate_smt_oneshot_query(
    control: SmtOneshotControl,
    package_root: Path,
    semantic_profile: SmtOneshotSemanticProfile,
) -> SourceSemanticQuery:
    """Authenticate a registered packet and its producer preflight offline."""

    return _validated_profile_query(control, package_root, semantic_profile)[1]


class SmtOneshotWaveEngine:
    def __init__(
        self,
        *,
        control: SmtOneshotControl,
        package_root: Path,
        output_path: Path,
        base_url: str,
        semantic_profile: SmtOneshotSemanticProfile,
        transport: PiqdTransport | None = None,
        execution_registration: dict[str, Any],
    ) -> None:
        if type(control) is not SmtOneshotControl:
            raise SmtOneshotEngineError("SMT_ONESHOT control has the wrong type")
        for value, label in (
            (package_root, "package_root"),
            (output_path, "output_path"),
        ):
            if type(value) is not _NATIVE_PATH_TYPE or not value.is_absolute():
                raise SmtOneshotEngineError(f"{label} must be an absolute native Path")
        if type(base_url) is not str or not base_url:
            raise SmtOneshotEngineError("base_url must be nonempty builtin text")
        if type(execution_registration) is not dict:
            raise SmtOneshotEngineError(
                "execution registration must be an exact object"
            )
        self.control = control
        self.package_root = package_root
        self.output_path = output_path
        self.base_url = base_url
        self.profile = semantic_profile
        self.transport = transport
        self.execution_registration = execution_registration

    def run(self) -> SmtOneshotEngineResult:
        _, query = _validated_profile_query(
            self.control, self.package_root, self.profile
        )
        transport = self.transport
        if transport is None:
            timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
            transport = UrllibPiqdTransport(
                self.base_url, http_timeout_s=(timeout_ms + 30_000) / 1000
            )
        with SmtOutputTransaction(self.output_path) as transaction:
            custody: dict[str, Any] = {
                "descriptor": transaction.write_bytes(
                    "descriptor.json", query.descriptor_bytes
                ),
                "original_smt2": transaction.write_bytes(
                    "original.smt2", query.original_smt2
                ),
                "journal_smt2": transaction.write_bytes(
                    "journal.smt2", query.journal_smt2
                ),
            }
            source_manifest = _source_manifest(query)
            source_manifest_bytes = _canonical_json(source_manifest) + b"\n"
            custody["source_manifest"] = transaction.write_bytes(
                "source-manifest.json", source_manifest_bytes
            )
            custody["sources"] = [
                transaction.write_bytes(_artifact_name(index, source), source.payload)
                for index, source in enumerate(query.source_files)
            ]
            try:
                engine = run_authenticated_single_solver_query(
                    query,
                    solver=self.profile.solver,
                    descriptor_schema=self.profile.descriptor_schema,
                    solver_profile_schema=self.profile.solver_profile_schema,
                    authenticated_journal_commands=query.journal_commands,
                    transport=transport,
                    semantic_verifier=self.profile.semantic_verifier,
                    output_fd=transaction.file_descriptor,
                )
            except SmtSourceAdapterError as error:
                raise SmtOneshotEngineError("one-shot SMT execution failed") from error
            classification = engine["effective_status"]
            if classification not in _CLASSIFICATIONS:
                raise SmtOneshotEngineError("one-shot SMT classification is invalid")
            envelope: dict[str, Any] = {
                "schema": ENGINE_SCHEMA,
                "execution_registration": self.execution_registration,
                "control_sha256": sha256_bytes(self.control.canonical_bytes),
                "semantic_profile": self.profile.as_dict(),
                "package": {
                    "descriptor_reference": {
                        "path": self.control.descriptor.path,
                        "bytes": len(query.descriptor_bytes),
                        "sha256": sha256_bytes(query.descriptor_bytes),
                    },
                    "source_manifest_sha256": sha256_bytes(source_manifest_bytes),
                    "original_smt2_sha256": sha256_bytes(query.original_smt2),
                    "journal_sha256": sha256_bytes(query.journal_smt2),
                    "journal_commands": len(query.journal_commands),
                    "semantic_sha256": query.descriptor["semantic_sha256"],
                    "sources": source_manifest["sources"],
                },
                "custody": custody,
                "result": {
                    "classification": classification,
                    "raw_status": engine["raw_status"],
                    "engine": engine,
                },
                "claims": dict(ENGINE_FALSE_CLAIMS),
            }
            envelope["envelope_sha256"] = sha256_bytes(_canonical_json(envelope))
            transaction.write_bytes("envelope.json", _canonical_json(envelope) + b"\n")
            transaction.publish()
        accepted = validate_smt_oneshot_engine_output(
            self.control,
            self.package_root,
            self.output_path,
            semantic_profile=self.profile,
            execution_registration=self.execution_registration,
        )
        return SmtOneshotEngineResult(classification, self.output_path, accepted)


def _strict_json(raw: bytes) -> dict[str, Any]:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise ValueError("duplicate JSON key")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_constant=lambda _: (_ for _ in ()).throw(ValueError()),
        )
    except (UnicodeDecodeError, ValueError, json.JSONDecodeError) as error:
        raise SmtOneshotEngineError("SMT output JSON is invalid") from error
    if type(value) is not dict:
        raise SmtOneshotEngineError("SMT output JSON is not an object")
    return value


def _capture_artifact(root: Path, metadata: object) -> bytes:
    if type(metadata) is not dict or set(metadata) != {"path", "bytes", "sha256"}:
        raise SmtOneshotEngineError("SMT artifact metadata is invalid")
    name = metadata["path"]
    if (
        type(name) is not str
        or name in {"", ".", ".."}
        or "/" in name
        or "\\" in name
        or type(metadata["bytes"]) is not int
        or metadata["bytes"] < 0
        or type(metadata["sha256"]) is not str
    ):
        raise SmtOneshotEngineError("SMT artifact metadata is invalid")
    try:
        captured = capture_exact_regular_file(
            root / name,
            max_bytes=MAX_OUTPUT_BYTES,
            require_nonempty=metadata["bytes"] > 0,
            require_single_link=True,
            keep_bytes=True,
            label=f"SMT output {name}",
        )
    except ExactFileCaptureError as error:
        raise SmtOneshotEngineError("SMT output artifact capture failed") from error
    if (
        captured.data is None
        or len(captured.data) != metadata["bytes"]
        or captured.sha256 != metadata["sha256"]
    ):
        raise SmtOneshotEngineError("SMT output artifact digest is crossed")
    return captured.data


def _artifact_rows(envelope: Mapping[str, Any]) -> list[dict[str, Any]]:
    try:
        custody = envelope["custody"]
        rows = [
            custody["descriptor"],
            custody["original_smt2"],
            custody["journal_smt2"],
            custody["source_manifest"],
            *custody["sources"],
            *envelope["result"]["engine"]["artifacts"].values(),
        ]
    except (KeyError, TypeError, AttributeError) as error:
        raise SmtOneshotEngineError(
            "SMT output artifact inventory is absent"
        ) from error
    if not all(type(row) is dict for row in rows):
        raise SmtOneshotEngineError("SMT output artifact inventory is invalid")
    return rows


def inspect_smt_oneshot_engine_output_structure(path: Path) -> dict[str, Any]:
    """Validate an installed SMT output's self-consistency without its package."""

    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise SmtOneshotEngineError("output path must be an absolute native Path")
    try:
        info = os.stat(path, follow_symlinks=False)
    except OSError as error:
        raise SmtOneshotEngineError(
            "SMT output directory cannot be inspected"
        ) from error
    if not stat.S_ISDIR(info.st_mode):
        raise SmtOneshotEngineError("SMT output path is not a directory")
    if Path(os.path.realpath(path)) != path:
        raise SmtOneshotEngineError("SMT output path must be canonical and no-symlink")
    try:
        captured_envelope = capture_exact_regular_file(
            path / "envelope.json",
            max_bytes=MAX_OUTPUT_BYTES,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=True,
            label="SMT envelope",
        )
    except ExactFileCaptureError as error:
        raise SmtOneshotEngineError("SMT envelope capture failed") from error
    if captured_envelope.data is None:
        raise SmtOneshotEngineError("SMT envelope bytes were not retained")
    envelope_raw = captured_envelope.data
    envelope = _strict_json(envelope_raw)
    if envelope_raw != _canonical_json(envelope) + b"\n":
        raise SmtOneshotEngineError("SMT envelope bytes are not canonical")
    expected_keys = {
        "schema",
        "execution_registration",
        "control_sha256",
        "semantic_profile",
        "package",
        "custody",
        "result",
        "claims",
        "envelope_sha256",
    }
    if set(envelope) != expected_keys or envelope["schema"] != ENGINE_SCHEMA:
        raise SmtOneshotEngineError("SMT envelope schema is invalid")
    digest = envelope.pop("envelope_sha256")
    if type(digest) is not str or digest != sha256_bytes(_canonical_json(envelope)):
        raise SmtOneshotEngineError("SMT envelope digest is crossed")
    envelope["envelope_sha256"] = digest
    if envelope["claims"] != ENGINE_FALSE_CLAIMS:
        raise SmtOneshotEngineError("SMT envelope makes a proof or theorem claim")
    result = envelope["result"]
    if type(result) is not dict or set(result) != {
        "classification",
        "raw_status",
        "engine",
    }:
        raise SmtOneshotEngineError("SMT result schema is invalid")
    engine = result["engine"]
    if type(engine) is not dict or result["classification"] not in _CLASSIFICATIONS:
        raise SmtOneshotEngineError("SMT engine result is invalid")
    if (
        result["classification"] != engine.get("effective_status")
        or result["raw_status"] != engine.get("raw_status")
        or engine.get("claims") != FALSE_CLAIMS
    ):
        raise SmtOneshotEngineError("SMT result boundary is crossed")
    rows = _artifact_rows(envelope)
    names = [row.get("path") for row in rows]
    if len(names) != len(set(names)) or any(type(name) is not str for name in names):
        raise SmtOneshotEngineError("SMT artifact names are duplicate or invalid")
    for row in rows:
        _capture_artifact(path, row)
    if set(os.listdir(path)) != {*names, "envelope.json"}:
        raise SmtOneshotEngineError("SMT output contains unregistered artifacts")
    return envelope


def _offline_semantic_replay(
    root: Path,
    query: SourceSemanticQuery,
    profile: SmtOneshotSemanticProfile,
    engine: Mapping[str, Any],
) -> None:
    raw_status = engine.get("raw_status")
    semantic = engine.get("semantic_replay")
    if raw_status in {None, "UNSAT", "UNKNOWN"}:
        if semantic is not None:
            raise SmtOneshotEngineError("non-SAT output carries semantic replay")
        expected = {
            None: "INCONCLUSIVE_TRANSPORT_LOSS",
            "UNSAT": "UNSAT_DISCOVERY_ONLY",
            "UNKNOWN": "INCONCLUSIVE_UNKNOWN",
        }[raw_status]
        if engine.get("effective_status") != expected:
            raise SmtOneshotEngineError("non-SAT classification is crossed")
        return
    if raw_status != "SAT":
        raise SmtOneshotEngineError("SMT raw status is invalid")
    artifacts = engine.get("artifacts")
    if type(artifacts) is not dict:
        raise SmtOneshotEngineError("SAT artifact inventory is absent")
    solve_row = artifacts.get("reconciled_solve", artifacts.get("solve"))
    solve = _strict_json(_capture_artifact(root, solve_row))
    model = solve.get("model")
    values = solve.get("values")
    if type(model) is not str or type(values) is not str:
        raise SmtOneshotEngineError("SAT solve artifact lacks model/readback")
    try:
        verification = profile.semantic_verifier(
            _clone_query(query), profile.solver, model, values
        )
        if (
            type(verification) is not SemanticVerification
            or type(verification.accepted) is not bool
        ):
            raise TypeError("invalid semantic verifier result")
        evidence = json.loads(_canonical_json(verification.evidence).decode("utf-8"))
        expected_semantic = {
            "accepted": verification.accepted,
            "evidence": evidence,
            "verifier": query.descriptor["semantic_verifier"],
            "model_sha256": sha256_bytes(model.encode("utf-8")),
            "values_sha256": sha256_bytes(values.encode("utf-8")),
        }
        expected_status = (
            "SAT_SEMANTICALLY_REPLAYED"
            if verification.accepted
            else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
        )
    except Exception as error:  # noqa: BLE001 - reproduce adapter failure record
        expected_semantic = {
            "accepted": False,
            "failure": type(error).__name__,
            "verifier": query.descriptor["semantic_verifier"],
        }
        expected_status = "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"
    if (
        semantic != expected_semantic
        or engine.get("effective_status") != expected_status
    ):
        raise SmtOneshotEngineError("offline SAT semantic replay disagrees")


def validate_smt_oneshot_engine_output(
    control: SmtOneshotControl,
    package_root: Path,
    path: Path,
    *,
    semantic_profile: SmtOneshotSemanticProfile,
    execution_registration: dict[str, Any],
) -> dict[str, Any]:
    """Cross-bind control, source packet, registration, and SAT semantics offline."""

    _, query = _validated_profile_query(control, package_root, semantic_profile)
    envelope = inspect_smt_oneshot_engine_output_structure(path)
    manifest = _source_manifest(query)
    manifest_bytes = _canonical_json(manifest) + b"\n"
    expected_package = {
        "descriptor_reference": {
            "path": control.descriptor.path,
            "bytes": len(query.descriptor_bytes),
            "sha256": sha256_bytes(query.descriptor_bytes),
        },
        "source_manifest_sha256": sha256_bytes(manifest_bytes),
        "original_smt2_sha256": sha256_bytes(query.original_smt2),
        "journal_sha256": sha256_bytes(query.journal_smt2),
        "journal_commands": len(query.journal_commands),
        "semantic_sha256": query.descriptor["semantic_sha256"],
        "sources": manifest["sources"],
    }
    if (
        envelope["execution_registration"] != execution_registration
        or envelope["control_sha256"] != sha256_bytes(control.canonical_bytes)
        or envelope["semantic_profile"] != semantic_profile.as_dict()
        or envelope["package"] != expected_package
    ):
        raise SmtOneshotEngineError("SMT output is crossed with control or package")
    custody = envelope["custody"]
    if _capture_artifact(path, custody["descriptor"]) != query.descriptor_bytes:
        raise SmtOneshotEngineError("descriptor custody is crossed")
    if _capture_artifact(path, custody["original_smt2"]) != query.original_smt2:
        raise SmtOneshotEngineError("original SMT2 custody is crossed")
    if _capture_artifact(path, custody["journal_smt2"]) != query.journal_smt2:
        raise SmtOneshotEngineError("journal custody is crossed")
    if _capture_artifact(path, custody["source_manifest"]) != manifest_bytes:
        raise SmtOneshotEngineError("source manifest custody is crossed")
    for row, source in zip(custody["sources"], query.source_files, strict=True):
        if _capture_artifact(path, row) != source.payload:
            raise SmtOneshotEngineError("source custody is crossed")
    _offline_semantic_replay(
        path, query, semantic_profile, envelope["result"]["engine"]
    )
    return envelope


__all__ = [
    "ENGINE_FALSE_CLAIMS",
    "ENGINE_SCHEMA",
    "SMT_ONESHOT_SEMANTIC_PROFILES",
    "SmtOneshotEngineError",
    "SmtOneshotEngineResult",
    "SmtOneshotSemanticProfile",
    "SmtOneshotWaveEngine",
    "authenticate_smt_oneshot_query",
    "inspect_smt_oneshot_engine_output_structure",
    "resolve_smt_oneshot_semantic_profile",
    "validate_smt_oneshot_engine_output",
]
