"""Tests for the Tier-2a inventory certificate recheck.

The digest reimplementations are pinned against the writer's own functions, so
a drift in either implementation shows up here rather than as a silent pass.
"""

from __future__ import annotations

import copy
import hashlib
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import recheck_inventory_certificates as mod

REPO = Path(__file__).resolve().parents[1]


@pytest.fixture(scope="module")
def documents():
    class_document, _ = mod.load_document(REPO / mod.CLASS_CERT)
    incidence_document, _ = mod.load_document(REPO / mod.INCIDENCE_CERT)
    return class_document, incidence_document


@pytest.fixture(scope="module")
def writer():
    return mod.load_writer(REPO)


# --------------------------------------------------------------------------
# the reimplemented digests must agree with the writer's
# --------------------------------------------------------------------------


def test_key_set_digest_matches_the_writer(writer):
    keys = ["b", "a", "c", "a"]
    assert mod.key_set_digest(keys) == writer.key_digest(set(keys))


def test_single_key_digest_matches_the_writer(writer):
    assert mod.key_digest_one("abc") == writer.single_key_sha256("abc")


def test_id_list_digest_matches_the_writer(writer):
    ids = [0, 3, 4, 5, 19]
    assert mod.id_list_digest(ids) == writer.class_id_digest(ids)


def test_incidence_digest_matches_the_writer(writer):
    rows = [
        {"profile_id": 1, "class_ids": [4, 5]},
        {"profile_id": 0, "class_ids": [1]},
    ]
    assert mod.incidence_table_digest(rows) == writer.incidence_digest(rows)


def test_range_compression_matches_the_writer(writer):
    for ids in ([], [0], [0, 1, 2], [0, 2, 3, 9], [5, 6, 8, 9, 10]):
        assert mod.compress_ranges(list(ids)) == writer.id_ranges(list(ids))


def test_key_set_digest_deduplicates():
    """key_digest hashes the distinct key set, so a repeat must not change it."""
    assert mod.key_set_digest(["a", "b"]) == mod.key_set_digest(["a", "b", "a"])


def test_key_set_digest_is_order_independent():
    assert mod.key_set_digest(["b", "a"]) == mod.key_set_digest(["a", "b"])


# --------------------------------------------------------------------------
# committed ground truth
# --------------------------------------------------------------------------


def test_every_relation_holds_on_the_committed_files(documents):
    class_document, incidence_document = documents
    relations = mod.check_class_inventory(class_document) + mod.check_incidence(
        incidence_document, class_document
    )
    failed = [r["name"] for r in relations if not r["holds"]]
    assert failed == []
    assert len(relations) >= 30


def test_the_claims_vector_is_all_true_and_computed(documents):
    """These two files are NOT the all-False anti-overclaim seal.

    The seal pattern requires every field to be literally ``False``.  Here each
    claim is a computed boolean
    (``scripts/multi-center-sweep-certificate.py:301-304,510-513``), and every
    one currently evaluates true.
    """
    class_document, incidence_document = documents
    for document in (class_document, incidence_document):
        assert document["claims"]
        assert all(value is True for value in document["claims"].values())


def test_source_dir_resolves(documents):
    class_document, incidence_document = documents
    for document in (class_document, incidence_document):
        source = REPO / document["source_dir"]
        assert source.is_dir()
        assert sorted(p.name for p in source.glob("*.json")) == sorted(
            Path(entry["path"]).name for entry in document["artifact_statuses"]
        )


# --------------------------------------------------------------------------
# mandatory negative controls
# --------------------------------------------------------------------------


def test_a_tampered_class_key_is_caught(documents):
    class_document, _ = documents
    tampered = copy.deepcopy(class_document)
    tampered["rows"][0]["class_key"] += "x"
    failed = {r["name"] for r in mod.check_class_inventory(tampered) if not r["holds"]}
    assert "class_key_sha256_recomputes" in failed
    assert "full_inventory_sha256_recomputes" in failed


def test_a_reordered_incidence_row_is_caught(documents):
    """The digest sorts by profile_id, so reordering alone must trip a relation."""
    class_document, incidence_document = documents
    tampered = copy.deepcopy(incidence_document)
    tampered["rows"][0], tampered["rows"][1] = (
        tampered["rows"][1],
        tampered["rows"][0],
    )
    failed = {
        r["name"]
        for r in mod.check_incidence(tampered, class_document)
        if not r["holds"]
    }
    assert "profile_ids_are_contiguous_from_zero" in failed


def test_a_dropped_class_id_is_caught(documents):
    class_document, incidence_document = documents
    tampered = copy.deepcopy(incidence_document)
    tampered["rows"][0]["class_ids"] = tampered["rows"][0]["class_ids"][:-1]
    failed = {
        r["name"]
        for r in mod.check_incidence(tampered, class_document)
        if not r["holds"]
    }
    assert "incidence_sha256_recomputes" in failed
    assert "class_ids_sha256_recomputes" in failed


def test_the_full_mutation_control_rejects_every_mutant(documents):
    class_document, incidence_document = documents
    control = mod.mutation_control(class_document, incidence_document, None, {})
    assert control["n_mutants"] > 0
    assert control["n_rejected"] == control["n_mutants"]


# --------------------------------------------------------------------------
# leg B
# --------------------------------------------------------------------------


def test_the_writer_serialization_reproduces_the_committed_bytes(documents):
    """The writer's own serializer round-trips the committed file byte for byte."""
    class_document, _ = documents
    committed = mod.read_regular(REPO / mod.CLASS_CERT)
    assert mod.writer_serialization(class_document) == committed


def test_replay_diff_reports_the_first_difference():
    diff = mod.replay_diff({"a": 1}, mod.writer_serialization({"a": 2}))
    assert diff["byte_identical"] is False
    assert diff["first_difference"]["offset"] > 0


def test_replay_diff_accepts_an_identical_rebuild():
    document = {"a": 1, "b": [2, 3]}
    diff = mod.replay_diff(document, mod.writer_serialization(document))
    assert diff["byte_identical"] is True


# --------------------------------------------------------------------------
# bounded IO
# --------------------------------------------------------------------------


def test_duplicate_json_key_is_rejected(tmp_path):
    path = tmp_path / "dup.json"
    path.write_text('{"a": 1, "a": 2}', encoding="utf-8")
    with pytest.raises(ValueError, match="duplicate JSON key"):
        mod.load_document(path)


def test_load_returns_the_raw_bytes(tmp_path):
    path = tmp_path / "d.json"
    raw = b'{"a": 1}'
    path.write_bytes(raw)
    document, seen = mod.load_document(path)
    assert document == {"a": 1}
    assert seen == raw
    assert hashlib.sha256(seen).hexdigest() == hashlib.sha256(raw).hexdigest()


def test_symlink_is_not_followed(tmp_path):
    target = tmp_path / "real.json"
    target.write_text("{}", encoding="utf-8")
    link = tmp_path / "link.json"
    link.symlink_to(target)
    with pytest.raises(OSError):
        mod.load_document(link)
