"""Tests for the Tier-0 non-piqd custody survey.

Includes the two mandatory Tier-0 mutation controls:

* a ``{path, sha256}`` reference with a wrong digest must be recorded
  ``MISMATCH`` -- if it is not, the survey is void;
* the Lean reverse-link scanner must not truncate ``bank.jsonl`` to
  ``bank.json``.  An alternation on ``json`` produced exactly that false
  dangling link in an earlier pass.
"""

from __future__ import annotations

import hashlib
import json
import subprocess
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import audit_nonpiqd_custody as mod

REPO = Path(__file__).resolve().parents[1]


def _git_init(root: Path) -> None:
    subprocess.run(["git", "init", "-q"], cwd=root, check=True)
    subprocess.run(
        ["git", "config", "user.email", "t@example.com"], cwd=root, check=True
    )
    subprocess.run(["git", "config", "user.name", "t"], cwd=root, check=True)


def _commit_all(root: Path) -> None:
    subprocess.run(["git", "add", "-A"], cwd=root, check=True)
    subprocess.run(["git", "commit", "-qm", "fixture"], cwd=root, check=True)


@pytest.fixture
def repo(tmp_path: Path) -> Path:
    root = tmp_path / "repo"
    (root / "scratch" / "lane").mkdir(parents=True)
    (root / "lean" / "Proof").mkdir(parents=True)
    (root / "lean" / "scratch").mkdir(parents=True)
    _git_init(root)
    return root


# --------------------------------------------------------------------------
# mutation control 1: a wrong digest must be reported MISMATCH
# --------------------------------------------------------------------------


def test_reference_hash_mismatch_is_detected(repo: Path) -> None:
    payload = b"cnf payload\n"
    (repo / "scratch" / "lane" / "input.cnf").write_bytes(payload)
    good = hashlib.sha256(payload).hexdigest()
    record = {
        "schema": "fixture-record.v1",
        "artifacts": [
            {"path": "scratch/lane/input.cnf", "bytes": len(payload), "sha256": good}
        ],
    }
    (repo / "scratch" / "lane" / "result.json").write_text(json.dumps(record))
    _commit_all(repo)

    surveyed = mod.survey_record(repo, "scratch/lane/result.json", {})
    assert [e["hash_verdict"] for e in surveyed["referenced_inputs"]] == ["MATCH"]
    assert surveyed["defects"] == []

    # Mutate one hex digit.  The survey MUST now report MISMATCH.
    mutated = ("0" if good[0] != "0" else "1") + good[1:]
    record["artifacts"][0]["sha256"] = mutated
    (repo / "scratch" / "lane" / "result.json").write_text(json.dumps(record))
    surveyed = mod.survey_record(repo, "scratch/lane/result.json", {})
    assert [e["hash_verdict"] for e in surveyed["referenced_inputs"]] == ["MISMATCH"]
    assert any(d["reason"] == "REFERENCE_HASH_MISMATCH" for d in surveyed["defects"])


def test_reference_size_mismatch_is_detected(repo: Path) -> None:
    payload = b"abc\n"
    (repo / "scratch" / "lane" / "input.cnf").write_bytes(payload)
    record = {
        "schema": "fixture-record.v1",
        "artifacts": [
            {
                "path": "scratch/lane/input.cnf",
                "bytes": len(payload) + 7,
                "sha256": hashlib.sha256(payload).hexdigest(),
            }
        ],
    }
    (repo / "scratch" / "lane" / "result.json").write_text(json.dumps(record))
    _commit_all(repo)
    surveyed = mod.survey_record(repo, "scratch/lane/result.json", {})
    assert any(d["reason"] == "REFERENCE_SIZE_MISMATCH" for d in surveyed["defects"])


# --------------------------------------------------------------------------
# mutation control 2: the jsonl truncation trap
# --------------------------------------------------------------------------


def test_lean_link_scanner_does_not_truncate_jsonl(repo: Path) -> None:
    (repo / "scratch" / "lane" / "bank.jsonl").write_text("{}\n")
    (repo / "lean" / "Proof" / "M.lean").write_text(
        "/-! rows of `scratch/lane/bank.jsonl` are the source. -/\n"
    )
    result = mod.lean_reverse_links(repo)
    assert "scratch/lane/bank.jsonl" in {
        t for t in [*[m["token"] for m in result["missing"]], "scratch/lane/bank.jsonl"]
    }
    assert result["missing"] == [], (
        "bank.jsonl exists; truncating to bank.json invents a defect"
    )


def test_lean_link_scanner_reports_a_real_dangling_link(repo: Path) -> None:
    (repo / "lean" / "Proof" / "M.lean").write_text("-- see scratch/lane/gone.json\n")
    result = mod.lean_reverse_links(repo)
    assert [m["token"] for m in result["missing"]] == ["scratch/lane/gone.json"]
    assert result["missing"][0]["off_spine_only"] is False


def test_off_spine_only_flag_tracks_lean_scratch(repo: Path) -> None:
    (repo / "lean" / "scratch" / "P.lean").write_text("-- see scratch/lane/gone.json\n")
    result = mod.lean_reverse_links(repo)
    assert result["missing"][0]["off_spine_only"] is True


# --------------------------------------------------------------------------
# resolution strategy
# --------------------------------------------------------------------------


def test_manifest_relative_reference_resolves(repo: Path) -> None:
    payload = b"x\n"
    (repo / "scratch" / "lane" / "input.cnf").write_bytes(payload)
    record = {
        "schema": "fixture-record.v1",
        "artifacts": [
            {"path": "input.cnf", "sha256": hashlib.sha256(payload).hexdigest()}
        ],
    }
    (repo / "scratch" / "lane" / "result.json").write_text(json.dumps(record))
    _commit_all(repo)
    surveyed = mod.survey_record(repo, "scratch/lane/result.json", {})
    entry = surveyed["referenced_inputs"][0]
    assert entry["resolution"] == "manifest_rel"
    assert entry["hash_verdict"] == "MATCH"
    assert surveyed["defects"] == []


def test_unresolved_reference_is_not_a_defect(repo: Path) -> None:
    record = {
        "schema": "fixture-record.v1",
        "artifacts": [{"path": "nowhere/input.cnf", "sha256": "0" * 64}],
    }
    (repo / "scratch" / "lane" / "result.json").write_text(json.dumps(record))
    _commit_all(repo)
    surveyed = mod.survey_record(repo, "scratch/lane/result.json", {})
    assert surveyed["referenced_inputs"][0]["resolution"] == "unresolved"
    assert surveyed["defects"] == []


# --------------------------------------------------------------------------
# classification
# --------------------------------------------------------------------------


def test_piqd_marker_sets_route_class(repo: Path) -> None:
    record = {"schema": "p97-piqd-static-solver-receipt/v1", "job_id": "a" * 64}
    (repo / "scratch" / "lane" / "receipt.json").write_text(json.dumps(record))
    _commit_all(repo)
    surveyed = mod.survey_record(repo, "scratch/lane/receipt.json", {})
    assert surveyed["route_class"] == "PIQD_BACKED"
    assert "job_id" in surveyed["route_markers"]
    assert "schema" in surveyed["route_markers"]


def test_record_without_marker_is_not_piqd(repo: Path) -> None:
    (repo / "scratch" / "lane" / "r.json").write_text(
        json.dumps({"schema": "plain.v1"})
    )
    _commit_all(repo)
    surveyed = mod.survey_record(repo, "scratch/lane/r.json", {})
    assert surveyed["route_class"] == "NON_SOLVER"
    assert surveyed["route_markers"] == []


def test_self_hash_matching_variant_is_reported(repo: Path) -> None:
    body = {"schema": "fixture.v1", "value": 3}
    digest = hashlib.sha256(mod.canonical_json_bytes(body)).hexdigest()
    record = dict(body, manifest_sha256=digest)
    (repo / "scratch" / "lane" / "m.json").write_text(json.dumps(record))
    _commit_all(repo)
    surveyed = mod.survey_record(repo, "scratch/lane/m.json", {})
    entry = next(s for s in surveyed["self_hash"] if s["field"] == "manifest_sha256")
    assert entry["verdict"] == "self_hash_ok"
    assert entry["variant"] == "compact"


def test_reference_to_another_document_is_not_called_a_self_hash(repo: Path) -> None:
    """A `bank_sha256` naming some other bank must not be reported as a defect."""
    record = {"schema": "fixture.v1", "bank_sha256": "b" * 64}
    (repo / "scratch" / "lane" / "m.json").write_text(json.dumps(record))
    _commit_all(repo)
    surveyed = mod.survey_record(repo, "scratch/lane/m.json", {})
    entry = next(s for s in surveyed["self_hash"] if s["field"] == "bank_sha256")
    assert entry["verdict"] == "not_a_self_hash"
    assert surveyed["defects"] == []


# --------------------------------------------------------------------------
# writer attribution and the corrected exclusion set
# --------------------------------------------------------------------------


def test_writer_index_maps_schema_to_its_live_module(repo: Path) -> None:
    (repo / "scripts").mkdir()
    (repo / "scripts" / "w.py").write_text('SCHEMA = "fixture-record.v1"\n')
    index = mod.build_writer_index(repo, {"fixture-record.v1"})
    assert index == {"fixture-record.v1": ["scripts/w.py"]}


def test_writer_index_excludes_whole_source_checkouts(repo: Path) -> None:
    (repo / "scripts").mkdir()
    (repo / "scripts" / "w.py").write_text('SCHEMA = "fixture-record.v1"\n')
    copy = repo / "scratch" / "lane-e6e12303-source" / "scripts"
    copy.mkdir(parents=True)
    (copy / "w.py").write_text('SCHEMA = "fixture-record.v1"\n')
    index = mod.build_writer_index(repo, {"fixture-record.v1"})
    assert index == {"fixture-record.v1": ["scripts/w.py"]}, (
        "a *-source/ tree is a whole repository checkout and must be excluded entirely"
    )


def test_is_excluded_covers_the_corrected_set() -> None:
    assert mod.is_excluded("scratch/a-e6e12303-source/scripts/x.py")
    assert mod.is_excluded("scratch/a-e6e12303-source/scratch/x.py")
    assert mod.is_excluded("scratch/x/.lake/build/y.olean")
    assert mod.is_excluded("scratch/x/__pycache__/y.pyc")
    assert mod.is_excluded("scratch/exact12-overlay-20260810/anything.olean")
    assert not mod.is_excluded("scratch/atail-force/result.json")


def test_generator_field_is_never_used_for_writer_attribution() -> None:
    """`generator` holds polynomial strings in certificates/; it is a decoy."""
    assert "generator" not in mod.WRITER_SIDECAR_FIELDS
    assert "generators" not in mod.WRITER_SIDECAR_FIELDS


# --------------------------------------------------------------------------
# guards
# --------------------------------------------------------------------------


def test_duplicate_json_key_is_rejected() -> None:
    with pytest.raises(mod.SurveyError):
        mod.load_json_bounded(b'{"a": 1, "a": 2}')


def test_symlink_is_not_followed(repo: Path) -> None:
    target = repo / "scratch" / "lane" / "real.json"
    target.write_text("{}")
    link = repo / "scratch" / "lane" / "link.json"
    link.symlink_to(target)
    with pytest.raises(mod.SurveyError):
        mod.read_bounded(link)


def test_summary_counts_are_triples(repo: Path) -> None:
    (repo / "scratch" / "lane" / "a.json").write_text(json.dumps({"schema": "s.v1"}))
    _commit_all(repo)
    records = [mod.survey_record(repo, "scratch/lane/a.json", {})]
    links = mod.lean_reverse_links(repo)
    summary = mod.summarize(records, links)
    assert set(summary["scope"]) == {"files", "distinct_paths", "distinct_contents"}
    for triple in summary["by_route_class"].values():
        assert set(triple) == {"files", "distinct_paths", "distinct_contents"}
