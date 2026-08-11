from __future__ import annotations

import hashlib
import json
from collections.abc import Callable
from pathlib import Path
from typing import Any
from urllib.parse import urlsplit

import pytest

from census.p97_search import phase3_piqd_incremental_discovery as incremental
from census.p97_search import phase3_piqd_projected_v3_provisioning as provisioning
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search.phase3_cegar_wave import canonical_json_bytes
from census.p97_search.phase3_piqd_oracle import HttpResponse, PreparedJob

JOB_ID = "12345678-1234-4234-8234-123456789abc"
SESSION_ID = "abcdefab-1234-4234-8234-abcdefabcdef"
SOLVER = "piqd-satworker-cadical-3.0.0"
SOLVER_HASH = qualification.PRODUCTION_SOLVER_SHA256
SIGNATURE = "cadical-3.0.0"
BASE = b"p cnf 2 1\n1 2 0\n"
CURRENT = b"p cnf 2 2\n1 2 0\n-2 0\n"
TERMINAL = b"p cnf 2 3\n1 2 0\n-2 0\n2 0\n"
MODEL = [1, -2]
SOLVER_STATS = {
    "vars": 2,
    "active": 2,
    "irredundant": 3,
    "clauses_added": 2,
    "solves": 1,
    "solve_ms_total": 7,
}
JOB_PROGRESS = {
    "backend": "cadical",
    "last_line": "s SATISFIABLE",
    "cubes_total": None,
    "cubes_done": None,
    "cubes_sat": None,
    "cubes_unsat": None,
    "cubes_unknown": None,
    "decisions": 1,
    "conflicts": 0,
    "restarts": 0,
    "elapsed_s": 0,
    "solver_version": None,
    "solver_started": True,
    "spawn_failure": None,
}


@pytest.fixture(scope="module")
def current_bundle() -> provisioning.CurrentUnshardedBundle:
    return provisioning.build_current_unsharded_projected_v3_bundle()


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _private(path: Path, data: bytes) -> None:
    path.write_bytes(data)
    path.chmod(0o600)


def _manifests(
    source: bytes, *, source_path: str = "src/fixture.py"
) -> tuple[bytes, bytes]:
    source_value = {
        "schema": static.SOURCE_SCHEMA,
        "source_id": "fixture-source",
        "source_path": source_path,
        "source_sha256": _sha(source),
        "finite_schema": "projected-v3-test/v1",
        "cardinality_scope": "one exact finite CNF",
        "source_theorem": "Problem97.fixture",
        "claims": {
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
            "lean_closure": False,
        },
    }
    source_raw = canonical_json_bytes(source_value)
    producer = {
        "schema": static.PRODUCER_SCHEMA,
        "producer_id": "fixture-producer",
        "producer_kind": "static-dimacs",
        "source_manifest": source_value,
        "source_manifest_sha256": _sha(source_raw),
        "variable_map_sha256": "2" * 64,
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        "claims": {**source_value["claims"], "one_process": False, "one_core": False},
    }
    return source_raw, canonical_json_bytes(producer)


def _job(
    *,
    core: int = 1,
    status: str = "completed",
    overrides: dict[str, Any] | None = None,
) -> bytes:
    value = {
        "id": JOB_ID,
        "status": status,
        "result": "SAT" if status == "completed" else None,
        "backend": "cadical",
        "project": "fixture",
        "timeout_s": 900,
        "march_timeout_s": 900,
        "wall_ms": 10,
        "wall_human": "10ms",
        "running_for_s": None,
        "created_at": 1,
        "confirmed_at": 2,
        "started_at": 3,
        "completed_at": 4,
        "model_blob_hash": None,
        "requested_core_limit": core,
        "attested_solver_processes": 1,
        "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
    }
    value.update(overrides or {})
    return canonical_json_bytes(value)


def _prepared_job(
    *,
    blob: str | None = None,
    identity: str = "4" * 64,
    existing: bool = False,
    core: int = 1,
) -> PreparedJob:
    return PreparedJob(
        JOB_ID,
        "cadical",
        "sat",
        blob or _sha(BASE),
        identity,
        2,
        1,
        existing,
        core,
    )


def _registry(
    *, solver_hash: str = SOLVER_HASH, daemon_sha256: str | None = None
) -> bytes:
    daemon: dict[str, Any] = {
        "name": "piqd",
        "version": "test",
        "protocol_version": 1,
    }
    if daemon_sha256 is not None:
        daemon["sha256"] = daemon_sha256
    return canonical_json_bytes(
        {
            "daemon": daemon,
            "solver_dir": "/sealed/solvers",
            "solvers": [
                {
                    "name": SOLVER,
                    "lane": "sat",
                    "sha256": solver_hash,
                    "solver": "cadical",
                    "solver_signature": SIGNATURE,
                    "usable": True,
                }
            ],
        }
    )


def _version(*, daemon_sha256: str = "3" * 64, version: str = "test") -> bytes:
    return canonical_json_bytes(
        {
            "daemon": {
                "name": "piqd",
                "version": version,
                "protocol_version": 1,
                "sha256": daemon_sha256,
            },
            "limits": {"max_var": 1_000_000},
        }
    )


def _session(
    *,
    state: str,
    solves: int = 0,
    solver_stats: dict[str, Any] | None = None,
) -> bytes:
    value = {
        "id": SESSION_ID,
        "lane": "sat",
        "state": state,
        "solver_name": SOLVER,
        "solver_sha256": SOLVER_HASH,
        "solver_signature": SIGNATURE,
        "protocol_version": 1,
        "journal_path": "/sealed/journal",
        "created_at": 1,
        "updated_at": 2,
        "clauses": 3 if state == "closed" else 1,
        "max_var": 2,
        "solves": solves,
        "last_status": "UNSAT" if solves == 2 else None,
        "declared_num_vars": 2,
        "last_solve_index": solves if solves else None,
        "last_assumption_free": True if solves else None,
        "last_terminal_unsat": True if solves == 2 else None,
        "label": "qualification-test",
    }
    if solver_stats is not None:
        value["solver_stats"] = solver_stats
    return canonical_json_bytes(value)


def _raw_solve(
    index: int,
    *,
    model: list[int] | None = None,
    core: list[int] | None = None,
    terminal_unsat: bool = True,
) -> bytes:
    if index == 1:
        actual_model = MODEL if model is None else model
        return canonical_json_bytes(
            {
                "status": "SAT",
                "solve_ms": 1,
                "solve_index": 1,
                "result_sha256": incremental._result_digest(
                    "SAT", None, None, actual_model
                ),
                "model": actual_model,
            }
        )
    actual_core = [] if core is None else core
    return canonical_json_bytes(
        {
            "status": "UNSAT",
            "solve_ms": 2,
            "solve_index": 2,
            "result_sha256": incremental._result_digest(
                "UNSAT", None, actual_core, None
            ),
            "core": actual_core,
            "terminal_unsat": terminal_unsat,
        }
    )


class FakeTransport:
    def __init__(
        self,
        *,
        job: bytes | None = None,
        blob: bytes = BASE,
        registry: bytes | None = None,
        version_pre: bytes | None = None,
        version_post: bytes | None = None,
        solve1: bytes | None = None,
        solve2: bytes | None = None,
        create: bytes | None = None,
        close: bytes | None = None,
        blob_status: int = 200,
        status_overrides: dict[str, int] | None = None,
        response_overrides: dict[tuple[str, str], Any] | None = None,
    ) -> None:
        self.job = job or _job()
        self.blob = blob
        self.registry = registry or _registry()
        self.version_pre = version_pre or _version()
        self.version_post = version_post or self.version_pre
        self.solve1 = solve1 or _raw_solve(1)
        self.solve2 = solve2 or _raw_solve(2)
        self.create = create or _session(state="live")
        self.close = close or _session(state="closed", solves=2)
        self.blob_status = blob_status
        self.status_overrides = status_overrides or {}
        self.response_overrides = response_overrides or {}
        self.session_label: str | None = None
        self.version_calls = 0
        self.solve_calls = 0
        self.calls: list[tuple[str, str]] = []
        self.lose_delete_once = False

    def _status(self, endpoint: str, default: int) -> int:
        return self.status_overrides.get(endpoint, default)

    def _bound_session(self, raw: bytes) -> bytes:
        if self.session_label is None:
            return raw
        value = json.loads(raw)
        value["label"] = self.session_label
        return canonical_json_bytes(value)

    def __call__(
        self, method: str, path: str, _body: Any, _headers: Any
    ) -> HttpResponse:
        self.calls.append((method, path))
        parsed = urlsplit(path)
        route = parsed.path if parsed.scheme or parsed.netloc else path
        if (method, path) in self.response_overrides:
            return self.response_overrides[(method, path)]
        if (method, route) in self.response_overrides:
            return self.response_overrides[(method, route)]
        if route == "/version":
            self.version_calls += 1
            body = self.version_pre if self.version_calls == 1 else self.version_post
            return HttpResponse(self._status("version", 200), body, {})
        if route == f"/jobs/{JOB_ID}":
            return HttpResponse(self._status("job", 200), self.job, {})
        if route == f"/jobs/{JOB_ID}/cnf":
            return HttpResponse(self._status("blob", self.blob_status), self.blob, {})
        if route == "/solvers":
            return HttpResponse(self._status("solvers", 200), self.registry, {})
        if method == "POST" and route.endswith("/sessions"):
            return HttpResponse(
                self._status("create", 201), self._bound_session(self.create), {}
            )
        if method == "POST" and route.endswith("/clauses"):
            return HttpResponse(self._status("append", 200), b"{}", {})
        if method == "POST" and route.endswith("/solve"):
            self.solve_calls += 1
            return HttpResponse(
                self._status("solve", 200),
                self.solve1 if self.solve_calls == 1 else self.solve2,
                {},
            )
        if method == "DELETE" and route.endswith(SESSION_ID):
            if self.lose_delete_once:
                self.lose_delete_once = False
                raise OSError("lost close response")
            return HttpResponse(
                self._status("close", 200), self._bound_session(self.close), {}
            )
        if method == "GET" and route.endswith(SESSION_ID):
            return HttpResponse(
                self._status("session", 200), self._bound_session(self.close), {}
            )
        raise AssertionError((method, path))


class StrictAbsoluteTransport(FakeTransport):
    """Production-v3 fake that models stdlib's absolute-URL requirement."""

    def __call__(self, method: str, path: str, body: Any, headers: Any) -> HttpResponse:
        parsed = urlsplit(path)
        if (
            parsed.scheme not in {"http", "https"}
            or parsed.netloc != "piqd.test"
            or not parsed.path.startswith("/")
        ):
            raise AssertionError(f"strict fake rejected non-absolute URL: {path!r}")
        return super().__call__(method, path, body, headers)


def _event(payload: dict[str, Any], sequence: int, prior: str | None) -> dict[str, Any]:
    value = {
        "schema": incremental.SCHEMA,
        "sequence": sequence,
        "prior_event_sha256": prior,
        "session_id": SESSION_ID,
        "producer_job_id": JOB_ID,
        "learned_state": "not_claimed",
        **payload,
    }
    value["event_sha256"] = _sha(canonical_json_bytes(value))
    return value


def _receipt(
    status: str,
    index: int,
    frontier: list[tuple[int, ...]],
    result_sha256: str,
    *,
    stale: bool = False,
) -> dict[str, Any]:
    prefix = incremental._journal_bytes(frontier)
    value: dict[str, Any] = {
        "solve_index": index,
        "base_clauses": len(frontier),
        "base_bytes": len(prefix),
        "base_sha256": "0" * 64 if stale else _sha(prefix),
        "assumptions": [],
        "status": status,
        "model_recorded": status == "SAT",
        "result_sha256": result_sha256,
        "at": index,
    }
    if status == "UNSAT":
        value["core"] = []
    return value


def _write_result(
    directory: Path,
    *,
    model: list[int] | None = None,
    stale_receipt: bool = False,
    canary: tuple[int, ...] = (2,),
    swapped_appends: bool = False,
) -> None:
    preflight_path = directory / qualification.PREFLIGHT_NAME
    if not preflight_path.exists():
        preflight_path = directory / qualification.PRODUCTION_V2_PREFLIGHT_NAME
    preflight = json.loads(preflight_path.read_bytes())
    descriptor_root = preflight["descriptor_root"]
    base = [(1, 2)]
    current = [*base, (-2,)]
    terminal = [*current, canary]
    sat_model = MODEL if model is None else model
    raw1 = json.loads(_raw_solve(1, model=sat_model))
    raw2 = json.loads(_raw_solve(2))
    events: list[dict[str, Any]] = []

    def add(payload: dict[str, Any]) -> None:
        events.append(
            _event(
                {"descriptor_root": descriptor_root, **payload},
                len(events),
                events[-1]["event_sha256"] if events else None,
            )
        )

    add(
        {
            "event": "open",
            "seed_blob_hash": _sha(BASE),
            "seed_sha256": _sha(BASE),
            "frontier_count": 1,
            "frontier_sha256": incremental._frontier_hash(2, base),
        }
    )
    first_addition = [list(canary)] if swapped_appends else [[-2]]
    first_frontier = [*base, *(tuple(item) for item in first_addition)]
    add(
        {
            "event": "append",
            "clauses": first_addition,
            "prior_frontier_sha256": incremental._frontier_hash(2, base),
            "frontier_count": len(first_frontier),
            "frontier_sha256": incremental._frontier_hash(2, first_frontier),
        }
    )
    add(
        {
            "event": "solve",
            "status": "SAT",
            "solve_index": 1,
            "result_sha256": raw1["result_sha256"],
            "receipt": _receipt(
                "SAT",
                1,
                current,
                raw1["result_sha256"],
                stale=stale_receipt,
            ),
            "model": sat_model,
            "frontier_count": len(first_frontier),
            "frontier_sha256": incremental._frontier_hash(2, first_frontier),
            "proof_verified": False,
            "closure_claim": False,
        }
    )
    second_addition = [[-2]] if swapped_appends else [list(canary)]
    second_frontier = [*first_frontier, *(tuple(item) for item in second_addition)]
    add(
        {
            "event": "append",
            "clauses": second_addition,
            "prior_frontier_sha256": incremental._frontier_hash(2, first_frontier),
            "frontier_count": len(second_frontier),
            "frontier_sha256": incremental._frontier_hash(2, second_frontier),
        }
    )
    add(
        {
            "event": "solve",
            "status": "UNSAT",
            "solve_index": 2,
            "result_sha256": raw2["result_sha256"],
            "receipt": _receipt("UNSAT", 2, terminal, raw2["result_sha256"]),
            "model": None,
            "frontier_count": len(second_frontier),
            "frontier_sha256": incremental._frontier_hash(2, second_frontier),
            "proof_verified": False,
            "closure_claim": False,
        }
    )
    _private(
        directory / qualification.JOURNAL_NAME,
        b"".join(canonical_json_bytes(event) + b"\n" for event in events),
    )
    _private(directory / ".solver.cnf", TERMINAL)


def _production_authority(
    tmp_path: Path,
    *,
    source_raw: bytes,
    producer_raw: bytes,
    version_raw: bytes,
    base: bytes = BASE,
) -> qualification.ProductionAuthorityV2:
    tmp_path.mkdir(parents=True, exist_ok=True)
    producer_hash = _sha(producer_raw)
    base_hash = _sha(base)
    value = {
        "schema": qualification.PRODUCTION_V2_AUTHORITY_SCHEMA,
        "daemon_url": "http://piqd.test",
        "daemon_version_pre_sha256": _sha(version_raw),
        "source_manifest_sha256": _sha(source_raw),
        "producer_manifest_sha256": producer_hash,
        "base_cnf_sha256": base_hash,
        "raw_dimacs_identity": qualification.raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=base_hash,
            producer_manifest_sha256=producer_hash,
            requested_core_limit=1,
        ),
        "producer_job_id": JOB_ID,
        "solver": {
            "name": SOLVER,
            "sha256": SOLVER_HASH,
            "signature": SIGNATURE,
            "backend": "cadical",
            "lane": "sat",
        },
        "policy": dict(qualification.PRODUCTION_V2_POLICY),
    }
    value["authority_sha256"] = _sha(canonical_json_bytes(value))
    path = tmp_path / "production-authority-v2.input.json"
    path.write_bytes(canonical_json_bytes(value))
    return qualification.load_production_authority_v2(path)


def _production_authority_v3(
    tmp_path: Path,
    *,
    bundle: provisioning.CurrentUnshardedBundle,
    version_raw: bytes,
    prepared_existing: bool = True,
) -> qualification.ProductionAuthorityV3:
    tmp_path.mkdir(parents=True, exist_ok=True)
    value = {
        "schema": qualification.PRODUCTION_V3_AUTHORITY_SCHEMA,
        "base_scope": qualification.PRODUCTION_V3_BASE_SCOPE,
        "builder_base_scope": qualification.PRODUCTION_V3_BUILDER_BASE_SCOPE,
        "profile": qualification.PRODUCTION_V3_PROFILE,
        "num_variables": qualification.PRODUCTION_V3_VARIABLES,
        "num_clauses": qualification.PRODUCTION_V3_BASE_CLAUSES,
        "base_cnf_sha256": qualification.PRODUCTION_V3_BASE_SHA256,
        "variable_map_sha256": qualification.PRODUCTION_V3_VARIABLE_MAP_SHA256,
        "variable_map_bytes": qualification.PRODUCTION_V3_VARIABLE_MAP_BYTES,
        "source_bundle_sha256": bundle.source_bundle_sha256,
        "source_bundle_bytes": len(bundle.source_bundle),
        "encoding_configuration_sha256": (
            qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_SHA256
        ),
        "encoding_configuration_bytes": (
            qualification.PRODUCTION_V3_ENCODING_CONFIGURATION_BYTES
        ),
        "source_manifest_sha256": bundle.source_manifest_sha256,
        "source_manifest_bytes": len(bundle.source_manifest),
        "producer_manifest_sha256": bundle.producer_manifest_sha256,
        "producer_manifest_bytes": len(bundle.producer_manifest),
        "shard_index": None,
        "shard_count": None,
        "shard_literals": None,
        "daemon_url": "http://piqd.test",
        "daemon_version_pre_sha256": _sha(version_raw),
        "raw_dimacs_identity": bundle.raw_dimacs_identity,
        "producer_job_id": JOB_ID,
        "producer_job_requested_core_limit": 1,
        "producer_prepare_preview": bundle.base_cnf[
            : qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
        ].decode("utf-8", errors="replace"),
        "prepared_existing": prepared_existing,
        "solver": {
            "name": SOLVER,
            "sha256": SOLVER_HASH,
            "signature": SIGNATURE,
            "backend": "cadical",
            "lane": "sat",
        },
        "policy": dict(qualification.PRODUCTION_V3_POLICY),
        "claims": dict(qualification.PRODUCTION_V3_CLAIMS),
    }
    value["authority_sha256"] = _sha(canonical_json_bytes(value))
    path = tmp_path / "production-authority-v3.input.json"
    path.write_bytes(canonical_json_bytes(value))
    return qualification.load_production_authority_v3(path)


def _resign_authority(path: Path, mutate: Callable[[dict[str, Any]], None]) -> None:
    value = json.loads(path.read_bytes())
    mutate(value)
    value.pop("authority_sha256")
    value["authority_sha256"] = _sha(canonical_json_bytes(value))
    path.write_bytes(canonical_json_bytes(value))


def _production_session(
    *, variables: int, clauses: int, solves: int, state: str
) -> bytes:
    value = json.loads(_session(state=state, solves=solves))
    value["clauses"] = clauses
    value["max_var"] = variables
    value["declared_num_vars"] = variables
    if solves == 1:
        value["last_status"] = "UNSAT"
        value["last_solve_index"] = 1
        value["last_assumption_free"] = True
        value["last_terminal_unsat"] = True
    return canonical_json_bytes(value)


def _prepare_v3(
    tmp_path: Path,
    *,
    bundle: provisioning.CurrentUnshardedBundle,
    transport: FakeTransport | None = None,
    daemon_url: str = "http://piqd.test",
) -> tuple[qualification.ProductionQualificationV3, FakeTransport]:
    tmp_path.mkdir(parents=True, exist_ok=True)
    version_raw = _version()
    authority = _production_authority_v3(
        tmp_path, bundle=bundle, version_raw=version_raw
    )
    root = tmp_path / "out"
    root.mkdir(mode=0o700)
    source_path = tmp_path / "source-manifest-v3.input.json"
    producer_path = tmp_path / "producer-manifest-v3.input.json"
    source_path.write_bytes(bundle.source_manifest)
    producer_path.write_bytes(bundle.producer_manifest)
    _private(root / "base.cnf", bundle.base_cnf)
    _private(root / ".solver.cnf", bundle.base_cnf)
    descriptor = incremental.DiscoveryDescriptor(
        seed_cnf=bundle.base_cnf,
        producer_manifest=bundle.producer_manifest,
        source_manifest=bundle.source_manifest,
        solver_name=SOLVER,
        producer_job_id=JOB_ID,
    )
    job = _job(
        overrides={
            "cnf_blob_hash": bundle.base_cnf_sha256,
            "identity_hash": bundle.raw_dimacs_identity,
            "producer_manifest_hash": bundle.producer_manifest_sha256,
        }
    )
    fake = transport or StrictAbsoluteTransport(
        job=job,
        blob=bundle.base_cnf,
        registry=_registry(daemon_sha256="3" * 64),
        version_pre=version_raw,
        create=_production_session(
            variables=bundle.num_variables,
            clauses=bundle.num_clauses,
            solves=0,
            state="live",
        ),
        close=_production_session(
            variables=bundle.num_variables,
            clauses=bundle.num_clauses + 2,
            solves=1,
            state="closed",
        ),
        solve1=canonical_json_bytes(
            {
                "status": "UNSAT",
                "solve_ms": 1,
                "solve_index": 1,
                "result_sha256": incremental._result_digest("UNSAT", None, [], None),
                "replayed": False,
                "timeout_ms": 3_000,
                "core": [],
                "terminal_unsat": True,
            }
        ),
    )
    blob_path = f"/jobs/{JOB_ID}/blobs/{bundle.base_cnf_sha256}"
    fake.response_overrides[("GET", blob_path)] = HttpResponse(200, bundle.base_cnf, {})
    contract = qualification.prepare_production_qualification_v3(
        authority=authority,
        output_dir=root,
        base_cnf_path=root / "base.cnf",
        runtime_cnf_path=root / ".solver.cnf",
        source_manifest_path=source_path,
        producer_manifest_path=producer_path,
        source_manifest=bundle.source_manifest,
        producer_manifest=bundle.producer_manifest,
        daemon_url=daemon_url,
        producer_job_id=JOB_ID,
        solver_name=SOLVER,
        descriptor=descriptor,
        transport=fake,
    )
    fake.session_label = contract.transport.expected_label
    return contract, fake


def _prepare_v2(
    tmp_path: Path,
    *,
    transport: FakeTransport | None = None,
) -> tuple[qualification.ProductionQualificationV2, FakeTransport]:
    tmp_path.mkdir(parents=True, exist_ok=True)
    source_raw, producer_raw = _manifests(b"# v2 fixture\n")
    version_raw = _version()
    authority = _production_authority(
        tmp_path,
        source_raw=source_raw,
        producer_raw=producer_raw,
        version_raw=version_raw,
    )
    root = tmp_path / "out"
    root.mkdir(mode=0o700)
    source_path = tmp_path / "source-manifest-v2.input.json"
    producer_path = tmp_path / "producer-manifest-v2.input.json"
    source_path.write_bytes(source_raw)
    producer_path.write_bytes(producer_raw)
    _private(root / "base.cnf", BASE)
    _private(root / ".solver.cnf", CURRENT)
    descriptor = incremental.DiscoveryDescriptor(
        seed_cnf=BASE,
        producer_manifest=producer_raw,
        source_manifest=source_raw,
        solver_name=SOLVER,
        producer_job_id=JOB_ID,
    )
    fake = transport or FakeTransport(version_pre=version_raw)
    fake.response_overrides[("GET", f"/jobs/{JOB_ID}/blobs/{_sha(BASE)}")] = (
        HttpResponse(200, BASE, {})
    )
    contract = qualification.prepare_production_qualification_v2(
        authority=authority,
        output_dir=root,
        base_cnf_path=root / "base.cnf",
        runtime_cnf_path=root / ".solver.cnf",
        source_manifest_path=source_path,
        producer_manifest_path=producer_path,
        source_manifest=source_raw,
        producer_manifest=producer_raw,
        daemon_url="http://piqd.test",
        producer_job_id=JOB_ID,
        solver_name=SOLVER,
        descriptor=descriptor,
        transport=fake,
    )
    fake.session_label = contract.transport.expected_label
    return contract, fake


def _complete_v2(
    contract: qualification.ProductionQualificationV2,
    *,
    driver_status: str = "STRUCTURAL_UNSAT_VERIFIED",
    tamper_runtime: bool = False,
    tamper_custody: Callable[[qualification.ProductionQualificationV2], None]
    | None = None,
) -> dict[str, Any] | None:
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    transport(
        "POST",
        f"http://piqd.test/sessions/{SESSION_ID}/clauses",
        canonical_json_bytes({"clauses": [[-2]]}),
        {},
    )
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    transport(
        "POST",
        f"http://piqd.test/sessions/{SESSION_ID}/clauses",
        canonical_json_bytes({"clauses": [[2]]}),
        {},
    )
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    _write_result(contract.directory)
    if tamper_runtime:
        _private(contract.runtime_cnf_path, BASE)
    transport("DELETE", f"http://piqd.test/sessions/{SESSION_ID}", None, {})
    if tamper_custody is not None:
        tamper_custody(contract)
    return qualification.finalize_production_qualification_v2(
        contract, driver_status=driver_status
    )


def _complete_v3(
    contract: qualification.ProductionQualificationV3,
    *,
    driver_status: str = "STRUCTURAL_UNSAT_VERIFIED",
    receipt_timeout_ms: int = 3_000,
) -> dict[str, Any] | None:
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    additions = [(1,), (-1,)]
    transport(
        "POST",
        f"http://piqd.test/sessions/{SESSION_ID}/clauses",
        canonical_json_bytes({"clauses": [list(item) for item in additions]}),
        {},
    )
    solve_raw = transport(
        "POST",
        f"http://piqd.test/sessions/{SESSION_ID}/solve",
        canonical_json_bytes(
            {"assumptions": [], "include_model": True, "timeout_ms": 3_000}
        ),
        {},
    ).body
    solve = json.loads(solve_raw)
    variables, base = incremental.parse_dimacs(contract.descriptor.seed_cnf)
    frontier = [*base, *additions]
    descriptor_root = contract.descriptor.descriptor_root
    events: list[dict[str, Any]] = []

    def add(payload: dict[str, Any]) -> None:
        events.append(
            _event(
                {"descriptor_root": descriptor_root, **payload},
                len(events),
                events[-1]["event_sha256"] if events else None,
            )
        )

    add(
        {
            "event": "open",
            "seed_blob_hash": contract.descriptor.seed_blob_hash,
            "seed_sha256": contract.descriptor.seed_sha256,
            "frontier_count": len(base),
            "frontier_sha256": incremental._frontier_hash(variables, list(base)),
        }
    )
    add(
        {
            "event": "append",
            "clauses": [list(item) for item in additions],
            "prior_frontier_sha256": incremental._frontier_hash(variables, list(base)),
            "frontier_count": len(frontier),
            "frontier_sha256": incremental._frontier_hash(variables, frontier),
        }
    )
    add(
        {
            "event": "solve",
            "status": "UNSAT",
            "solve_index": 1,
            "result_sha256": solve["result_sha256"],
            "receipt": {
                **_receipt("UNSAT", 1, frontier, solve["result_sha256"]),
                "timeout_ms": receipt_timeout_ms,
            },
            "model": None,
            "frontier_count": len(frontier),
            "frontier_sha256": incremental._frontier_hash(variables, frontier),
            "proof_verified": False,
            "closure_claim": False,
        }
    )
    _private(
        contract.directory / qualification.JOURNAL_NAME,
        b"".join(canonical_json_bytes(event) + b"\n" for event in events),
    )
    _private(
        contract.runtime_cnf_path,
        qualification._render_dimacs(variables, tuple(frontier)),
    )
    transport("DELETE", f"http://piqd.test/sessions/{SESSION_ID}", None, {})
    return qualification.finalize_production_qualification_v3(
        contract, driver_status=driver_status
    )


def _prepare(
    tmp_path: Path,
    *,
    transport: FakeTransport | None = None,
    current: bytes = CURRENT,
    prepared_job: PreparedJob | None = None,
) -> tuple[qualification.QualificationContract, FakeTransport]:
    repository = tmp_path / "repo"
    source_path = repository / "src" / "fixture.py"
    source_path.parent.mkdir(parents=True)
    source = b"# exact projected-v3 source\n"
    source_path.write_bytes(source)
    source_raw, producer_raw = _manifests(source)
    base_path = tmp_path / "base.cnf"
    current_path = tmp_path / ".solver.cnf"
    _private(base_path, BASE)
    _private(current_path, current)
    fake = transport or FakeTransport()
    contract = qualification.prepare_test_qualification(
        repository_root=repository,
        output_dir=tmp_path / "qualification",
        source_manifest=source_raw,
        producer_manifest=producer_raw,
        base_cnf_path=base_path,
        current_cnf_path=current_path,
        producer_job=prepared_job or _prepared_job(),
        solver_name=SOLVER,
        daemon_url="http://piqd.test",
        canary_clause=(2,),
        transport=fake,
    )
    preflight = json.loads(
        (contract.directory / qualification.PREFLIGHT_NAME).read_bytes()
    )
    fake.session_label = f"{incremental.SCHEMA}:{preflight['descriptor_root']}"
    return contract, fake


def _complete(
    contract: qualification.QualificationContract,
    *,
    model: list[int] | None = None,
    stale_receipt: bool = False,
    swapped_appends: bool = False,
    close_by_get: bool = False,
) -> dict[str, Any]:
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    _write_result(
        contract.directory,
        model=model,
        stale_receipt=stale_receipt,
        swapped_appends=swapped_appends,
    )
    method = "GET" if close_by_get else "DELETE"
    transport(method, f"http://piqd.test/sessions/{SESSION_ID}", None, {})
    return qualification.finalize_qualification(contract)


def _replace_json(path: Path, mutate: Any) -> None:
    value = json.loads(path.read_bytes())
    mutate(value)
    _private(path, canonical_json_bytes(value))


def test_canonical_two_phase_packet_and_false_claim_boundary(tmp_path: Path) -> None:
    contract, fake = _prepare(tmp_path)
    assert not (contract.directory / qualification.QUALIFICATION_NAME).exists()
    assert fake.calls[0] == ("GET", "/version")
    assert ("GET", f"/jobs/{JOB_ID}/cnf") in fake.calls
    status = json.loads((contract.directory / "producer-job.json").read_bytes())
    assert "cnf_blob_hash" not in status and "identity_hash" not in status
    prepared = json.loads((contract.directory / "producer-prepare.json").read_bytes())
    assert prepared["cnf_blob_hash"] == _sha(BASE)
    assert prepared["identity_hash"] == "4" * 64
    with pytest.raises(qualification.QualificationError, match="confirmed close"):
        qualification.finalize_qualification(contract)
    packet = _complete(contract)
    assert packet["schema"] == qualification.TEST_SCHEMA
    assert packet["profile"]["repository_commit"] is None
    assert packet["terminal_frontier"]["appended_clause"] == [2]
    assert packet["solver_stats_contract"] == {
        "attribution": "pinned-piqd-satworker-binary",
        "fields": sorted(qualification.PINNED_WORKER_SOLVER_STATS_KEYS),
        "presence_required": False,
        "worker_name": qualification.PRODUCTION_SOLVER_NAME,
        "worker_pin_matches_session": True,
        "worker_sha256": qualification.PRODUCTION_SOLVER_SHA256,
        "worker_signature": qualification.PRODUCTION_SOLVER_SIGNATURE,
    }
    assert packet["claims"] == {
        "piqd_proof_verified": False,
        "piqd_closure": False,
        "global_obstruction": False,
        "theorem_coverage": False,
        "universal_lift": False,
        "lean_closure": False,
    }
    assert fake.calls[-1] == ("GET", "/version")
    result = qualification.validate_test_qualification(contract.directory)
    assert result["statuses"] == ["SAT", "UNSAT"]
    assert result["terminal_unsat"] is True
    assert result["proof_verified"] is False
    with pytest.raises(qualification.QualificationError, match="artifact set"):
        qualification.validate_qualification(contract.directory)


def test_production_schema_rejects_generic_fixture_even_at_pinned_commit(
    tmp_path: Path,
) -> None:
    repository = tmp_path / "repo"
    source_path = repository / "src" / "fixture.py"
    source_path.parent.mkdir(parents=True)
    source = b"source\n"
    source_path.write_bytes(source)
    source_raw, producer_raw = _manifests(source)
    base = tmp_path / "base.cnf"
    current = tmp_path / ".solver.cnf"
    _private(base, BASE)
    _private(current, CURRENT)
    wrong_solver_transport = FakeTransport()
    with pytest.raises(qualification.QualificationError, match="solver name pin"):
        qualification.prepare_qualification(
            repository_root=repository,
            repository_commit=qualification.PRODUCTION_REPOSITORY_COMMIT,
            output_dir=tmp_path / "wrong-solver",
            source_manifest=source_raw,
            producer_manifest=producer_raw,
            expected_source_manifest_sha256=_sha(source_raw),
            expected_producer_manifest_sha256=_sha(producer_raw),
            base_cnf_path=base,
            current_cnf_path=current,
            producer_job=_prepared_job(),
            solver_name="another-worker",
            daemon_url="http://piqd.test",
            transport=wrong_solver_transport,
        )
    assert wrong_solver_transport.calls == []
    with pytest.raises(
        qualification.QualificationError, match="three-file source bundle"
    ):
        qualification.prepare_qualification(
            repository_root=repository,
            repository_commit=qualification.PRODUCTION_REPOSITORY_COMMIT,
            output_dir=tmp_path / "out",
            source_manifest=source_raw,
            producer_manifest=producer_raw,
            expected_source_manifest_sha256=_sha(source_raw),
            expected_producer_manifest_sha256=_sha(producer_raw),
            base_cnf_path=base,
            current_cnf_path=current,
            producer_job=_prepared_job(),
            solver_name=SOLVER,
            daemon_url="http://piqd.test",
            transport=FakeTransport(),
        )
    assert not (tmp_path / "out" / qualification.QUALIFICATION_NAME).exists()


def test_production_constants_and_three_file_bundle_are_exact(tmp_path: Path) -> None:
    assert qualification.PRODUCTION_REPOSITORY_COMMIT == (
        "942ba5770a847b9b253916191c9f1bfb3c8946c2"
    )
    assert qualification.PRODUCTION_SOURCE_MANIFEST_SHA256 == (
        "986e1204d820061c5173604ec5ced25beed6a3e94ea69935283ee8a1e9ba8628"
    )
    assert qualification.PRODUCTION_PRODUCER_MANIFEST_SHA256 == (
        "74ddf30ef786b9102b34fda4ecf6ed48ea1334ce877a063f54dfaa238197cded"
    )
    assert qualification.PRODUCTION_VARIABLE_MAP_SHA256 == (
        "e5f7801c91152dd27a201c7014ae801b8036551e770092ae9419f03321c81802"
    )
    assert qualification.PRODUCTION_RAW_DIMACS_IDENTITY == (
        "62faf51e4d6b4c926bb0e21675245d51788809f663a6e50395fcb2f94fcce8cf"
    )
    assert qualification.PRODUCTION_SOLVER_NAME == SOLVER
    assert qualification.PRODUCTION_SOLVER_SHA256 == (
        "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
    )
    assert qualification.PRODUCTION_SOLVER_SIGNATURE == SIGNATURE
    assert qualification.PRODUCTION_SOLVER_BACKEND == "cadical"
    assert qualification.PRODUCTION_SOLVER_LANE == "sat"
    expected = {
        "census/p97_search/phase3_structural_cegar_projected_static_v3.py": (
            "historical-source-projector.py",
            "a57d2c9b2f45617a068d231cf300c49c36b623908836c05e1f9dffcc7f616e08",
        ),
        "census/p97_search/phase3_three_rhombus_prefix_bank.py": (
            "historical-source-prefix-bank.py",
            "6626aaad7b03bc7ac2336fbe313b0578bd248a3d8a25475330b44496359320f9",
        ),
        "census/p97_search/sat_generate.py": (
            "historical-source-sat-generate.py",
            "5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817",
        ),
    }
    assert dict(qualification.PRODUCTION_SOURCE_BUNDLE) == expected

    bundle_paths: dict[str, Path] = {}
    for index, declared_path in enumerate(expected):
        path = tmp_path / f"historical-{index}.py"
        path.write_bytes(f"fixture {index}\n".encode())
        bundle_paths[declared_path] = path
    source_raw, producer_raw = _manifests(
        bundle_paths[next(iter(expected))].read_bytes(),
        source_path=next(iter(expected)),
    )
    base = tmp_path / "base.cnf"
    current = tmp_path / ".solver.cnf"
    _private(base, BASE)
    _private(current, CURRENT)
    with pytest.raises(qualification.QualificationError, match="bundle hash"):
        qualification.prepare_qualification(
            repository_root=tmp_path,
            repository_commit=qualification.PRODUCTION_REPOSITORY_COMMIT,
            output_dir=tmp_path / "out",
            source_manifest=source_raw,
            producer_manifest=producer_raw,
            expected_source_manifest_sha256=qualification.PRODUCTION_SOURCE_MANIFEST_SHA256,
            expected_producer_manifest_sha256=(
                qualification.PRODUCTION_PRODUCER_MANIFEST_SHA256
            ),
            historical_source_paths=bundle_paths,
            base_cnf_path=base,
            current_cnf_path=current,
            producer_job=_prepared_job(),
            solver_name=SOLVER,
            daemon_url="http://piqd.test",
            transport=FakeTransport(),
        )


@pytest.mark.parametrize(
    ("target", "field", "value"),
    [
        ("selected", "name", "crossed-worker"),
        ("selected", "sha256", "f" * 64),
        ("selected", "solver_signature", "cadical-drift"),
        ("selected", "solver", "z3"),
        ("selected", "lane", "smt"),
        ("producer", "backend", "z3"),
        ("producer", "solver_profile", "plain"),
        ("job", "backend", "z3"),
    ],
)
def test_production_solver_contract_is_exact_and_cross_bound(
    target: str, field: str, value: str
) -> None:
    producer: dict[str, Any] = {"backend": "cadical", "solver_profile": "sat"}
    job: dict[str, Any] = {"backend": "cadical"}
    selected: dict[str, Any] = {
        "name": qualification.PRODUCTION_SOLVER_NAME,
        "sha256": qualification.PRODUCTION_SOLVER_SHA256,
        "solver_signature": qualification.PRODUCTION_SOLVER_SIGNATURE,
        "solver": "cadical",
        "lane": "sat",
    }
    {"producer": producer, "job": job, "selected": selected}[target][field] = value
    solver_name = selected["name"]
    with pytest.raises(qualification.QualificationError, match="production solver"):
        qualification._production_solver_contract(
            producer=producer,
            job=job,
            selected=selected,
            solver_name=solver_name,
        )


def test_production_solver_contract_rejects_string_subclasses() -> None:
    class StringSubclass(str):
        pass

    with pytest.raises(qualification.QualificationError, match="builtin string"):
        qualification._production_solver_contract(
            producer={"backend": StringSubclass("cadical"), "solver_profile": "sat"},
            job={"backend": "cadical"},
            selected={
                "name": qualification.PRODUCTION_SOLVER_NAME,
                "sha256": qualification.PRODUCTION_SOLVER_SHA256,
                "solver_signature": qualification.PRODUCTION_SOLVER_SIGNATURE,
                "solver": "cadical",
                "lane": "sat",
            },
            solver_name=qualification.PRODUCTION_SOLVER_NAME,
        )


def test_nonprefix_job_blob_core_and_manifest_pins_fail_closed(tmp_path: Path) -> None:
    nonprefix = b"p cnf 2 3\n-1 2 0\n-2 0\n1 2 0\n"
    with pytest.raises(qualification.QualificationError, match="exact prefix"):
        _prepare(tmp_path / "prefix", current=nonprefix)
    with pytest.raises(qualification.QualificationError, match="job-scoped"):
        _prepare(tmp_path / "blob", transport=FakeTransport(blob=b"wrong\n"))
    with pytest.raises(
        qualification.QualificationError, match="evidence request failed"
    ):
        _prepare(
            tmp_path / "missing-blob",
            transport=FakeTransport(blob=b"missing\n", blob_status=404),
        )
    with pytest.raises(qualification.QualificationError, match="requested_core_limit"):
        _prepare(tmp_path / "core", transport=FakeTransport(job=_job(core=2)))
    reused, _ = _prepare(
        tmp_path / "existing",
        prepared_job=_prepared_job(existing=True),
    )
    reused_preflight = json.loads(
        (reused.directory / qualification.PREFLIGHT_NAME).read_bytes()
    )
    assert reused_preflight["producer"]["job_existing"] is True
    assert reused_preflight["producer"]["job_custody"] == "reused"
    with pytest.raises(qualification.QualificationError, match="prepare binding"):
        _prepare(
            tmp_path / "prepare-blob",
            prepared_job=_prepared_job(blob="5" * 64),
        )
    with pytest.raises(qualification.QualificationError, match="completed"):
        _prepare(
            tmp_path / "running",
            transport=FakeTransport(job=_job(status="running")),
        )


def test_exact_http_type_and_solver_identity_gate_precede_attribute_access(
    tmp_path: Path,
) -> None:
    class BadTransport(FakeTransport):
        def __call__(self, method: str, path: str, body: Any, headers: Any) -> Any:
            if path == "/version":
                return object()
            return super().__call__(method, path, body, headers)

    with pytest.raises(qualification.QualificationError, match="exact HttpResponse"):
        _prepare(tmp_path / "type", transport=BadTransport())
    drift = json.loads(_session(state="live"))
    drift["solver_signature"] = "drifted"
    contract, _ = _prepare(
        tmp_path / "identity",
        transport=FakeTransport(create=canonical_json_bytes(drift)),
    )
    with pytest.raises(qualification.QualificationError, match="identity drifted"):
        contract.transport("POST", "http://piqd.test/sessions", b"{}", {})


@pytest.mark.parametrize(
    ("endpoint", "status"),
    [
        ("version", 201),
        ("version", 302),
        ("job", 204),
        ("job", 307),
        ("blob", 206),
        ("blob", 301),
        ("solvers", 201),
        ("solvers", 308),
    ],
)
def test_preflight_rejects_redirects_and_wrong_success_statuses(
    tmp_path: Path, endpoint: str, status: int
) -> None:
    with pytest.raises(qualification.QualificationError, match="evidence request"):
        _prepare(
            tmp_path,
            transport=FakeTransport(status_overrides={endpoint: status}),
        )
    assert not (tmp_path / "qualification").exists()


@pytest.mark.parametrize(
    ("endpoint", "status"),
    [
        ("create", 200),
        ("create", 302),
        ("append", 201),
        ("append", 307),
        ("solve", 202),
        ("solve", 308),
        ("session", 204),
        ("session", 301),
        ("close", 202),
        ("close", 303),
    ],
)
def test_qualification_transport_rejects_status_before_state_change(
    tmp_path: Path, endpoint: str, status: int
) -> None:
    contract, fake = _prepare(tmp_path)
    transport = contract.transport
    if endpoint != "create":
        transport("POST", "http://piqd.test/sessions", b"{}", {})
        fake.status_overrides[endpoint] = status
    else:
        fake.status_overrides[endpoint] = status
    method, path = {
        "create": ("POST", "http://piqd.test/sessions"),
        "append": ("POST", f"http://piqd.test/sessions/{SESSION_ID}/clauses"),
        "solve": ("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve"),
        "session": ("GET", f"http://piqd.test/sessions/{SESSION_ID}"),
        "close": ("DELETE", f"http://piqd.test/sessions/{SESSION_ID}"),
    }[endpoint]
    with pytest.raises(qualification.QualificationError, match=f"HTTP {status}"):
        transport(method, path, b"{}" if method == "POST" else None, {})
    if endpoint == "create":
        assert transport.session_id is None
        assert not contract.identity_evidence_path.exists()
    assert transport.solve_count == 0
    assert transport.close_observed is False


def test_exact_cnf_binary_routes_accept_responses_over_control_limit(
    tmp_path: Path,
) -> None:
    assert qualification.MAX_CNF_ARTIFACT_RESPONSE_BYTES == 256 << 20
    contract, fake = _prepare(tmp_path)
    transport = contract.transport
    large_blob = b"c" * (qualification.MAX_CONTROL_BYTES + 1)
    job_blob_path = (
        f"http://piqd.test/jobs/{JOB_ID}/blobs/{hashlib.sha256(BASE).hexdigest()}"
    )
    fake.response_overrides[("GET", job_blob_path)] = HttpResponse(
        200, large_blob, {"Content-Type": "application/octet-stream"}
    )
    job_response = transport("GET", job_blob_path, None, {})
    assert job_response.body is large_blob

    transport("POST", "http://piqd.test/sessions", b"{}", {})
    session_cnf = b"s" * (qualification.MAX_CONTROL_BYTES + 2)
    session_cnf_path = f"http://piqd.test/sessions/{SESSION_ID}/cnf"
    fake.response_overrides[("GET", session_cnf_path)] = HttpResponse(
        200, session_cnf, {"Content-Type": "application/octet-stream"}
    )
    session_response = transport("GET", session_cnf_path, None, {})
    assert session_response.body is session_cnf


def test_control_and_near_miss_binary_routes_retain_control_limit(
    tmp_path: Path,
) -> None:
    contract, fake = _prepare(tmp_path)
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    oversized = b"x" * (qualification.MAX_CONTROL_BYTES + 1)
    paths = [
        f"http://piqd.test/sessions/{SESSION_ID}/model",
        f"http://piqd.test/jobs/{JOB_ID}/blobs/{'f' * 64}",
        f"http://piqd.test/near/jobs/{JOB_ID}/blobs/{_sha(BASE)}",
        "http://piqd.test/sessions/11111111-1111-4111-8111-111111111111/cnf",
    ]
    for path in paths:
        fake.response_overrides[("GET", path)] = HttpResponse(200, oversized, {})
        with pytest.raises(
            qualification.QualificationError, match="bounded exact bytes"
        ):
            transport("GET", path, None, {})

    assert qualification.MAX_JOB_STATUS_BYTES == 64 << 10
    exact_job_path = f"http://piqd.test/jobs/{JOB_ID}"
    fake.response_overrides[("GET", exact_job_path)] = HttpResponse(
        200, b"j" * (qualification.MAX_JOB_STATUS_BYTES + 1), {}
    )
    with pytest.raises(qualification.QualificationError, match="bounded exact bytes"):
        transport("GET", exact_job_path, None, {})


def test_unbound_test_transport_cannot_elevate_job_blob_limit(tmp_path: Path) -> None:
    root = tmp_path / "transport"
    root.mkdir(mode=0o700)
    path = f"http://piqd.test/jobs/{JOB_ID}/blobs/{_sha(BASE)}"
    oversized = b"x" * (qualification.MAX_CONTROL_BYTES + 1)
    fake = FakeTransport(
        response_overrides={
            ("GET", path): HttpResponse(
                200, oversized, {"Content-Type": "application/octet-stream"}
            )
        }
    )
    transport = qualification.QualificationTransport(
        fake,
        root=root,
        solver_name=SOLVER,
        solver_sha256=SOLVER_HASH,
        solver_signature=SIGNATURE,
        descriptor_root="a" * 64,
    )
    with pytest.raises(qualification.QualificationError, match="bounded exact bytes"):
        transport("GET", path, None, {})
    with pytest.raises(qualification.QualificationError, match="supplied together"):
        qualification.QualificationTransport(
            fake,
            root=root,
            solver_name=SOLVER,
            solver_sha256=SOLVER_HASH,
            solver_signature=SIGNATURE,
            descriptor_root="a" * 64,
            producer_job_id=JOB_ID,
        )


def test_authority_v3_transport_requires_generalized_current_sat_mode(
    tmp_path: Path,
) -> None:
    root = tmp_path / "transport"
    root.mkdir(mode=0o700)
    with pytest.raises(qualification.QualificationError, match="generalized"):
        qualification.QualificationTransport(
            FakeTransport(),
            root=root,
            solver_name=SOLVER,
            solver_sha256=SOLVER_HASH,
            solver_signature=SIGNATURE,
            descriptor_root="a" * 64,
            authority_version=3,
        )


@pytest.mark.parametrize(
    ("response", "message"),
    [
        (HttpResponse(True, b"cnf", {}), "status is not a builtin integer"),
        (HttpResponse(206, b"cnf", {}), "returned HTTP 206"),
        (HttpResponse(200, bytearray(b"cnf"), {}), "bounded exact bytes"),
        (HttpResponse(200, b"cnf", {"Content-Type": 1}), "exact string map"),
    ],
)
def test_binary_cnf_cap_retains_exact_response_schema_and_status(
    tmp_path: Path, response: Any, message: str
) -> None:
    contract, fake = _prepare(tmp_path)
    path = f"http://piqd.test/jobs/{JOB_ID}/blobs/{_sha(BASE)}"
    fake.response_overrides[("GET", path)] = response
    with pytest.raises(qualification.QualificationError, match=message):
        contract.transport("GET", path, None, {})


def test_live_session_status_accepts_exact_solver_stats_and_preserves_raw(
    tmp_path: Path,
) -> None:
    contract, fake = _prepare(tmp_path)
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    fake.close = _session(state="live", solves=1, solver_stats=SOLVER_STATS)
    expected = fake._bound_session(fake.close)
    response = transport("GET", f"http://piqd.test/sessions/{SESSION_ID}", None, {})
    assert type(response) is HttpResponse
    assert response.body == expected
    assert transport.close_observed is False


def test_solver_stats_shape_is_gated_by_the_pinned_worker_identity(
    tmp_path: Path,
) -> None:
    assert qualification.PINNED_WORKER_SOLVER_STATS_KEYS == (
        incremental.CALLER_SATWORKER_STATS_KEYS
    )
    root = tmp_path / "transport"
    root.mkdir(mode=0o700)
    drift_hash = "1" * 64
    create = json.loads(_session(state="live"))
    create["solver_sha256"] = drift_hash
    status = json.loads(_session(state="live", solver_stats=SOLVER_STATS))
    status["solver_sha256"] = drift_hash
    fake = FakeTransport(
        create=canonical_json_bytes(create), close=canonical_json_bytes(status)
    )
    fake.session_label = f"{incremental.SCHEMA}:{'a' * 64}"
    transport = qualification.QualificationTransport(
        fake,
        root=root,
        solver_name=SOLVER,
        solver_sha256=drift_hash,
        solver_signature=SIGNATURE,
        descriptor_root="a" * 64,
        producer_job_id=JOB_ID,
        base_sha256=_sha(BASE),
    )
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    with pytest.raises(qualification.QualificationError, match="pinned worker"):
        transport("GET", f"http://piqd.test/sessions/{SESSION_ID}", None, {})


@pytest.mark.parametrize("route", ["create", "close"])
def test_solver_stats_is_rejected_on_creation_and_close_routes(
    tmp_path: Path, route: str
) -> None:
    session = _session(state="live", solver_stats=SOLVER_STATS)
    fake = (
        FakeTransport(create=session)
        if route == "create"
        else FakeTransport(close=session)
    )
    contract, _ = _prepare(tmp_path, transport=fake)
    transport = contract.transport
    if route == "create":
        method = "POST"
        path = "http://piqd.test/sessions"
        body: bytes | None = b"{}"
    else:
        transport("POST", "http://piqd.test/sessions", b"{}", {})
        method = "DELETE"
        path = f"http://piqd.test/sessions/{SESSION_ID}"
        body = None
    with pytest.raises(qualification.QualificationError, match="inexact schema"):
        transport(method, path, body, {})


@pytest.mark.parametrize(
    "mutate",
    [
        lambda value: value.pop("vars"),
        lambda value: value.__setitem__("extra", 0),
        lambda value: value.__setitem__("active", True),
        lambda value: value.__setitem__("active", 1.5),
    ],
)
def test_live_session_status_rejects_malformed_solver_stats(
    tmp_path: Path, mutate: Any
) -> None:
    stats = dict(SOLVER_STATS)
    mutate(stats)
    contract, fake = _prepare(tmp_path)
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    fake.close = _session(state="live", solver_stats=stats)
    with pytest.raises(qualification.QualificationError):
        transport("GET", f"http://piqd.test/sessions/{SESSION_ID}", None, {})


def test_session_status_rejects_solver_stats_on_closed_depth_and_size(
    tmp_path: Path,
) -> None:
    closed, fake = _prepare(tmp_path / "closed")
    closed.transport("POST", "http://piqd.test/sessions", b"{}", {})
    fake.close = _session(state="closed", solves=2, solver_stats=SOLVER_STATS)
    with pytest.raises(qualification.QualificationError, match="requires a live"):
        closed.transport("GET", f"http://piqd.test/sessions/{SESSION_ID}", None, {})

    deep_value: Any = 0
    for _ in range(34):
        deep_value = {"nested": deep_value}
    deep, fake_deep = _prepare(tmp_path / "deep")
    deep.transport("POST", "http://piqd.test/sessions", b"{}", {})
    deep_stats = dict(SOLVER_STATS)
    deep_stats["vars"] = deep_value
    fake_deep.close = _session(state="live", solver_stats=deep_stats)
    with pytest.raises(qualification.QualificationError, match="depth bound"):
        deep.transport("GET", f"http://piqd.test/sessions/{SESSION_ID}", None, {})

    large, fake_large = _prepare(tmp_path / "large")
    large.transport("POST", "http://piqd.test/sessions", b"{}", {})
    fake_large.close = b"{" + b" " * qualification.MAX_CONTROL_BYTES + b"}"
    fake_large.session_label = None
    with pytest.raises(qualification.QualificationError, match="bounded exact bytes"):
        large.transport("GET", f"http://piqd.test/sessions/{SESSION_ID}", None, {})


def test_completed_job_status_known_and_future_fields_are_bounded(
    tmp_path: Path,
) -> None:
    future = {
        "cnf_blob_hash": _sha(BASE),
        "identity_hash": "4" * 64,
        "future_note": {"bounded": True},
        "progress": JOB_PROGRESS,
        "log_tail": "",
        "log_size_bytes": 0,
    }
    _prepare(tmp_path / "accepted", transport=FakeTransport(job=_job(overrides=future)))

    with pytest.raises(qualification.QualificationError, match="prepare authority"):
        _prepare(
            tmp_path / "crossed-hash",
            transport=FakeTransport(job=_job(overrides={"cnf_blob_hash": "f" * 64})),
        )
    with pytest.raises(qualification.QualificationError, match="too many future"):
        _prepare(
            tmp_path / "many",
            transport=FakeTransport(
                job=_job(overrides={f"future_{index}": index for index in range(17)})
            ),
        )
    with pytest.raises(qualification.QualificationError, match="invalid future"):
        _prepare(
            tmp_path / "name",
            transport=FakeTransport(job=_job(overrides={"future_é": 1})),
        )
    with pytest.raises(qualification.QualificationError, match="aggregate bound"):
        _prepare(
            tmp_path / "large-job",
            transport=FakeTransport(job=_job(overrides={"future": "x" * 70_000})),
        )
    with pytest.raises(qualification.QualificationError, match="progress"):
        _prepare(
            tmp_path / "progress-shape",
            transport=FakeTransport(job=_job(overrides={"progress": {}})),
        )
    stopped = dict(JOB_PROGRESS)
    stopped["solver_started"] = False
    with pytest.raises(qualification.QualificationError, match="did not start"):
        _prepare(
            tmp_path / "progress-lifecycle",
            transport=FakeTransport(job=_job(overrides={"progress": stopped})),
        )


@pytest.mark.parametrize(
    ("field", "value"),
    [("wall_ms", True), ("created_at", 1.5), ("log_size_bytes", False)],
)
def test_completed_job_status_rejects_bool_and_float_known_fields(
    tmp_path: Path, field: str, value: Any
) -> None:
    with pytest.raises(qualification.QualificationError):
        _prepare(
            tmp_path / field,
            transport=FakeTransport(job=_job(overrides={field: value})),
        )


def test_full_version_object_must_match_after_close(tmp_path: Path) -> None:
    contract, fake = _prepare(
        tmp_path, transport=FakeTransport(version_post=_version(version="test-drift"))
    )
    with pytest.raises(qualification.QualificationError, match="full canonical"):
        _complete(contract)
    assert fake.calls[-2][0] == "DELETE"
    assert fake.calls[-1] == ("GET", "/version")
    assert not (contract.directory / qualification.QUALIFICATION_NAME).exists()

    malformed = json.loads(_version())
    malformed["limits"]["max_var"] = 999_999
    with pytest.raises(qualification.QualificationError, match="max_var"):
        _prepare(
            tmp_path / "shape",
            transport=FakeTransport(version_pre=canonical_json_bytes(malformed)),
        )


def test_exact_frontier_order_stale_receipt_and_incomplete_model_fail_closed(
    tmp_path: Path,
) -> None:
    order, _ = _prepare(tmp_path / "order")
    with pytest.raises(
        qualification.QualificationError, match="wrong ordered frontier"
    ):
        _complete(order, swapped_appends=True)
    stale, _ = _prepare(tmp_path / "stale")
    with pytest.raises(
        qualification.QualificationError, match="headerless journal prefix"
    ):
        _complete(stale, stale_receipt=True)
    incomplete, _ = _prepare(
        tmp_path / "model", transport=FakeTransport(solve1=_raw_solve(1, model=[-2]))
    )
    with pytest.raises(qualification.QualificationError, match="not total"):
        _complete(incomplete, model=[-2])


@pytest.mark.parametrize(
    "solve2",
    [_raw_solve(2, core=[1]), _raw_solve(2, terminal_unsat=False)],
)
def test_terminal_unsat_requires_raw_empty_core_and_terminal_flag(
    tmp_path: Path, solve2: bytes
) -> None:
    contract, _ = _prepare(tmp_path, transport=FakeTransport(solve2=solve2))
    contract.transport("POST", "http://piqd.test/sessions", b"{}", {})
    contract.transport(
        "POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {}
    )
    with pytest.raises(qualification.QualificationError):
        contract.transport(
            "POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {}
        )


def test_durable_terminal_evidence_needs_no_raw_archive_and_false_claim_fails(
    tmp_path: Path,
) -> None:
    contract, _ = _prepare(tmp_path)
    _complete(contract)
    assert not any(
        (contract.directory / name).exists()
        for name in qualification.SOLVE_RESPONSE_NAMES
    )
    assert qualification.validate_test_qualification(contract.directory)[
        "terminal_unsat"
    ]

    claims, _ = _prepare(tmp_path / "claims")
    _complete(claims)
    _replace_json(
        claims.directory / qualification.QUALIFICATION_NAME,
        lambda value: value["claims"].__setitem__("global_obstruction", True),
    )
    with pytest.raises(qualification.QualificationError, match="forbidden"):
        qualification.validate_test_qualification(claims.directory)

    stats_contract, _ = _prepare(tmp_path / "stats-contract")
    _complete(stats_contract)
    _replace_json(
        stats_contract.directory / qualification.QUALIFICATION_NAME,
        lambda value: value["solver_stats_contract"].__setitem__(
            "presence_required", True
        ),
    )
    with pytest.raises(qualification.QualificationError, match="forbidden"):
        qualification.validate_test_qualification(stats_contract.directory)


def test_lost_close_response_recovery_and_close_once(tmp_path: Path) -> None:
    contract, fake = _prepare(tmp_path)
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    _write_result(contract.directory)
    fake.lose_delete_once = True
    with pytest.raises(OSError, match="lost close response"):
        transport("DELETE", f"http://piqd.test/sessions/{SESSION_ID}", None, {})
    transport("GET", f"http://piqd.test/sessions/{SESSION_ID}", None, {})
    qualification.finalize_qualification(contract)
    result = qualification.validate_test_qualification(contract.directory)
    assert result["terminal_unsat"] is True
    with pytest.raises(qualification.QualificationError, match="already closed"):
        transport("DELETE", f"http://piqd.test/sessions/{SESSION_ID}", None, {})


def test_close_must_attest_terminal_and_assumption_free_separately(
    tmp_path: Path,
) -> None:
    close = json.loads(_session(state="closed", solves=2))
    close["last_assumption_free"] = False
    contract, _ = _prepare(
        tmp_path, transport=FakeTransport(close=canonical_json_bytes(close))
    )
    with pytest.raises(qualification.QualificationError, match="exact session"):
        _complete(contract)


def test_production_v2_generalized_transport_accepts_dense_solve_sequence(
    tmp_path: Path,
) -> None:
    def response(status: str, index: int) -> bytes:
        common: dict[str, Any] = {
            "status": status,
            "solve_ms": index,
            "solve_index": index,
        }
        if status == "SAT":
            common["model"] = MODEL
            common["result_sha256"] = incremental._result_digest(
                "SAT", None, None, MODEL
            )
        else:
            common["core"] = []
            common["terminal_unsat"] = True
            common["result_sha256"] = incremental._result_digest(
                "UNSAT", None, [], None
            )
        return canonical_json_bytes(common)

    class ThreeSolveTransport(FakeTransport):
        def __init__(self) -> None:
            super().__init__()
            self.responses = [
                response("SAT", 1),
                response("SAT", 2),
                response("UNSAT", 3),
            ]

        def __call__(
            self, method: str, path: str, body: Any, headers: Any
        ) -> HttpResponse:
            if method == "POST" and path.endswith("/solve"):
                self.calls.append((method, path))
                raw = self.responses[self.solve_calls]
                self.solve_calls += 1
                return HttpResponse(200, raw, {})
            return super().__call__(method, path, body, headers)

    contract, _ = _prepare_v2(tmp_path, transport=ThreeSolveTransport())
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    transport(
        "POST",
        f"http://piqd.test/sessions/{SESSION_ID}/clauses",
        canonical_json_bytes({"clauses": [[-2]]}),
        {},
    )
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})
    transport("POST", f"http://piqd.test/sessions/{SESSION_ID}/solve", b"{}", {})

    assert transport.statuses == ["SAT", "SAT", "UNSAT"]
    assert transport.event_sequence == ["solve", "append", "solve", "solve"]


def test_production_v2_seals_only_after_closed_terminal_run(tmp_path: Path) -> None:
    contract, fake = _prepare_v2(tmp_path)
    assert not (
        contract.directory / qualification.PRODUCTION_V2_QUALIFICATION_NAME
    ).exists()

    seal = _complete_v2(contract)

    assert seal is not None
    assert seal["statuses"] == ["SAT", "UNSAT"]
    assert seal["solve_count"] == 2
    assert seal["claims"] == {
        "piqd_proof_verified": False,
        "piqd_closure": False,
        "global_obstruction": False,
        "theorem_coverage": False,
        "universal_lift": False,
        "lean_closure": False,
    }
    assert fake.version_calls == 2
    assert (
        contract.directory / qualification.PRODUCTION_V2_SESSION_RESULT_NAME
    ).exists()
    assert (
        contract.directory / qualification.PRODUCTION_V2_QUALIFICATION_NAME
    ).read_bytes() == canonical_json_bytes(seal)


def test_production_v2_failed_run_preserves_forensics_without_seal(
    tmp_path: Path,
) -> None:
    contract, _ = _prepare_v2(tmp_path)

    assert _complete_v2(contract, driver_status="UNKNOWN") is None

    assert (contract.directory / qualification.PRODUCTION_V2_PREFLIGHT_NAME).exists()
    assert (contract.directory / qualification.CLOSE_RESPONSE_NAME).exists()
    assert not (
        contract.directory / qualification.PRODUCTION_V2_SESSION_RESULT_NAME
    ).exists()
    assert not (
        contract.directory / qualification.PRODUCTION_V2_QUALIFICATION_NAME
    ).exists()


def test_production_v2_version_drift_and_runtime_tamper_do_not_seal(
    tmp_path: Path,
) -> None:
    drift, _ = _prepare_v2(
        tmp_path / "drift",
        transport=FakeTransport(version_post=_version(version="changed")),
    )
    with pytest.raises(
        qualification.QualificationError, match="version object changed"
    ):
        _complete_v2(drift)
    assert not (
        drift.directory / qualification.PRODUCTION_V2_QUALIFICATION_NAME
    ).exists()

    tampered, _ = _prepare_v2(tmp_path / "tampered")
    with pytest.raises(
        qualification.QualificationError, match="not the journal frontier"
    ):
        _complete_v2(tampered, tamper_runtime=True)
    assert not (
        tampered.directory / qualification.PRODUCTION_V2_QUALIFICATION_NAME
    ).exists()


def test_production_v2_rejects_byte_only_version_drift(tmp_path: Path) -> None:
    same_value_different_bytes = json.dumps(
        json.loads(_version()), indent=2, sort_keys=False
    ).encode("utf-8")
    contract, _ = _prepare_v2(
        tmp_path,
        transport=FakeTransport(version_post=same_value_different_bytes),
    )

    with pytest.raises(
        qualification.QualificationError, match="version object changed"
    ):
        _complete_v2(contract)

    assert not (
        contract.directory / qualification.PRODUCTION_V2_QUALIFICATION_NAME
    ).exists()


def test_production_v2_rejects_mutated_preflight_and_unknown_journal_fields(
    tmp_path: Path,
) -> None:
    preflight, _ = _prepare_v2(tmp_path / "preflight")

    def alter_preflight(contract: qualification.ProductionQualificationV2) -> None:
        _replace_json(
            contract.directory / qualification.PRODUCTION_V2_PREFLIGHT_NAME,
            lambda value: value.__setitem__("base_clauses", 99),
        )

    with pytest.raises(qualification.QualificationError, match="preflight custody"):
        _complete_v2(preflight, tamper_custody=alter_preflight)

    journal, _ = _prepare_v2(tmp_path / "journal")

    def add_unknown_journal_field(
        contract: qualification.ProductionQualificationV2,
    ) -> None:
        path = contract.directory / qualification.JOURNAL_NAME
        events = [json.loads(line) for line in path.read_bytes().splitlines()]
        events[1]["unexpected"] = True
        prior: str | None = None
        for event in events:
            event["prior_event_sha256"] = prior
            event.pop("event_sha256", None)
            event["event_sha256"] = _sha(canonical_json_bytes(event))
            prior = event["event_sha256"]
        _private(
            path,
            b"".join(canonical_json_bytes(event) + b"\n" for event in events),
        )

    with pytest.raises(qualification.QualificationError, match="inexact schema"):
        _complete_v2(journal, tamper_custody=add_unknown_journal_field)


def test_production_v2_revalidates_mutable_authority_snapshot(tmp_path: Path) -> None:
    contract, _ = _prepare_v2(tmp_path)
    contract.authority.value["policy"]["workers"] = 2

    with pytest.raises(qualification.QualificationError, match="changed after loading"):
        _complete_v2(contract)


def test_production_v2_authority_policy_is_exact(tmp_path: Path) -> None:
    source_raw, producer_raw = _manifests(b"# exact policy\n")
    authority = _production_authority(
        tmp_path,
        source_raw=source_raw,
        producer_raw=producer_raw,
        version_raw=_version(),
    )
    value = json.loads(authority.path.read_bytes())
    value["policy"]["workers"] = 2
    value.pop("authority_sha256")
    value["authority_sha256"] = _sha(canonical_json_bytes(value))
    authority.path.write_bytes(canonical_json_bytes(value))

    with pytest.raises(qualification.QualificationError, match="policy"):
        qualification.load_production_authority_v2(authority.path)


@pytest.mark.parametrize("prepared_existing", [False, True])
def test_production_v3_authority_loads_only_current_global_bundle(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
    prepared_existing: bool,
) -> None:
    authority = _production_authority_v3(
        tmp_path,
        bundle=current_bundle,
        version_raw=_version(),
        prepared_existing=prepared_existing,
    )
    assert authority.value["base_scope"] == "global"
    assert authority.value["builder_base_scope"] == "global-unsharded"
    assert authority.value["prepared_existing"] is prepared_existing
    assert authority.value["producer_prepare_preview"] == current_bundle.base_cnf[
        : qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    assert authority.value["shard_index"] is None
    assert authority.value["shard_count"] is None
    assert authority.value["shard_literals"] is None
    with pytest.raises(qualification.QualificationError):
        qualification.load_production_authority_v2(authority.path)


@pytest.mark.parametrize(
    "attack",
    [
        "schema",
        "base-scope",
        "profile",
        "variables-bool",
        "clauses-float",
        "map",
        "source",
        "producer",
        "shard-index",
        "shard-count",
        "shard-literals",
        "existing-int",
        "preview-missing",
        "preview-bool",
        "preview-float",
        "preview-tamper",
        "solver",
        "claim",
    ],
)
def test_production_v3_authority_schema_profile_and_builtin_attacks_fail(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
    attack: str,
) -> None:
    authority = _production_authority_v3(
        tmp_path, bundle=current_bundle, version_raw=_version()
    )

    def mutate(value: dict[str, Any]) -> None:
        if attack == "schema":
            value["schema"] = qualification.PRODUCTION_V2_AUTHORITY_SCHEMA
        elif attack == "base-scope":
            value["base_scope"] = "projected-static-v3-shard"
        elif attack == "profile":
            value["profile"] += ";shard=4/32;units=-91,-92,93,-94,-95"
        elif attack == "variables-bool":
            value["num_variables"] = True
        elif attack == "clauses-float":
            value["num_clauses"] = 58_314.0
        elif attack == "map":
            value["variable_map_sha256"] = "f" * 64
        elif attack == "source":
            value["source_manifest_sha256"] = "f" * 64
        elif attack == "producer":
            value["producer_manifest_sha256"] = "f" * 64
        elif attack == "shard-index":
            value["shard_index"] = 4
        elif attack == "shard-count":
            value["shard_count"] = 32
        elif attack == "shard-literals":
            value["shard_literals"] = [-91, -92, 93, -94, -95]
        elif attack == "existing-int":
            value["prepared_existing"] = 1
        elif attack == "preview-missing":
            value.pop("producer_prepare_preview")
        elif attack == "preview-bool":
            value["producer_prepare_preview"] = True
        elif attack == "preview-float":
            value["producer_prepare_preview"] = 1.0
        elif attack == "preview-tamper":
            value["producer_prepare_preview"] += "crossed"
        elif attack == "solver":
            value["solver"]["sha256"] = "f" * 64
        elif attack == "claim":
            value["claims"]["piqd_closure"] = True

    _resign_authority(authority.path, mutate)
    with pytest.raises(qualification.QualificationError):
        qualification.load_production_authority_v3(authority.path)


def test_production_v3_rejects_noncanonical_v2_and_exact_type_crossing(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    authority = _production_authority_v3(
        tmp_path / "v3", bundle=current_bundle, version_raw=_version()
    )
    value = json.loads(authority.raw)
    authority.path.write_bytes(json.dumps(value, indent=2).encode())
    with pytest.raises(qualification.QualificationError, match="canonical"):
        qualification.load_production_authority_v3(authority.path)

    source, producer = _manifests(b"# frozen v2 crossing\n")
    v2 = _production_authority(
        tmp_path / "v2",
        source_raw=source,
        producer_raw=producer,
        version_raw=_version(),
    )
    with pytest.raises(qualification.QualificationError):
        qualification.load_production_authority_v3(v2.path)

    class AuthoritySubclass(qualification.ProductionAuthorityV3):
        pass

    crossed = AuthoritySubclass(authority.path, authority.raw, value)
    with pytest.raises(qualification.QualificationError, match="exact v3"):
        qualification.validate_production_launch_authority_v3(
            crossed,
            daemon_url="http://piqd.test",
            source_manifest=current_bundle.source_manifest,
            producer_manifest=current_bundle.producer_manifest,
            producer_job_id=JOB_ID,
            solver_name=SOLVER,
        )


def test_production_v3_rejects_caller_selected_manifests_and_custody_crossing(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    authority = _production_authority_v3(
        tmp_path / "manifests", bundle=current_bundle, version_raw=_version()
    )
    substituted_source, substituted_producer = _manifests(b"# substituted\n")
    with pytest.raises(qualification.QualificationError, match="current public bundle"):
        qualification.validate_production_launch_authority_v3(
            authority,
            daemon_url="http://piqd.test",
            source_manifest=substituted_source,
            producer_manifest=substituted_producer,
            producer_job_id=JOB_ID,
            solver_name=SOLVER,
        )

    authority = _production_authority_v3(
        tmp_path / "custody", bundle=current_bundle, version_raw=_version()
    )
    _resign_authority(
        authority.path,
        lambda value: value.__setitem__("producer_job_id", "f" * 36),
    )
    with pytest.raises(qualification.QualificationError):
        qualification.validate_production_launch_authority_v3(
            authority,
            daemon_url="http://piqd.test",
            source_manifest=current_bundle.source_manifest,
            producer_manifest=current_bundle.producer_manifest,
            producer_job_id=JOB_ID,
            solver_name=SOLVER,
        )


def test_production_v3_full_arbitrary_append_unsat_lifecycle_seals(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    contract, fake = _prepare_v3(tmp_path, bundle=current_bundle)
    seal = _complete_v3(contract)
    assert seal is not None
    assert seal["schema"] == qualification.PRODUCTION_V3_QUALIFICATION_SCHEMA
    assert seal["statuses"] == ["UNSAT"]
    assert seal["solve_count"] == 1
    assert contract.transport.event_sequence == ["append", "solve"]
    assert seal["final_frontier_count"] == current_bundle.num_clauses + 2
    assert seal["daemon_version_pre_sha256"] == seal["daemon_version_post_sha256"]
    preflight = json.loads(
        (contract.directory / qualification.PRODUCTION_V3_PREFLIGHT_NAME).read_bytes()
    )
    assert preflight["producer_job_requested_core_limit"] == 1
    assert preflight["producer_prepare_preview"] == current_bundle.base_cnf[
        : qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    assert seal["policy"] == dict(qualification.PRODUCTION_V3_POLICY)
    assert all(claim is False for claim in seal["claims"].values())
    assert fake.version_calls == 2
    assert (
        contract.directory / qualification.PRODUCTION_V3_SESSION_RESULT_NAME
    ).exists()


def test_production_v3_binds_every_control_request_to_daemon_origin(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    contract, fake = _prepare_v3(
        tmp_path, bundle=current_bundle, daemon_url="http://piqd.test/"
    )
    assert _complete_v3(contract) is not None
    control_gets = [path for method, path in fake.calls if method == "GET"]
    assert control_gets == [
        "http://piqd.test/version",
        f"http://piqd.test/jobs/{JOB_ID}",
        (f"http://piqd.test/jobs/{JOB_ID}/blobs/{current_bundle.base_cnf_sha256}"),
        "http://piqd.test/solvers",
        "http://piqd.test/version",
    ]
    assert all(path.count("http://") == 1 for _, path in fake.calls)


class _StringSubclass(str):
    pass


@pytest.mark.parametrize(
    "daemon_url",
    [
        "piqd.test",
        "ftp://piqd.test",
        "http://",
        "http://:7272",
        "http://user@piqd.test",
        "http://piqd.test/api",
        "http://piqd.test?query=1",
        "http://piqd.test#fragment",
        "http://piqd.test:invalid",
        "http://piqd.test:",
        "http://piqd.test:07272",
        "http://piqd.test:0",
        "http://piqd.test:65536",
        "http://piqd.test:80",
        "https://piqd.test:443",
        "http://piqd.test:+80",
        "HTTP://piqd.test",
        "http://PIQD.test",
        "http://piqd.test.",
        "http://piqd.test?",
        "http://piqd.test#",
        "http://piqd.test#/",
        "http://[::01]",
        "http://[::1%25lo0]",
        " http://piqd.test",
        "http://piqd.test ",
        "http://pi qd.test",
        "http://piqd.test\n",
        "http://piqd.\u00a0test",
        "http://piqd.test/\x00",
        _StringSubclass("http://piqd.test"),
    ],
)
def test_production_v3_rejects_malformed_daemon_origins_without_transport(
    daemon_url: Any,
) -> None:
    fake = StrictAbsoluteTransport()
    with pytest.raises(qualification.QualificationError, match="daemon_url"):
        qualification._production_v3_bound_transport(fake, daemon_url)
    assert fake.calls == []


@pytest.mark.parametrize(
    "request_url",
    [
        "http://hostile.test/version",
        "https://piqd.test/version",
        "//hostile.test/version",
        "http://user@piqd.test/version",
        "http://piqd.test/version?query=1",
        "http://piqd.test/version#fragment",
        "http://piqd.test/../version",
        "http://piqd.test//version",
        "HTTP://piqd.test/version",
        "http://PIQD.test/version",
        "http://piqd.test:/version",
        "/%2e%2e/version",
        "/%2E/version",
        "/jobs%2fstatus",
        "/jobs%2Fstatus",
        "/jobs%5cstatus",
        "/jobs%5Cstatus",
        "/version%00",
        "/version%09",
        "/version%0d%0a",
        "/version%3Fignored",
        "/%252e%252e/version",
        "/jobs%252fstatus",
        "http://piqd.test/%2e%2e/version",
        "http://piqd.test/jobs%252fstatus",
        "/version?",
        "/version#",
        "/version\\suffix",
        "/version suffix",
        "/version\x00",
        "/version\u00a0",
    ],
)
def test_production_v3_rejects_hostile_absolute_control_urls(
    request_url: str,
) -> None:
    fake = StrictAbsoluteTransport()
    bound = qualification._production_v3_bound_transport(fake, "http://piqd.test/")
    with pytest.raises(qualification.QualificationError, match="request URL"):
        bound("GET", request_url, None, {"Accept": "application/json"})
    assert fake.calls == []


def test_production_v3_same_origin_absolute_url_is_not_double_prefixed() -> None:
    fake = StrictAbsoluteTransport()
    bound = qualification._production_v3_bound_transport(fake, "http://piqd.test/")
    response = bound(
        "GET",
        "http://piqd.test/version",
        None,
        {"Accept": "application/json"},
    )
    assert response.status == 200
    assert fake.calls == [("GET", "http://piqd.test/version")]


def test_production_v3_accepts_one_trailing_slash_and_canonical_port() -> None:
    assert (
        qualification._production_v3_daemon_origin("http://piqd.test:7272/")
        == "http://piqd.test:7272"
    )


def test_production_v3_registry_daemon_sha256_is_optional_and_cross_bound(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    version_daemon = json.loads(_version())["daemon"]
    without_sha256 = json.loads(_registry())
    qualification._production_v3_registry_daemon_contract(
        without_sha256,
        version_daemon=version_daemon,
        label="solver registry",
    )

    contract, _ = _prepare_v3(tmp_path, bundle=current_bundle)
    captured = json.loads((contract.directory / "solver-registry-v3.json").read_bytes())
    assert captured["daemon"]["sha256"] == version_daemon["sha256"]


@pytest.mark.parametrize(
    ("attack", "replacement"),
    [
        ("missing-required", None),
        ("extra", "forbidden"),
        ("uppercase", "A" * 64),
        ("bool", True),
        ("float", 3.0),
        ("crossed", "4" * 64),
    ],
)
def test_production_v3_registry_daemon_sha256_attacks_fail_closed(
    attack: str,
    replacement: Any,
) -> None:
    registry = json.loads(_registry(daemon_sha256="3" * 64))
    version_daemon = json.loads(_version())["daemon"]
    if attack == "missing-required":
        del registry["daemon"]["version"]
    elif attack == "extra":
        registry["daemon"]["EXTRA"] = replacement
    else:
        registry["daemon"]["sha256"] = replacement
    with pytest.raises(qualification.QualificationError):
        qualification._production_v3_registry_daemon_contract(
            registry,
            version_daemon=version_daemon,
            label="solver registry",
        )


def test_production_v3_registry_daemon_sha256_rejects_string_subclasses() -> None:
    class StringSubclass(str):
        pass

    registry = json.loads(_registry(daemon_sha256="3" * 64))
    registry["daemon"]["sha256"] = StringSubclass("3" * 64)
    with pytest.raises(qualification.QualificationError, match="lowercase 64-hex"):
        qualification._production_v3_registry_daemon_contract(
            registry,
            version_daemon=json.loads(_version())["daemon"],
            label="solver registry",
        )


def test_production_v3_crossed_registry_daemon_sha_fails_before_session(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    fake = FakeTransport(
        job=_job(
            overrides={
                "cnf_blob_hash": current_bundle.base_cnf_sha256,
                "identity_hash": current_bundle.raw_dimacs_identity,
                "producer_manifest_hash": current_bundle.producer_manifest_sha256,
            }
        ),
        blob=current_bundle.base_cnf,
        registry=_registry(daemon_sha256="4" * 64),
    )
    fake.response_overrides[
        ("GET", f"/jobs/{JOB_ID}/blobs/{current_bundle.base_cnf_sha256}")
    ] = HttpResponse(200, current_bundle.base_cnf, {})
    with pytest.raises(qualification.QualificationError, match="sha256 is crossed"):
        _prepare_v3(tmp_path, bundle=current_bundle, transport=fake)
    assert not any(path.endswith("/sessions") for _, path in fake.calls)


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("cnf_blob_hash", None),
        ("identity_hash", None),
        ("producer_manifest_hash", None),
        ("cnf_blob_hash", "f" * 64),
        ("identity_hash", "f" * 64),
        ("producer_manifest_hash", "f" * 64),
        ("producer_manifest_hash", True),
        ("producer_manifest_hash", 1.0),
    ],
)
def test_production_v3_requires_exact_job_status_custody_hashes(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
    field: str,
    replacement: Any,
) -> None:
    value = json.loads(
        _job(
            overrides={
                "cnf_blob_hash": current_bundle.base_cnf_sha256,
                "identity_hash": current_bundle.raw_dimacs_identity,
                "producer_manifest_hash": current_bundle.producer_manifest_sha256,
            }
        )
    )
    if replacement is None:
        del value[field]
    else:
        value[field] = replacement
    fake = FakeTransport(job=canonical_json_bytes(value))
    with pytest.raises(qualification.QualificationError, match="producer job"):
        _prepare_v3(tmp_path, bundle=current_bundle, transport=fake)


def test_production_v3_accepts_timed_sat_response_without_effective_deadline(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    solve = json.loads(_raw_solve(2))
    solve["solve_index"] = 1
    solve["replayed"] = False
    solve["timeout_ms"] = 3_000
    fake = FakeTransport(
        job=_job(
            overrides={
                "cnf_blob_hash": current_bundle.base_cnf_sha256,
                "identity_hash": current_bundle.raw_dimacs_identity,
                "producer_manifest_hash": current_bundle.producer_manifest_sha256,
            }
        ),
        solve1=canonical_json_bytes(solve),
    )
    contract, _ = _prepare_v3(tmp_path, bundle=current_bundle, transport=fake)
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    response = transport(
        "POST",
        f"http://piqd.test/sessions/{SESSION_ID}/solve",
        canonical_json_bytes(
            {"assumptions": [], "include_model": True, "timeout_ms": 3_000}
        ),
        {},
    )
    assert json.loads(response.body)["replayed"] is False
    assert "effective_deadline_ms" not in json.loads(response.body)


@pytest.mark.parametrize("timeout_ms", [None, True, 3_000.0, -1])
def test_production_v3_rejects_invalid_timeout_request_before_delegation(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
    timeout_ms: Any,
) -> None:
    contract, fake = _prepare_v3(tmp_path, bundle=current_bundle)
    contract.transport("POST", "http://piqd.test/sessions", b"{}", {})
    request: dict[str, Any] = {"assumptions": [], "include_model": True}
    if timeout_ms is not None:
        request["timeout_ms"] = timeout_ms
    calls_before = list(fake.calls)
    with pytest.raises(
        qualification.QualificationError,
        match="schema|timeout_ms|non-negative|non-builtin",
    ):
        contract.transport(
            "POST",
            f"http://piqd.test/sessions/{SESSION_ID}/solve",
            canonical_json_bytes(request),
            {},
        )
    assert fake.calls == calls_before


@pytest.mark.parametrize("response_timeout_ms", [None, 2_999, True, 3_000.0, -1])
def test_production_v3_exactly_binds_response_timeout_to_request(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
    response_timeout_ms: Any,
) -> None:
    solve = json.loads(_raw_solve(2))
    solve.update({"solve_index": 1, "replayed": False})
    if response_timeout_ms is not None:
        solve["timeout_ms"] = response_timeout_ms
    fake = FakeTransport(
        job=_job(
            overrides={
                "cnf_blob_hash": current_bundle.base_cnf_sha256,
                "identity_hash": current_bundle.raw_dimacs_identity,
                "producer_manifest_hash": current_bundle.producer_manifest_sha256,
            }
        ),
        solve1=canonical_json_bytes(solve),
    )
    contract, _ = _prepare_v3(tmp_path, bundle=current_bundle, transport=fake)
    contract.transport("POST", "http://piqd.test/sessions", b"{}", {})
    with pytest.raises(
        qualification.QualificationError,
        match="schema|timeout_ms|non-negative|non-builtin",
    ):
        contract.transport(
            "POST",
            f"http://piqd.test/sessions/{SESSION_ID}/solve",
            canonical_json_bytes(
                {"assumptions": [], "include_model": True, "timeout_ms": 3_000}
            ),
            {},
        )


def test_production_v3_rejects_timeout_subclass_at_typed_boundary(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    contract, fake = _prepare_v3(tmp_path, bundle=current_bundle)
    with pytest.raises(qualification.QualificationError, match="timeout_ms"):
        contract.transport._solve_payload(
            fake.solve1,
            expected_index=1,
            requested_timeout_ms=_IntSubclass(3_000),
        )


class _IntSubclass(int):
    pass


@pytest.mark.parametrize(
    "receipt_timeout_ms",
    [None, 24, True, 25.0, _IntSubclass(25), -1],
)
def test_production_v3_exactly_binds_receipt_timeout_to_retained_request(
    receipt_timeout_ms: Any,
) -> None:
    frontier = [(1,)]
    result_sha256 = incremental._result_digest("UNSAT", None, [], None)
    receipt = _receipt("UNSAT", 1, frontier, result_sha256)
    if receipt_timeout_ms is not None:
        receipt["timeout_ms"] = receipt_timeout_ms
    with pytest.raises(
        qualification.QualificationError, match="timeout_ms|retained request"
    ):
        qualification._validate_receipt(
            receipt,
            status="UNSAT",
            solve_index=1,
            result_sha256=result_sha256,
            frontier=frontier,
            authority_version=3,
            requested_timeout_ms=25,
        )


@pytest.mark.parametrize("authority_version", [None, 2])
def test_historical_receipt_schema_still_accepts_effective_deadline(
    authority_version: int | None,
) -> None:
    frontier = [(1,)]
    result_sha256 = incremental._result_digest("UNSAT", None, [], None)
    receipt = {
        **_receipt("UNSAT", 1, frontier, result_sha256),
        "timeout_ms": 25,
        "effective_deadline_ms": 30_025,
    }

    qualification._validate_receipt(
        receipt,
        status="UNSAT",
        solve_index=1,
        result_sha256=result_sha256,
        frontier=frontier,
        authority_version=authority_version,
    )


@pytest.mark.parametrize("authority_version", [None, 2])
def test_historical_transport_still_binds_effective_deadline(
    tmp_path: Path,
    authority_version: int | None,
) -> None:
    solve = json.loads(_raw_solve(1))
    solve["effective_deadline_ms"] = 30_025
    fake = FakeTransport(solve1=canonical_json_bytes(solve))
    contract, _ = (
        _prepare_v2(tmp_path, transport=fake)
        if authority_version == 2
        else _prepare(tmp_path, transport=fake)
    )
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})

    response = transport(
        "POST",
        f"http://piqd.test/sessions/{SESSION_ID}/solve",
        canonical_json_bytes(
            {"assumptions": [], "include_model": True, "timeout_ms": 25}
        ),
        {},
    )

    assert json.loads(response.body)["effective_deadline_ms"] == 30_025


@pytest.mark.parametrize("authority_version", [None, 2])
@pytest.mark.parametrize("effective_deadline_ms", [None, 30_024, True, 30_025.0])
def test_historical_transport_rejects_inexact_effective_deadline(
    tmp_path: Path,
    authority_version: int | None,
    effective_deadline_ms: Any,
) -> None:
    solve = json.loads(_raw_solve(1))
    if effective_deadline_ms is not None:
        solve["effective_deadline_ms"] = effective_deadline_ms
    fake = FakeTransport(solve1=canonical_json_bytes(solve))
    contract, _ = (
        _prepare_v2(tmp_path, transport=fake)
        if authority_version == 2
        else _prepare(tmp_path, transport=fake)
    )
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})

    with pytest.raises(
        qualification.QualificationError,
        match="schema|effective_deadline_ms|non-builtin",
    ):
        transport(
            "POST",
            f"http://piqd.test/sessions/{SESSION_ID}/solve",
            canonical_json_bytes(
                {"assumptions": [], "include_model": True, "timeout_ms": 25}
            ),
            {},
        )


def test_production_v3_finalization_uses_transport_retained_timeout(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    contract, _ = _prepare_v3(tmp_path, bundle=current_bundle)
    with pytest.raises(qualification.QualificationError, match="retained request"):
        _complete_v3(contract, receipt_timeout_ms=2_999)
    assert not (
        contract.directory / qualification.PRODUCTION_V3_QUALIFICATION_NAME
    ).exists()


def test_production_v3_rejects_cross_index_receipt_timeout_substitution(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    contract, fake = _prepare_v3(tmp_path, bundle=current_bundle)
    first = json.loads(fake.solve1)
    first["timeout_ms"] = 1_000
    fake.solve1 = canonical_json_bytes(first)
    fake.solve2 = canonical_json_bytes(
        {
            "status": "UNKNOWN",
            "solve_ms": 1,
            "solve_index": 2,
            "result_sha256": incremental._result_digest("UNKNOWN", None, None, None),
            "replayed": False,
            "timeout_ms": 2_000,
        }
    )
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})
    for timeout_ms in (1_000, 2_000):
        transport(
            "POST",
            f"http://piqd.test/sessions/{SESSION_ID}/solve",
            canonical_json_bytes(
                {
                    "assumptions": [],
                    "include_model": True,
                    "timeout_ms": timeout_ms,
                }
            ),
            {},
        )
    assert transport.requested_timeouts_ms == (1_000, 2_000)
    frontier = [(1,)]
    result_sha256 = incremental._result_digest("UNSAT", None, [], None)
    crossed = {
        **_receipt("UNSAT", 1, frontier, result_sha256),
        "timeout_ms": transport.requested_timeouts_ms[1],
    }
    with pytest.raises(qualification.QualificationError, match="retained request"):
        qualification._validate_receipt(
            crossed,
            status="UNSAT",
            solve_index=1,
            result_sha256=result_sha256,
            frontier=frontier,
            authority_version=3,
            requested_timeout_ms=transport.requested_timeouts_ms[0],
        )


@pytest.mark.parametrize(
    "replayed",
    [None, True, 0, 0.0, "false", _IntSubclass(0)],
)
def test_production_v3_rejects_inexact_replayed(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
    replayed: Any,
) -> None:
    solve = json.loads(_raw_solve(2))
    solve["solve_index"] = 1
    solve["timeout_ms"] = 3_000
    if replayed is not None:
        solve["replayed"] = replayed
    fake = FakeTransport(
        job=_job(
            overrides={
                "cnf_blob_hash": current_bundle.base_cnf_sha256,
                "identity_hash": current_bundle.raw_dimacs_identity,
                "producer_manifest_hash": current_bundle.producer_manifest_sha256,
            }
        ),
        solve1=canonical_json_bytes(solve),
    )
    contract, _ = _prepare_v3(tmp_path, bundle=current_bundle, transport=fake)
    contract.transport("POST", "http://piqd.test/sessions", b"{}", {})
    with pytest.raises(
        qualification.QualificationError, match="schema|replayed|non-builtin"
    ):
        contract.transport(
            "POST",
            f"http://piqd.test/sessions/{SESSION_ID}/solve",
            canonical_json_bytes(
                {"assumptions": [], "include_model": True, "timeout_ms": 3_000}
            ),
            {},
        )


def test_production_v3_committed_schema_failure_preserves_one_close_artifact(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    solve = json.loads(_raw_solve(2))
    solve["solve_index"] = 1
    solve["replayed"] = True
    solve["timeout_ms"] = 3_000
    fake = FakeTransport(
        job=_job(
            overrides={
                "cnf_blob_hash": current_bundle.base_cnf_sha256,
                "identity_hash": current_bundle.raw_dimacs_identity,
                "producer_manifest_hash": current_bundle.producer_manifest_sha256,
            }
        ),
        solve1=canonical_json_bytes(solve),
        close=_production_session(
            variables=current_bundle.num_variables,
            clauses=current_bundle.num_clauses,
            solves=1,
            state="closed",
        ),
    )
    contract, _ = _prepare_v3(tmp_path, bundle=current_bundle, transport=fake)
    transport = contract.transport
    transport("POST", "http://piqd.test/sessions", b"{}", {})

    with pytest.raises(qualification.QualificationError, match="replayed") as raised:
        try:
            transport(
                "POST",
                f"http://piqd.test/sessions/{SESSION_ID}/solve",
                canonical_json_bytes(
                    {"assumptions": [], "include_model": True, "timeout_ms": 3_000}
                ),
                {},
            )
        except qualification.QualificationError:
            transport(
                "DELETE",
                f"http://piqd.test/sessions/{SESSION_ID}",
                None,
                {},
            )
            raise

    assert "replayed" in str(raised.value)
    assert sum(method == "DELETE" for method, _path in fake.calls) == 1
    assert not any(
        method == "GET" and path.endswith(SESSION_ID) for method, path in fake.calls
    )
    assert (contract.directory / qualification.CLOSE_RESPONSE_NAME).exists()


@pytest.mark.parametrize("effective_deadline_ms", [33_000, True, 33_000.0])
def test_production_v3_solve_forbids_sat_effective_deadline(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
    effective_deadline_ms: Any,
) -> None:
    solve = json.loads(_raw_solve(2))
    solve["solve_index"] = 1
    solve["replayed"] = False
    solve["timeout_ms"] = 3_000
    solve["effective_deadline_ms"] = effective_deadline_ms
    fake = FakeTransport(
        job=_job(
            overrides={
                "cnf_blob_hash": current_bundle.base_cnf_sha256,
                "identity_hash": current_bundle.raw_dimacs_identity,
                "producer_manifest_hash": current_bundle.producer_manifest_sha256,
            }
        ),
        solve1=canonical_json_bytes(solve),
    )
    contract, _ = _prepare_v3(tmp_path, bundle=current_bundle, transport=fake)
    contract.transport("POST", "http://piqd.test/sessions", b"{}", {})
    with pytest.raises(
        qualification.QualificationError, match="inexact schema|non-builtin"
    ):
        contract.transport(
            "POST",
            f"http://piqd.test/sessions/{SESSION_ID}/solve",
            canonical_json_bytes(
                {"assumptions": [], "include_model": True, "timeout_ms": 3_000}
            ),
            {},
        )


def test_production_v3_version_drift_never_seals(
    tmp_path: Path,
    current_bundle: provisioning.CurrentUnshardedBundle,
) -> None:
    contract, fake = _prepare_v3(tmp_path, bundle=current_bundle)
    fake.version_post = _version(version="drifted")
    with pytest.raises(
        qualification.QualificationError, match="version object changed"
    ):
        _complete_v3(contract)
    assert not (
        contract.directory / qualification.PRODUCTION_V3_QUALIFICATION_NAME
    ).exists()
