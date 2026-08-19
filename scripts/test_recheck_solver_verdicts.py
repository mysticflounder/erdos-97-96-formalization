"""Tests for the Tier-2c solver-verdict recheck.

Two of these carry the weight.  ``test_a_single_flip_can_stay_rup`` pins the
hazard that makes a one-attempt mutation control unsound, and
``test_an_ineffective_control_is_not_reported_as_a_rejection`` pins the
tool's response to it.  Between them they are the reason a passing control
here means something.
"""

from __future__ import annotations

import json
import shutil
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import recheck_solver_verdicts as mod

REPO = Path(__file__).resolve().parents[1]
RUP_CELLS = REPO / (
    "scratch/rigid221-sourceheavy-anchor/"
    "exact12-next-row-arm-terminal-rup-sources-20260813"
)

needs_drat_trim = pytest.mark.skipif(
    shutil.which("drat-trim") is None, reason="drat-trim is not on PATH"
)

# Every clause over two variables: unsatisfiable, and small enough to reason
# about by hand.
TINY_CNF = "p cnf 2 4\n1 2 0\n1 -2 0\n-1 2 0\n-1 -2 0\n"
TINY_DRAT = "1 0\n0\n"


def write(path: Path, text: str) -> Path:
    path.write_text(text, encoding="utf-8")
    return path


# --------------------------------------------------------------------------
# declared verdicts -- the Tier-2c partition
# --------------------------------------------------------------------------


def test_a_timed_out_record_is_inconclusive_not_terminal():
    """The headline Tier-2c distinction.

    A record whose solver hit its limit holds a partial proof by construction.
    ``s NOT VERIFIED`` on it is the correct outcome, not a defect.  Classing it
    as terminal would manufacture a failure out of a correctly labelled
    artifact.
    """
    record = {"status": "UNKNOWN", "cadical_returncode": 0, "timed_out": False}
    assert mod.declared_verdict(record) == "UNKNOWN"
    assert mod.declared_class("UNKNOWN") == "INCONCLUSIVE"


def test_terminal_verdicts_are_recognised():
    assert mod.declared_class(mod.declared_verdict({"status": "UNSAT"})) == "TERMINAL"
    assert (
        mod.declared_class(mod.declared_verdict({"status": "DRAT_VERIFIED"}))
        == "TERMINAL"
    )


def test_an_unknown_label_is_not_silently_treated_as_terminal():
    assert (
        mod.declared_class(mod.declared_verdict({"status": "PROMOTED"})) == "UNDECLARED"
    )
    assert mod.declared_class(mod.declared_verdict({})) == "UNDECLARED"


def test_the_repository_record_that_motivated_the_split():
    """Ground truth: this committed record really does declare UNKNOWN."""
    path = (
        REPO
        / "scratch/atail-force/exact5-card13-distinct-radius-aggregate"
        / "artifacts/mirror.result.json"
    )
    record = mod.load_json(path)
    assert record["status"] == "UNKNOWN"
    assert record["cadical_returncode"] == 0
    assert mod.declared_class(mod.declared_verdict(record)) == "INCONCLUSIVE"


# --------------------------------------------------------------------------
# pairing is read off the record, never guessed
# --------------------------------------------------------------------------


def survey_line(path: str, references: list[dict[str, str]]) -> str:
    return json.dumps(
        {
            "path": path,
            "referenced_inputs": [
                {"path": r["path"], "resolved_path": r["path"], "hash_verdict": r["v"]}
                for r in references
            ],
        }
    )


def test_a_record_naming_two_cnfs_is_recorded_as_ambiguous(tmp_path):
    survey = tmp_path / "s.jsonl"
    survey.write_text(
        survey_line(
            "r.json",
            [
                {"path": "a.cnf", "v": "MATCH"},
                {"path": "b.cnf", "v": "MATCH"},
                {"path": "p.drat", "v": "MATCH"},
            ],
        )
        + "\n",
        encoding="utf-8",
    )
    result = mod.enumerate_pairs(survey, tmp_path)
    assert result["pairs"] == []
    assert result["ambiguous_records"][0]["n_matching_cnf"] == 2


def test_a_reference_that_did_not_match_does_not_form_a_pair(tmp_path):
    survey = tmp_path / "s.jsonl"
    survey.write_text(
        survey_line(
            "r.json",
            [{"path": "a.cnf", "v": "MISMATCH"}, {"path": "p.drat", "v": "MATCH"}],
        )
        + "\n",
        encoding="utf-8",
    )
    assert mod.enumerate_pairs(survey, tmp_path)["pairs"] == []


def test_the_carrier_count_is_reported(tmp_path):
    survey = tmp_path / "s.jsonl"
    survey.write_text("{}\n{}\n{}\n", encoding="utf-8")
    assert mod.enumerate_pairs(survey, tmp_path)["carriers_scanned"] == 3


# --------------------------------------------------------------------------
# mutation
# --------------------------------------------------------------------------


def test_lemma_recognition():
    assert mod._is_lemma(b"1 -2 0")
    assert not mod._is_lemma(b"0")
    assert not mod._is_lemma(b"d 1 0")
    assert not mod._is_lemma(b"c a comment 0")


def test_mutate_negates_the_last_lemma(tmp_path):
    proof = write(tmp_path / "p.drat", "5 6 0\n1 -2 0\n0\n")
    applied = mod.mutate_proof(proof, tmp_path / "m.drat")
    assert applied["original_literal"] == 1
    assert applied["mutated_literal"] == -1
    assert (tmp_path / "m.drat").read_text() == "5 6 0\n-1 -2 0\n0\n"


def test_skip_walks_backwards_through_the_lemmas(tmp_path):
    proof = write(tmp_path / "p.drat", "5 6 0\n1 -2 0\n0\n")
    mod.mutate_proof(proof, tmp_path / "m.drat", skip=1)
    assert (tmp_path / "m.drat").read_text() == "-5 6 0\n1 -2 0\n0\n"


def test_mutate_returns_none_when_the_skip_runs_off_the_end(tmp_path):
    proof = write(tmp_path / "p.drat", "1 0\n0\n")
    assert mod.mutate_proof(proof, tmp_path / "m.drat", skip=5) is None


@needs_drat_trim
def test_a_single_flip_can_stay_rup(tmp_path):
    """Why one mutation attempt is not a control.

    On this instance the proof is ``1 0`` and the flip gives ``-1 0``.  Both
    are RUP against the formula, so ``drat-trim`` verifies the mutant.  A tool
    that counted this as a rejection would report a working control where there
    is none.
    """
    cnf = write(tmp_path / "t.cnf", TINY_CNF)
    good = write(tmp_path / "t.drat", TINY_DRAT)
    bad = write(tmp_path / "m.drat", "-1 0\n0\n")
    assert mod.run_drat_trim(cnf, good, 60)[0] == mod.VERIFIED
    assert mod.run_drat_trim(cnf, bad, 60)[0] == mod.VERIFIED


@needs_drat_trim
def test_an_ineffective_control_is_not_reported_as_a_rejection(tmp_path):
    """The tool's answer to the hazard above: report 0 rejected, not 1."""
    cnf = write(tmp_path / "t.cnf", TINY_CNF)
    proof = write(tmp_path / "t.drat", TINY_DRAT)
    control = mod.mutation_control(cnf, proof, tmp_path / "scratch", 60)
    assert control["n_mutants"] == 1
    assert control["n_rejected"] == 0
    assert "ineffective" in control
    assert all(a["verdict"] == mod.VERIFIED for a in control["attempts"])


@needs_drat_trim
def test_a_broken_proof_is_rejected(tmp_path):
    """The control fires when the perturbation really does break the proof."""
    cnf = write(tmp_path / "t.cnf", TINY_CNF)
    proof = write(tmp_path / "t.drat", TINY_DRAT)
    broken = write(tmp_path / "b.drat", "1 2 0\n0\n")
    assert mod.run_drat_trim(cnf, proof, 60)[0] == mod.VERIFIED
    assert mod.run_drat_trim(cnf, broken, 60)[0] == mod.NOT_VERIFIED


@needs_drat_trim
def test_the_reused_authority_agrees_with_the_transcript(tmp_path):
    """_verify_drat is the verdict authority; it must not disagree with drat-trim."""
    verify = mod.load_module(
        REPO / mod.VALIDATOR, "exact12_next_row_arm_static_v24_validator"
    )._verify_drat
    cnf = write(tmp_path / "t.cnf", TINY_CNF)
    proof = write(tmp_path / "t.drat", TINY_DRAT)
    assert mod.verify_pair(verify, cnf, proof, 60)["verdict"] == mod.VERIFIED
    broken = write(tmp_path / "b.drat", "1 2 0\n0\n")
    entry = mod.verify_pair(verify, cnf, broken, 60)
    assert entry["verdict"] == mod.NOT_VERIFIED
    assert entry["authority_accepted"] is False
    # A False from the authority is always explained rather than left ambiguous.
    assert entry["explanation"]["status_lines"]


# --------------------------------------------------------------------------
# receipt redaction
# --------------------------------------------------------------------------


def test_redaction_drops_the_transcripts_and_nothing_else():
    document = {
        "receipt_sha256": "aa",
        "normalization": {"hints": 116},
        "artifacts": {
            "terminal_cnf": {"path": "terminal.cnf", "sha256": "1"},
            "drat_trim_output": {"path": "drat-trim-output.txt", "sha256": "2"},
        },
    }
    redacted = mod.redact_receipt(document)
    assert "receipt_sha256" not in redacted
    assert redacted["normalization"] == {"hints": 116}
    assert list(redacted["artifacts"]) == ["terminal_cnf"]


def test_a_changed_normalization_count_still_breaks_the_comparison(tmp_path):
    """Redaction must not become a way to hide a real regression."""
    left = tmp_path / "a.json"
    right = tmp_path / "b.json"
    left.write_text(
        json.dumps({"receipt_sha256": "x", "normalization": {"hints": 116}}),
        encoding="utf-8",
    )
    right.write_text(
        json.dumps({"receipt_sha256": "y", "normalization": {"hints": 117}}),
        encoding="utf-8",
    )
    assert mod.compare_receipts(left, right)["redacted_identical"] is False


def test_two_receipts_differing_only_in_transcripts_compare_equal(tmp_path):
    def receipt(sha: str, own: str) -> str:
        return json.dumps(
            {
                "receipt_sha256": own,
                "artifacts": {
                    "drat_trim_output": {"path": "drat-trim-output.txt", "sha256": sha},
                    "terminal_cnf": {"path": "terminal.cnf", "sha256": "stable"},
                },
            }
        )

    left = tmp_path / "a.json"
    right = tmp_path / "b.json"
    left.write_text(receipt("1", "p"), encoding="utf-8")
    right.write_text(receipt("2", "q"), encoding="utf-8")
    result = mod.compare_receipts(left, right)
    assert result["redacted_identical"] is True
    assert "artifacts.drat_trim_output" in result["redacted_fields"]


# --------------------------------------------------------------------------
# tree comparison
# --------------------------------------------------------------------------


def build(root: Path, files: dict[str, str]) -> Path:
    for name, text in files.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
    return root


def test_identical_cells_compare_clean(tmp_path):
    files = {"terminal.cnf": "p cnf 1 1\n", "job.json": "{}"}
    diff = mod.compare_cell_tree(
        build(tmp_path / "c", files), build(tmp_path / "e", files)
    )
    assert diff["deterministic_artifacts_identical"] is True
    assert diff["identical"] == 2


def test_one_changed_cnf_byte_is_caught(tmp_path):
    left = build(tmp_path / "c", {"terminal.cnf": "p cnf 1 1\n"})
    right = build(tmp_path / "e", {"terminal.cnf": "p cnf 1 2\n"})
    diff = mod.compare_cell_tree(left, right)
    assert diff["deterministic_artifacts_identical"] is False
    assert diff["differing"] == ["terminal.cnf"]


def test_a_differing_transcript_is_not_a_break(tmp_path):
    left = build(tmp_path / "c", {"drat-trim-output.txt": "0.1 seconds\n"})
    right = build(tmp_path / "e", {"drat-trim-output.txt": "0.2 seconds\n"})
    diff = mod.compare_cell_tree(left, right)
    assert diff["deterministic_artifacts_identical"] is False  # nothing identical
    assert [item["path"] for item in diff["volatile_transcripts"]] == [
        "drat-trim-output.txt"
    ]
    assert diff["differing"] == []


def test_a_missing_emitted_artifact_is_caught(tmp_path):
    left = build(tmp_path / "c", {"a": "1"})
    right = build(tmp_path / "e", {"a": "1", "b": "2"})
    assert mod.compare_cell_tree(right, left)["only_committed"] == ["b"]


# --------------------------------------------------------------------------
# repository ground truth
# --------------------------------------------------------------------------


def test_the_retained_cells_hold_the_artifacts_the_preparer_requires():
    """The preparer refuses a workdir missing any of these."""
    preparer = mod.load_module(
        REPO / mod.PREPARER, "prepare_exact12_next_row_arm_terminal_rup_source"
    )
    cells = sorted(RUP_CELLS.glob("cell-*"))
    assert cells
    for cell in cells:
        for _label, name in preparer.REQUIRED_ARTIFACTS:
            assert (cell / name).is_file(), f"{cell.name} lacks {name}"
        assert mod.load_json(cell / "summary.json")["status"] == "UNSAT_DRAT_VERIFIED"


def test_the_volatile_list_names_only_files_the_cells_really_hold():
    """A stale name here would silently excuse a genuine difference."""
    cell = min(RUP_CELLS.glob("cell-*"))
    for name in mod.VOLATILE_ARTIFACTS:
        assert (cell / name).is_file()


# --------------------------------------------------------------------------
# bounded IO
# --------------------------------------------------------------------------


def test_duplicate_json_key_is_rejected(tmp_path):
    path = write(tmp_path / "d.json", '{"a": 1, "a": 2}')
    with pytest.raises(ValueError, match="duplicate JSON key"):
        mod.load_json(path)


def test_symlink_is_not_followed(tmp_path):
    target = write(tmp_path / "real.json", "{}")
    link = tmp_path / "link.json"
    link.symlink_to(target)
    with pytest.raises(OSError):
        mod.load_json(link)


def test_sha256_file_matches_hashlib(tmp_path):
    import hashlib

    payload = b"abc" * 500
    path = tmp_path / "f.bin"
    path.write_bytes(payload)
    assert mod.sha256_file(path) == hashlib.sha256(payload).hexdigest()


# --------------------------------------------------------------------------
# binary DRAT -- the encoding every proof in this corpus actually uses
# --------------------------------------------------------------------------


# marker 'a', literal 1 encoded as 2, terminator; then the empty clause.
TINY_BINARY = bytes([0x61, 0x02, 0x00, 0x61, 0x00])


def test_the_corpus_proofs_are_binary_not_text():
    """Ground truth, and the reason the first control was a silent no-op.

    A text-line mutator finds no lemma in these files, perturbs nothing, and
    reports a clean control while establishing nothing.
    """
    proof = REPO / "scratch/atail-force/exact5-card13-same-radius-terminal/direct.drat"
    assert mod.is_binary_drat(proof) is True


def test_text_drat_is_not_read_as_binary(tmp_path):
    assert mod.is_binary_drat(write(tmp_path / "t.drat", TINY_DRAT)) is False


def test_binary_lemma_starts_finds_both_additions(tmp_path):
    assert mod.binary_lemma_starts(TINY_BINARY) == [0, 3]


def test_binary_lemma_starts_stops_at_an_unknown_marker():
    assert mod.binary_lemma_starts(bytes([0x61, 0x02, 0x00, 0x7A])) == [0]


def test_binary_mutation_flips_exactly_one_byte(tmp_path):
    proof = tmp_path / "p.drat"
    proof.write_bytes(TINY_BINARY)
    target = tmp_path / "m.drat"
    applied = mod.mutate_binary_proof(proof, target)
    assert applied["original_byte"] == 0x02
    assert applied["mutated_byte"] == 0x03
    mutated = target.read_bytes()
    assert len(mutated) == len(TINY_BINARY)
    assert sum(1 for a, b in zip(mutated, TINY_BINARY, strict=True) if a != b) == 1


def test_the_empty_final_clause_is_skipped(tmp_path):
    """The last addition is the empty clause: a marker and a terminator.

    Aiming at it finds no literal and returns None, which the caller would read
    as "nothing to perturb" for the whole proof.
    """
    proof = tmp_path / "p.drat"
    proof.write_bytes(TINY_BINARY)
    applied = mod.mutate_binary_proof(proof, tmp_path / "m.drat")
    assert applied["lemma_offset"] == 0  # not 3, the empty clause
    assert applied["total_addition_lemmas"] == 2
    assert mod.mutate_binary_proof(proof, tmp_path / "m2.drat", skip=1) is None


def test_flipping_bit_zero_cannot_change_the_varint_length():
    """Why a one-byte edit is safe: the encoding stays aligned.

    A literal is encoded as ``2*|l| + (l < 0)``, seven bits per byte.  Negating
    it toggles bit 0, moving the value by one.  A varint grows only at a
    multiple of 128, and toggling bit 0 never crosses one: an even value goes
    up by one, an odd value down by one.
    """

    def width(value: int) -> int:
        length = 1
        while value >= 0x80:
            value >>= 7
            length += 1
        return length

    for value in (0, 1, 2, 126, 127, 128, 129, 254, 255, 16_383, 16_384):
        assert width(value) == width(value ^ 1), value


# --------------------------------------------------------------------------
# the control must aim where the checker looks
# --------------------------------------------------------------------------


@needs_drat_trim
def test_the_control_targets_the_core_and_verifies_it_first(tmp_path):
    """Aimed at the core, and the core is checked unperturbed before the flip.

    Perturbing the stored proof's tail is invisible: those lemmas fall outside
    the backward check.  ``-l`` writes the lemmas that were used, so a flip
    lands where the checker must look.  Verifying the core first separates a
    working checker from one that rejects everything.
    """
    cnf = REPO / "scratch/atail-force/exact5-card13-same-radius-terminal/direct.cnf"
    proof = REPO / "scratch/atail-force/exact5-card13-same-radius-terminal/direct.drat"
    control = mod.mutation_control(cnf, proof, tmp_path / "scratch", 1800)
    assert control["provenance"]["target"] == "core_lemmas"
    assert control["provenance"]["core_verifies_unperturbed"] is True
    assert (
        control["provenance"]["core_bytes"]
        < control["provenance"]["stored_proof_bytes"]
    )
    assert control["n_mutants"] == 1
    assert control["n_rejected"] == 1


# --------------------------------------------------------------------------
# a terminal pair with no control is not a pass
# --------------------------------------------------------------------------


def test_an_uncontrolled_terminal_pair_is_reported():
    """A control that perturbed nothing must not read as a clean run."""
    records = [
        {
            "route": "pair",
            "verdict": mod.AGREES,
            "declared_class": "TERMINAL",
            "proof": "a.drat",
            "mutation_control": {"n_mutants": 0, "n_rejected": 0},
        }
    ]
    summary = mod.summarize(records)
    assert summary["mutation_control"]["controls_owed"] == 1
    assert summary["mutation_control"]["uncontrolled_terminal_proofs"] == ["a.drat"]


def test_an_inconclusive_pair_owes_no_control():
    records = [
        {
            "route": "pair",
            "verdict": mod.AGREES,
            "declared_class": "INCONCLUSIVE",
            "proof": "b.drat",
        }
    ]
    summary = mod.summarize(records)
    assert summary["mutation_control"]["controls_owed"] == 0
    assert summary["mutation_control"]["uncontrolled_terminal_proofs"] == []


def test_a_controlled_terminal_pair_is_clean():
    records = [
        {
            "route": "pair",
            "verdict": mod.AGREES,
            "declared_class": "TERMINAL",
            "proof": "c.drat",
            "mutation_control": {"n_mutants": 1, "n_rejected": 1},
        }
    ]
    summary = mod.summarize(records)
    assert summary["mutation_control"] == {
        "n_mutants": 1,
        "n_rejected": 1,
        "controls_owed": 1,
        "uncontrolled_terminal_proofs": [],
    }
