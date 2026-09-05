# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for source-reconstructed exact-13 DIMACS provenance custody."""

from __future__ import annotations

import json
from pathlib import Path

import cardge13_exact13_global_source_cell_boolean_slice_piqd as boolean
import cardge13_exact13_global_source_cell_csp_piqd as base
import cardge13_literal_qfuf_to_dimacs_v2 as subject
import pytest


def learned_cut(atoms: tuple[str, ...]) -> tuple[str, dict[str, object]]:
    """Build one synthetic but custody-valid conflict record."""
    ordered = sorted(atoms)
    conflict: dict[str, object] = {
        "kind": "transitive-incidence-path",
        "form": [0, 1, 2, 3, 0],
        "pairings": [],
        "atoms": ordered,
    }
    cut = f"(assert {base.disjunction(f'(not {atom})' for atom in ordered)})"
    return cut, conflict


def event_object(
    *,
    schema: str,
    journal_path: str,
    journal_payload: bytes,
    commands: tuple[str, ...],
    bank_count: int,
    cuts: tuple[tuple[str, dict[str, object]], ...],
    status: str,
    seed_sources: list[dict[str, object]] | None = None,
    base_command_count: int | None = None,
) -> dict[str, object]:
    """Build one minimal event satisfying the producer's custody fields."""
    iterations: list[dict[str, object]] = []
    for index, (cut, conflict) in enumerate(cuts):
        iterations.append(
            {
                "index": index,
                "cut": cut,
                "linear_conflict": conflict,
                "solved": {"status": "SAT"},
            }
        )
    terminal_solved: dict[str, object] = {
        "status": "UNSAT" if status == "UNSAT" else "SAT"
    }
    if status == "UNSAT":
        terminal_solved["terminal_unsat"] = True
    iterations.append({"index": len(iterations), "solved": terminal_solved})
    event: dict[str, object] = {
        "schema": schema,
        "orientation": "direct",
        "role_pins": {},
        "row_pins": {},
        "order": list(base.DIRECT_ORDER),
        "base_conflict_count": bank_count,
        "command_count": len(commands),
        "journal": journal_path,
        "journal_sha256": subject.sha256_bytes(journal_payload),
        "cegar_statuses": [status],
        "solves": [
            {
                "cegar_status": status,
                "closed": {"solves": len(iterations)},
                "iterations": iterations,
            }
        ],
    }
    if schema == subject.RESUME_EVENT_SCHEMA:
        event["base_command_count"] = base_command_count
        event["seed_sources"] = seed_sources
        event["seed_cut_count"] = len(commands) - int(base_command_count or 0)
    return event


def write_json(path: Path, value: object) -> bytes:
    """Write compact event JSON and return the exact payload."""
    payload = subject.canonical_json_bytes(value)
    path.write_bytes(payload)
    return payload


def run_conversion(root: Path, journal: Path, event: Path) -> dict[str, object]:
    """Run the converter with outputs below one isolated fixture root."""
    return subject.convert(
        source_path=journal,
        event_path=event,
        output_cnf_path=root / "out" / "full.cnf",
        output_manifest_path=root / "out" / "conversion-manifest.json",
        output_provenance_path=root / "out" / "clause-provenance.jsonl",
        repo_root=root,
    )


def test_pair_event_emits_structured_clause_provenance(tmp_path: Path) -> None:
    """A first-wave terminal event is rebuilt from the current source generator."""
    commands, bank = boolean.build_commands(base.DIRECT_ORDER)
    journal_payload = ("\n".join(commands) + "\n").encode("ascii")
    journal = tmp_path / "pair.smt2"
    journal.write_bytes(journal_payload)
    dynamic = learned_cut(("m_C0_0", "m_C0_1"))
    assert dynamic[0] not in commands
    event = tmp_path / "pair-event.json"
    write_json(
        event,
        event_object(
            schema=subject.PAIR_EVENT_SCHEMA,
            journal_path=journal.name,
            journal_payload=journal_payload,
            commands=commands,
            bank_count=len(bank),
            cuts=(dynamic,),
            status="UNSAT",
        ),
    )

    manifest = run_conversion(tmp_path, journal, event)
    parsed = subject.parse_journal(journal_payload)
    assert manifest["dimacs"]["clause_count"] == len(parsed.clauses) + 1
    assert manifest["clause_family_counts"]["base_kalmanson_nogood"] == len(bank)
    assert manifest["clause_family_counts"]["dynamic_kalmanson_nogood"] == 1
    rows = [
        json.loads(line)
        for line in (tmp_path / "out" / "clause-provenance.jsonl").read_text().splitlines()
    ]
    assert [row["original_clause_id"] for row in rows] == list(range(1, len(rows) + 1))
    assert rows[-1]["origin"]["subtype"] == "terminal_event_cut"
    assert rows[-1]["journal_locator"]["byte_start"] is None
    assert any(
        record["sha256"] == subject.sha256_file(Path(subject.__file__).resolve())
        for record in manifest["generators"]
    )
    assert any(
        record["sha256"] == subject.sha256_file(Path(subject.tight.__file__).resolve())
        for record in manifest["generators"]
    )


def resume_fixture(
    root: Path, *, seed_status: str = "REFINEMENT_BUDGET"
) -> tuple[Path, Path, Path]:
    """Write a recursively authenticated seed event and resumed terminal event."""
    commands, bank = boolean.build_commands(base.DIRECT_ORDER)
    seed_cut = learned_cut(("m_C0_0", "m_C0_1"))
    terminal_cut = learned_cut(("m_C1_0", "m_C1_1"))

    seed_journal = root / "seed.smt2"
    seed_payload = ("\n".join(commands) + "\n").encode("ascii")
    seed_journal.write_bytes(seed_payload)
    seed_event = root / "seed-event.json"
    seed_event_payload = write_json(
        seed_event,
        event_object(
            schema=subject.PAIR_EVENT_SCHEMA,
            journal_path=seed_journal.name,
            journal_payload=seed_payload,
            commands=commands,
            bank_count=len(bank),
            cuts=(seed_cut,),
            status=seed_status,
        ),
    )

    resumed_commands = (*commands, seed_cut[0])
    resumed_journal = root / "resumed.smt2"
    resumed_payload = ("\n".join(resumed_commands) + "\n").encode("ascii")
    resumed_journal.write_bytes(resumed_payload)
    terminal_event = root / "terminal-event.json"
    write_json(
        terminal_event,
        event_object(
            schema=subject.RESUME_EVENT_SCHEMA,
            journal_path=resumed_journal.name,
            journal_payload=resumed_payload,
            commands=resumed_commands,
            bank_count=len(bank),
            cuts=(terminal_cut,),
            status="UNSAT",
            base_command_count=len(commands),
            seed_sources=[
                {
                    "path": seed_event.name,
                    "sha256": subject.sha256_bytes(seed_event_payload),
                    "cut_occurrences": 1,
                }
            ],
        ),
    )
    return seed_journal, resumed_journal, terminal_event


def test_resume_event_recursively_authenticates_seed_lineage(tmp_path: Path) -> None:
    """A resumed journal retains first-occurrence seed and terminal cut origins."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)
    manifest = run_conversion(tmp_path, resumed_journal, terminal_event)
    assert manifest["seed_cut_count"] == 1
    assert manifest["terminal_cut_count"] == 1
    assert manifest["clause_family_counts"]["dynamic_kalmanson_nogood"] == 2
    custody_names = {Path(record["path"]).name for record in manifest["recursive_custody"]}
    assert custody_names == {
        "seed.smt2",
        "seed-event.json",
        "resumed.smt2",
        "terminal-event.json",
    }
    rows = [
        json.loads(line)
        for line in (tmp_path / "out" / "clause-provenance.jsonl").read_text().splitlines()
    ]
    assert [row["origin"]["subtype"] for row in rows[-2:]] == [
        "seed_cut",
        "terminal_event_cut",
    ]


def test_nested_seed_imports_immediate_event_cuts_only(tmp_path: Path) -> None:
    """Recursive history is authenticated while the producer imports immediate cuts."""
    commands, bank = boolean.build_commands(base.DIRECT_ORDER)
    inherited_cut = learned_cut(("m_C0_0", "m_C0_1"))
    imported_cut = learned_cut(("m_C1_0", "m_C1_1"))
    terminal_cut = learned_cut(("m_K_0", "m_K_1"))

    inherited_journal = tmp_path / "inherited.smt2"
    inherited_payload = ("\n".join(commands) + "\n").encode("ascii")
    inherited_journal.write_bytes(inherited_payload)
    inherited_event = tmp_path / "inherited-event.json"
    inherited_event_payload = write_json(
        inherited_event,
        event_object(
            schema=subject.PAIR_EVENT_SCHEMA,
            journal_path=inherited_journal.name,
            journal_payload=inherited_payload,
            commands=commands,
            bank_count=len(bank),
            cuts=(inherited_cut,),
            status="SAT_SURVIVOR",
        ),
    )

    middle_commands = (*commands, inherited_cut[0])
    middle_journal = tmp_path / "middle.smt2"
    middle_payload = ("\n".join(middle_commands) + "\n").encode("ascii")
    middle_journal.write_bytes(middle_payload)
    middle_event = tmp_path / "middle-event.json"
    middle_event_payload = write_json(
        middle_event,
        event_object(
            schema=subject.RESUME_EVENT_SCHEMA,
            journal_path=middle_journal.name,
            journal_payload=middle_payload,
            commands=middle_commands,
            bank_count=len(bank),
            cuts=(imported_cut,),
            status="REFINEMENT_BUDGET",
            base_command_count=len(commands),
            seed_sources=[
                {
                    "path": inherited_event.name,
                    "sha256": subject.sha256_bytes(inherited_event_payload),
                    "cut_occurrences": 1,
                }
            ],
        ),
    )

    terminal_commands = (*commands, imported_cut[0])
    terminal_journal = tmp_path / "terminal.smt2"
    terminal_payload = ("\n".join(terminal_commands) + "\n").encode("ascii")
    terminal_journal.write_bytes(terminal_payload)
    terminal_event = tmp_path / "terminal-event.json"
    write_json(
        terminal_event,
        event_object(
            schema=subject.RESUME_EVENT_SCHEMA,
            journal_path=terminal_journal.name,
            journal_payload=terminal_payload,
            commands=terminal_commands,
            bank_count=len(bank),
            cuts=(terminal_cut,),
            status="UNSAT",
            base_command_count=len(commands),
            seed_sources=[
                {
                    "path": middle_event.name,
                    "sha256": subject.sha256_bytes(middle_event_payload),
                    "cut_occurrences": 1,
                }
            ],
        ),
    )

    manifest = run_conversion(tmp_path, terminal_journal, terminal_event)
    assert manifest["seed_cut_count"] == 1
    rows = [
        json.loads(line)
        for line in (tmp_path / "out" / "clause-provenance.jsonl").read_text().splitlines()
    ]
    assert [row["assertion"] for row in rows[-2:]] == [
        imported_cut[0],
        terminal_cut[0],
    ]


def test_resume_event_accepts_sat_survivor_seed(tmp_path: Path) -> None:
    """A seed may end at a replayed SAT cell after contributing earlier cuts."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(
        tmp_path, seed_status="SAT_SURVIVOR"
    )
    manifest = run_conversion(tmp_path, resumed_journal, terminal_event)
    assert manifest["seed_cut_count"] == 1


def test_rejects_sat_survivor_as_terminal_event(tmp_path: Path) -> None:
    """A SAT-survivor event is admissible only as authenticated seed history."""
    commands, bank = boolean.build_commands(base.DIRECT_ORDER)
    journal_payload = ("\n".join(commands) + "\n").encode("ascii")
    journal = tmp_path / "survivor.smt2"
    journal.write_bytes(journal_payload)
    event = tmp_path / "survivor-event.json"
    write_json(
        event,
        event_object(
            schema=subject.PAIR_EVENT_SCHEMA,
            journal_path=journal.name,
            journal_payload=journal_payload,
            commands=commands,
            bank_count=len(bank),
            cuts=(learned_cut(("m_C0_0", "m_C0_1")),),
            status="SAT_SURVIVOR",
        ),
    )
    with pytest.raises(subject.ConversionError, match="terminal CEGAR event is not UNSAT"):
        run_conversion(tmp_path, journal, event)


def test_resume_event_rejects_seed_journal_drift(tmp_path: Path) -> None:
    """A seed event digest alone cannot conceal drift in its claimed journal."""
    seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)
    seed_journal.write_bytes(seed_journal.read_bytes() + b"; drift\n")
    with pytest.raises(subject.ConversionError, match="seed journal reconstruction drifted"):
        run_conversion(tmp_path, resumed_journal, terminal_event)


def test_terminal_event_rejects_different_declared_journal(tmp_path: Path) -> None:
    """The caller cannot substitute a byte-identical path for the event journal."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)
    copied_journal = tmp_path / "copied.smt2"
    copied_journal.write_bytes(resumed_journal.read_bytes())
    event = json.loads(terminal_event.read_bytes())
    event["journal"] = copied_journal.name
    write_json(terminal_event, event)
    with pytest.raises(subject.ConversionError, match="journal path differs"):
        run_conversion(tmp_path, resumed_journal, terminal_event)


def test_rejects_cut_atom_drift() -> None:
    """The event cut must be regenerated exactly from its conflict atoms."""
    cut, conflict = learned_cut(("m_C0_0", "m_C0_1"))
    iteration = {
        "cut": cut.replace("m_C0_1", "m_C0_2"),
        "linear_conflict": conflict,
    }
    with pytest.raises(subject.ConversionError, match="cut/atom drift"):
        subject.validate_conflict_cut(iteration, event_label="fixture", iteration_index=0)


def test_publication_failure_cleans_partial_outputs(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """A failed exclusive publish leaves neither outputs nor sibling temporaries."""
    commands, bank = boolean.build_commands(base.DIRECT_ORDER)
    journal_payload = ("\n".join(commands) + "\n").encode("ascii")
    journal = tmp_path / "atomic.smt2"
    journal.write_bytes(journal_payload)
    event = tmp_path / "atomic-event.json"
    write_json(
        event,
        event_object(
            schema=subject.PAIR_EVENT_SCHEMA,
            journal_path=journal.name,
            journal_payload=journal_payload,
            commands=commands,
            bank_count=len(bank),
            cuts=(learned_cut(("m_C0_0", "m_C0_1")),),
            status="UNSAT",
        ),
    )
    real_link = subject.os.link
    calls = 0

    def fail_second_link(source: Path, target: Path) -> None:
        nonlocal calls
        calls += 1
        if calls == 2:
            raise OSError("synthetic publication failure")
        real_link(source, target)

    monkeypatch.setattr(subject.os, "link", fail_second_link)
    with pytest.raises(OSError, match="synthetic publication failure"):
        run_conversion(tmp_path, journal, event)
    output = tmp_path / "out"
    assert not (output / "full.cnf").exists()
    assert not (output / "conversion-manifest.json").exists()
    assert not (output / "clause-provenance.jsonl").exists()
    assert not tuple(output.glob(".*.tmp"))
    assert not tuple(tmp_path.glob(".out.*.tmp"))


def test_directory_commit_failure_leaves_no_published_set(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """Failure before the atomic directory rename exposes no output artifact."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)

    def fail_rename(source: Path, target: Path) -> None:
        raise OSError(f"synthetic rename failure: {source} -> {target}")

    monkeypatch.setattr(subject, "rename_directory_exclusive", fail_rename)
    with pytest.raises(OSError, match="synthetic rename failure"):
        run_conversion(tmp_path, resumed_journal, terminal_event)
    assert not (tmp_path / "out").exists()
    assert not tuple(tmp_path.glob(".out.*.tmp"))


def test_concurrent_output_directory_is_not_replaced(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """Atomic publication preserves an empty directory won by another process."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)
    original = subject.rename_directory_exclusive

    def race_with_concurrent_directory(source: Path, target: Path) -> None:
        target.mkdir()
        original(source, target)

    monkeypatch.setattr(
        subject, "rename_directory_exclusive", race_with_concurrent_directory
    )
    with pytest.raises(OSError):
        run_conversion(tmp_path, resumed_journal, terminal_event)
    output = tmp_path / "out"
    assert output.is_dir()
    assert not tuple(output.iterdir())
    assert not tuple(tmp_path.glob(".out.*.tmp"))


def test_input_mutation_during_conversion_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """Published custody cannot mix validated bytes with a later path version."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)
    original = subject.provenance_rows

    def mutate_event_after_validation(
        parsed: subject.ParsedJournal, run: subject.ReconstructedRun
    ) -> tuple[dict[str, object], ...]:
        rows = original(parsed, run)
        terminal_event.write_bytes(terminal_event.read_bytes() + b"\n")
        return rows

    monkeypatch.setattr(subject, "provenance_rows", mutate_event_after_validation)
    with pytest.raises(subject.ConversionError, match="input changed during conversion"):
        run_conversion(tmp_path, resumed_journal, terminal_event)
    assert not (tmp_path / "out").exists()
    assert not tuple(tmp_path.glob(".out.*.tmp"))


@pytest.mark.parametrize("relative_path", ["seed-event.json", "seed.smt2"])
def test_recursive_input_mutation_during_conversion_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, relative_path: str
) -> None:
    """Recursive event and journal snapshots are stable through publication."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)
    recursive_path = tmp_path / relative_path
    original = subject.provenance_rows

    def mutate_recursive_input(
        parsed: subject.ParsedJournal, run: subject.ReconstructedRun
    ) -> tuple[dict[str, object], ...]:
        rows = original(parsed, run)
        recursive_path.write_bytes(recursive_path.read_bytes() + b"\n")
        return rows

    monkeypatch.setattr(subject, "provenance_rows", mutate_recursive_input)
    with pytest.raises(subject.ConversionError, match="input changed during conversion"):
        run_conversion(tmp_path, resumed_journal, terminal_event)
    assert not (tmp_path / "out").exists()
    assert not tuple(tmp_path.glob(".out.*.tmp"))


def test_reconstruction_executes_captured_generator_source(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    """Previously loaded module state cannot override the captured source bytes."""
    _seed_journal, resumed_journal, terminal_event = resume_fixture(tmp_path)

    def stale_loaded_generator(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("stale loaded generator was used")

    monkeypatch.setattr(subject.boolean, "build_commands", stale_loaded_generator)
    manifest = run_conversion(tmp_path, resumed_journal, terminal_event)
    assert manifest["generator_execution"] == "captured-source-compile-exec/v1"
