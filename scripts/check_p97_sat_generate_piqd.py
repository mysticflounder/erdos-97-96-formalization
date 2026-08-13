"""Capped AST/hash gate for the additive P97 PIQD SAT-generator launcher.

This checker reads source only. It never contacts PIQD, invokes a solver or
checker, runs Lean, or changes Git.
"""

from __future__ import annotations

import ast
import hashlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FROZEN_SHA256 = "5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817"
FILES = {
    "frozen": ROOT / "census/p97_search/sat_generate.py",
    "adapter": ROOT / "census/p97_search/phase3_piqd_sat_generate_adapter.py",
    "tests": ROOT / "census/p97_search/tests/test_phase3_piqd_sat_generate_adapter.py",
    "spec": ROOT / "docs/specs/p97-sat-generate-piqd-discovery-v1.md",
}


def _function(tree: ast.AST, name: str) -> ast.FunctionDef:
    matches = [
        node
        for node in ast.walk(tree)
        if isinstance(node, ast.FunctionDef) and node.name == name
    ]
    if len(matches) != 1:
        raise ValueError(f"expected one function {name!r}, found {len(matches)}")
    return matches[0]


def _class(tree: ast.AST, name: str) -> ast.ClassDef:
    matches = [
        node
        for node in ast.walk(tree)
        if isinstance(node, ast.ClassDef) and node.name == name
    ]
    if len(matches) != 1:
        raise ValueError(f"expected one class {name!r}, found {len(matches)}")
    return matches[0]


def _method(tree: ast.AST, class_name: str, name: str) -> ast.FunctionDef:
    owner = _class(tree, class_name)
    matches = [
        node
        for node in owner.body
        if isinstance(node, ast.FunctionDef) and node.name == name
    ]
    if len(matches) != 1:
        raise ValueError(
            f"expected one method {class_name}.{name}, found {len(matches)}"
        )
    return matches[0]


def _call_name(call: ast.Call) -> str | None:
    parts: list[str] = []
    value: ast.expr = call.func
    while isinstance(value, ast.Attribute):
        parts.append(value.attr)
        value = value.value
    if isinstance(value, ast.Name):
        parts.append(value.id)
        return ".".join(reversed(parts))
    return None


def _calls(node: ast.AST, name: str) -> list[ast.Call]:
    return [
        item
        for item in ast.walk(node)
        if isinstance(item, ast.Call) and _call_name(item) == name
    ]


def _literal_none_call(node: ast.AST, name: str, index: int) -> bool:
    return any(
        len(call.args) > index
        and isinstance(call.args[index], ast.Constant)
        and call.args[index].value is None
        for call in _calls(node, name)
    )


def _strings(node: ast.AST) -> set[str]:
    return {
        item.value
        for item in ast.walk(node)
        if isinstance(item, ast.Constant) and type(item.value) is str
    }


def _assigns_true(node: ast.AST, attribute: str) -> list[ast.Assign]:
    return [
        item
        for item in ast.walk(node)
        if isinstance(item, ast.Assign)
        and any(
            isinstance(target, ast.Attribute)
            and isinstance(target.value, ast.Name)
            and target.value.id == "self"
            and target.attr == attribute
            for target in item.targets
        )
        and isinstance(item.value, ast.Constant)
        and item.value.value is True
    ]


def main() -> int:
    raw = {name: path.read_bytes() for name, path in FILES.items()}
    source = {name: value.decode() for name, value in raw.items()}
    adapter_tree = ast.parse(source["adapter"], filename=str(FILES["adapter"]))
    tests_tree = ast.parse(source["tests"], filename=str(FILES["tests"]))
    enumerate_piqd = _function(adapter_tree, "enumerate_cell_with_piqd")
    seal = _function(adapter_tree, "_seal_production_encoding")
    prepare = _method(adapter_tree, "SatGeneratePiqdFactory", "prepare_encoding")
    factory_call = _method(adapter_tree, "SatGeneratePiqdFactory", "__call__")
    runner_call = _method(adapter_tree, "SatGeneratePiqdRunner", "__call__")
    runner_close = _method(adapter_tree, "SatGeneratePiqdRunner", "close")
    held_capture = _method(adapter_tree, "_HeldOutputDirectory", "capture")
    held_write = _method(adapter_tree, "_HeldOutputDirectory", "write_once")
    provenance = _function(adapter_tree, "_provenance_boundary")
    artifact_hashes = _function(adapter_tree, "_artifact_hashes")
    verify_provenance_manifest = _function(
        adapter_tree, "_verify_provenance_manifest"
    )
    verify_production = _function(adapter_tree, "verify_production_run_artifacts")
    verify_models = _function(adapter_tree, "_verify_model_and_bank_chain")
    cli = _function(adapter_tree, "main")
    adapter_strings = _strings(adapter_tree)
    test_names = {
        node.name
        for node in tests_tree.body
        if isinstance(node, ast.FunctionDef) and node.name.startswith("test_")
    }

    preflight_calls = _calls(enumerate_piqd, "factory.prepare_encoding")
    first_output_open = _calls(enumerate_piqd, "_HeldOutputDirectory")
    early_preflight = (
        len(preflight_calls) == 1
        and bool(first_output_open)
        and preflight_calls[0].lineno < first_output_open[0].lineno
    )
    close_stages = {
        "runner": _calls(runner_close, "self._runner.close"),
        "metadata": _calls(runner_close, "self._write_metadata"),
        "custody": _calls(runner_close, "self._custody.close"),
    }
    closed_assignments = _assigns_true(runner_close, "_closed")
    close_order = (
        all(len(calls) == 1 for calls in close_stages.values())
        and len(closed_assignments) == 1
        and close_stages["runner"][0].lineno
        < close_stages["metadata"][0].lineno
        < close_stages["custody"][0].lineno
        < closed_assignments[0].lineno
    )

    required_tests = {
        "test_frozen_sat_generate_remains_byte_identical",
        "test_default_piqd_rejects_unsupported_profile_before_filesystem",
        "test_custody_containment_and_crossed_seed_reject_before_io",
        "test_exact_native_path_and_builtin_boundaries",
        "test_manifest_capture_rejects_symlink_hardlink_and_oversize",
        "test_held_output_detects_symlink_and_repoint_race",
        "test_close_is_retry_safe_and_metadata_is_create_once",
        "test_factory_setup_failure_closes_underlying_without_masking",
        "test_persistent_discovery_literal_none_one_local_terminal_proof_and_publication",
        "test_failed_terminal_rerun_retains_and_hashes_pending_proof",
        "test_offline_verifier_rejects_unexpected_entry_without_deleting_it",
        "test_retained_transient_rejects_links_without_deleting_them",
        "test_unknown_or_transport_error_has_no_local_discovery_fallback",
        "test_close_failure_downgrades_complete_without_masking",
        "test_published_manifest_detects_metadata_tamper",
        "test_cli_defaults_to_piqd_and_legacy_is_explicit",
        "test_full_offline_verifier_rejects_semantic_tamper_beyond_hash_provenance",
        "test_cli_check_uses_additive_production_verifier",
    }
    normalized_spec = " ".join(source["spec"].split())
    checks = {
        "byte-frozen generator": hashlib.sha256(raw["frozen"]).hexdigest()
        == FROZEN_SHA256,
        "additive default and explicit legacy": {"piqd", "legacy-local"}
        <= _strings(cli)
        and bool(_calls(cli, "enumerate_cell_with_piqd"))
        and bool(_calls(cli, "sat.enumerate_cell")),
        "sealed profile before output open": early_preflight
        and bool(_calls(prepare, "_seal_production_encoding"))
        and bool(_calls(seal, "pinned_multiplicity.install"))
        and {
            "phase3-v0.2-projected-static",
            "sat_generate encoding does not equal the sealed production-v3 base",
        }
        <= adapter_strings,
        "public v3 factory": bool(
            _calls(
                factory_call,
                "incremental_v3.make_piqd_incremental_v3_solver_runner",
            )
        ),
        "literal None discovery": _literal_none_call(
            enumerate_piqd, "discovery", 2
        )
        and _literal_none_call(runner_call, "self._runner", 2),
        "one terminal local call and checker": len(
            _calls(enumerate_piqd, "local_proof_runner")
        )
        == 1
        and len(_calls(enumerate_piqd, "checker_runner")) == 1,
        "exact base and containment": {
            "PIQD seed must equal the exact output_dir/base.cnf artifact",
            "output_dir escapes the documented custody_root",
        }
        <= adapter_strings,
        "bounded nofollow held custody": bool(
            _calls(held_capture, "static._capture_file_at")
        )
        and bool(_calls(held_write, "static._write_once_at"))
        and bool(_calls(held_capture, "self._revalidate")),
        "retry-safe close order": close_order
        and len(_assigns_true(runner_close, "_underlying_closed")) == 1
        and len(_assigns_true(runner_close, "_closed_metadata_written")) == 1,
        "setup cleanup ownership": bool(_calls(factory_call, "runner.close")),
        "durable chained provenance": bool(_calls(provenance, "custody.capture"))
        and bool(_calls(verify_provenance_manifest, "_artifact_hashes"))
        and {
            "p97-sat-generate-piqd-provenance/v1",
            "piqd-lifecycle-failure.json",
        }
        <= adapter_strings,
        "exact hashed directory inventory": len(
            _calls(artifact_hashes, "custody.entries")
        )
        >= 2
        and bool(_calls(artifact_hashes, "custody.capture"))
        and not _calls(artifact_hashes, "Path.unlink")
        and {
            ".solver.cnf",
            ".solver.log",
            ".terminal.drat.pending",
            "unexpected PIQD caller output entries: ",
        }
        <= adapter_strings,
        "production-aware offline verifier": all(
            bool(_calls(verify_production, call))
            for call in (
                "_seal_production_encoding",
                "_verify_provenance_manifest",
                "_verify_caller_semantics",
                "_verify_model_and_bank_chain",
                "checker_runner",
            )
        )
        and bool(_calls(verify_models, "sat.iterate_cell"))
        and not _calls(verify_production, "sat.run_cadical")
        and not _calls(verify_production, "local_proof_runner")
        and bool(_calls(cli, "verify_production_run_artifacts")),
        "adversarial test matrix": required_tests <= test_names,
        "honest additive specification": all(
            phrase in normalized_spec
            for phrase in (
                "byte-frozen v2 artifact",
                "production entry point is `phase3_piqd_sat_generate_adapter.enumerate_cell_with_piqd`",
                "P97 adapter guarantees, not new PIQD guarantees",
                "before filesystem or transport access",
                "Production-wrapper output must be checked with the exported production-aware offline verifier",
                "remains the consumer only for frozen legacy-local output",
                "Publication and verification require an exact directory inventory",
                "rejects the run without deleting or rewriting the hostile entry",
            )
        ),
    }
    failed = [name for name, passed in checks.items() if not passed]
    print(f"checked={len(checks)} files={len(FILES)} tests={len(test_names)}")
    if failed:
        print("FAILED: " + ", ".join(failed))
        return 1
    print("PASS: AST/hash additive PIQD caller contract")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
