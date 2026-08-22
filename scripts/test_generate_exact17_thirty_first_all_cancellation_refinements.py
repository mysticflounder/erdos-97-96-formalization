from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
GENERATOR = ROOT / "scripts" / "generate_exact17_thirty_first_all_cancellation_refinements.py"
ANALYSIS = (
    ROOT
    / "scratch"
    / "exact17-lean-to-sat"
    / "audit-thirty-first-model-analysis-hardened-terminal.json"
)
DIAGNOSTIC_ANALYSIS = (
    ROOT
    / "scratch"
    / "exact17-lean-to-sat"
    / "piqd-thirty-first-root-model-analysis.json"
)
PARENT_LEDGER = (
    ROOT
    / "scratch"
    / "exact17-lean-to-sat"
    / "piqd-thirtieth-root-all-cancellation-family.json"
)
PARENT_CNF = (
    ROOT
    / "scratch"
    / "exact17-lean-to-sat"
    / "exact17-thirty-first-root-thirtieth-model-refinements.cnf"
)


def generator_module():
    spec = importlib.util.spec_from_file_location("exact17_child32_generator_test", GENERATOR)
    assert spec and spec.loader
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def publication_skeleton(module, lean_output: Path) -> dict[str, object]:
    analysis = module.validate_analysis(ANALYSIS)
    order_index, order = module.authenticated_order(analysis)
    outputs = {}
    for index, path in enumerate(module.output_paths(lean_output)):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(f"output {index}\n", encoding="utf-8")
        outputs[str(path)] = hashlib.sha256(path.read_bytes()).hexdigest()
    return {
        "schema": module.LEDGER_SCHEMA,
        "publication_protocol": module.PUBLICATION_PROTOCOL,
        "source_analysis": str(ANALYSIS.resolve()),
        "source_analysis_sha256": module.ANALYSIS_SHA256,
        "terminal_artifact": module.terminal_artifact_binding(analysis),
        "parent_ledger": str(PARENT_LEDGER.resolve()),
        "parent_ledger_sha256": module.PARENT_LEDGER_SHA256,
        "parent_cnf": {
            "path": str(PARENT_CNF.resolve()),
            "sha256": module.PARENT_CNF_SHA256,
            "bytes_verified": True,
        },
        "record_count": 237,
        "reverse_record_count": 237,
        "distinct_support_count": 135,
        "minimal_support_count": 84,
        "parent_subsumed_support_count": 0,
        "emitted_clause_count": 336,
        "lean_projection": {
            "schema": "path-row-choice-subset/v1",
            "record_count": 168,
            "preserves_full_records": True,
        },
        "shard_count": 4,
        "generated_outputs": outputs,
        "named_order": {
            "index": order_index,
            "tuple": list(order),
            "reverse_tuple": list(reversed(order)),
            "table_sha256": module.order_table_sha256(),
        },
        "implementation_identities": module.implementation_identities(),
        "source_identities": module.source_identities(),
        "entries": [],
    }


def write_ledger(path: Path, payload: dict[str, object]) -> None:
    path.write_text(json.dumps(payload, sort_keys=True), encoding="utf-8")


def test_authenticated_child31_analysis_passes() -> None:
    module = generator_module()
    analysis = module.validate_analysis(ANALYSIS)
    assert analysis["cnf_sha256"] == module.PARENT_CNF_SHA256
    assert len(analysis["rows"]) == 17
    assert module.authenticated_order(analysis)[0] == analysis["named_orders"][0]


def test_diagnostic_child31_analysis_is_rejected_for_production() -> None:
    module = generator_module()
    with pytest.raises(ValueError, match="analysis hash drifted"):
        module.validate_analysis(DIAGNOSTIC_ANALYSIS)

    module.ANALYSIS_SHA256 = hashlib.sha256(DIAGNOSTIC_ANALYSIS.read_bytes()).hexdigest()
    with pytest.raises(ValueError, match="diagnostic-only"):
        module.validate_analysis(DIAGNOSTIC_ANALYSIS)


def test_analysis_byte_mutation_is_rejected(tmp_path: Path) -> None:
    module = generator_module()
    mutated = tmp_path / "analysis.json"
    mutated.write_bytes(ANALYSIS.read_bytes() + b"\n")
    with pytest.raises(ValueError, match="analysis hash drifted"):
        module.validate_analysis(mutated)


def test_duplicate_json_keys_are_rejected(tmp_path: Path) -> None:
    module = generator_module()
    duplicate = tmp_path / "duplicate.json"
    duplicate.write_text('{"status":"PASS","status":"FAIL"}\n', encoding="utf-8")
    with pytest.raises(ValueError, match="duplicate JSON key"):
        module.load_strict_json(duplicate)


def test_staging_path_is_exclusive(tmp_path: Path) -> None:
    module = generator_module()
    destination = tmp_path / "output.txt"
    staged = module.stage_text(destination, "first\n")
    try:
        with pytest.raises(FileExistsError):
            module.stage_text(destination, "second\n")
        assert staged.read_text(encoding="utf-8") == "first\n"
    finally:
        staged.unlink(missing_ok=True)


def test_immutable_publication_is_ledger_last_and_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = generator_module()
    outputs = {tmp_path / "a.lean": "a\n", tmp_path / "b.lean": "b\n"}
    staged_outputs = {
        path: module.stage_text(path, content) for path, content in outputs.items()
    }
    ledger = tmp_path / "ledger.json"
    staged_ledger = module.stage_text(ledger, "{}\n")
    original_link = module.os.link
    calls = 0

    def fail_second_link(source, destination):
        nonlocal calls
        calls += 1
        if calls == 2:
            raise OSError("injected publication interruption")
        original_link(source, destination)

    monkeypatch.setattr(module.os, "link", fail_second_link)
    with pytest.raises(OSError, match="injected publication interruption"):
        module.publish_staged_once(staged_outputs, staged_ledger, ledger)
    assert not ledger.exists()
    assert sum(path.exists() for path in outputs) == 1


def test_immutable_publication_refuses_any_existing_target(tmp_path: Path) -> None:
    module = generator_module()
    output = tmp_path / "a.lean"
    output.write_text("old\n", encoding="utf-8")
    staged = module.stage_text(output, "new\n")
    ledger = tmp_path / "ledger.json"
    staged_ledger = module.stage_text(ledger, "{}\n")
    try:
        with pytest.raises(FileExistsError, match="immutable publication target exists"):
            module.publish_staged_once({output: staged}, staged_ledger, ledger)
        assert output.read_text(encoding="utf-8") == "old\n"
        assert not ledger.exists()
    finally:
        staged.unlink(missing_ok=True)
        staged_ledger.unlink(missing_ok=True)


def test_production_cli_requires_parent_cnf(monkeypatch: pytest.MonkeyPatch) -> None:
    module = generator_module()
    monkeypatch.setattr(
        sys,
        "argv",
        [
            "generate_exact17_thirty_first_all_cancellation_refinements.py",
            "--analysis",
            str(ANALYSIS),
            "--parent-ledger",
            str(PARENT_LEDGER),
            "--lean-output",
            "unused.lean",
            "--ledger-output",
            "unused.json",
        ],
    )
    with pytest.raises(SystemExit) as error:
        module.main()
    assert error.value.code == 2


def test_certificate_selection_replays_under_explicit_order(monkeypatch: pytest.MonkeyPatch) -> None:
    module = generator_module()
    hits = frozenset({(0, 1), (0, 2)})
    record = {
        "core": {
            "paths": [
                {
                    "steps": [
                        {"kind": "row", "center": 0, "first": 1, "second": 2}
                    ]
                }
            ]
        }
    }
    enumerated_orders: list[tuple[int, ...]] = []
    certified_orders: list[tuple[int, ...]] = []

    def enumerate_fake(rows, n, order, *, max_cores):
        enumerated_orders.append(tuple(order))
        return [record]

    def certify_fake(rows, n, order, core):
        certified_orders.append(tuple(order))
        return record

    monkeypatch.setattr(
        module.producer_bank,
        "enumerate_two_kalmanson_cancellations",
        enumerate_fake,
    )
    monkeypatch.setattr(
        module.producer_bank,
        "certify_two_kalmanson_cancellation",
        certify_fake,
    )
    selected = module.ORDERS[1]
    assert module.choose_exact_support_record(hits, selected) == record
    assert enumerated_orders == [selected]
    assert certified_orders == [selected]


def test_certificate_selection_uses_original_record_bank(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    module = generator_module()
    hits = frozenset({(0, 1), (0, 2)})
    record = {
        "core": {
            "boundary_labels": list(module.ORDERS[1]),
            "paths": [
                {
                    "steps": [
                        {"kind": "row", "center": 0, "first": 1, "second": 2}
                    ]
                }
            ],
        }
    }

    def fail_if_reenumerated(*args, **kwargs):
        raise AssertionError("projected hits must not be re-enumerated")

    monkeypatch.setattr(
        module.producer_bank,
        "enumerate_two_kalmanson_cancellations",
        fail_if_reenumerated,
    )
    monkeypatch.setattr(
        module.producer_bank,
        "certify_two_kalmanson_cancellation",
        lambda rows, n, order, core: record,
    )
    assert (
        module.choose_exact_support_record(
            hits,
            module.ORDERS[1],
            records=[record],
            rows=[],
        )
        == record
    )


def test_lean_occurrence_mirror_rejects_extra_or_missing_used_choice() -> None:
    module = generator_module()
    hits = frozenset({(0, 1), (0, 2)})
    reverse_hits = module.reflected(hits)

    def record(center: int, first: int, second: int) -> dict[str, object]:
        return {
            "core": {
                "paths": [
                    {
                        "steps": [
                            {
                                "kind": "row",
                                "center": center,
                                "first": first,
                                "second": second,
                            }
                        ]
                    }
                ],
                "row_choices": [
                    {"center": center, "support": [first, second]}
                ],
            }
        }

    forward = record(0, 1, 2)
    reverse = record(16, 14, 15)
    assert module.lean_occurrence_check(hits, forward, reverse)

    extra = {
        "core": dict(forward["core"]),
    }
    extra["core"]["row_choices"] = [
        *forward["core"]["row_choices"],
        {"center": 1, "support": [0, 2]},
    ]
    assert not module.lean_occurrence_check(hits, extra, reverse)

    missing = {"core": dict(forward["core"])}
    missing["core"]["row_choices"] = []
    assert not module.lean_occurrence_check(hits, missing, reverse)
    assert reverse_hits == frozenset({(16, 15), (16, 14)})


def test_lean_occurrence_mirror_accepts_union_cover_of_asymmetric_paths() -> None:
    module = generator_module()
    hits = frozenset({(0, 1), (0, 2), (0, 3)})

    def record(center: int, first: int, second: int) -> dict[str, object]:
        return {
            "core": {
                "paths": [
                    {
                        "steps": [
                            {
                                "kind": "row",
                                "center": center,
                                "first": first,
                                "second": second,
                            }
                        ]
                    }
                ],
                "row_choices": [
                    {"center": center, "support": [first, second]}
                ],
            }
        }

    forward = record(0, 1, 2)
    reverse = record(16, 13, 14)
    assert module.lean_occurrence_check(hits, forward, reverse)

    missing_reverse_cover = frozenset({(0, 1), (0, 2)})
    assert not module.lean_occurrence_check(
        missing_reverse_cover, forward, reverse
    )


def test_certificate_selection_rejects_invalid_order() -> None:
    module = generator_module()
    with pytest.raises(ValueError, match="invalid named order"):
        module.choose_exact_support_record(frozenset(), [0])


def test_publication_validator_rejects_partial_output_set(tmp_path: Path) -> None:
    module = generator_module()
    lean_output = tmp_path / "Family.lean"
    payload = publication_skeleton(module, lean_output)
    module.output_paths(lean_output)[2].unlink()
    ledger = tmp_path / "child31-ledger.json"
    write_ledger(ledger, payload)
    with pytest.raises(ValueError, match="published output hash mismatch"):
        module.validate_published_outputs(
            ledger,
            lean_output=lean_output,
            analysis_path=ANALYSIS,
            parent_ledger_path=PARENT_LEDGER,
            parent_cnf_path=PARENT_CNF,
        )


@pytest.mark.parametrize("mutation", ["mutated", "mixed"])
def test_publication_validator_rejects_mutated_or_mixed_outputs(
    tmp_path: Path, mutation: str
) -> None:
    module = generator_module()
    lean_output = tmp_path / "Family.lean"
    payload = publication_skeleton(module, lean_output)
    paths = module.output_paths(lean_output)
    if mutation == "mutated":
        paths[0].write_text("mutated\n", encoding="utf-8")
    else:
        first = paths[0].read_bytes()
        paths[0].write_bytes(paths[1].read_bytes())
        paths[1].write_bytes(first)
    ledger = tmp_path / "child31-ledger.json"
    write_ledger(ledger, payload)
    with pytest.raises(ValueError, match="published output hash mismatch"):
        module.validate_published_outputs(
            ledger,
            lean_output=lean_output,
            analysis_path=ANALYSIS,
            parent_ledger_path=PARENT_LEDGER,
            parent_cnf_path=PARENT_CNF,
        )


def test_publication_validator_rejects_arbitrary_output_path(tmp_path: Path) -> None:
    module = generator_module()
    lean_output = tmp_path / "Family.lean"
    payload = publication_skeleton(module, lean_output)
    outputs = payload["generated_outputs"]
    assert isinstance(outputs, dict)
    outputs.pop(str(module.output_paths(lean_output)[0]))
    arbitrary = tmp_path / "arbitrary.lean"
    arbitrary.write_text("arbitrary\n", encoding="utf-8")
    outputs[str(arbitrary.resolve())] = hashlib.sha256(arbitrary.read_bytes()).hexdigest()
    ledger = tmp_path / "child31-ledger.json"
    write_ledger(ledger, payload)
    with pytest.raises(ValueError, match="output allowlist drifted"):
        module.validate_published_outputs(
            ledger,
            lean_output=lean_output,
            analysis_path=ANALYSIS,
            parent_ledger_path=PARENT_LEDGER,
            parent_cnf_path=PARENT_CNF,
        )


def test_publication_validator_rejects_symlink_ledger_path(tmp_path: Path) -> None:
    module = generator_module()
    target = tmp_path / "target-ledger.json"
    target.write_text("{}\n", encoding="utf-8")
    ledger = tmp_path / "ledger.json"
    ledger.symlink_to(target)
    with pytest.raises(ValueError, match="publication ledger path must not be a symlink"):
        module.validate_published_outputs(
            ledger,
            lean_output=tmp_path / "Family.lean",
            analysis_path=ANALYSIS,
            parent_ledger_path=PARENT_LEDGER,
            parent_cnf_path=PARENT_CNF,
        )


def test_publication_validator_rejects_symlink_coordinator_path(tmp_path: Path) -> None:
    module = generator_module()
    target = tmp_path / "target-family.lean"
    target.write_text("target\n", encoding="utf-8")
    lean_output = tmp_path / "Family.lean"
    lean_output.symlink_to(target)
    with pytest.raises(ValueError, match="coordinator output path must not be a symlink"):
        module.validate_published_outputs(
            tmp_path / "ledger.json",
            lean_output=lean_output,
            analysis_path=ANALYSIS,
            parent_ledger_path=PARENT_LEDGER,
            parent_cnf_path=PARENT_CNF,
        )


@pytest.mark.parametrize(
    ("mutation", "message"),
    [
        (lambda module, payload: payload.update(schema="legacy/v1"), "legacy or unknown"),
        (lambda module, payload: payload.update(extra=True), "schema drifted"),
        (
            lambda module, payload: payload["parent_cnf"].update(bytes_verified=False),
            "parent CNF byte/path binding drifted",
        ),
        (
            lambda module, payload: payload["terminal_artifact"].update(sha256="0" * 64),
            "terminal artifact binding drifted",
        ),
        (
            lambda module, payload: payload["named_order"].update(reverse_tuple=[]),
            "order or table binding drifted",
        ),
        (
            lambda module, payload: payload.update(record_count=236),
            "census binding drifted",
        ),
        (
            lambda module, payload: payload["implementation_identities"]["producer_bank"].update(sha256="0" * 64),
            "generator/helper/producer identity drifted",
        ),
        (
            lambda module, payload: payload["source_identities"].update(
                {next(iter(payload["source_identities"])): "0" * 64}
            ),
            "Lean source identity drifted",
        ),
    ],
)
def test_publication_validator_rejects_schema_and_identity_drift(
    tmp_path: Path, mutation, message: str
) -> None:
    module = generator_module()
    lean_output = tmp_path / "Family.lean"
    payload = publication_skeleton(module, lean_output)
    mutation(module, payload)
    ledger = tmp_path / "child31-ledger.json"
    write_ledger(ledger, payload)
    with pytest.raises(ValueError, match=message):
        module.validate_published_outputs(
            ledger,
            lean_output=lean_output,
            analysis_path=ANALYSIS,
            parent_ledger_path=PARENT_LEDGER,
            parent_cnf_path=PARENT_CNF,
        )


def test_parent_cnf_binding_requires_expected_bytes(tmp_path: Path) -> None:
    module = generator_module()
    with pytest.raises(ValueError, match="required for production"):
        module.parent_cnf_binding(None)
    parent = tmp_path / "parent.cnf"
    parent.write_bytes(b"p cnf 1 1\n1 0\n")
    with pytest.raises(ValueError, match="parent CNF hash drifted"):
        module.parent_cnf_binding(parent)


def test_parent_cnf_binding_records_verified_bytes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = generator_module()
    parent = tmp_path / "parent.cnf"
    parent.write_bytes(b"parent bytes\n")
    monkeypatch.setattr(module, "PARENT_CNF_SHA256", hashlib.sha256(parent.read_bytes()).hexdigest())
    binding = module.parent_cnf_binding(parent)
    assert binding == {
        "path": str(parent.resolve()),
        "sha256": hashlib.sha256(parent.read_bytes()).hexdigest(),
        "bytes_verified": True,
    }


def test_full_production_fixture_regenerates_237_to_84(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = generator_module()
    lean_output = tmp_path / "BlockerVExactSeventeenThirtyFirstModelRefinements.lean"
    ledger_output = tmp_path / "child31-ledger.json"
    monkeypatch.setattr(
        sys,
        "argv",
        [
            "generate_exact17_thirty_first_all_cancellation_refinements.py",
            "--analysis",
            str(ANALYSIS),
            "--parent-ledger",
            str(PARENT_LEDGER),
            "--parent-cnf",
            str(PARENT_CNF),
            "--lean-output",
            str(lean_output),
            "--ledger-output",
            str(ledger_output),
        ],
    )
    assert module.main() == 0
    ledger = json.loads(ledger_output.read_text(encoding="utf-8"))
    assert (ledger["record_count"], ledger["minimal_support_count"]) == (237, 84)
    assert ledger["reverse_record_count"] == 237
    assert ledger["named_order"]["index"] == 1
    assert ledger["parent_cnf"]["bytes_verified"] is True
    assert len(ledger["generated_outputs"]) == 5
    assert ledger["lean_projection"] == {
        "preserves_full_records": True,
        "record_count": 168,
        "schema": "path-row-choice-subset/v1",
    }
    analysis = module.validate_analysis(ANALYSIS)
    _, order = module.authenticated_order(analysis)
    rows = [
        module.producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in analysis["rows"].items()
    ]
    reverse_order = tuple(reversed(order))
    assert len(ledger["entries"]) == 84
    for entry in ledger["entries"]:
        assert len(entry["forward_record"]["core"]["row_choices"]) == 17
        assert len(entry["reverse_record"]["core"]["row_choices"]) == 17
        assert entry["forward_lean_record"]["core"]["row_choices"] == module.referenced_row_choices(
            entry["forward_record"]
        )
        assert entry["reverse_lean_record"]["core"]["row_choices"] == module.referenced_row_choices(
            entry["reverse_record"]
        )
        assert entry["forward_lean_record"]["projection"]["source_record_sha256"] == hashlib.sha256(
            module.record_key(entry["forward_record"]).encode("utf-8")
        ).hexdigest()
        assert entry["reverse_lean_record"]["projection"]["source_record_sha256"] == hashlib.sha256(
            module.record_key(entry["reverse_record"]).encode("utf-8")
        ).hexdigest()
        assert module.lean_occurrence_check(
            frozenset(tuple(hit) for hit in entry["hits"]),
            entry["forward_lean_record"],
            entry["reverse_lean_record"],
            rows=rows,
            forward_order=order,
            reverse_order=reverse_order,
        )
        assert len(entry["forward_lean_record"]["core"]["row_choices"]) < 17
        assert len(entry["reverse_lean_record"]["core"]["row_choices"]) < 17
    validated = module.validate_published_outputs(
        ledger_output,
        lean_output=lean_output,
        analysis_path=ANALYSIS,
        parent_ledger_path=PARENT_LEDGER,
        parent_cnf_path=PARENT_CNF,
    )
    assert validated["schema"] == module.LEDGER_SCHEMA

    mutated_ledger = tmp_path / "mutated-entry-ledger.json"
    ledger["entries"][0]["hits"][0] = [99, 99]
    write_ledger(mutated_ledger, ledger)
    with pytest.raises(ValueError, match="support binding drifted"):
        module.validate_published_outputs(
            mutated_ledger,
            lean_output=lean_output,
            analysis_path=ANALYSIS,
            parent_ledger_path=PARENT_LEDGER,
            parent_cnf_path=PARENT_CNF,
        )
