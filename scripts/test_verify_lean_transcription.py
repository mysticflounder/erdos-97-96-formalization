"""Tests for the Tier-2b Lean transcription check.

The emit runs themselves are not exercised here: one endpoint pass alone is
about a minute of exact-rational arithmetic.  What is pinned is the comparison
logic, the missing-symbol classifier and the repository ground truth those two
rest on.
"""

from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import verify_lean_transcription as mod

REPO = Path(__file__).resolve().parents[1]


def write_tree(root: Path, files: dict[str, str]) -> Path:
    for name, text in files.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
    return root


# --------------------------------------------------------------------------
# tree comparison
# --------------------------------------------------------------------------


def test_identical_trees_compare_clean(tmp_path):
    files = {"A.lean": "one\n", "Shards/B.lean": "two\n"}
    left = write_tree(tmp_path / "left", files)
    right = write_tree(tmp_path / "right", files)
    diff = mod.compare_trees(left, right)
    assert diff["byte_identical"] is True
    assert diff["identical"] == 2


def test_one_changed_byte_is_caught(tmp_path):
    """The mandatory control: a single byte must break the comparison."""
    left = write_tree(tmp_path / "left", {"A.lean": "one\n"})
    right = write_tree(tmp_path / "right", {"A.lean": "onE\n"})
    diff = mod.compare_trees(left, right)
    assert diff["byte_identical"] is False
    assert diff["differing"] == ["A.lean"]


def test_a_missing_emitted_file_is_caught(tmp_path):
    left = write_tree(tmp_path / "left", {"A.lean": "one\n"})
    right = write_tree(tmp_path / "right", {"A.lean": "one\n", "B.lean": "two\n"})
    diff = mod.compare_trees(left, right)
    assert diff["byte_identical"] is False
    assert diff["only_committed"] == ["B.lean"]


def test_an_extra_emitted_file_is_caught(tmp_path):
    left = write_tree(tmp_path / "left", {"A.lean": "one\n", "X.lean": "x\n"})
    right = write_tree(tmp_path / "right", {"A.lean": "one\n"})
    diff = mod.compare_trees(left, right)
    assert diff["byte_identical"] is False
    assert diff["only_emitted"] == ["X.lean"]


def test_ignored_committed_files_do_not_count_as_a_break(tmp_path):
    left = write_tree(tmp_path / "left", {"A.lean": "one\n"})
    right = write_tree(tmp_path / "right", {"A.lean": "one\n", "Bank.lean": "b\n"})
    diff = mod.compare_trees(left, right, ignore=("Bank.lean",))
    assert diff["byte_identical"] is True
    assert diff["ignored_committed"] == ["Bank.lean"]


def test_an_absent_emitted_tree_is_not_a_pass(tmp_path):
    right = write_tree(tmp_path / "right", {"A.lean": "one\n"})
    diff = mod.compare_trees(tmp_path / "nothing", right)
    assert diff["byte_identical"] is False
    assert diff["emitted_files"] == 0


# --------------------------------------------------------------------------
# missing-symbol classifier, against the repository
# --------------------------------------------------------------------------


def test_the_broken_surplus_shard_path_is_reported():
    """Ground truth: the term-sharded surplus emitter calls two removed helpers.

    Commit 7c3fa141 removed ``add_poly_many`` and ``singleton_poly`` from
    ``scripts/endpoint-certificate.py``.  The surplus caller was not updated, so
    every certificate above the shard threshold aborts the emit.
    """
    found = mod.classify_surplus_failure(REPO, {"stderr_tail": ""})
    unguarded = {item["symbol"] for item in found["unguarded_missing_symbols"]}
    assert {"add_poly_many", "singleton_poly"} <= unguarded


def test_a_guarded_call_site_is_not_counted_as_a_break():
    """``run_singular_script`` is wrapped in ``except AttributeError`` with a
    local fallback (``scripts/pinned-surplus-certificate.py:228``), so its
    absence is tolerated by design and must not read as a regression."""
    found = mod.classify_surplus_failure(REPO, {"stderr_tail": ""})
    guarded = {
        item["symbol"]
        for item in found["missing_producer_symbols"]
        if item["guarded_by_attributeerror"]
    }
    unguarded = {item["symbol"] for item in found["unguarded_missing_symbols"]}
    assert "run_singular_script" in guarded
    assert "run_singular_script" not in unguarded


# --------------------------------------------------------------------------
# repository ground truth the check depends on
# --------------------------------------------------------------------------


def test_every_term_sharded_endpoint_id_has_a_certificate():
    tool = mod.load_module(
        REPO / "scripts" / "endpoint-certificate.py", "endpoint_certificate_tool"
    )
    assert tool.PRODUCT_SUM_ENDPOINT_IDS
    for pid in tool.PRODUCT_SUM_ENDPOINT_IDS:
        assert (REPO / mod.ENDPOINT_JSON_DIR / f"{pid}.json").is_file()
        assert (
            REPO / mod.ENDPOINT_LEAN_DIR / f"{tool.lean_module_stem(pid)}.lean"
        ).is_file()


def test_the_committed_lean_directories_exist():
    assert (REPO / mod.ENDPOINT_LEAN_DIR).is_dir()
    assert (REPO / mod.SURPLUS_LEAN_DIR).is_dir()


def test_the_excluded_surplus_modules_are_really_committed():
    """SURPLUS_NOT_EMITTED must name files that exist, or the exclusion hides
    a genuine missing-output finding instead of a known out-of-scope one."""
    for name in mod.SURPLUS_NOT_EMITTED:
        assert (REPO / mod.SURPLUS_LEAN_DIR / name).is_file()


def test_the_exclusion_cannot_hide_a_certificate_row():
    """No excluded name is the module of a certificate in the input directory.

    This is what the exclusion has to satisfy.  If ``Bank.lean`` or
    ``Payload.lean`` were the emitted stem of some certificate, ignoring it
    would turn a real missing-output break into a silent pass.
    """
    producer = mod.load_module(
        REPO / "scripts" / "pinned-surplus-certificate.py",
        "pinned_surplus_certificate_tool",
    )
    stems = set()
    for cert_path in producer.relaxed_certificate_paths(REPO / mod.SURPLUS_JSON_DIR):
        cert_id, _v, _g, _c = producer.read_relaxed_certificate(cert_path)
        stems.add(f"{producer.relaxed_lean_module_stem(cert_id)}.lean")
    assert stems
    assert not stems & set(mod.SURPLUS_NOT_EMITTED)


# --------------------------------------------------------------------------
# digests
# --------------------------------------------------------------------------


def test_sha256_file_matches_hashlib(tmp_path):
    import hashlib

    path = tmp_path / "f.bin"
    payload = b"abc" * 1000
    path.write_bytes(payload)
    assert mod.sha256_file(path) == hashlib.sha256(payload).hexdigest()


def test_tree_digests_uses_posix_relative_keys(tmp_path):
    write_tree(tmp_path, {"a/b/C.lean": "x\n"})
    assert list(mod.tree_digests(tmp_path)) == ["a/b/C.lean"]
