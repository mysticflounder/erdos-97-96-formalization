"""Governed cvc5-only long replay of the profile-0034 mirror targets.

The completed QF_NRA run is an authenticated parent, not a solver source.  This
producer reuses its hardened custody/PIQD machinery while pinning the two target
SMT-LIB byte streams before any live submission.  All solver execution remains
inside PIQD; ``--verify`` is entirely offline.
"""

from __future__ import annotations

from collections.abc import Mapping, Sequence
from contextlib import contextmanager
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_profile0034_new_mirror_supporting_edge_qfnra_piqd as _base,
)

_ORIGINAL = {
    name: getattr(_base, name)
    for name in (
        "SYSTEM_SCHEMA",
        "PRODUCER_VERSION",
        "DEFAULT_TIMEOUT_S",
        "LAUNCH_SCHEMA",
        "TERMINAL_SCHEMA",
        "LANE_ID",
        "RUN_OWNER",
        "RUN_ROOT",
        "CHECKPOINT_PATH",
        "SPEC_PATH",
        "RUNNER_PATH",
        "PARENT_ROOT",
        "PARENT_MANIFEST_PATH",
        "PARENT_LAUNCH_PATH",
        "PARENT_TERMINAL_PATH",
        "PARENT_RESULT_PATH",
        "PARENT_SOURCE_MANIFEST_PATH",
        "PARENT_PROFILE_ROOT",
        "RUN_MANIFEST_SCHEMA",
        "PARENT_MANIFEST_SHA256",
        "PARENT_LAUNCH_SHA256",
        "PARENT_TERMINAL_SHA256",
        "PARENT_MANIFEST_FILE_SHA256",
        "PARENT_LAUNCH_FILE_SHA256",
        "PARENT_TERMINAL_FILE_SHA256",
    )
}

LANE_ID = "exactfive-profile0034-new-mirror-supporting-edge-long-replay-piqd-20260904"
RUN_ID = "run-0001"
RUN_OWNER = "profile0034-new-mirror-supporting-edge-long-replay-piqd"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / "docs/specs/p97-exactfive-profile0034-new-mirror-supporting-edge-long-replay-piqd-v1.md"
RUNNER_PATH = REPOSITORY_ROOT / "scripts/run_exactfive_profile0034_new_mirror_supporting_edge_long_replay_piqd.py"
PARENT_ROOT = REPOSITORY_ROOT / "scratch/runs/exactfive-profile0034-new-mirror-supporting-edge-qfnra-piqd-20260904/run-0001"
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_RESULT_PATH = PARENT_ROOT / "artifacts/mirror-radius-lt/result.json"
PARENT_SOURCE_MANIFEST_PATH = PARENT_ROOT / "artifacts/mirror-radius-lt/source-manifest.json"
PARENT_PROFILE_ROOT = PARENT_ROOT / "artifacts/mirror-radius-lt"

PARENT_MANIFEST_SHA256 = "966b9cfcb90f8542e19d613d4817a733ae766c74635ace3b3e83a328c3731c05"
PARENT_LAUNCH_SHA256 = "95e49630f86c2e7cd7961cd45302fd672b228c999f69fcdfffd51d2f6a9e0648"
PARENT_TERMINAL_SHA256 = "621c8f7f8bd435e63004b238b28ba108e291078157e3a164c3c2b7a931b30204"
PARENT_MANIFEST_FILE_SHA256 = "35b379483456df4e4e2ecb5e960c5697bb1ca25087b810fc95b2f38a8f03f279"
PARENT_LAUNCH_FILE_SHA256 = "a2c553ff19c8c57434379568ac74eaa64a2582599397c9ccdcfaf443da92d58c"
PARENT_TERMINAL_FILE_SHA256 = "7563a658da37ca524debaba7c5286d1358478f1c8458a099cf548e0985d49f76"
PARENT_TARGET_QUERY_SHA256 = {
    "mirror-radius-lt": "db29694cf075b978bb586fde6b5490fa0aa3cf318635cef59cddbf4c18c3862a",
    "mirror-radius-gt": "9a5c4cfd3154224d46f3cb81df6c5e4a13f0ecc8783e9bfaadcdeb9040402cbf",
}
PARENT_TARGET_RESULT_SHA256 = {
    "mirror-radius-lt": "eb3644e2176b2bf17351cde18bdf9d478a80e49007188573b8351c555bf1eba0",
    "mirror-radius-gt": "f7b07f6ce060ffcc3950a3f97e6be64944ffa831406acff8138a14b6bd004c9f",
}
PARENT_CONTROL_RESULT_SHA256 = {
    "control-positive": "11154d4b7f06a281c84ae91090ad81b1aeeb52f4892b973f27b9e60ce4a4179b",
    "control-negative": "ae8b89534001c98853bdf373492e89a5c4644ce5496bbf8e8caf0ca583d150c2",
}
PARENT_CONTROL_SOURCE_SHA256 = {
    "control-positive": "bb805ab3157e161693a13fd504d5a9124b5261799654eaa5994062eba4718f92",
    "control-negative": "8b04308628c79a617cbca0fdb8d8002f7c29ba306c6b4f464a876c44faa1edc0",
}
PARENT_SOURCE_PRODUCER_SHA256 = "fd8906d1b698c4779ccf8d6f373af9cd5d55c57eb7c3c89507f94862632696b3"

SYSTEM_SCHEMA = "p97-exactfive-profile0034-new-mirror-supporting-edge-long-replay-system/v1"
PRODUCER_VERSION = "p97-exactfive-profile0034-new-mirror-supporting-edge-long-replay-piqd/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-new-mirror-supporting-edge-long-replay-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-new-mirror-supporting-edge-long-replay-result/v1"
DEFAULT_TIMEOUT_S = 300.0
MAX_WORKERS = 2
TARGET_KEYS = ("mirror-radius-lt", "mirror-radius-gt")
QUERY_KEYS = ("control-positive", "control-negative", *TARGET_KEYS)
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_profile0034_new_mirror_supporting_edge_long_replay_piqd.py",
    "census/card_head/tests/test_exactfive_profile0034_new_mirror_supporting_edge_long_replay_piqd.py",
    "docs/specs/p97-exactfive-profile0034-new-mirror-supporting-edge-long-replay-piqd-v1.md",
    "scripts/run_exactfive_profile0034_new_mirror_supporting_edge_long_replay_piqd.py",
]

_ORIGINAL_PARENT_MODULE = _base.parent
_ORIGINAL_PREPARE = _base.prepare_query
_ORIGINAL_SOURCE_SNAPSHOTS = _base._source_snapshots
_ORIGINAL_EXPECTED_MANIFEST = _base._expected_run_manifest
_ORIGINAL_REQUIRE_CONTROL = _base._require_control
_ORIGINAL_AUTHENTICATE = _base.authenticate_source_orders
_ORIGINAL_VERIFY_RUN = _base.verify_run
_ORIGINAL_CHECKPOINT_PATHS = _base._CHECKPOINT_OWNED_PATHS


class Profile0034NewMirrorSupportingEdgeLongReplayError(_base.Profile0034NewMirrorSupportingEdgeError):
    """The long replay producer failed closed."""


Error = Profile0034NewMirrorSupportingEdgeLongReplayError


def _sync() -> None:
    """Copy monkeypatchable facade state into the reused implementation."""
    for name in (
        "LANE_ID", "RUN_ID", "RUN_OWNER", "REPOSITORY_ROOT", "RUN_ROOT",
        "CHECKPOINT_PATH", "SPEC_PATH", "RUNNER_PATH", "PARENT_ROOT",
        "PARENT_MANIFEST_PATH", "PARENT_LAUNCH_PATH", "PARENT_TERMINAL_PATH",
        "PARENT_RESULT_PATH", "PARENT_SOURCE_MANIFEST_PATH", "PARENT_PROFILE_ROOT",
        "PARENT_MANIFEST_SHA256", "PARENT_LAUNCH_SHA256", "PARENT_TERMINAL_SHA256",
        "PARENT_MANIFEST_FILE_SHA256", "PARENT_LAUNCH_FILE_SHA256",
        "PARENT_TERMINAL_FILE_SHA256", "SYSTEM_SCHEMA", "PRODUCER_VERSION",
        "LAUNCH_SCHEMA", "TERMINAL_SCHEMA",
        "DEFAULT_TIMEOUT_S",
    ):
        setattr(_base, name, globals()[name])
    _base.adapter.SOLVERS = ("cvc5",)
    _base._CHECKPOINT_OWNED_PATHS = _CHECKPOINT_OWNED_PATHS
    _base.authenticate_source_orders = authenticate_source_orders
    _base.prepare_query = prepare_query
    _base._source_snapshots = _source_snapshots
    _base._expected_run_manifest = _expected_run_manifest
    _base._require_control = _require_control
    _base._launch_record = _launch_record
    _base.verify_run = _verify_run_strict


_CONFIG_ATTRS = (
    *_ORIGINAL.keys(), "_CHECKPOINT_OWNED_PATHS", "parent",
    "authenticate_source_orders", "prepare_query", "_source_snapshots",
    "_expected_run_manifest", "_require_control", "_launch_record",
    "verify_run",
)


@contextmanager
def _base_scope():
    """Temporarily configure the reused implementation and always restore it."""
    saved = {name: getattr(_base, name) for name in _CONFIG_ATTRS}
    saved_solvers = _base.adapter.SOLVERS
    try:
        _sync()
        yield
    finally:
        for name, value in saved.items():
            setattr(_base, name, value)
        _base.adapter.SOLVERS = saved_solvers


def _restore() -> None:
    for name, value in _ORIGINAL.items():
        setattr(_base, name, value)
    _base.parent = _ORIGINAL_PARENT_MODULE
    _base.adapter.SOLVERS = ("z3", "cvc5")
    _base.authenticate_source_orders = _ORIGINAL_AUTHENTICATE
    _base.prepare_query = _ORIGINAL_PREPARE
    _base._source_snapshots = _ORIGINAL_SOURCE_SNAPSHOTS
    _base._expected_run_manifest = _ORIGINAL_EXPECTED_MANIFEST
    _base._require_control = _ORIGINAL_REQUIRE_CONTROL
    _base._CHECKPOINT_OWNED_PATHS = _ORIGINAL_CHECKPOINT_PATHS


def _parent_authenticate() -> dict[str, Any]:
    """Validate the completed QF_NRA parent without contacting PIQD."""
    _sync()
    read = _base._read_regular
    manifest_payload = read(PARENT_MANIFEST_PATH)
    launch_payload = read(PARENT_LAUNCH_PATH)
    terminal_payload = read(PARENT_TERMINAL_PATH)
    if (_base._sha(manifest_payload), _base._sha(launch_payload), _base._sha(terminal_payload)) != (
        PARENT_MANIFEST_FILE_SHA256, PARENT_LAUNCH_FILE_SHA256, PARENT_TERMINAL_FILE_SHA256
    ):
        raise Error("parent manifest/launch/terminal bytes drifted")
    manifest = _base._strict_json(manifest_payload, "parent run manifest")
    launch = _base._strict_json(launch_payload, "parent launch")
    terminal = _base._strict_json(terminal_payload, "parent terminal")
    if (
        manifest.get("schema") != _ORIGINAL["RUN_MANIFEST_SCHEMA"]
    ):
        raise Error("parent manifest schema drifted")
    if manifest.get("manifest_sha256") != PARENT_MANIFEST_SHA256 or manifest.get("manifest_sha256") != _base._self_hash(manifest, "manifest_sha256"):
        raise Error("parent manifest hash drifted")
    if launch.get("schema") != _ORIGINAL["LAUNCH_SCHEMA"] or launch.get("launch_sha256") != PARENT_LAUNCH_SHA256 or launch.get("launch_sha256") != _base._self_hash(launch, "launch_sha256"):
        raise Error("parent launch drifted")
    if terminal.get("schema") != _ORIGINAL["TERMINAL_SCHEMA"] or terminal.get("terminal_sha256") != PARENT_TERMINAL_SHA256 or terminal.get("terminal_sha256") != _base._self_hash(terminal, "terminal_sha256"):
        raise Error("parent terminal drifted")
    if launch.get("timeout_ms") != 60_000 or launch.get("workers") != 2 or terminal.get("status") != "TARGET_INCONCLUSIVE":
        raise Error("parent run parameters or status drifted")
    descriptor = _base._strict_json(read(PARENT_ROOT / "artifacts/mirror-radius-lt/descriptor.json"), "parent target descriptor")
    semantic_system = descriptor.get("semantic_input", {}).get("system")
    ranks = semantic_system.get("ranks") if isinstance(semantic_system, dict) else None
    if not isinstance(ranks, dict) or set(ranks) != set(_base.CLASS_IDS) or set(ranks.values()) != set(range(13)):
        raise Error("parent exact ranks are malformed")
    order = tuple(sorted(ranks, key=ranks.__getitem__))
    if order != _base.EXPECTED_ORDER or _base._sha(_base._canonical(list(order))) != _base.EXPECTED_ORDER_SHA256:
        raise Error("parent mirror order drifted")
    prior = {
        "schema": "p97-profile0034-new-mirror-parent-custody/v1",
        "profile_index": _base.PROFILE_INDEX,
        "profile_sha256": _base.PROFILE_SHA256,
        "parent_manifest_sha256": _ORIGINAL["PARENT_MANIFEST_SHA256"],
        "parent_launch_sha256": _ORIGINAL["PARENT_LAUNCH_SHA256"],
        "parent_terminal_sha256": _ORIGINAL["PARENT_TERMINAL_SHA256"],
        "orders": {"mirror": list(order)},
        "order_sha256": PARENT_ORDER_SHA256,
        "result_sha256s": {
            "control-positive": "73c00e58ea8753bbca9003e3c87bc2dd7f542f1911793467ef95baaf51b3ced7",
            "control-negative": "fca7c0b8cb9c616dd79230e4af5559aec063be4aaea1fe561749c6fdf3b88fa9",
            "parent-z3-mirror": "0db3c932e361daf67c9ba70b9c5c5ea565cc307fc7901f2aba3058758e502875",
            "parent-cvc5-direct": "b274ee7274eea49220cd814450c50246eb07e9f0c66413899d646a2685d80f69",
        },
    }
    old_auth = _base.authenticate_source_orders
    old_schema = _base.SYSTEM_SCHEMA
    old_producer = _base.PRODUCER_VERSION
    old_launch = _base.LAUNCH_SCHEMA
    old_terminal = _base.TERMINAL_SCHEMA
    old_sources = _base._source_snapshots
    old_parent_module = _base.parent
    old_prepare = _base.prepare_query
    output_root = PARENT_ROOT
    try:
        _base.SYSTEM_SCHEMA = _ORIGINAL["SYSTEM_SCHEMA"]
        _base.PRODUCER_VERSION = _ORIGINAL["PRODUCER_VERSION"]
        _base.LAUNCH_SCHEMA = _ORIGINAL["LAUNCH_SCHEMA"]
        _base.TERMINAL_SCHEMA = _ORIGINAL["TERMINAL_SCHEMA"]
        _base.adapter.SOLVERS = ("z3", "cvc5")
        _base.authenticate_source_orders = lambda: prior
        _base.prepare_query = _ORIGINAL_PREPARE
        _base._source_snapshots = _ORIGINAL_SOURCE_SNAPSHOTS
        _base.parent = _ORIGINAL_PARENT_MODULE
        _base.SPEC_PATH = _ORIGINAL["SPEC_PATH"]
        # The QF_NRA parent itself snapshots its alternate-order predecessor;
        # restore that source root only while replaying the parent's custody.
        _base.PARENT_ROOT = _ORIGINAL["PARENT_ROOT"]
        _base.PARENT_MANIFEST_PATH = _ORIGINAL["PARENT_MANIFEST_PATH"]
        _base.PARENT_LAUNCH_PATH = _ORIGINAL["PARENT_LAUNCH_PATH"]
        _base.PARENT_TERMINAL_PATH = _ORIGINAL["PARENT_TERMINAL_PATH"]
        for key in ("control-positive", "control-negative", "mirror-radius-lt", "mirror-radius-gt"):
            system = _base.build_control_system(key.removeprefix("control-")) if key.startswith("control-") else _base.build_target_system("mirror", key.rsplit("-", 1)[-1])
            prepared = _ORIGINAL_PREPARE(system, timeout_ms=60_000)
            _base.verify_adapter_tree(prepared, output_root / "artifacts" / key)
    except Exception as exc:
        raise Error(f"parent artifact replay failed: {exc}") from exc
    finally:
        _base.authenticate_source_orders = old_auth
        _base.prepare_query = old_prepare
        _base.SYSTEM_SCHEMA = old_schema
        _base.PRODUCER_VERSION = old_producer
        _base.LAUNCH_SCHEMA = old_launch
        _base.TERMINAL_SCHEMA = old_terminal
        _base._source_snapshots = old_sources
        _base.parent = old_parent_module
        _base.SPEC_PATH = SPEC_PATH
        _base.PARENT_ROOT = output_root
        _base.PARENT_MANIFEST_PATH = output_root / "run_manifest.json"
        _base.PARENT_LAUNCH_PATH = output_root / "events/launch.json"
        _base.PARENT_TERMINAL_PATH = output_root / "events/terminal.json"
        _base.adapter.SOLVERS = ("cvc5",)
    return prior


PARENT_ORDER_SHA256 = _base.EXPECTED_ORDER_SHA256


def _authenticate_impl() -> dict[str, Any]:
    prior = _parent_authenticate()
    terminal = _base._strict_json(_base._read_regular(PARENT_TERMINAL_PATH), "parent terminal")
    # The parent result is context only.  Pin both target query byte streams.
    for key in ("control-positive", "control-negative", "mirror-radius-lt", "mirror-radius-gt"):
        original = _base._read_regular(PARENT_ROOT / "artifacts" / key / "original.smt2")
        journal = _base._read_regular(PARENT_ROOT / "artifacts" / key / "journal.smt2")
        result = _base._read_regular(PARENT_ROOT / "artifacts" / key / "result.json")
        source_manifest = _base._read_regular(PARENT_ROOT / "artifacts" / key / "source-manifest.json")
        expected_result = PARENT_CONTROL_RESULT_SHA256.get(key, PARENT_TARGET_RESULT_SHA256.get(key))
        expected_source = PARENT_CONTROL_SOURCE_SHA256.get(key, "15ccfd00264a1fd38ee86b6ca6377cbc549dcaa53fc7d622338ae052401c4c47" if key.endswith("lt") else "726ba3a044f10816f1cb764f7ff9738adcdf5f84a2b0c1abf4fb856cf1d4933c")
        expected_query = PARENT_TARGET_QUERY_SHA256.get(key)
        if ((expected_query is not None and (_base._sha(original) != expected_query or _base._sha(journal) != expected_query))
                or _base._sha(result) != expected_result
                or terminal.get("results", {}).get(key, {}).get("result_sha256") != expected_result
                or _base._sha(source_manifest) != expected_source
                or original != journal):
            raise Error(f"parent target query bytes drifted: {key}")
    if _base._sha(_base._read_regular(Path(_base.__file__))) != PARENT_SOURCE_PRODUCER_SHA256:
        raise Error("parent source producer bytes drifted")
    return prior


def authenticate_source_orders() -> dict[str, Any]:
    with _base_scope():
        return _authenticate_impl()


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    engines = result.get("engines", [])
    if len(engines) != 1 or engines[0].get("solver") != "cvc5" or engines[0].get("raw_status") != expected:
        raise Error(f"{key} did not produce cvc5 {expected}")
    if expected == "SAT" and engines[0].get("effective_status") != "SAT_SEMANTICALLY_REPLAYED":
        raise Error("positive control failed exact replay")


def _launch_record(manifest: Mapping[str, Any], server: str, timeout_ms: int, workers: int) -> dict[str, Any]:
    if timeout_ms != 300_000:
        raise Error("long replay requires timeout_ms=300000")
    launch = _ORIGINAL_LAUNCH_RECORD(manifest, server, timeout_ms, workers)
    launch.update({"owner": RUN_OWNER, "base_head": manifest.get("base_head"), "effective_deadline_ms": 330_000})
    launch["launch_sha256"] = _base._self_hash(launch, "launch_sha256")
    return launch


def _verify_run_strict() -> dict[str, Any]:
    root, manifest = _base._validate_existing_run_root()
    launch = _base._strict_json(_base._read_regular(root / "events/launch.json"), "launch")
    if (
        launch.get("schema") != LAUNCH_SCHEMA
        or launch.get("lane_id") != LANE_ID
        or launch.get("run_id") != RUN_ID
        or launch.get("owner") != RUN_OWNER
        or launch.get("base_head") != manifest.get("base_head")
        or launch.get("run_manifest_sha256") != manifest.get("manifest_sha256")
        or launch.get("timeout_ms") != 300_000
        or launch.get("effective_deadline_ms") != 330_000
        or launch.get("workers") != 2
        or launch.get("launch_sha256") != _base._self_hash(launch, "launch_sha256")
        or not isinstance(launch.get("server"), str)
    ):
        raise Error("launch record is malformed")
    _base._validate_server(launch["server"])
    return _ORIGINAL_VERIFY_RUN()


_ORIGINAL_LAUNCH_RECORD = _base._launch_record


def _prepare_impl(system: dict[str, Any], *, timeout_ms: int = 300_000) -> _base.PreparedQuery:
    try:
        prepared = _ORIGINAL_PREPARE(system, timeout_ms=timeout_ms)
    except _base.Profile0034NewMirrorSupportingEdgeError as exc:
        raise Error(str(exc)) from exc
    descriptor = dict(prepared.query.descriptor)
    descriptor["producer"] = {"id": "p97-profile0034-new-mirror-supporting-edge-long-replay-piqd", "version": "v1"}
    descriptor["stage_id"] = "profile0034-new-mirror-supporting-edge-long-replay"
    semantic = dict(descriptor["semantic_input"])
    semantic["producer_version"] = PRODUCER_VERSION
    descriptor["semantic_input"] = semantic
    descriptor["semantic_sha256"] = _base._sha(_base._canonical(semantic))
    descriptor_bytes = _base._json(descriptor)
    query = _base.adapter.SourceSemanticQuery(
        descriptor, descriptor_bytes, prepared.query.original_smt2,
        prepared.query.journal_commands, prepared.query.journal_smt2,
        prepared.query.source_files,
    )
    if prepared.system["kind"] == "target":
        key = prepared.key
        original = _base._read_regular(PARENT_ROOT / "artifacts" / key / "original.smt2")
        journal = _base._read_regular(PARENT_ROOT / "artifacts" / key / "journal.smt2")
        if query.original_smt2 != original or query.journal_smt2 != journal:
            raise Error(f"target query bytes are not source-preserving: {key}")
    return _base.PreparedQuery(prepared.key, prepared.system, query)


def prepare_query(system: dict[str, Any], *, timeout_ms: int = 300_000) -> _base.PreparedQuery:
    with _base_scope():
        return _prepare_impl(system, timeout_ms=timeout_ms)


def _source_snapshots(prior: Mapping[str, Any]):
    """Use only files present in the authenticated QF_NRA parent run."""
    names = [
        ("parent-run-manifest.json", PARENT_MANIFEST_PATH),
        ("parent-launch.json", PARENT_LAUNCH_PATH),
        ("parent-terminal.json", PARENT_TERMINAL_PATH),
        ("implementation-exact-parser.py", Path(_base.bo_source.__file__)),
        ("implementation-order-replay.py", Path(_base.frozen_order.__file__)),
        ("implementation-coverage.py", Path(_base.coverage.__file__)),
        ("implementation-adapter.py", Path(_base.adapter.__file__)),
        ("specification.md", SPEC_PATH),
    ]
    for key in ("control-positive", "control-negative", "mirror-radius-lt", "mirror-radius-gt"):
        names.extend(((f"parent-{key}-result.json", PARENT_ROOT / "artifacts" / key / "result.json"),
                      (f"parent-{key}-source-manifest.json", PARENT_ROOT / "artifacts" / key / "source-manifest.json")))
    return tuple(_base.adapter.SourceSnapshot(name, _base._read_regular(path)) for name, path in sorted(names))


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    _sync()
    checkpoint = _base._load_checkpoint()
    source_paths = [Path(__file__), SPEC_PATH, RUNNER_PATH, Path(_base.__file__),
                    Path(_base.bo_source.__file__),
                    Path(_base.frozen_nra.__file__), Path(_base.frozen_order.__file__),
                    Path(_base.coverage.__file__), Path(_base.adapter.__file__)]
    inputs = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    for key in ("control-positive", "control-negative", "mirror-radius-lt", "mirror-radius-gt"):
        inputs.extend(PARENT_ROOT / "artifacts" / key / name for name in ("result.json", "source-manifest.json", "original.smt2", "journal.smt2"))
    result = {
        "schema": "worktree-run-manifest/v1", "lane_id": LANE_ID, "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}", "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"], "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _base._source_digest_map(source_paths),
        "input_digests": _base._source_digest_map(inputs), "created_utc": created_utc,
    }
    result["manifest_sha256"] = _base._self_hash(result, "manifest_sha256")
    return result


def build_control_system(control: str) -> dict[str, Any]:
    with _base_scope():
        return _base.build_control_system(control)  # type: ignore[arg-type]


def build_target_system(order_id: str, branch_id: str) -> dict[str, Any]:
    with _base_scope():
        return _base.build_target_system(order_id, branch_id)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    with _base_scope():
        return _base.build_smt_commands(system)


def verify_adapter_tree(prepared: _base.PreparedQuery, output_directory: Path) -> dict[str, Any]:
    with _base_scope():
        return _base.verify_adapter_tree(prepared, output_directory)


def run_query(prepared: _base.PreparedQuery, output_directory: Path, transport: Any) -> dict[str, Any]:
    with _base_scope():
        return _base.run_query(prepared, output_directory, transport)


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    with _base_scope():
        return _base.ensure_run_root()


def verify_run() -> dict[str, Any]:
    with _base_scope():
        return _verify_run_strict()


def run_diagnostic(*, server: str = "http://127.0.0.1:7272", timeout_s: float = DEFAULT_TIMEOUT_S, workers: int = 2) -> dict[str, Any]:
    with _base_scope():
        try:
            return _base.run_diagnostic(server=server, timeout_s=timeout_s, workers=workers)
        except _base.Profile0034NewMirrorSupportingEdgeError as exc:
            raise Error(str(exc)) from exc


def main(argv: Sequence[str] | None = None) -> int:
    with _base_scope():
        return _base.main(argv)


for _name in (
    "CONTROL_IDS", "ORDER_IDS", "BRANCH_IDS", "BRANCH_RELATIONS", "TARGET_KEYS",
    "QUERY_KEYS", "TARGET_VARIABLES", "EXPECTED_ORDER", "EXPECTED_ORDER_SHA256",
    "PROFILE_INDEX", "PROFILE_SHA256", "FALSE_CLAIMS", "RUN_MANIFEST_SCHEMA",
    "PreparedQuery", "formula_inventory", "check_coordinates", "check_supporting_edges",
    "supporting_edge_constraints", "verify_sat_model", "_read_terminal", "_validate_existing_run_root",
    "_launch_record", "_terminal_record", "_sha", "_canonical", "_json", "_self_hash",
    "_read_regular", "_strict_json", "_target_key", "Profile0034NewMirrorSupportingEdgeError",
):
    if _name not in globals() and hasattr(_base, _name):
        globals()[_name] = getattr(_base, _name)

__all__ = [
    "DEFAULT_TIMEOUT_S",
    "LANE_ID",
    "QUERY_KEYS",
    "RUN_ID",
    "RUN_ROOT",
    "TARGET_KEYS",
    "Profile0034NewMirrorSupportingEdgeLongReplayError",
    "authenticate_source_orders",
    "build_control_system",
    "build_smt_commands",
    "build_target_system",
    "main",
    "prepare_query",
    "run_diagnostic",
    "verify_adapter_tree",
    "verify_run",
]
