# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mutation tests for the Lean-ingress publication binding record.

Every test builds a tiny fake repository under ``tmp_path`` and monkeypatches
the semantic probe, so Lean and Lake are never invoked.
"""

from __future__ import annotations

import copy
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import bind_lean_ingress_record as binder

INGRESS_MODULE = "Fake.Ingress"
AGGREGATE_MODULE = "Fake.Aggregate"
DECLARATIONS = ["Fake.Ingress.alpha", "Fake.Ingress.beta"]
PARENT_KIND = "fake-replay-provenance"
PARENT_SCHEMA = "fake-replay-provenance/v1"
TOOLCHAIN = "leanprover/lean4:v4.27.0"


def fake_probe(
    *,
    repo_root: Path,
    lake_root: str,
    aggregate_module: str,
    declarations: list[str],
    timeout: int,
) -> dict[str, Any]:
    probe_text = binder.build_probe_text(aggregate_module, declarations)
    return {
        "toolchain": TOOLCHAIN,
        "lean_version": "Lean (version 4.27.0, commit deadbeef, Release)",
        "probe_sha256": hashlib.sha256(probe_text.encode("utf-8")).hexdigest(),
        "timeout_seconds": timeout,
        "declarations": [
            {
                "declaration": declaration,
                "check_output": f"@{declaration} : True",
                "axioms": ["propext", "Classical.choice", "Quot.sound"],
            }
            for declaration in declarations
        ],
    }


def unknown_constant_probe(**_kwargs: Any) -> dict[str, Any]:
    raise binder.BindingError(
        "semantic probe: lean reported an error: unknown constant 'Fake.Ingress.gamma'"
    )


def make_repo(tmp_path: Path) -> Path:
    repo = tmp_path / "repo"
    (repo / "lean" / "Fake").mkdir(parents=True)
    (repo / "lean" / "lean-toolchain").write_text(TOOLCHAIN + "\n", encoding="utf-8")
    (repo / "lean" / "Fake" / "Dep.lean").write_text(
        "import Mathlib.Tactic\n\ntheorem dep : True := trivial\n", encoding="utf-8"
    )
    (repo / "lean" / "Fake" / "Ingress.lean").write_text(
        "import Fake.Dep\n\ntheorem alpha : True := trivial\n"
        "theorem beta : True := trivial\n",
        encoding="utf-8",
    )
    (repo / "lean" / "Fake" / "Aggregate.lean").write_text(
        "import Fake.Ingress\n\ntheorem agg : True := trivial\n", encoding="utf-8"
    )
    (repo / "logs").mkdir()
    (repo / "logs" / "build.log").write_text(
        "info: fake build\n"
        "info: [42/42] Built Fake.Aggregate\n"
        "BUILD-EXIT=0\n",
        encoding="utf-8",
    )
    (repo / "docs").mkdir()
    (repo / "docs" / "parent.json").write_text(
        json.dumps({"schema": PARENT_SCHEMA, "payload": {"jobs": 3}}, indent=2) + "\n",
        encoding="utf-8",
    )
    return repo


def generate(repo: Path, **overrides: Any) -> dict[str, Any]:
    kwargs: dict[str, Any] = {
        "repo_root": repo,
        "lake_root": "lean",
        "source_root": "lean",
        "ingress_module": INGRESS_MODULE,
        "aggregate_module": AGGREGATE_MODULE,
        "declarations": list(DECLARATIONS),
        "parent_record": "docs/parent.json",
        "parent_kind": PARENT_KIND,
        "build_log": "logs/build.log",
        "lake_env_lean_timeout": 900,
    }
    kwargs.update(overrides)
    return binder.generate_record(**kwargs)


def rehash(record: dict[str, Any]) -> dict[str, Any]:
    record["self_hash"] = {
        "domain": binder.SELF_HASH_DOMAIN,
        "sha256": binder.compute_self_hash(record),
    }
    return record


@pytest.fixture()
def repo(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> Path:
    monkeypatch.setattr(binder, "run_semantic_probe", fake_probe)
    return make_repo(tmp_path)


def failure(record: dict[str, Any], repo: Path, **kwargs: Any) -> str:
    with pytest.raises(binder.BindingError) as excinfo:
        binder.check_record_object(record, repo, **kwargs)
    return str(excinfo.value)


def test_generate_then_check_passes(repo: Path) -> None:
    record = generate(repo)

    assert record["schema"] == binder.SCHEMA
    assert set(record) == set(binder.TOP_LEVEL_KEYS)
    assert record["ingress"]["path"] == "lean/Fake/Ingress.lean"
    assert record["aggregate"]["path"] == "lean/Fake/Aggregate.lean"
    assert record["import_edge"] == {"present": True, "line": "import Fake.Ingress"}
    assert record["closure"]["module_count"] == 2
    assert record["closure"]["external_imports"] == ["Mathlib.Tactic"]
    assert record["declarations"] == DECLARATIONS
    assert record["parent"]["schema"] == PARENT_SCHEMA
    assert record["build_evidence"]["build_exit_line"] == "BUILD-EXIT=0"
    assert record["build_evidence"]["aggregate_built_line"] == "info: [42/42] Built Fake.Aggregate"
    assert record["recapture"]["stable"] is True
    assert record["self_hash"]["sha256"] == binder.compute_self_hash(record)

    assert binder.check_record_object(record, repo) == record["self_hash"]["sha256"]
    assert binder.check_record_object(record, repo, semantic=True)


def test_cli_generate_and_check(repo: Path, capsys: pytest.CaptureFixture[str]) -> None:
    out = repo / "docs" / "binding.json"
    code = binder.main(
        [
            "generate",
            "--repo-root",
            str(repo),
            "--lake-root",
            "lean",
            "--source-root",
            "lean",
            "--ingress-module",
            INGRESS_MODULE,
            "--aggregate-module",
            AGGREGATE_MODULE,
            "--declaration",
            DECLARATIONS[0],
            "--declaration",
            DECLARATIONS[1],
            "--parent-record",
            "docs/parent.json",
            "--parent-kind",
            PARENT_KIND,
            "--build-log",
            "logs/build.log",
            "--out",
            "docs/binding.json",
        ]
    )
    assert code == 0
    assert "BINDING RECORD WRITTEN" in capsys.readouterr().out

    assert binder.main(["check", "--repo-root", str(repo), "--record", "docs/binding.json"]) == 0
    stdout = capsys.readouterr().out
    assert stdout.startswith("BINDING CHECK OK ")

    (repo / "lean" / "Fake" / "Ingress.lean").write_text("import Fake.Dep\n", encoding="utf-8")
    assert binder.main(["check", "--repo-root", str(repo), "--record", str(out)]) == 1
    assert "BINDING CHECK FAILED" in capsys.readouterr().err


def test_mutation_1_ingress_bytes(repo: Path) -> None:
    record = generate(repo)
    path = repo / "lean" / "Fake" / "Ingress.lean"
    path.write_text(path.read_text(encoding="utf-8") + "-- drift\n", encoding="utf-8")

    reason = failure(record, repo)
    assert reason.startswith("ingress byte_count mismatch")


def test_mutation_2_aggregate_bytes(repo: Path) -> None:
    record = generate(repo)
    path = repo / "lean" / "Fake" / "Aggregate.lean"
    path.write_text(path.read_text(encoding="utf-8") + "-- drift\n", encoding="utf-8")

    reason = failure(record, repo)
    assert reason.startswith("aggregate byte_count mismatch")


def test_mutation_3a_declaration_replaced_fails_semantically(
    repo: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    record = generate(repo)
    record["declarations"][0] = "Fake.Ingress.gamma"
    rehash(record)

    monkeypatch.setattr(binder, "run_semantic_probe", unknown_constant_probe)
    reason = failure(record, repo, semantic=True)
    assert "unknown constant 'Fake.Ingress.gamma'" in reason

    monkeypatch.setattr(binder, "run_semantic_probe", fake_probe)
    assert failure(record, repo, semantic=True).startswith("semantic mismatch")


def test_mutation_3b_declaration_replaced_breaks_self_hash(repo: Path) -> None:
    record = generate(repo)
    record["declarations"][0] = "Fake.Ingress.gamma"

    reason = failure(record, repo)
    assert reason.startswith("self_hash mismatch")


def test_mutation_4_import_edge_removed(repo: Path) -> None:
    record = generate(repo)
    path = repo / "lean" / "Fake" / "Aggregate.lean"
    path.write_text("theorem agg : True := trivial\n", encoding="utf-8")
    data = path.read_bytes()
    record["aggregate"]["byte_count"] = len(data)
    record["aggregate"]["sha256"] = hashlib.sha256(data).hexdigest()
    record["recapture"]["aggregate_sha256_recaptured"] = record["aggregate"]["sha256"]
    rehash(record)

    reason = failure(record, repo)
    assert reason.startswith("import edge missing")


def test_mutation_5_closure_gains_a_module(repo: Path) -> None:
    record = generate(repo)
    (repo / "lean" / "Fake" / "Extra.lean").write_text(
        "theorem extra : True := trivial\n", encoding="utf-8"
    )
    dep = repo / "lean" / "Fake" / "Dep.lean"
    dep.write_text("import Fake.Extra\n" + dep.read_text(encoding="utf-8"), encoding="utf-8")

    reason = failure(record, repo)
    assert reason.startswith("closure module_count mismatch")
    assert binder.compute_closure(repo, "lean", INGRESS_MODULE)["module_count"] == 3


def test_mutation_6a_parent_kind_crosses_record_kinds(repo: Path) -> None:
    record = generate(repo)
    record["parent"]["record_kind"] = "some-other-record-kind"
    rehash(record)

    reason = failure(record, repo)
    assert reason.startswith("parent link_digest mismatch")


def test_mutation_6b_parent_bytes(repo: Path) -> None:
    record = generate(repo)
    parent = repo / "docs" / "parent.json"
    parent.write_text(
        json.dumps({"schema": PARENT_SCHEMA, "payload": {"jobs": 4}}, indent=2) + "\n",
        encoding="utf-8",
    )

    reason = failure(record, repo)
    assert reason.startswith(("parent byte_count mismatch", "parent sha256 mismatch"))


def test_mutation_6c_parent_without_schema_is_rejected(repo: Path) -> None:
    (repo / "docs" / "parent.json").write_text(json.dumps({"payload": 1}), encoding="utf-8")

    with pytest.raises(binder.BindingError) as excinfo:
        generate(repo)
    assert "no 'schema' string" in str(excinfo.value)


def test_mutation_7_duplicate_json_key_rejected(repo: Path) -> None:
    record = generate(repo)
    out = repo / "docs" / "binding.json"
    binder.write_record(record, out)
    text = out.read_text(encoding="utf-8")
    marker = '"schema": "' + binder.SCHEMA + '",'
    assert marker in text
    out.write_text(text.replace(marker, marker + "\n  " + marker, 1), encoding="utf-8")

    with pytest.raises(binder.BindingError) as excinfo:
        binder.check_record_file(out, repo)
    assert "duplicate key in JSON object: 'schema'" in str(excinfo.value)


def test_mutation_7b_non_object_json_rejected(repo: Path) -> None:
    out = repo / "docs" / "binding.json"
    out.write_text("[1, 2, 3]\n", encoding="utf-8")

    with pytest.raises(binder.BindingError) as excinfo:
        binder.check_record_file(out, repo)
    assert "not an object" in str(excinfo.value)


def test_mutation_8a_symlinked_ingress_rejected(repo: Path) -> None:
    real = repo / "lean" / "Fake" / "Real.lean"
    real.write_text("import Fake.Dep\n", encoding="utf-8")
    link = repo / "lean" / "Fake" / "Ingress.lean"
    link.unlink()
    link.symlink_to(real)

    with pytest.raises(ValueError) as excinfo:
        generate(repo)
    assert "symlinked path component" in str(excinfo.value)


def test_mutation_8b_symlinked_ancestor_directory_rejected(repo: Path) -> None:
    real_dir = repo / "lean" / "Real"
    real_dir.mkdir()
    (real_dir / "parent.json").write_text(json.dumps({"schema": PARENT_SCHEMA}), encoding="utf-8")
    linked = repo / "linked"
    linked.symlink_to(real_dir, target_is_directory=True)

    with pytest.raises(ValueError) as excinfo:
        generate(repo, parent_record="linked/parent.json")
    assert "symlinked path component" in str(excinfo.value)


def test_mutation_8c_absolute_and_escaping_paths_rejected(repo: Path) -> None:
    with pytest.raises(ValueError) as absolute:
        generate(repo, build_log=str(repo / "logs" / "build.log"))
    assert "absolute path is not allowed" in str(absolute.value)

    with pytest.raises(ValueError) as escaping:
        generate(repo, parent_record="../parent.json")
    assert "escapes the repository" in str(escaping.value)

    with pytest.raises(ValueError) as escaping_module:
        generate(repo, source_root="lean/../lean")
    assert "escapes the repository" in str(escaping_module.value)


def test_mutation_9_extra_top_level_key_rejected(repo: Path) -> None:
    record = generate(repo)
    record["extra_note"] = "not part of the schema"
    rehash(record)

    reason = failure(record, repo)
    assert reason == "unexpected top-level keys in record: extra_note"


def test_mutation_9b_missing_top_level_key_rejected(repo: Path) -> None:
    record = generate(repo)
    del record["closure"]
    rehash(record)

    reason = failure(record, repo)
    assert reason == "missing top-level keys in record: closure"


def perturb(value: Any) -> Any:
    if isinstance(value, bool):
        return not value
    if isinstance(value, str):
        return value + "-perturbed"
    if isinstance(value, int):
        return value + 1
    if isinstance(value, list):
        return list(value) + ["perturbed"]
    if isinstance(value, dict):
        mutated = dict(value)
        mutated["perturbed"] = True
        return mutated
    return "perturbed"


def test_mutation_10_every_bound_field_changes_the_self_hash(repo: Path) -> None:
    record = generate(repo)
    baseline = binder.compute_self_hash(record)
    bound = [key for key in binder.TOP_LEVEL_KEYS if key != "self_hash"]
    assert len(bound) == len(binder.TOP_LEVEL_KEYS) - 1

    for key in bound:
        mutated = copy.deepcopy(record)
        mutated[key] = perturb(mutated[key])
        assert binder.compute_self_hash(mutated) != baseline, key


def test_duplicate_declarations_rejected(repo: Path) -> None:
    with pytest.raises(binder.BindingError) as excinfo:
        generate(repo, declarations=[DECLARATIONS[0], DECLARATIONS[0]])
    assert "duplicate declaration name" in str(excinfo.value)


def test_missing_build_lines_rejected(repo: Path) -> None:
    log = repo / "logs" / "build.log"
    log.write_text("info: fake build\nBUILD-EXIT=0\n", encoding="utf-8")
    with pytest.raises(binder.BindingError) as excinfo:
        generate(repo)
    assert "no line containing 'Built Fake.Aggregate'" in str(excinfo.value)

    log.write_text("info: [42/42] Built Fake.Aggregate\nBUILD-EXIT=1\n", encoding="utf-8")
    with pytest.raises(binder.BindingError) as excinfo:
        generate(repo)
    assert "records a failed build" in str(excinfo.value)


def test_recapture_detects_post_probe_mutation(repo: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    ingress = repo / "lean" / "Fake" / "Ingress.lean"

    def mutating_probe(**kwargs: Any) -> dict[str, Any]:
        ingress.write_text(
            ingress.read_text(encoding="utf-8") + "-- replay drift\n", encoding="utf-8"
        )
        return fake_probe(**kwargs)

    monkeypatch.setattr(binder, "run_semantic_probe", mutating_probe)
    with pytest.raises(binder.BindingError) as excinfo:
        generate(repo)
    assert "recapture failed: ingress source changed" in str(excinfo.value)


def test_lean_message_and_axiom_parsing() -> None:
    probe = "/tmp/probe.lean"
    output = (
        f"{probe}:5:0: information: @Fake.Ingress.alpha : True\n"
        f"{probe}:6:0: information: 'Fake.Ingress.alpha' depends on axioms: [propext,\n"
        "Classical.choice, Quot.sound]\n"
    )
    messages = binder.parse_lean_messages(output, probe)
    assert [message["severity"] for message in messages] == ["information", "information"]
    assert messages[0]["text"] == "@Fake.Ingress.alpha : True"
    assert binder.parse_axiom_message(messages[1]["text"], "Fake.Ingress.alpha") == [
        "propext",
        "Classical.choice",
        "Quot.sound",
    ]
    assert binder.parse_axiom_message(
        "'Fake.Ingress.alpha' does not depend on any axioms", "Fake.Ingress.alpha"
    ) == []
    errors = binder.parse_lean_messages(f"{probe}:5:0: error: unknown constant 'X'\n", probe)
    assert errors[0]["severity"] == "error"


def test_bare_info_messages_without_position_prefix() -> None:
    probe = "/tmp/probe.lean"
    output = (
        "Fake.Ingress.alpha : True\n"
        "'Fake.Ingress.alpha' depends on axioms: [propext,\n"
        " Classical.choice,\n"
        " Quot.sound]\n"
        "Fake.Agg.beta : True →\n"
        "  False\n"
        "'Fake.Agg.beta' depends on axioms: [propext, sorryAx]\n"
    )
    messages = binder.parse_lean_messages(output, probe)
    assert [message["severity"] for message in messages] == ["info"] * 4
    assert messages[0]["text"] == "Fake.Ingress.alpha : True"
    assert binder.parse_axiom_message(messages[1]["text"], "Fake.Ingress.alpha") == [
        "propext",
        "Classical.choice",
        "Quot.sound",
    ]
    assert messages[2]["text"] == "Fake.Agg.beta : True →\n  False"
    assert binder.parse_axiom_message(messages[3]["text"], "Fake.Agg.beta") == [
        "propext",
        "sorryAx",
    ]
