#!/usr/bin/env python3
"""Generate the P97 proof-obligation registry from built-spine truth.

This is the single generated authority ledger described in
``docs/audits/2026-08-23-consolidation-refactor-audit.md`` (sections
"P0 - Single generated authority ledger" and "generated obligation registry as
the sole status source").  It joins Lean declaration identity, publish-spine
reachability, source location and cluster into one canonical file:

    proof-status/obligations.json          canonical registry (schema v1)
    proof-status/id-assignments.json       stable symbol -> id ledger
    proof-status/frontier-table.generated.md  README-shaped open frontier table

The reviewed half of the ledger lives in ``proof-status/obligations-meta.json``
(a plain JSON object keyed by obligation id).  Its reviewed fields are joined
onto every registry entry at generate time, and the join is validated: every
registry id must have exactly one meta entry, every meta entry must name a live
registry id, and ``prose_status`` must be a member of the controlled status
vocabulary fixed by the consolidation-refactor audit (P1 section "controlled
status vocabulary").

Subcommands
-----------
generate --baseline DIR --out DIR
    Build the registry from recorded baseline exports
    (``spine-sorry.json`` / ``offspine-sorry.json`` JSON-lines under DIR).

generate --fresh --out DIR
    Same, but re-export the ROSTER live first by running ``proof-blueprint``
    into a temporary directory under DIR.  Declared consumer trust is still read
    from the RECORDED closure, ``DIR/baseline/axioms.txt`` (W3-0e-fix-2, auditor
    #7524); no live axiom closure is exported in either mode.

check --baseline DIR
    Regenerate FRESH from the live tree and exit nonzero with a precise diff if
    the obligation SET or any per-obligation ``lean_decl`` / ``source_file`` /
    ``reachable`` field differs from the committed registry, or if the reviewed
    metadata join is broken.  This is the standing gate for later refactor
    phases; the only thing it writes is a revision-binding receipt under
    ``proof-status/receipts/``, which pins the git HEAD, the working-tree
    sha256 of every roster source file, the Lean toolchain digest and the
    ``proof-blueprint refs --check`` build id and staleness counts that the
    verdict was computed against.

check ... --require-factorized LABEL
    Additionally require a VERIFIED ``p97-factorization/v2`` block on every
    REACHABLE leaf of the named cluster (a ``CLUSTER_*`` code, e.g. ``TD``);
    repeatable.  Without the flag, missing blocks are only counted.

Exit codes: 0 pass, 1 drift or metadata violation, 2 operational failure.

Factorization entries (W3-0)
----------------------------
A reviewed ``obligations-meta.json`` entry MAY carry a ``factorization`` block
recording the machine-checkable shape a cluster coordinator refactor leaves
behind (audit "Phase 3 - cluster coordinators": *every old leaf has a
machine-checked factorization entry in the obligation registry*)::

    "factorization": {
      "schema": "p97-factorization/v2",
      "obligation_id": "<the entry's own id>",
      "roles": {"legacy_wrapper": Sym, "coordinator": Sym,
                "producer": Sym, "eliminator": Sym, "open_leaf": Sym},
      "transitive": [{"from": "<role>", "to": "<role>", "via": [Sym, ...]}],
      "pinned": {"legacy_wrapper_statement_sha256": <hex>,
                 "open_leaf_statement_sha256": <hex>},
      "consumer_trust": [<axiom name>, ...],   # OPTIONAL (W3-0e); see below
      "note": "<free prose>"
    }

``p97-factorization/v1`` is the same block WITHOUT the ``pinned`` digests.  It
still loads, is counted as a WARNING in the receipt, and is NEVER reported as a
verified factorization: without pinned statement digests nothing binds the
block to the statements it claims to factor.  A meta file with no factorization
block at all is unchanged legacy input.  Any key inside a block outside the set
above is a metadata violation, as is an unknown ``schema``.

What a v2 block must satisfy (all violations are reported, none are inferred):

* the five roles are DISTINCT, exact, fully qualified, PUBLIC declarations that
  each resolve to exactly one index record (``search --name`` filtered to an
  exact fully-qualified match; zero or more than one record is ambiguous and is
  a violation, as is ``private == true``);
* EVERY ``via`` declaration obeys the same resolve rule - exactly one PUBLIC
  index record - and may not be one of the five roles;
* the direct-call chain ``legacy_wrapper -> coordinator``,
  ``coordinator -> producer``, ``coordinator -> eliminator`` and
  ``eliminator -> open_leaf`` holds in the kernel-mined call graph.  "A directly
  calls B" is decided as ``A in callers(B)``, where ``callers(B)`` is exactly
  what ``proof-blueprint search --uses B`` returns (the declarations whose
  proofs use B).  A ``transitive`` row REPLACES the direct check for its
  ``(from, to)`` pair by checking every consecutive hop of
  ``from -> via[0] -> ... -> via[-1] -> to`` directly; a pair with no row must
  be direct;
* the direct-call relation RESTRICTED to the five roles UNION every ``via``
  declaration is acyclic;
* ``open_leaf`` is the registry entry's ``lean_decl`` (after the alias
  migration below) and has ``has_sorry == true``;
* the pinned ``open_leaf`` and ``legacy_wrapper`` digests equal the current
  statement digests of those two declarations;
* every symbol the block names (roles and ``via`` hops) is mined for the
  CURRENT build - not stale, not never-mined;
* every hop meets the trust boundary below.

Trust boundary (W3-0b)
    The allowed baseline is EXPLICIT: ``ALLOWED_AXIOMS = ("propext",
    "Classical.choice", "Quot.sound")``.  A closure is CLEAN when every axiom is
    in that tuple and CONSUMER-OK when every axiom is in that tuple or is
    ``sorryAx``.  Everything else - ``Lean.ofReduceNat``, ``Lean.ofReduceBool``,
    ``Lean.trustCompiler``, any custom axiom, any unknown name - is forbidden on
    every hop REGARDLESS of the tag ``proof-blueprint axioms`` prints next to
    it: the tag is advisory and is never a trust decision.

    Producer-path hops (the ``producer`` itself and every ``via`` on the
    ``coordinator -> producer`` row) must be CLEAN.  Consumer-side hops
    (``legacy_wrapper``, ``coordinator``, ``eliminator`` and every ``via`` on
    the ``legacy_wrapper -> coordinator``, ``coordinator -> eliminator`` and
    ``eliminator -> open_leaf`` rows) must be CONSUMER-OK, and ``sorryAx`` is
    permitted on such a hop ONLY when that hop actually consumes the open leaf -
    decided from the call graph as a bounded backwards reachability from
    ``open_leaf`` over ``callers`` restricted to the role and ``via`` symbols.
    A consumer hop carrying ``sorryAx`` that does not reach the open leaf is
    reported as "<id>: <role> carries sorryAx without consuming the open leaf".
    A ``has_sorry`` source scan is deliberately NOT used anywhere: it cannot see
    a transitively reached ``sorry``.

    The ``open_leaf`` role is audited on the SAME boundary (auditor #7462):
    ``has_sorry == true`` proves the leaf is OPEN, it does NOT prove the leaf
    adds nothing else, so the leaf's own closure must be CONSUMER-OK - exactly
    ``propext``, ``Classical.choice``, ``Quot.sound`` and ``sorryAx``, and any
    other axiom (custom, native, unknown, whatever tag the tool prints) is
    reported as "<id>: open_leaf (<Sym>) carries forbidden axiom <name>".
    ``sorryAx`` is ALWAYS permitted on the leaf and needs no consumption
    justification there: the leaf is the open leaf a consumer hop would have to
    reach, so it consumes itself.  Every other consumer hop still has to reach
    it.

Declared consumer trust (W3-0e)
    A v2 block MAY carry ONE optional key, ``consumer_trust``: a non-empty JSON
    list of unique non-empty axiom names.  Anything else is a violation
    ("<id>: consumer_trust must be a non-empty list of unique axiom names"), and
    the key inside a v1 block is an unknown key.

    A listed name is ACCEPTED only when it is not ``sorryAx`` (an open
    obligation is never declarable trust), is not already in ``ALLOWED_AXIOMS``,
    and IS carried by the PUBLISH TARGET's RECORDED closure: the reviewed
    ``proof-blueprint axioms`` export of ``PUBLISH_TARGET`` kept in the
    repository under ``BASELINE_AXIOMS_FILE`` and parsed by
    ``parse_axioms_output`` (``read_declarable_trust``).  The RECORDED closure
    is the trust authority in BOTH source modes and NO live export is ever
    consulted for trust (W3-0e-fix-2, auditor #7524):

    * ``generate --baseline DIR`` and every ``check`` read ``DIR/axioms.txt``;
    * ``generate --fresh --out OUT`` reads ``OUT/baseline/axioms.txt`` - the
      same reviewed file, kept with the output tree the run regenerates.

    A name the closure does not carry is rejected; a closure that could not be
    read at all - an absent or unparseable recorded file - is reported as
    "cannot verify" and accepts nothing, and ``generate`` refuses BEFORE writing
    any of its three output files.  Each rejected name prints its own violation
    line naming the id and the name.

    An ACCEPTED name is acceptable on CONSUMER-SIDE hops ONLY: ``legacy_wrapper``,
    ``coordinator``, ``eliminator``, every ``via`` on the three consumer rows,
    and the ``open_leaf`` audit.  The producer path is unchanged - it must be
    CLEAN with no opt-in, and its violation line says that
    ``consumer_trust`` does not apply there.  A declaration that NO consumer-side
    hop actually carries is itself a violation ("<id>: consumer_trust declares
    <name> but no consumer-side hop carries it"), so the key can never be a
    blanket widening.

    The key is MATERIALIZED onto the registry entry (sorted), so an added,
    removed or drifted declaration is registry drift like any other field, and
    ``check_factorizations`` reports ``"declared_trust": {"blocks": <n>,
    "axioms": [...]}`` in its summary, its receipt and the console census line.

Canonical registry materialization (W3-0b)
    ``build_registry`` copies every reviewed v2 block onto its own registry
    entry in a normalized form, so ``obligations.json`` CARRIES the verified
    factorization instead of pointing at the reviewed file::

        "factorization": {
          "schema": "p97-factorization/v2",
          "roles": {...five roles...},
          "transitive": [...],            # sorted; omitted when empty
          "pinned": {...},
          "verified_at_build": "<current mined build fingerprint>"
        }

    ``obligation_id`` and ``note`` are dropped (the id is the entry's own key;
    prose is not machine-checkable).  An entry whose reviewed metadata carries
    no v2 block gets NO ``factorization`` key, so a registry with no
    factorization entries regenerates byte-identical.  ``check`` compares the
    materialized block on the COMMITTED registry entry with the normalized
    reviewed block stamped with the CURRENT build: a missing block, an extra
    block, a drifted field or a ``verified_at_build`` that is not the current
    build is registry drift and exits 1 naming the id and the differing key.

Hard generator gate (W3-0c)
    ``generate`` treats an ALIAS-MIGRATION violation and a FACTORIZATION
    violation as a hard error in EVERY mode, ``--strict-meta`` or not, and the
    gate is TRANSACTIONAL: the command validates first and writes nothing at
    all when the gate fails.  ``obligations.json``, ``id-assignments.json`` and
    ``frontier-table.generated.md`` keep the bytes they had, and a file that did
    not exist is not created.  Each violation is printed to stderr as
    ``ERROR: factorization: <reason>``, followed by a one-line refusal summary,
    and the exit code is 1.  (Under ``--fresh`` the output directory itself is
    still created before the gate runs, because it is the scratch parent the
    live re-export needs; none of the three generated files is written there.)

    ``--strict-meta`` therefore controls ONE thing only: whether the ORDINARY
    reviewed-metadata join warnings from ``validate_meta`` (a missing meta
    entry, an orphan entry, an unknown ``prose_status``, a cluster disagreement)
    are a warning that still writes or an exit 1 after writing.  It has no say
    over the factorization gate, which was the auditor's finding #7468: a
    rejected rename used to be written first and downgraded to that soft path,
    so a default-mode ``generate`` exited 0 after retiring the old id and
    allocating a new one.

    Materialization follows the same rule.  ``build_registry`` takes a
    ``verified_ids`` argument, and ``generate`` passes exactly the set
    ``check_factorizations`` reports as VERIFIED, so a ``verified_at_build``
    stamp is only ever written onto a block that passed live validation.  With
    ``verified_ids=None`` (the default, used by ``check`` for its throwaway
    comparison registry and by the unit tests) every v2 block is materialized,
    which is the pre-W3-0c behaviour.

Statement digest
    ``sha256`` of the index record's ``signature`` string after collapsing every
    whitespace run to one space and stripping leading/trailing whitespace
    (``" ".join(text.split())``), encoded UTF-8, lowercase hex.  The
    normalization exists so that re-indentation of a Lean statement does not
    read as a statement change; a token change does.

Stable identity / alias migration
    When a v2 block names an ``open_leaf`` different from the symbol the id
    ledger currently assigns to that id, that is a RENAME, not drift: the
    ``P97-*`` id FOLLOWS the new ``open_leaf``, and the old public name is
    recorded in ``id-assignments.json`` under ``aliases`` as
    ``{"aliases": [<old>, ...], "renamed_from": <old>,
    "renamed_at_head": <git HEAD short>}``.  A rename is accepted only when the
    old name still resolves to exactly one PUBLIC index record (the
    compatibility wrapper) and is exactly the ``legacy_wrapper`` role.  It may
    not allocate a new id, may not retire the old id, may not reuse an id
    another entry holds, and may not alias a symbol another id already claims;
    each of those is a violation and the ledger is left alone.  WITHOUT a
    factorization block a ``lean_decl`` change is still ordinary drift, exactly
    as before.  The ``aliases`` key is written only when it is non-empty, so a
    ledger with no rename stays byte-identical.

Freshness and trust are read through one injectable seam
(``FactorizationBackend``): ``resolve``, ``callers``, ``axioms``,
``mined_build`` and ``current_build``.  ``BlueprintBackend`` backs it with the
``proof-blueprint`` CLI plus a READ-ONLY sqlite3 read of the blueprint database
named by ``[paths] db`` in ``.blueprint.toml``; the tests back it with dicts.
Every seam failure is reported as a "cannot verify" violation - freshness is
never assumed.

``main(argv, backend_factory=..., export_source=...)`` exposes that seam at the
COMMAND level (W3-0b), together with a second one for the roster records.  Both
default to None, which is the live behaviour, and neither can be set from the
command line; they exist so a test can drive the real ``generate`` / ``check``
entry point over a COPY of ``proof-status`` without reading live data.

Standard library only.  The registry and the tables are deterministic (no
timestamps, every collection sorted); receipts are timestamped by design.
"""

from __future__ import annotations

import argparse
import datetime
import hashlib
import json
import shutil
import sqlite3
import subprocess
import sys
import tempfile
import tomllib
from pathlib import Path

SCHEMA = "p97-obligation-registry/v1"
ID_SCHEMA = "p97-obligation-id-assignments/v1"
PUBLISH_TARGET = "Problem97.erdos97_rhs"
GENERATED_BY = "scripts/gen_obligation_registry.py"

REPO_ROOT = Path(__file__).resolve().parent.parent
# Registry ``source_file`` paths are recorded relative to the Lean package root.
LEAN_ROOT = REPO_ROOT / "lean"

SPINE_EXPORT = "spine-sorry.json"
OFFSPINE_EXPORT = "offspine-sorry.json"
BASE_HEAD_FILE = "base-head.txt"
# The publish target's RECORDED axiom closure in the `proof-blueprint axioms`
# text format: the reviewed export kept in the repository beside the baseline
# roster exports.  It is the ONLY source of declarable consumer trust (W3-0e)
# in BOTH source modes - `generate --baseline DIR` and `check` read
# `DIR/axioms.txt`, `generate --fresh --out OUT` reads
# `OUT/<BASELINE_DIR_NAME>/axioms.txt` - and no live export is ever consulted
# for trust (W3-0e-fix-2, auditor #7524).  Both are read by
# `read_declarable_trust`.
BASELINE_AXIOMS_FILE = "axioms.txt"
# The baseline subdirectory of an output tree (`proof-status/baseline`).
BASELINE_DIR_NAME = "baseline"
REGISTRY_NAME = "obligations.json"
ID_ASSIGNMENTS_NAME = "id-assignments.json"
FRONTIER_TABLE_NAME = "frontier-table.generated.md"
# The reviewed metadata file actually kept in the repository.
META_NAME = "obligations-meta.json"
# Historical name, accepted only when META_NAME is absent.
META_OVERLAY_NAME = "meta-status.overlay.json"

RECEIPTS_DIRNAME = "receipts"
RECEIPT_SCHEMA = "p97-registry-check-receipt/v1"
RECEIPT_PREFIX = "registry-check-"

# Toolchain pins, most specific first: the Lake package lives under lean/.
TOOLCHAIN_CANDIDATES = ("lean/lean-toolchain", "lean-toolchain")

BLUEPRINT_CMD = "proof-blueprint"
SPINE_ARGS = ["search", "--with-sorry", "--spine", "--json"]
OFFSPINE_ARGS = ["search", "--with-sorry", "--off-spine", "--json"]
REFS_CHECK_ARGS = ["refs", "--check"]

# The `proof-blueprint axioms` text format, matched EXACTLY (auditor #7521).
# The header is `axioms reported by `#print axioms <Sym>` (<N>):`; the target it
# names must be the symbol that was queried and the count is mandatory.
AXIOMS_HEADER_OPENING = "axioms reported by"
AXIOMS_HEADER_PREFIX = AXIOMS_HEADER_OPENING + " `#print axioms "
AXIOMS_HEADER_INFIX = "` ("
AXIOMS_HEADER_SUFFIX = "):"
# The tags the tool prints in the tag column, lowercased.  A tag is ADVISORY and
# is never a trust decision; an unknown one means the format changed, and the
# whole parse is refused rather than guessed at.
AXIOMS_TAGS = ("core", "core*", "custom")
# Non-alphanumeric characters a Lean identifier may use in the axiom column.
AXIOM_NAME_PUNCTUATION = "_.'!?"

# ---------------------------------------------------------------------------
# reviewed metadata
# ---------------------------------------------------------------------------

# Controlled status vocabulary, transcribed verbatim from
# docs/audits/2026-08-23-consolidation-refactor-audit.md, section
# "P1 refactor - controlled status vocabulary".  This tuple is the authority the
# gate enforces; extend it only together with that audit section.
PROSE_STATUS_VOCABULARY = (
    "KERNEL_CLEAN",
    "CERTIFIED_APPROVED_TRUST",
    "SOURCE_CLEAN_TRANSITIVELY_OPEN",
    "PROSE_CLOSED_LEAN_UNIMPLEMENTED",
    "NORMAL_FORM_CLOSED_TERMINAL_OPEN",
    "OPEN_MATHEMATICAL",
    "REFUTED_LOCAL_STATEMENT",
    "OFF_SPINE_DIAGNOSTIC",
    "SUPERSEDED",
)

# Reviewed fields copied onto each registry entry.  ``cluster`` is deliberately
# absent: the registry derives its own cluster from the source path and the meta
# ``cluster`` is cross-checked against it instead of overwriting it.
META_ATTACHED_FIELDS = (
    "terminal_family",
    "mathematical_packet",
    "latest_checkpoint",
    "implementation_effect",
    "evidence_note",
)

# ---------------------------------------------------------------------------
# cluster classification (from the source-file basename)
# ---------------------------------------------------------------------------

CLUSTER_R221 = "R221"
CLUSTER_TA = "TA"
CLUSTER_TS = "TS"
CLUSTER_TD = "TD"
CLUSTER_B1 = "B1"
CLUSTER_X = "X"

CLUSTER_LABELS = {
    CLUSTER_R221: "Rigid221",
    CLUSTER_TA: "TriApex",
    CLUSTER_TS: "TwoSource",
    CLUSTER_TD: "Two-deletion",
    CLUSTER_B1: "B1Live",
    CLUSTER_X: "Other",
}

# Display order of the frontier table, matching the README open-frontier table.
CLUSTER_ORDER = [
    CLUSTER_LABELS[CLUSTER_R221],
    CLUSTER_LABELS[CLUSTER_TA],
    CLUSTER_LABELS[CLUSTER_TS],
    CLUSTER_LABELS[CLUSTER_TD],
    CLUSTER_LABELS[CLUSTER_B1],
    CLUSTER_LABELS[CLUSTER_X],
]

TS_PREFIXES = ("TwoSource", "FreshThird", "FirstFiber", "FirstNonHit")


def module_stem(source_file: str) -> str:
    """Basename of a source path with a trailing ``.lean`` removed."""
    name = source_file.replace("\\", "/").rsplit("/", 1)[-1]
    if name.endswith(".lean"):
        name = name[: -len(".lean")]
    return name


def cluster_code(source_file: str) -> str:
    stem = module_stem(source_file)
    if stem.startswith("Rigid221"):
        return CLUSTER_R221
    if stem.startswith("TriApex"):
        return CLUSTER_TA
    if stem.startswith("TwoDeletionCollision"):
        return CLUSTER_TD
    for prefix in TS_PREFIXES:
        if stem.startswith(prefix):
            return CLUSTER_TS
    if stem.startswith("B1Live"):
        return CLUSTER_B1
    return CLUSTER_X


def cluster_label(source_file: str) -> str:
    return CLUSTER_LABELS[cluster_code(source_file)]


# ---------------------------------------------------------------------------
# slug derivation
# ---------------------------------------------------------------------------

MIN_SLUG_LEN = 10
MAX_SLUG_LEN = 20

# Segments dropped from the front of a declaration base name.
LEAD_NOISE = {"false", "of", "not", "no"}
# Segments dropped from the end of a declaration base name.
TAIL_NOISE = {"of", "counterexample"}
# Segments that carry no distinguishing content when widening a slug leftwards.
SKIP_SEGMENTS = {
    "of", "eq", "ne", "le", "lt", "ge", "gt", "is", "and", "or", "the", "a", "an",
}


def camel_words(text: str) -> list[str]:
    """Split an identifier segment into camel-case words, no regex."""
    words: list[str] = []
    current = ""
    for index, ch in enumerate(text):
        if ch in "_-":
            if current:
                words.append(current)
                current = ""
            continue
        if ch.isupper() and current:
            previous = text[index - 1] if index > 0 else ""
            following = text[index + 1] if index + 1 < len(text) else ""
            starts_word = (
                previous.islower()
                or previous.isdigit()
                or (previous.isupper() and following.islower())
            )
            if starts_word:
                words.append(current)
                current = ""
        current += ch
    if current:
        words.append(current)
    return words


def _upper_alnum(text: str) -> str:
    return "".join(ch for ch in text.upper() if ch.isalnum())


def _joined_length(words: list[str]) -> int:
    return sum(len(_upper_alnum(word)) for word in words)


def slug_for_symbol(symbol: str) -> str:
    """Short UPPERCASE slug from the distinguishing tail of a declaration name.

    The tail is grown right-to-left one underscore segment at a time until it
    reaches ``MIN_SLUG_LEN`` characters, and is trimmed word-by-word from the
    right so it never exceeds ``MAX_SLUG_LEN``.  Example:
    ``false_of_crossBlockerCoincidence`` -> ``CROSSBLOCKER``.
    """
    base = symbol.rsplit(".", 1)[-1]
    segments = [seg for seg in base.split("_") if seg]
    while len(segments) > 1 and segments[0].lower() in LEAD_NOISE:
        segments.pop(0)
    while len(segments) > 1 and segments[-1].lower() in TAIL_NOISE:
        segments.pop()

    words: list[str] = []
    for segment in reversed(segments):
        if segment.lower() in SKIP_SEGMENTS:
            continue
        candidate = camel_words(segment) + words
        if words and _joined_length(candidate) > MAX_SLUG_LEN:
            break
        words = candidate
        if _joined_length(words) >= MIN_SLUG_LEN:
            break

    while len(words) > 1 and _joined_length(words) > MAX_SLUG_LEN:
        words.pop()

    slug = "".join(_upper_alnum(word) for word in words)
    if not slug:
        slug = _upper_alnum(base)
    return slug or "OBLIGATION"


def base_id(symbol: str, source_file: str, reachable: bool) -> str:
    code = cluster_code(source_file)
    prefix = "P97-" + code + "-" if reachable else "P97-OFF-" + code + "-"
    return prefix + slug_for_symbol(symbol)


# ---------------------------------------------------------------------------
# input reading
# ---------------------------------------------------------------------------


class RegistryError(Exception):
    """Operational failure: missing input, failed export, unreadable file."""


def read_records(path: Path) -> list[dict]:
    """Read a proof-blueprint --json export (JSON lines, array tolerated)."""
    if not path.is_file():
        raise RegistryError("missing export file: " + str(path))
    text = path.read_text(encoding="utf-8")
    stripped = text.strip()
    if not stripped:
        return []
    if stripped.startswith("["):
        parsed = json.loads(stripped)
        if not isinstance(parsed, list):
            raise RegistryError("unexpected JSON payload in " + str(path))
        return parsed
    records = []
    for number, line in enumerate(text.splitlines(), start=1):
        line = line.strip()
        if not line:
            continue
        try:
            records.append(json.loads(line))
        except json.JSONDecodeError as exc:
            raise RegistryError(
                "bad JSON on line " + str(number) + " of " + str(path) + ": " + str(exc)
            ) from exc
    return records


def read_json(path: Path) -> dict:
    if not path.is_file():
        raise RegistryError("missing file: " + str(path))
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise RegistryError("bad JSON in " + str(path) + ": " + str(exc)) from exc


def git_head() -> str:
    try:
        result = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=str(REPO_ROOT),
            capture_output=True,
            text=True,
            check=False,
        )
    except OSError:
        return ""
    if result.returncode != 0:
        return ""
    return result.stdout.strip()


def read_base_head(baseline_dir: Path | None, out_dir: Path | None) -> str:
    for candidate in (
        baseline_dir / BASE_HEAD_FILE if baseline_dir else None,
        out_dir / BASELINE_DIR_NAME / BASE_HEAD_FILE if out_dir else None,
    ):
        if candidate is not None and candidate.is_file():
            head = candidate.read_text(encoding="utf-8").strip()
            if head:
                return head
    return "unknown"


def export_fresh(target_dir: Path) -> Path:
    """Run proof-blueprint twice, writing the two ROSTER exports into target_dir.

    Both are HARD - a failure there fails the run.  No axiom closure is exported
    here and none is needed: declarable consumer trust is read from the RECORDED
    closure in every mode (W3-0e-fix-2, auditor #7524), so neither ``--fresh``
    nor ``check`` runs ``proof-blueprint axioms`` for the publish target at all.
    """
    target_dir.mkdir(parents=True, exist_ok=True)
    for args, name in ((SPINE_ARGS, SPINE_EXPORT), (OFFSPINE_ARGS, OFFSPINE_EXPORT)):
        command = [BLUEPRINT_CMD] + args
        try:
            result = subprocess.run(
                command,
                cwd=str(REPO_ROOT),
                capture_output=True,
                text=True,
                check=False,
            )
        except OSError as exc:
            raise RegistryError(
                "cannot run " + " ".join(command) + ": " + str(exc)
            ) from exc
        if result.returncode != 0:
            detail = result.stderr.strip() or result.stdout.strip() or "(no output)"
            raise RegistryError(
                " ".join(command)
                + " exited "
                + str(result.returncode)
                + " (cwd "
                + str(REPO_ROOT)
                + ")\n"
                + detail
            )
        (target_dir / name).write_text(result.stdout, encoding="utf-8")
    return target_dir


# ---------------------------------------------------------------------------
# id assignment ledger
# ---------------------------------------------------------------------------


def load_id_assignments(path: Path) -> dict:
    if not path.is_file():
        return {"schema": ID_SCHEMA, "assigned": {}, "retired": {}, "aliases": {}}
    data = read_json(path)
    assigned = data.get("assigned")
    retired = data.get("retired")
    aliases = data.get("aliases")
    return {
        "schema": data.get("schema", ID_SCHEMA),
        "assigned": dict(assigned) if isinstance(assigned, dict) else {},
        "retired": dict(retired) if isinstance(retired, dict) else {},
        # Alias records written by the W3-0 factorization rename migration.
        # Absent on a ledger that has never seen a rename.
        "aliases": dict(aliases) if isinstance(aliases, dict) else {},
    }


def assign_ids(records: list[dict], ledger: dict, source_head: str) -> tuple[dict, dict]:
    """Return (symbol -> id for the current set, updated ledger).

    Existing symbols keep their id even if the slug rule changes.  A symbol
    that reappears after retirement gets its old id back.  New symbols are
    assigned in lexicographic order, with ``-2`` / ``-3`` suffixes on
    collision.  Vanished symbols move to the ``retired`` map with the head at
    which they disappeared.
    """
    assigned = dict(ledger["assigned"])
    retired = dict(ledger["retired"])

    present = {record["symbol"]: record for record in records}

    taken = set(assigned.values())
    for entry in retired.values():
        if isinstance(entry, dict) and entry.get("id"):
            taken.add(entry["id"])

    # A retired symbol that came back reclaims its old id.
    for symbol in sorted(present):
        if symbol in assigned:
            continue
        entry = retired.get(symbol)
        if isinstance(entry, dict) and entry.get("id"):
            assigned[symbol] = entry["id"]
            del retired[symbol]

    for symbol in sorted(present):
        if symbol in assigned:
            continue
        record = present[symbol]
        candidate = base_id(symbol, record["source_file"], record["reachable"])
        if candidate in taken:
            suffix = 2
            while candidate + "-" + str(suffix) in taken:
                suffix += 1
            candidate = candidate + "-" + str(suffix)
        assigned[symbol] = candidate
        taken.add(candidate)

    for symbol in sorted(assigned):
        if symbol in present:
            continue
        if symbol not in retired:
            retired[symbol] = {"id": assigned[symbol], "retired_at_head": source_head}
        del assigned[symbol]

    current = {symbol: assigned[symbol] for symbol in present}
    updated = {
        "schema": ID_SCHEMA,
        "assigned": {symbol: assigned[symbol] for symbol in sorted(assigned)},
        "retired": {symbol: retired[symbol] for symbol in sorted(retired)},
    }
    # Written only when a rename has actually happened, so a ledger that has
    # never been migrated stays byte-identical.
    aliases = ledger.get("aliases") or {}
    if aliases:
        updated["aliases"] = {
            obligation_id: aliases[obligation_id] for obligation_id in sorted(aliases)
        }
    return current, updated


# ---------------------------------------------------------------------------
# registry construction
# ---------------------------------------------------------------------------


def normalize_records(spine: list[dict], offspine: list[dict]) -> list[dict]:
    """Flatten the two exports into raw obligation records."""
    seen: dict[str, dict] = {}
    for records, reachable in ((spine, True), (offspine, False)):
        for record in records:
            symbol = record.get("symbol")
            if not symbol:
                raise RegistryError("export record without a symbol: " + repr(record))
            source_file = record.get("file") or ""
            entry = {
                "symbol": symbol,
                "reachable": reachable,
                "source_file": source_file,
                "line": record.get("line"),
                "kind": record.get("kind") or "theorem",
            }
            if symbol in seen and seen[symbol] != entry:
                raise RegistryError(
                    "symbol reported twice with different data: " + symbol
                )
            seen[symbol] = entry
    return [seen[symbol] for symbol in sorted(seen)]


def meta_path(status_dir: Path | None) -> Path | None:
    """Path of the reviewed metadata file, preferring the current name."""
    if status_dir is None:
        return None
    primary = status_dir / META_NAME
    if primary.is_file():
        return primary
    fallback = status_dir / META_OVERLAY_NAME
    if fallback.is_file():
        return fallback
    return primary


def load_meta(status_dir: Path | None) -> dict:
    """Reviewed metadata keyed by obligation id.

    The reviewed file (``obligations-meta.json``) is a JSON object mapping an
    obligation id to an object of reviewed fields.  The historical overlay name
    is accepted as a fallback, including its degenerate ``id -> status string``
    shape, which is normalised into ``{"prose_status": <string>}``.
    """
    path = meta_path(status_dir)
    if path is None or not path.is_file():
        return {}
    data = read_json(path)
    if not isinstance(data, dict):
        raise RegistryError("reviewed metadata is not a JSON object: " + str(path))
    # Historical overlay shape: {"meta_status": {...}} or a bare id->string map.
    inner = data.get("meta_status")
    if isinstance(inner, dict):
        data = inner
    meta: dict[str, dict] = {}
    for key, value in data.items():
        if key == "schema":
            continue
        if isinstance(value, str):
            meta[key] = {"prose_status": value}
        elif isinstance(value, dict):
            meta[key] = value
        else:
            raise RegistryError(
                "reviewed metadata entry " + repr(key) + " is neither an object nor a"
                " status string in " + str(path)
            )
    return meta


def validate_meta(registry: dict, meta: dict) -> list[str]:
    """Reasons the reviewed-metadata join is broken; empty list means valid."""
    violations: list[str] = []
    by_id = {item["id"]: item for item in registry.get("obligations", [])}

    for obligation_id in sorted(set(by_id) - set(meta)):
        violations.append(
            "missing reviewed metadata for " + obligation_id
            + " (" + by_id[obligation_id]["lean_decl"] + ")"
        )
    for obligation_id in sorted(set(meta) - set(by_id)):
        violations.append(
            "orphan reviewed metadata entry " + obligation_id
            + " names no live obligation"
        )

    for obligation_id in sorted(set(by_id) & set(meta)):
        entry = meta[obligation_id]
        status = entry.get("prose_status")
        if status is None:
            violations.append(obligation_id + ": reviewed entry has no prose_status")
        elif status not in PROSE_STATUS_VOCABULARY:
            violations.append(
                obligation_id + ": prose_status " + repr(status)
                + " is outside the controlled vocabulary"
            )
        reviewed_cluster = entry.get("cluster")
        derived_cluster = by_id[obligation_id]["cluster"]
        if reviewed_cluster is not None and reviewed_cluster != derived_cluster:
            violations.append(
                obligation_id + ": reviewed cluster " + repr(reviewed_cluster)
                + " disagrees with the generated cluster " + repr(derived_cluster)
            )
    return violations


# ---------------------------------------------------------------------------
# factorization entries (W3-0)
# ---------------------------------------------------------------------------

FACTORIZATION_KEY = "factorization"
# Key of the build fingerprint stamped onto a MATERIALIZED registry block.
VERIFIED_AT_BUILD = "verified_at_build"
# Optional v2 block key (W3-0e): the axiom names the block DECLARES as
# consumer-side trust.  It is materialized like every other reviewed field.
CONSUMER_TRUST_KEY = "consumer_trust"
# Keys of the materialized block, in the canonical registry.  ``transitive`` is
# omitted when the reviewed block declares no rows and ``consumer_trust`` is
# omitted when it declares no trust.
MATERIALIZED_KEYS = (
    "schema",
    "roles",
    "transitive",
    "pinned",
    CONSUMER_TRUST_KEY,
    VERIFIED_AT_BUILD,
)
FACTORIZATION_SCHEMA_V1 = "p97-factorization/v1"
FACTORIZATION_SCHEMA_V2 = "p97-factorization/v2"
FACTORIZATION_SCHEMAS = (FACTORIZATION_SCHEMA_V1, FACTORIZATION_SCHEMA_V2)

ROLE_LEGACY_WRAPPER = "legacy_wrapper"
ROLE_COORDINATOR = "coordinator"
ROLE_PRODUCER = "producer"
ROLE_ELIMINATOR = "eliminator"
ROLE_OPEN_LEAF = "open_leaf"

FACTORIZATION_ROLES = (
    ROLE_LEGACY_WRAPPER,
    ROLE_COORDINATOR,
    ROLE_PRODUCER,
    ROLE_ELIMINATOR,
    ROLE_OPEN_LEAF,
)

# Direct caller -> callee obligations the block asserts.  A ``transitive`` row
# replaces exactly one of these pairs by an explicit multi-step path.
FACTORIZATION_CHAIN = (
    (ROLE_LEGACY_WRAPPER, ROLE_COORDINATOR),
    (ROLE_COORDINATOR, ROLE_PRODUCER),
    (ROLE_COORDINATOR, ROLE_ELIMINATOR),
    (ROLE_ELIMINATOR, ROLE_OPEN_LEAF),
)

PINNED_LEGACY_WRAPPER = "legacy_wrapper_statement_sha256"
PINNED_OPEN_LEAF = "open_leaf_statement_sha256"
PINNED_KEYS = (PINNED_LEGACY_WRAPPER, PINNED_OPEN_LEAF)

BLOCK_KEYS_V2 = (
    "schema",
    "obligation_id",
    "roles",
    "transitive",
    "pinned",
    "note",
    CONSUMER_TRUST_KEY,
)
# v1 is the same block WITHOUT pinned digests: a ``pinned`` key in a v1 block is
# an unknown key, not a silent upgrade.  ``consumer_trust`` is absent here for
# the same reason: the key inside a v1 block is an unknown key.
BLOCK_KEYS_V1 = ("schema", "obligation_id", "roles", "transitive", "note")

TRANSITIVE_KEYS = ("from", "to", "via")

# -- trust boundary (W3-0b) -------------------------------------------------
# The EXPLICIT allowed baseline.  Trust is decided by membership in this tuple
# and nothing else: the tag ``proof-blueprint axioms`` prints next to an axiom
# is ADVISORY and is never a trust decision, so a ``core``-tagged
# ``Lean.ofReduceNat`` is rejected exactly like an untagged custom axiom.
ALLOWED_AXIOMS = ("propext", "Classical.choice", "Quot.sound")
# The one axiom a CONSUMER hop may add, and only when that hop's closure
# actually reaches the open leaf (see ``reaching_symbols``).
SORRY_AXIOM = "sorryAx"


def is_clean_closure(closure: list[tuple[str, str]]) -> bool:
    """CLEAN: every axiom is in the allowed baseline."""
    return all(axiom in ALLOWED_AXIOMS for _tag, axiom in closure)


def is_consumer_ok_closure(
    closure: list[tuple[str, str]], declared: list[str] | tuple[str, ...] = ()
) -> bool:
    """CONSUMER-OK: baseline, ``sorryAx``, or an ACCEPTED declaration (W3-0e).

    ``declared`` is the block's ACCEPTED ``consumer_trust`` list - the names
    that passed every check in ``parse_consumer_trust``.  It defaults to empty,
    so a caller that declares nothing gets exactly the W3-0b rule.
    """
    return all(
        axiom in ALLOWED_AXIOMS or axiom == SORRY_AXIOM or axiom in declared
        for _tag, axiom in closure
    )


CLUSTER_CODES = tuple(sorted(CLUSTER_LABELS))

BLUEPRINT_CONFIG = ".blueprint.toml"
SYMBOL_MINED_TABLE = "symbol_mined"
MODULE_MINED_TABLE = "module_mined"
HEX_DIGITS = "0123456789abcdef"


def normalize_statement(text: str) -> str:
    """Collapse every whitespace run to one space and strip the ends.

    ``str.split()`` with no argument splits on runs of whitespace, so the join
    below is exactly the documented normalization - no regex.
    """
    return " ".join(text.split())


def statement_digest(signature: str) -> str:
    """sha256 of a normalized index-record ``signature``, lowercase hex."""
    return hashlib.sha256(normalize_statement(signature).encode("utf-8")).hexdigest()


def is_sha256_hex(value: object) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(ch in HEX_DIGITS for ch in value)
    )


def is_axiom_name(token: str) -> bool:
    """A Lean identifier as the axiom column of ``axioms`` prints it.

    Letters, digits, ``_``, ``.``, ``'``, ``!`` and ``?`` only, so a marker
    glyph, a tag or a fragment of prose can never be read as an axiom name
    (auditor #7521).  No regex: ``str.isalnum`` decides "letter or digit".
    """
    return bool(token) and all(
        ch.isalnum() or ch in AXIOM_NAME_PUNCTUATION for ch in token
    )


def parse_axioms_output(text: str, expected_target: str) -> list[tuple[str, str]]:
    """Parse ``proof-blueprint axioms <expected_target>`` into ``(tag, axiom)``.

    Recognised shape (the exit code is deliberately NOT trusted; the tool exits
    nonzero for some symbols by design)::

        axioms reported by `#print axioms <expected_target>` (3):
              core  propext
          🪶 CUSTOM  sorryAx
              core  Quot.sound

    The parse is STRICT in both halves (auditor #7521), because a loose parse
    turns a changed output format into a silently wrong closure:

    * the header must be exactly ``axioms reported by `#print axioms
      <expected_target>` (<N>):`` - a header naming a DIFFERENT symbol than the
      one that was queried, and a header with no integer ``N``, both raise;
    * exactly ``N`` entry lines follow, terminated by a blank line, an
      unindented line or EOF.  Each must be indented and hold an OPTIONAL
      leading marker token, a tag token whose lowercase is one of
      ``AXIOMS_TAGS``, and a Lean identifier name.  Any other indented line
      inside the block raises, as does a count that disagrees with the number of
      entries.

    Every raise surfaces as "cannot verify" upstream rather than as a false
    clean verdict.
    """
    lines = text.splitlines()
    header = None
    header_text = ""
    for index, raw in enumerate(lines):
        stripped = raw.strip()
        if stripped.startswith(AXIOMS_HEADER_OPENING):
            header = index
            header_text = stripped
            break
    if header is None:
        raise RegistryError(
            "unrecognised `" + BLUEPRINT_CMD + " axioms` output: no header line"
        )
    if not (
        header_text.startswith(AXIOMS_HEADER_PREFIX)
        and header_text.endswith(AXIOMS_HEADER_SUFFIX)
    ):
        raise RegistryError(
            "unrecognised `"
            + BLUEPRINT_CMD
            + " axioms` header line: "
            + repr(header_text)
        )
    body = header_text[len(AXIOMS_HEADER_PREFIX) : -len(AXIOMS_HEADER_SUFFIX)]
    split = body.rfind(AXIOMS_HEADER_INFIX)
    if split == -1:
        raise RegistryError(
            "`"
            + BLUEPRINT_CMD
            + " axioms` header line names no axiom count: "
            + repr(header_text)
        )
    found_target = body[:split]
    digits = body[split + len(AXIOMS_HEADER_INFIX) :]
    if found_target != expected_target:
        raise RegistryError(
            "`"
            + BLUEPRINT_CMD
            + " axioms` reported the closure of "
            + repr(found_target)
            + " but "
            + repr(expected_target)
            + " was queried"
        )
    if not digits.isdigit():
        raise RegistryError(
            "`"
            + BLUEPRINT_CMD
            + " axioms` header line names no axiom count: "
            + repr(header_text)
        )
    expected = int(digits)

    entries: list[tuple[str, str]] = []
    for raw in lines[header + 1 :]:
        if not raw.strip():
            break
        if not raw.startswith((" ", "\t")):
            break
        tokens = raw.split()
        # [tag, name] or [marker, tag, name]; nothing else is an entry line.
        if (
            len(tokens) not in (2, 3)
            or tokens[-2].lower() not in AXIOMS_TAGS
            or not is_axiom_name(tokens[-1])
        ):
            raise RegistryError(
                "unrecognised `"
                + BLUEPRINT_CMD
                + " axioms` entry line: "
                + repr(raw)
            )
        entries.append((tokens[-2].lower(), tokens[-1]))
    if expected != len(entries):
        raise RegistryError(
            "`"
            + BLUEPRINT_CMD
            + " axioms` reported "
            + str(expected)
            + " axiom(s) but "
            + str(len(entries))
            + " line(s) parsed"
        )
    return entries


def recorded_closure_path(recorded_dir: Path | None) -> str:
    """The recorded-closure file the "cannot verify" violation must name."""
    if recorded_dir is None:
        return BASELINE_AXIOMS_FILE
    return str(recorded_dir / BASELINE_AXIOMS_FILE)


def read_declarable_trust(recorded_dir: Path | None) -> set[str] | None:
    """Axiom names the PUBLISH TARGET's RECORDED closure carries, or None.

    ``recorded_dir`` is a directory holding the reviewed ``proof-blueprint
    axioms`` export of ``PUBLISH_TARGET`` under ``BASELINE_AXIOMS_FILE``, parsed
    by ``parse_axioms_output`` against that same target.  The RECORDED closure
    is the trust authority in BOTH source modes, and no LIVE export is ever read
    for trust (W3-0e-fix-2, auditor #7524).  The CALLER names the directory:

    * ``generate --baseline DIR`` and every ``check`` pass ``DIR``;
    * ``generate --fresh --out OUT`` passes ``OUT/BASELINE_DIR_NAME`` - the
      reviewed closure kept with the output tree the run regenerates.

    None means no directory was given, the file is absent, or it does not parse,
    and the gate turns that into a "cannot verify" violation on every block that
    declares consumer trust - a declaration is never accepted against a closure
    that could not be read, and ``generate`` refuses before writing anything.
    """
    if recorded_dir is None:
        return None
    try:
        text = (recorded_dir / BASELINE_AXIOMS_FILE).read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError):
        # Unreadable or undecodable bytes are "cannot verify" (auditor #7518).
        return None
    try:
        closure = parse_axioms_output(text, PUBLISH_TARGET)
    except RegistryError:
        return None
    return {axiom for _tag, axiom in closure}


class FactorizationBackend:
    """Seam between the factorization gate and kernel-mined truth.

    ``BlueprintBackend`` backs it with the ``proof-blueprint`` CLI and a
    read-only sqlite3 read of the blueprint database; ``MappingBackend`` backs
    it with plain dictionaries for tests.  Every method raises ``RegistryError``
    when the underlying truth cannot be read, and the gate turns that into a
    "cannot verify" violation.
    """

    def resolve(self, symbol: str) -> list[dict]:
        """Index records whose fully qualified name is exactly ``symbol``."""
        raise NotImplementedError

    def callers(self, symbol: str) -> set[str]:
        """Declarations whose proofs use ``symbol`` (the callers of it)."""
        raise NotImplementedError

    def axioms(self, symbol: str) -> list[tuple[str, str]]:
        """Transitive kernel axiom closure as ``(tag, axiom)`` pairs."""
        raise NotImplementedError

    def mined_build(self, symbol: str) -> str | None:
        """Build fingerprint ``symbol`` was mined against, None if never."""
        raise NotImplementedError

    def current_build(self) -> str:
        """Build fingerprint of the CURRENT build."""
        raise NotImplementedError


class MappingBackend(FactorizationBackend):
    """Dictionary-backed seam.

    ``index``  symbol -> list of index records (a list of length != 1 is what an
               unknown or ambiguous declaration looks like).
    ``calls``  caller -> iterable of callees.  This stores the true call
               relation; ``callers`` inverts it, so the fake answers exactly the
               query the CLI answers.
    ``axiom_closures`` symbol -> iterable of ``(tag, axiom)``.
    ``mined``  symbol -> build fingerprint (absent means never mined).
    ``build``  the current build fingerprint (None means "cannot determine").
    """

    def __init__(
        self,
        index: dict | None = None,
        calls: dict | None = None,
        axiom_closures: dict | None = None,
        mined: dict | None = None,
        build: str | None = None,
    ) -> None:
        self._index = dict(index or {})
        self._calls = {key: set(value) for key, value in (calls or {}).items()}
        self._axioms = {
            key: [(str(tag), str(name)) for tag, name in value]
            for key, value in (axiom_closures or {}).items()
        }
        self._mined = dict(mined or {})
        self._build = build

    def resolve(self, symbol: str) -> list[dict]:
        return list(self._index.get(symbol, []))

    def callers(self, symbol: str) -> set[str]:
        return {
            caller for caller, callees in self._calls.items() if symbol in callees
        }

    def axioms(self, symbol: str) -> list[tuple[str, str]]:
        if symbol not in self._axioms:
            raise RegistryError("no recorded axiom closure for " + symbol)
        return list(self._axioms[symbol])

    def mined_build(self, symbol: str) -> str | None:
        return self._mined.get(symbol)

    def current_build(self) -> str:
        if not self._build:
            raise RegistryError("no current build fingerprint recorded")
        return self._build


def blueprint_db_path(repo_root: Path = REPO_ROOT) -> Path:
    """Blueprint database path named by ``[paths] db`` in ``.blueprint.toml``."""
    config = repo_root / BLUEPRINT_CONFIG
    if not config.is_file():
        raise RegistryError("missing " + BLUEPRINT_CONFIG + " at " + str(repo_root))
    try:
        with config.open("rb") as handle:
            data = tomllib.load(handle)
    except (OSError, tomllib.TOMLDecodeError) as exc:
        raise RegistryError(
            "cannot read " + BLUEPRINT_CONFIG + ": " + str(exc)
        ) from exc
    paths = data.get("paths")
    relative = paths.get("db") if isinstance(paths, dict) else None
    if not isinstance(relative, str) or not relative:
        raise RegistryError(BLUEPRINT_CONFIG + " has no [paths] db entry")
    return repo_root / relative


class BlueprintBackend(FactorizationBackend):
    """Live seam: the ``proof-blueprint`` CLI plus a READ-ONLY database read.

    Symbol resolution, the call graph and the axiom closure come from the CLI.
    Per-symbol mined-build freshness has no CLI surface (``refs --check``
    reports GLOBAL counts only), so it is read from the blueprint database named
    by ``[paths] db`` in ``.blueprint.toml``, opened read-only:

    * ``symbol_mined(symbol, file_hash, mined_at)`` - ``file_hash`` is the build
      fingerprint the symbol was mined against; no row at all means never mined;
    * ``module_mined(module_name, olean_hash, global_fp, mined_at)`` - consulted
      only to resolve the short build id printed by ``refs --check`` to the full
      fingerprint stored in those tables.

    The CURRENT build is the id ``proof-blueprint refs --check`` prints
    (``current build: <id>``, a short prefix), expanded to the unique full
    fingerprint carrying that prefix in either table.  Zero or several matches
    means the build cannot be identified, which is reported as "cannot verify",
    never as fresh.
    """

    def __init__(self, repo_root: Path = REPO_ROOT) -> None:
        self._root = repo_root
        self._resolved: dict[str, list[dict]] = {}
        self._callers: dict[str, set[str]] = {}
        self._axioms: dict[str, list[tuple[str, str]]] = {}
        self._mined: dict[str, str | None] = {}
        self._build: str | None = None
        self._build_read = False
        self._connection: sqlite3.Connection | None = None

    # -- process / database plumbing ----------------------------------------

    def _run(self, args: list[str]) -> tuple[str, str]:
        """Run one ``proof-blueprint`` invocation, returning (stdout, stderr).

        The exit code is deliberately not used as an error signal: ``search``
        exits 1 on an EMPTY result set, and an empty caller set is a legitimate
        answer that the chain check must be able to observe.  A real failure is
        recognised by the CLI's own ``proof-blueprint: ...`` diagnostic line,
        which is what an unindexed argument produces.
        """
        command = [BLUEPRINT_CMD] + args
        try:
            result = subprocess.run(
                command,
                cwd=str(self._root),
                capture_output=True,
                text=True,
                check=False,
            )
        except OSError as exc:
            raise RegistryError(
                "cannot run " + " ".join(command) + ": " + str(exc)
            ) from exc
        return result.stdout, result.stderr

    def _records(self, args: list[str]) -> list[dict]:
        stdout, stderr = self._run(args)
        for line in stderr.splitlines():
            if line.strip().startswith(BLUEPRINT_CMD + ":"):
                raise RegistryError(
                    " ".join([BLUEPRINT_CMD] + args) + ": " + line.strip()
                )
        records = []
        for line in stdout.splitlines():
            line = line.strip()
            if not line.startswith("{"):
                continue
            try:
                parsed = json.loads(line)
            except json.JSONDecodeError:
                continue
            if isinstance(parsed, dict):
                records.append(parsed)
        return records

    def _cursor(self) -> sqlite3.Cursor:
        if self._connection is None:
            path = blueprint_db_path(self._root)
            if not path.is_file():
                raise RegistryError("missing blueprint database: " + str(path))
            try:
                self._connection = sqlite3.connect(path.as_uri() + "?mode=ro", uri=True)
            except sqlite3.Error as exc:
                raise RegistryError(
                    "cannot open " + str(path) + " read-only: " + str(exc)
                ) from exc
        return self._connection.cursor()

    def close(self) -> None:
        if self._connection is not None:
            self._connection.close()
            self._connection = None

    # -- seam ---------------------------------------------------------------

    def resolve(self, symbol: str) -> list[dict]:
        if symbol not in self._resolved:
            # --name matches substrings, so the exact fully-qualified match is
            # imposed here rather than trusted from the query.
            records = self._records(
                ["search", "--name", symbol, "--json", "--all", "--private"]
            )
            self._resolved[symbol] = [
                record for record in records if record.get("symbol") == symbol
            ]
        return list(self._resolved[symbol])

    def callers(self, symbol: str) -> set[str]:
        if symbol not in self._callers:
            records = self._records(
                ["search", "--uses", symbol, "--json", "--all", "--private"]
            )
            self._callers[symbol] = {
                record["symbol"] for record in records if record.get("symbol")
            }
        return set(self._callers[symbol])

    def axioms(self, symbol: str) -> list[tuple[str, str]]:
        if symbol not in self._axioms:
            stdout, stderr = self._run(["axioms", symbol])
            # The header must name the symbol that was queried (auditor #7521).
            self._axioms[symbol] = parse_axioms_output(stdout + stderr, symbol)
        return list(self._axioms[symbol])

    def mined_build(self, symbol: str) -> str | None:
        if symbol not in self._mined:
            try:
                cursor = self._cursor()
                cursor.execute(
                    "SELECT file_hash FROM " + SYMBOL_MINED_TABLE + " WHERE symbol = ?",
                    (symbol,),
                )
                row = cursor.fetchone()
            except sqlite3.Error as exc:
                raise RegistryError(
                    "cannot read " + SYMBOL_MINED_TABLE + ": " + str(exc)
                ) from exc
            self._mined[symbol] = row[0] if row else None
        return self._mined[symbol]

    def current_build(self) -> str:
        if not self._build_read:
            self._build_read = True
            self._build = self._compute_current_build()
        if not self._build:
            raise RegistryError(
                "cannot identify the current mined build from `"
                + BLUEPRINT_CMD
                + " "
                + " ".join(REFS_CHECK_ARGS)
                + "`"
            )
        return self._build

    def _compute_current_build(self) -> str | None:
        stdout, stderr = self._run(REFS_CHECK_ARGS)
        state = parse_refs_check(stdout + stderr)
        short = state.get("build_id")
        if not short:
            return None
        matches: set[str] = set()
        try:
            cursor = self._cursor()
            for table, column in (
                (SYMBOL_MINED_TABLE, "file_hash"),
                (MODULE_MINED_TABLE, "global_fp"),
            ):
                cursor.execute(
                    "SELECT DISTINCT "
                    + column
                    + " FROM "
                    + table
                    + " WHERE substr("
                    + column
                    + ", 1, ?) = ?",
                    (len(short), short),
                )
                matches.update(row[0] for row in cursor.fetchall() if row[0])
        except sqlite3.Error as exc:
            raise RegistryError("cannot read the blueprint database: " + str(exc)) from exc
        if len(matches) == 1:
            return matches.pop()
        return None


def make_backend(meta: dict, factory=None) -> FactorizationBackend | None:
    """A live backend, but only when a factorization block actually needs one.

    A reviewed metadata file with no factorization block costs no extra
    ``proof-blueprint`` invocation and no database read at all.

    ``factory`` is the command-level test seam (see ``main``): a zero-argument
    callable returning a ``FactorizationBackend``.  It is consulted only when a
    block actually needs a backend, so it never changes which commands read
    live data.
    """
    if not has_any_factorization(meta):
        return None
    if factory is not None:
        return factory()
    return BlueprintBackend()


def factorization_blocks(meta: dict) -> dict:
    """``obligation id -> factorization block`` for every entry carrying one."""
    blocks = {}
    for obligation_id in sorted(meta):
        entry = meta[obligation_id]
        if isinstance(entry, dict) and FACTORIZATION_KEY in entry:
            blocks[obligation_id] = entry[FACTORIZATION_KEY]
    return blocks


def has_any_factorization(meta: dict) -> bool:
    return bool(factorization_blocks(meta))


def current_build_id(backend: FactorizationBackend | None) -> str | None:
    """Current mined build fingerprint, or None when it cannot be read.

    None is never "fresh": ``check_v2_block`` reports an unreadable build as a
    "cannot verify" violation, and a materialized ``verified_at_build`` of None
    can never equal a committed one, so the registry comparison fails closed.
    """
    if backend is None:
        return None
    try:
        return backend.current_build()
    except RegistryError:
        return None


def normalized_factorization_block(block: object, build_id: str | None) -> dict | None:
    """The CANONICAL registry form of a reviewed v2 factorization block.

    Only a ``p97-factorization/v2`` block with an object ``roles`` map is
    materialized.  A v1 block is never a verified factorization (it pins no
    statement digests), so it must not appear on the registry at all, and an
    entry with no reviewed block gets no ``factorization`` key - which is what
    keeps a registry with no factorization entries byte-identical.

    ``obligation_id`` and ``note`` are deliberately dropped: the id is the key
    of the entry the block sits on, and prose is not machine-checkable.
    ``transitive`` is sorted (and omitted when empty) so the materialization is
    a function of the reviewed block alone; ``via`` order inside a row is the
    path and is preserved.  ``consumer_trust`` (W3-0e) is omitted only when the
    reviewed block has no such key; a present well-formed list is sorted, and
    any other present value (an explicit null included, auditor #7518) is
    carried through verbatim - the shape violation is what rejects such a
    block - so the registry carries every declared trust name and ``check``
    reports a drifted, added or removed declaration exactly like any other
    materialized field.
    """
    if not isinstance(block, dict):
        return None
    if block.get("schema") != FACTORIZATION_SCHEMA_V2:
        return None
    roles = block.get("roles")
    if not isinstance(roles, dict):
        return None

    pinned = block.get("pinned")
    materialized: dict = {
        "schema": FACTORIZATION_SCHEMA_V2,
        "roles": {key: roles[key] for key in sorted(roles)},
        "pinned": {key: pinned[key] for key in sorted(pinned)}
        if isinstance(pinned, dict)
        else {},
        VERIFIED_AT_BUILD: build_id,
    }

    rows = block.get("transitive")
    normalized_rows: list[dict] = []
    if isinstance(rows, list):
        for row in rows:
            if isinstance(row, dict):
                normalized_rows.append({key: row[key] for key in sorted(row)})
    normalized_rows.sort(
        key=lambda row: json.dumps(row, sort_keys=True, ensure_ascii=False)
    )
    if normalized_rows:
        materialized["transitive"] = normalized_rows

    if CONSUMER_TRUST_KEY in block:
        # A PRESENT key is always carried through, an explicit null included
        # (auditor #7518): the materialization mirrors the reviewed value and
        # never turns a present malformed value into key absence; the shape
        # violation of parse_consumer_trust is what rejects such a block.  A
        # malformed list (a non-string member) is copied unsorted, because
        # sorting mixed types raises on reviewed input.
        declared = block[CONSUMER_TRUST_KEY]
        materialized[CONSUMER_TRUST_KEY] = (
            sorted(declared)
            if isinstance(declared, list)
            and all(isinstance(name, str) for name in declared)
            else declared
        )
    return materialized


def present_repr(container: dict, key: str) -> str:
    """``repr`` of a materialized value, or ``(absent)`` when the key is missing.

    A present ``None`` and an absent key are different states and must read
    differently in a drift line (auditor #7524).
    """
    return repr(container[key]) if key in container else "(absent)"


def compare_registry_factorizations(
    registry: dict, meta: dict, build_id: str | None
) -> list[str]:
    """Drift between the MATERIALIZED registry blocks and the reviewed metadata.

    The registry is the file downstream consumers read, so it must carry every
    verified factorization itself rather than pointing at the reviewed file.
    A block missing from the registry, an extra block the reviewed file does not
    declare, a drifted field, or a ``verified_at_build`` that is not the current
    build are all registry drift and all fail the check.

    Every materialized key is compared by PRESENCE as well as by value (auditor
    #7524): an OPTIONAL key (``transitive``, ``consumer_trust``) that only one
    side carries is drift even when both sides read back as ``None``, so a
    registry-only ``"consumer_trust": null`` and a metadata-only declaration are
    both reported.  A side that does not carry the key at all is rendered as
    ``(absent)`` rather than as ``None``, which would be the value of a present
    null.
    """
    violations: list[str] = []
    by_id = {item["id"]: item for item in registry.get("obligations", [])}
    expected: dict[str, dict] = {}
    for obligation_id, block in factorization_blocks(meta).items():
        normalized = normalized_factorization_block(block, build_id)
        if normalized is not None:
            expected[obligation_id] = normalized

    for obligation_id in sorted(by_id):
        want = expected.get(obligation_id)
        got = by_id[obligation_id].get(FACTORIZATION_KEY)
        if want is None and got is None:
            continue
        if want is None:
            violations.append(
                obligation_id
                + ": the registry entry carries a materialized "
                + FACTORIZATION_KEY
                + " block that the reviewed metadata does not declare"
            )
            continue
        if got is None:
            violations.append(
                obligation_id
                + ": the registry entry carries no materialized "
                + FACTORIZATION_KEY
                + " block for its reviewed "
                + FACTORIZATION_SCHEMA_V2
                + " block"
            )
            continue
        if not isinstance(got, dict):
            violations.append(
                obligation_id
                + ": the materialized "
                + FACTORIZATION_KEY
                + " block is not a JSON object"
            )
            continue
        for key in sorted(set(want) | set(got)):
            if (key in want) == (key in got) and want.get(key) == got.get(key):
                continue
            if key == VERIFIED_AT_BUILD:
                violations.append(
                    obligation_id
                    + ": materialized "
                    + VERIFIED_AT_BUILD
                    + " is "
                    + present_repr(got, key)
                    + " but the current build is "
                    + present_repr(want, key)
                )
            else:
                violations.append(
                    obligation_id
                    + ": materialized factorization key "
                    + repr(key)
                    + " is "
                    + present_repr(got, key)
                    + " on the registry but "
                    + present_repr(want, key)
                    + " in the reviewed metadata"
                )
    return violations


def via_label(pair: tuple[str, str], position: int) -> str:
    """Stable label of one declared ``transitive`` hop."""
    return (
        "transitive " + pair[0] + " -> " + pair[1] + " via[" + str(position) + "]"
    )


def reaching_symbols(
    edges: dict[str, set[str]], target: str, vertices: list[str]
) -> set[str]:
    """Vertices whose calls reach ``target`` inside ``vertices`` (bounded).

    ``edges`` is the direct caller -> callee relation restricted to
    ``vertices``.  The walk is backwards from ``target``; each vertex is added
    at most once, so the loop runs at most ``len(vertices)`` times.
    """
    reaching: set[str] = set()
    frontier = [target]
    while frontier:
        current = frontier.pop()
        for caller in vertices:
            if caller in reaching or caller == target:
                continue
            if current in edges.get(caller, set()):
                reaching.add(caller)
                frontier.append(caller)
    return reaching


def check_block_structure(
    obligation_id: str, block: object
) -> tuple[str | None, dict | None, list[str]]:
    """Schema-level checks shared by v1 and v2.

    Returns ``(schema, roles, violations)``; ``schema`` is None when the block
    cannot be classified at all.
    """
    if not isinstance(block, dict):
        return None, None, [obligation_id + ": factorization block is not a JSON object"]

    violations: list[str] = []
    schema = block.get("schema")
    if not isinstance(schema, str) or schema not in FACTORIZATION_SCHEMAS:
        violations.append(
            obligation_id
            + ": factorization schema "
            + repr(schema)
            + " is unknown (expected one of "
            + ", ".join(FACTORIZATION_SCHEMAS)
            + ")"
        )
        return None, None, violations

    allowed = BLOCK_KEYS_V2 if schema == FACTORIZATION_SCHEMA_V2 else BLOCK_KEYS_V1
    for key in sorted(set(block) - set(allowed)):
        violations.append(
            obligation_id
            + ": unknown key "
            + repr(key)
            + " in the "
            + schema
            + " factorization block"
        )

    declared = block.get("obligation_id")
    if declared != obligation_id:
        violations.append(
            obligation_id
            + ": factorization obligation_id "
            + repr(declared)
            + " does not name its own entry"
        )

    roles = block.get("roles")
    if not isinstance(roles, dict):
        violations.append(obligation_id + ": factorization roles is not a JSON object")
        return schema, None, violations

    for key in sorted(set(roles) - set(FACTORIZATION_ROLES)):
        violations.append(
            obligation_id + ": unknown role " + repr(key) + " in the factorization block"
        )
    for role in FACTORIZATION_ROLES:
        value = roles.get(role)
        if not isinstance(value, str) or not value.strip():
            violations.append(
                obligation_id
                + ": role "
                + role
                + " is missing or is not a declaration name"
            )

    holders: dict[str, list[str]] = {}
    for role in FACTORIZATION_ROLES:
        value = roles.get(role)
        if isinstance(value, str) and value.strip():
            holders.setdefault(value, []).append(role)
    for symbol in sorted(holders):
        if len(holders[symbol]) > 1:
            violations.append(
                obligation_id
                + ": roles "
                + ", ".join(holders[symbol])
                + " name the same declaration ("
                + symbol
                + "); the five roles must be distinct"
            )
    return schema, roles, violations


def parse_transitive(obligation_id: str, block: dict) -> tuple[dict, list[str]]:
    """``(from, to) -> [via, ...]`` overrides declared by the block."""
    violations: list[str] = []
    rows = block.get("transitive")
    if rows is None:
        return {}, violations
    if not isinstance(rows, list):
        violations.append(obligation_id + ": factorization transitive is not a list")
        return {}, violations

    overrides: dict[tuple[str, str], list[str]] = {}
    for position, row in enumerate(rows):
        label = "transitive[" + str(position) + "]"
        if not isinstance(row, dict):
            violations.append(obligation_id + ": " + label + " is not a JSON object")
            continue
        for key in sorted(set(row) - set(TRANSITIVE_KEYS)):
            violations.append(
                obligation_id + ": unknown key " + repr(key) + " in " + label
            )
        source = row.get("from")
        target = row.get("to")
        via = row.get("via")
        if (source, target) not in FACTORIZATION_CHAIN:
            violations.append(
                obligation_id
                + ": "
                + label
                + " names the pair ("
                + repr(source)
                + ", "
                + repr(target)
                + "), which is not a factorization chain edge"
            )
            continue
        if not isinstance(via, list) or not via:
            violations.append(
                obligation_id + ": " + label + " has no non-empty via path"
            )
            continue
        if not all(isinstance(hop, str) and hop.strip() for hop in via):
            violations.append(
                obligation_id + ": " + label + " has a via hop that is not a declaration name"
            )
            continue
        if (source, target) in overrides:
            violations.append(
                obligation_id
                + ": "
                + label
                + " repeats the pair ("
                + source
                + ", "
                + target
                + ")"
            )
            continue
        overrides[(source, target)] = list(via)
    return overrides, violations


def find_role_cycle(
    symbols: list[str], edges: dict[str, set[str]]
) -> list[str] | None:
    """A directed cycle over ``symbols`` under ``edges``, or None."""
    colour = {symbol: 0 for symbol in symbols}
    stack: list[str] = []
    found: list[list[str]] = []

    def visit(node: str) -> bool:
        colour[node] = 1
        stack.append(node)
        for successor in sorted(edges.get(node, set())):
            if successor not in colour:
                continue
            if colour[successor] == 1:
                start = stack.index(successor)
                found.append(stack[start:] + [successor])
                return True
            if colour[successor] == 0 and visit(successor):
                return True
        stack.pop()
        colour[node] = 2
        return False

    for symbol in sorted(symbols):
        if colour[symbol] == 0 and visit(symbol):
            return found[0]
    return None


def _calls_directly(
    backend: FactorizationBackend, caller: str, callee: str
) -> bool:
    """``caller`` directly calls ``callee`` in the kernel-mined call graph."""
    return caller in backend.callers(callee)


def parse_consumer_trust(
    obligation_id: str,
    block: dict,
    declarable_trust: set[str] | None,
    closure_path: str = BASELINE_AXIOMS_FILE,
) -> tuple[list[str], list[str]]:
    """ACCEPTED ``consumer_trust`` declarations of one v2 block (W3-0e).

    Returns ``(accepted, violations)``.  Only an ABSENT key declares nothing.
    A key that is present must hold a non-empty list of unique non-empty
    strings; any other present value - an explicit ``null`` included (auditor
    #7518) - is one shape violation and accepts nothing.  Each listed name is then checked in this order, each failure its
    own violation line: ``sorryAx`` is never declarable (an open obligation is
    not trust), a name already in ``ALLOWED_AXIOMS`` declares nothing, an
    unreadable recorded closure is "cannot verify", and a name the publish
    target's recorded closure does not carry is rejected.  Only a name that
    passes all four is ACCEPTED.

    ``closure_path`` is the recorded-closure file the caller read, named in the
    "cannot verify" line so the message is SOURCE-NEUTRAL (auditor #7524): the
    recorded closure is the authority in both source modes, and the line says
    which file could not be read rather than which mode was running.
    """
    if CONSUMER_TRUST_KEY not in block:
        return [], []
    value = block[CONSUMER_TRUST_KEY]
    well_formed = (
        isinstance(value, list)
        and bool(value)
        and all(isinstance(name, str) and name.strip() for name in value)
        and len(set(value)) == len(value)
    )
    if not well_formed:
        return [], [
            obligation_id
            + ": "
            + CONSUMER_TRUST_KEY
            + " must be a non-empty list of unique axiom names"
        ]

    accepted: list[str] = []
    violations: list[str] = []
    for name in value:
        if name == SORRY_AXIOM:
            violations.append(
                obligation_id
                + ": "
                + CONSUMER_TRUST_KEY
                + " lists "
                + SORRY_AXIOM
                + "; an open obligation is never declarable trust"
            )
            continue
        if name in ALLOWED_AXIOMS:
            violations.append(
                obligation_id
                + ": "
                + CONSUMER_TRUST_KEY
                + " lists "
                + name
                + ", which is already in ALLOWED_AXIOMS"
            )
            continue
        if declarable_trust is None:
            violations.append(
                obligation_id
                + ": cannot verify "
                + CONSUMER_TRUST_KEY
                + ": the recorded closure "
                + closure_path
                + " could not be read"
            )
            continue
        if name not in declarable_trust:
            violations.append(
                obligation_id
                + ": "
                + CONSUMER_TRUST_KEY
                + " lists "
                + name
                + ", which the publish target's recorded closure does not carry"
            )
            continue
        accepted.append(name)
    return accepted, violations


def check_v2_block(
    obligation_id: str,
    block: dict,
    roles: dict,
    registry_entry: dict | None,
    backend: FactorizationBackend | None,
    declarable_trust: set[str] | None = None,
    closure_path: str = BASELINE_AXIOMS_FILE,
) -> list[str]:
    """Live checks for one well-formed v2 block; empty list means verified."""
    violations: list[str] = []
    if backend is None:
        return [
            obligation_id
            + ": cannot verify the factorization (no kernel-mined backend available)"
        ]

    role_symbol = {role: roles.get(role) for role in FACTORIZATION_ROLES}
    leaf = role_symbol[ROLE_OPEN_LEAF]

    # -- declared consumer trust (W3-0e), read FIRST -------------------------
    # ``declared_trust`` is the ACCEPTED subset; every rejected name is already
    # a violation here.  ``carried_trust`` collects the accepted names a
    # consumer-side hop (the open leaf included) actually carries, which is what
    # the no-blanket-declaration audit at the end of this function reads.
    declared_trust, trust_violations = parse_consumer_trust(
        obligation_id, block, declarable_trust, closure_path
    )
    violations.extend(trust_violations)
    carried_trust: set[str] = set()
    consumer_closures_readable = True

    # -- transitive rows, read FIRST -----------------------------------------
    # Every declared via hop is a first-class vertex of this block: it is
    # resolved, mined-freshness checked, trust checked and included in the cycle
    # detection exactly like a role.
    overrides, transitive_violations = parse_transitive(obligation_id, block)
    violations.extend(transitive_violations)
    via_hops: list[tuple[str, str, tuple[str, str]]] = []
    for pair in FACTORIZATION_CHAIN:
        for position, hop in enumerate(overrides.get(pair, [])):
            via_hops.append((via_label(pair, position), hop, pair))

    role_holder: dict[str, str] = {}
    for role in FACTORIZATION_ROLES:
        symbol = role_symbol[role]
        if isinstance(symbol, str) and symbol.strip():
            role_holder.setdefault(symbol, role)
    for label, symbol, _pair in via_hops:
        if symbol in role_holder:
            violations.append(
                obligation_id
                + ": "
                + label
                + " ("
                + symbol
                + ") is also the "
                + role_holder[symbol]
                + " role; a via hop must name a declaration distinct from the five"
                + " roles"
            )

    # -- pinned digests, structurally ---------------------------------------
    pinned = block.get("pinned")
    if not isinstance(pinned, dict):
        violations.append(
            obligation_id + ": " + FACTORIZATION_SCHEMA_V2 + " block has no pinned digests"
        )
        pinned = {}
    else:
        for key in sorted(set(pinned) - set(PINNED_KEYS)):
            violations.append(
                obligation_id + ": unknown key " + repr(key) + " in the pinned digests"
            )
        for key in PINNED_KEYS:
            if key not in pinned:
                violations.append(obligation_id + ": pinned digest " + key + " is missing")
            elif not is_sha256_hex(pinned.get(key)):
                violations.append(
                    obligation_id
                    + ": pinned digest "
                    + key
                    + " is not a lowercase sha256 hex string"
                )

    # -- resolution: the five roles AND every via hop ------------------------
    # A via declaration obeys exactly the role resolve rule: exactly one PUBLIC
    # index record, or the block is not verified.
    named: list[tuple[str, str]] = [
        (role, role_symbol[role])
        for role in FACTORIZATION_ROLES
        if isinstance(role_symbol[role], str) and role_symbol[role].strip()
    ] + [(label, symbol) for label, symbol, _pair in via_hops]

    records: dict[str, dict] = {}
    for label, symbol in named:
        try:
            matches = backend.resolve(symbol)
        except RegistryError as exc:
            violations.append(
                obligation_id
                + ": cannot verify "
                + label
                + " ("
                + symbol
                + "): "
                + str(exc)
            )
            continue
        if len(matches) != 1:
            violations.append(
                obligation_id
                + ": "
                + label
                + " ("
                + symbol
                + ") resolves to "
                + str(len(matches))
                + " index records; exactly one exact match is required"
            )
            continue
        record = matches[0]
        if record.get("private") is True:
            violations.append(
                obligation_id
                + ": "
                + label
                + " ("
                + symbol
                + ") is a private declaration; every role and via hop must be public"
            )
            continue
        records[label] = record

    # -- open leaf identity -------------------------------------------------
    if registry_entry is None:
        violations.append(
            obligation_id + ": the factorization names no live registry entry"
        )
    elif isinstance(leaf, str) and leaf != registry_entry.get("lean_decl"):
        violations.append(
            obligation_id
            + ": open_leaf ("
            + leaf
            + ") is not the registry lean_decl ("
            + str(registry_entry.get("lean_decl"))
            + ")"
        )
    if ROLE_OPEN_LEAF in records and records[ROLE_OPEN_LEAF].get("has_sorry") is not True:
        violations.append(
            obligation_id
            + ": open_leaf ("
            + str(leaf)
            + ") has no sorry; an open leaf must carry one"
        )

    # -- pinned digests, against the live statements ------------------------
    for role, key, label in (
        (ROLE_OPEN_LEAF, PINNED_OPEN_LEAF, "open leaf"),
        (ROLE_LEGACY_WRAPPER, PINNED_LEGACY_WRAPPER, "legacy wrapper"),
    ):
        expected = pinned.get(key)
        if not is_sha256_hex(expected) or role not in records:
            continue
        signature = records[role].get("signature")
        if not isinstance(signature, str):
            violations.append(
                obligation_id
                + ": "
                + role
                + " ("
                + str(role_symbol[role])
                + ") has no indexed statement to digest"
            )
            continue
        actual = statement_digest(signature)
        if actual != expected:
            violations.append(
                obligation_id
                + ": "
                + label
                + " statement changed ("
                + role
                + " "
                + str(role_symbol[role])
                + ": pinned "
                + expected[:12]
                + ", current "
                + actual[:12]
                + ")"
            )

    # -- freshness (the five roles AND every via hop) ------------------------
    try:
        current = backend.current_build()
    except RegistryError as exc:
        current = None
        violations.append(
            obligation_id + ": cannot verify mined freshness: " + str(exc)
        )
    if current is not None:
        for label, symbol in named:
            try:
                mined = backend.mined_build(symbol)
            except RegistryError as exc:
                violations.append(
                    obligation_id
                    + ": cannot verify mined freshness of "
                    + label
                    + " ("
                    + symbol
                    + "): "
                    + str(exc)
                )
                continue
            if mined is None:
                violations.append(
                    obligation_id
                    + ": "
                    + label
                    + " ("
                    + symbol
                    + ") is never mined; the factorization cannot be verified against"
                    + " the current build"
                )
            elif mined != current:
                violations.append(
                    obligation_id
                    + ": "
                    + label
                    + " ("
                    + symbol
                    + ") is stale (mined against build "
                    + mined[:12]
                    + ", current build "
                    + current[:12]
                    + ")"
                )

    # -- chain --------------------------------------------------------------
    for source, target in FACTORIZATION_CHAIN:
        source_symbol = role_symbol[source]
        target_symbol = role_symbol[target]
        if not isinstance(source_symbol, str) or not isinstance(target_symbol, str):
            continue
        via = overrides.get((source, target))
        if via is None:
            hops = [(source, source_symbol, target, target_symbol)]
        else:
            path = [(source, source_symbol)]
            for position, hop in enumerate(via):
                path.append(("via[" + str(position) + "]", hop))
            path.append((target, target_symbol))
            hops = [
                (path[index][0], path[index][1], path[index + 1][0], path[index + 1][1])
                for index in range(len(path) - 1)
            ]
        for caller_label, caller, callee_label, callee in hops:
            try:
                direct = _calls_directly(backend, caller, callee)
            except RegistryError as exc:
                violations.append(
                    obligation_id
                    + ": cannot verify that "
                    + caller_label
                    + " ("
                    + caller
                    + ") directly calls "
                    + callee_label
                    + " ("
                    + callee
                    + "): "
                    + str(exc)
                )
                continue
            if not direct:
                violations.append(
                    obligation_id
                    + ": "
                    + caller_label
                    + " ("
                    + caller
                    + ") does not directly call "
                    + callee_label
                    + " ("
                    + callee
                    + ")"
                )

    # -- call graph over the five roles AND every via hop --------------------
    vertices = sorted({symbol for _label, symbol in named})
    edges: dict[str, set[str]] = {symbol: set() for symbol in vertices}
    graph_readable = True
    for callee in vertices:
        try:
            callers = backend.callers(callee)
        except RegistryError:
            graph_readable = False
            break
        for caller in vertices:
            if caller in callers:
                edges[caller].add(callee)

    # -- cycles over roles union vias ---------------------------------------
    if graph_readable:
        cycle = find_role_cycle(vertices, edges)
        if cycle is not None:
            names = dict(role_holder)
            for label, symbol, _pair in via_hops:
                names.setdefault(symbol, label)
            violations.append(
                obligation_id
                + ": role cycle "
                + " -> ".join(
                    names.get(symbol, "?") + " (" + symbol + ")" for symbol in cycle
                )
            )

    # -- which hops actually consume the open leaf --------------------------
    consumption_known = graph_readable and isinstance(leaf, str) and leaf in edges
    leaf_consumers = (
        reaching_symbols(edges, leaf, vertices) if consumption_known else set()
    )

    # -- trust boundary ------------------------------------------------------
    # Producer-path hops (the producer and every via on coordinator -> producer)
    # must be CLEAN.  Consumer-side hops (legacy_wrapper, coordinator,
    # eliminator and every via on the other three chain rows) must be
    # CONSUMER-OK, and may carry sorryAx only when that hop reaches the open
    # leaf.  The tool's tag is advisory throughout.
    trust_hops: list[tuple[str, str, bool]] = []
    for role in (
        ROLE_LEGACY_WRAPPER,
        ROLE_COORDINATOR,
        ROLE_PRODUCER,
        ROLE_ELIMINATOR,
    ):
        symbol = role_symbol[role]
        if isinstance(symbol, str) and symbol.strip():
            trust_hops.append((role, symbol, role != ROLE_PRODUCER))
    for label, symbol, pair in via_hops:
        trust_hops.append((label, symbol, pair != (ROLE_COORDINATOR, ROLE_PRODUCER)))

    for label, symbol, consumer in trust_hops:
        try:
            closure = backend.axioms(symbol)
        except RegistryError as exc:
            if consumer:
                consumer_closures_readable = False
            violations.append(
                obligation_id
                + ": cannot verify the axiom closure of "
                + label
                + " ("
                + symbol
                + "): "
                + str(exc)
            )
            continue
        if consumer:
            for _tag, axiom in closure:
                if axiom in declared_trust:
                    carried_trust.add(axiom)
        acceptable = (
            is_consumer_ok_closure(closure, declared_trust)
            if consumer
            else is_clean_closure(closure)
        )
        if not acceptable:
            for tag, axiom in closure:
                if axiom in ALLOWED_AXIOMS:
                    continue
                if axiom == SORRY_AXIOM and consumer:
                    continue
                if consumer and axiom in declared_trust:
                    continue
                violations.append(
                    obligation_id
                    + ": "
                    + label
                    + " ("
                    + symbol
                    + ") axiom closure contains "
                    + axiom
                    + " (tool tag "
                    + repr(tag)
                    + ", advisory)"
                    + (
                        "; a consumer hop may add nothing beyond "
                        + ", ".join(ALLOWED_AXIOMS)
                        + " and "
                        + SORRY_AXIOM
                        + " unless the block declares it in "
                        + CONSUMER_TRUST_KEY
                        if consumer
                        else "; the producer path must be kernel clean; "
                        + CONSUMER_TRUST_KEY
                        + " does not apply to the producer path"
                    )
                )
        if not (consumer and any(axiom == SORRY_AXIOM for _tag, axiom in closure)):
            continue
        if not consumption_known:
            violations.append(
                obligation_id
                + ": cannot verify that "
                + label
                + " ("
                + symbol
                + ") consumes the open leaf: the call graph could not be read"
            )
        elif symbol not in leaf_consumers:
            violations.append(
                obligation_id
                + ": "
                + label
                + " carries "
                + SORRY_AXIOM
                + " without consuming the open leaf"
            )

    # -- the open leaf itself (auditor #7462) --------------------------------
    # ``has_sorry == true`` proves the leaf is OPEN; it does NOT prove the leaf
    # adds nothing else, so the leaf is audited as a consumer-side hop: its
    # closure must be CONSUMER-OK, i.e. the baseline plus sorryAx and nothing
    # more, whatever tag the tool prints next to an axiom.  sorryAx is ALWAYS
    # permitted here and is deliberately NOT put through the reaching_symbols
    # justification the other consumer hops get: the leaf IS the open leaf such
    # a hop would have to reach, so it consumes itself.
    if isinstance(leaf, str) and leaf.strip():
        try:
            leaf_closure = backend.axioms(leaf)
        except RegistryError as exc:
            consumer_closures_readable = False
            violations.append(
                obligation_id
                + ": cannot verify the axiom closure of "
                + ROLE_OPEN_LEAF
                + " ("
                + leaf
                + "): "
                + str(exc)
            )
        else:
            for _tag, axiom in leaf_closure:
                if axiom in declared_trust:
                    carried_trust.add(axiom)
            if not is_consumer_ok_closure(leaf_closure, declared_trust):
                for _tag, axiom in leaf_closure:
                    if axiom in ALLOWED_AXIOMS or axiom == SORRY_AXIOM:
                        continue
                    if axiom in declared_trust:
                        continue
                    violations.append(
                        obligation_id
                        + ": "
                        + ROLE_OPEN_LEAF
                        + " ("
                        + leaf
                        + ") carries forbidden axiom "
                        + axiom
                    )

    # -- no blanket declarations (W3-0e) -------------------------------------
    # A declaration no consumer-side hop carries widens the boundary for
    # nothing, so it is a violation.  The audit is skipped only when a
    # consumer-side closure could not be read at all: that case already reports
    # "cannot verify", and the block is not verified either way.
    if consumer_closures_readable:
        for name in declared_trust:
            if name in carried_trust:
                continue
            violations.append(
                obligation_id
                + ": "
                + CONSUMER_TRUST_KEY
                + " declares "
                + name
                + " but no consumer-side hop carries it"
            )
    return violations


def check_factorizations(
    registry: dict,
    meta: dict,
    backend: FactorizationBackend | None,
    required_clusters: tuple[str, ...] = (),
    declarable_trust: set[str] | None = None,
    closure_path: str = BASELINE_AXIOMS_FILE,
) -> dict:
    """Validate every factorization block against kernel-mined truth.

    Returns ``{"summary": <receipt section>, "verified_ids": [...],
    "missing_ids": [...]}``.  ``summary`` carries exactly the receipt keys.

    ``declarable_trust`` is the publish target's RECORDED closure, read by
    ``read_declarable_trust`` from ``<baseline>`` (``--baseline`` and every
    ``check``) or from ``<out>/baseline`` (``--fresh``); it is the trust
    authority in both modes and no live export is ever consulted (W3-0e-fix-2,
    auditor #7524).  None means it could not be read, and every block that
    declares consumer trust is then reported as "cannot verify" instead of being
    accepted.  ``closure_path`` names that file in the "cannot verify" line.
    """
    by_id = {item["id"]: item for item in registry.get("obligations", [])}
    blocks = factorization_blocks(meta)

    violations: list[str] = []
    schema_versions: dict[str, int] = {}
    verified_ids: list[str] = []
    v1_warnings = 0
    declared_trust_blocks = 0
    declared_trust_axioms: set[str] = set()

    for obligation_id in sorted(blocks):
        block = blocks[obligation_id]
        schema, roles, structural = check_block_structure(obligation_id, block)
        violations.extend(structural)
        key = schema if schema is not None else "unknown"
        schema_versions[key] = schema_versions.get(key, 0) + 1
        if schema == FACTORIZATION_SCHEMA_V1:
            v1_warnings += 1
            continue
        if schema != FACTORIZATION_SCHEMA_V2 or roles is None or structural:
            continue
        live = check_v2_block(
            obligation_id,
            block,
            roles,
            by_id.get(obligation_id),
            backend,
            declarable_trust,
            closure_path,
        )
        violations.extend(live)
        if not live:
            verified_ids.append(obligation_id)
            # A VERIFIED block reported no violation, so every name it lists is
            # an ACCEPTED declaration carried by a consumer-side hop.
            declared = block.get(CONSUMER_TRUST_KEY)
            if isinstance(declared, list) and declared:
                declared_trust_blocks += 1
                declared_trust_axioms.update(declared)

    reachable_ids = sorted(
        item["id"] for item in registry.get("obligations", []) if item.get("reachable")
    )
    missing_ids = [
        obligation_id for obligation_id in reachable_ids if obligation_id not in blocks
    ]

    verified = set(verified_ids)
    for code in required_clusters:
        label = CLUSTER_LABELS.get(code, code)
        for obligation_id in reachable_ids:
            if by_id[obligation_id].get("cluster") != label:
                continue
            if obligation_id in verified:
                continue
            if obligation_id not in blocks:
                violations.append(
                    "--require-factorized "
                    + code
                    + ": "
                    + obligation_id
                    + " ("
                    + str(by_id[obligation_id].get("lean_decl"))
                    + ") has no "
                    + FACTORIZATION_SCHEMA_V2
                    + " factorization block"
                )
            else:
                violations.append(
                    "--require-factorized "
                    + code
                    + ": "
                    + obligation_id
                    + " ("
                    + str(by_id[obligation_id].get("lean_decl"))
                    + ") has no VERIFIED "
                    + FACTORIZATION_SCHEMA_V2
                    + " factorization block"
                )

    summary = {
        "schema_versions": {name: schema_versions[name] for name in sorted(schema_versions)},
        "checked": len(blocks),
        "verified": len(verified_ids),
        "declared_trust": {
            "blocks": declared_trust_blocks,
            "axioms": sorted(declared_trust_axioms),
        },
        "v1_warnings": v1_warnings,
        "missing": len(missing_ids),
        "required_clusters": list(required_clusters),
        "violations": violations,
    }
    return {
        "summary": summary,
        "verified_ids": sorted(verified_ids),
        "missing_ids": missing_ids,
        "reachable_ids": reachable_ids,
    }


# ---------------------------------------------------------------------------
# stable identity: factorization rename / alias migration
# ---------------------------------------------------------------------------


def git_head_short() -> str:
    lines = git_lines(["rev-parse", "--short", "HEAD"])
    return lines[0].strip() if lines else "unknown"


def plan_alias_migrations(
    ledger: dict, meta: dict, backend: FactorizationBackend | None
) -> tuple[list[dict], list[str]]:
    """Renames a v2 factorization asks the id ledger to follow.

    A rename is planned only when the block is v2, the ledger already assigns
    the id, and the block's ``open_leaf`` differs from the symbol the ledger
    holds.  Every rejection leaves the ledger untouched and yields a violation.
    """
    violations: list[str] = []
    assigned = ledger.get("assigned") or {}
    aliases = ledger.get("aliases") or {}

    symbol_by_id: dict[str, str] = {}
    for symbol in sorted(assigned):
        obligation_id = assigned[symbol]
        if obligation_id in symbol_by_id:
            violations.append(
                obligation_id
                + ": the id ledger assigns this id to both "
                + symbol_by_id[obligation_id]
                + " and "
                + symbol
            )
            continue
        symbol_by_id[obligation_id] = symbol

    alias_owner: dict[str, str] = {}
    for obligation_id in sorted(aliases):
        record = aliases[obligation_id]
        names = record.get("aliases") if isinstance(record, dict) else None
        for name in names or []:
            alias_owner.setdefault(name, obligation_id)

    migrations: list[dict] = []
    for obligation_id, block in sorted(factorization_blocks(meta).items()):
        if not isinstance(block, dict):
            continue
        if block.get("schema") != FACTORIZATION_SCHEMA_V2:
            continue
        roles = block.get("roles")
        if not isinstance(roles, dict):
            continue
        new_leaf = roles.get(ROLE_OPEN_LEAF)
        wrapper = roles.get(ROLE_LEGACY_WRAPPER)
        if not isinstance(new_leaf, str) or not new_leaf.strip():
            continue
        old = symbol_by_id.get(obligation_id)
        if old is None or old == new_leaf:
            continue

        prefix = obligation_id + ": rename to " + new_leaf
        if wrapper != old:
            violations.append(
                prefix
                + " would allocate a new id: legacy_wrapper ("
                + str(wrapper)
                + ") is not the current name ("
                + old
                + ")"
            )
            continue
        holder = assigned.get(new_leaf)
        if holder is not None and holder != obligation_id:
            violations.append(
                prefix + " rejected (id reuse): " + new_leaf + " is already claimed by " + holder
            )
            continue
        owner = alias_owner.get(new_leaf)
        if owner is not None and owner != obligation_id:
            violations.append(
                prefix
                + " rejected (id reuse): "
                + new_leaf
                + " is already recorded as an alias of "
                + owner
            )
            continue
        owner = alias_owner.get(old)
        if owner is not None and owner != obligation_id:
            violations.append(
                prefix
                + " rejected (id reuse): alias "
                + old
                + " is already claimed by "
                + owner
            )
            continue
        if backend is None:
            violations.append(
                prefix + " rejected: cannot verify the compatibility wrapper "
                + old
                + " (no kernel-mined backend available)"
            )
            continue
        try:
            matches = backend.resolve(old)
        except RegistryError as exc:
            violations.append(
                prefix + " rejected: cannot resolve the previous name " + old + ": " + str(exc)
            )
            continue
        if len(matches) != 1:
            violations.append(
                prefix
                + " rejected: the previous name "
                + old
                + " resolves to "
                + str(len(matches))
                + " index records; the compatibility wrapper must remain as exactly one"
                + " declaration"
            )
            continue
        if matches[0].get("private") is True:
            violations.append(
                prefix
                + " rejected: the previous name "
                + old
                + " is private; the compatibility wrapper must be public"
            )
            continue
        migrations.append({"id": obligation_id, "old": old, "new": new_leaf})
    return migrations, violations


def apply_alias_migrations(
    ledger: dict, migrations: list[dict], head_short: str
) -> dict:
    """Ledger with every planned rename applied; the input is not mutated."""
    assigned = dict(ledger.get("assigned") or {})
    retired = dict(ledger.get("retired") or {})
    aliases = {
        key: dict(value)
        for key, value in (ledger.get("aliases") or {}).items()
        if isinstance(value, dict)
    }
    for migration in migrations:
        obligation_id = migration["id"]
        old = migration["old"]
        new = migration["new"]
        assigned.pop(old, None)
        assigned[new] = obligation_id
        # The id follows the leaf: it is neither reissued nor retired.
        retired.pop(new, None)
        record = aliases.get(obligation_id, {})
        names = list(record.get("aliases") or [])
        if old not in names:
            names.append(old)
        record["aliases"] = sorted(names)
        record["renamed_from"] = old
        record["renamed_at_head"] = head_short
        aliases[obligation_id] = record
    updated = {
        "schema": ledger.get("schema", ID_SCHEMA),
        "assigned": assigned,
        "retired": retired,
        "aliases": aliases,
    }
    return updated


def build_registry(
    spine: list[dict],
    offspine: list[dict],
    source_head: str,
    ledger: dict,
    meta: dict | None = None,
    build_id: str | None = None,
    verified_ids: list[str] | None = None,
) -> tuple[dict, dict]:
    """Canonical registry plus the updated id ledger.

    ``build_id`` is the current mined build fingerprint; it is stamped as
    ``verified_at_build`` onto every MATERIALIZED factorization block.  An entry
    whose reviewed metadata carries no ``p97-factorization/v2`` block gets no
    ``factorization`` key at all, so a registry with no factorization entries is
    byte-identical to one built before this key existed.

    ``verified_ids`` (W3-0c) restricts materialization to the obligation ids
    whose block PASSED live validation - exactly the ``verified_ids`` list
    ``check_factorizations`` returns.  ``generate`` always passes it, so a
    ``verified_at_build`` stamp can never be written onto a block that did not
    verify.  ``None`` means "do not restrict" and materializes every reviewed v2
    block; that is the default because ``check`` builds a throwaway registry for
    the roster comparison alone (its factorization keys are never read) and the
    unit tests build one to exercise the normalization itself.
    """
    records = normalize_records(spine, offspine)
    ids, updated_ledger = assign_ids(records, ledger, source_head)
    meta = meta or {}
    verified = None if verified_ids is None else set(verified_ids)

    obligations = []
    for record in records:
        symbol = record["symbol"]
        obligation_id = ids[symbol]
        reviewed = meta.get(obligation_id)
        if not isinstance(reviewed, dict):
            reviewed = {}
        legacy = reviewed.get("legacy_labels")
        obligation = {
            "id": obligation_id,
            "lean_decl": symbol,
            "reachable": record["reachable"],
            "source_file": record["source_file"],
            "line": record["line"],
            "cluster": cluster_label(record["source_file"]),
            "kind": record["kind"],
            "legacy_labels": sorted(legacy) if isinstance(legacy, list) else [],
            "meta_status": reviewed.get("prose_status"),
        }
        for field in META_ATTACHED_FIELDS:
            obligation[field] = reviewed.get(field)
        materialized = normalized_factorization_block(
            reviewed.get(FACTORIZATION_KEY), build_id
        )
        if materialized is not None and (verified is None or obligation_id in verified):
            obligation[FACTORIZATION_KEY] = materialized
        obligations.append(obligation)
    obligations.sort(key=lambda item: item["id"])

    registry = {
        "schema": SCHEMA,
        "source_head": source_head,
        "generated_by": GENERATED_BY,
        "publish_target": PUBLISH_TARGET,
        "meta_source": META_NAME,
        "prose_status_vocabulary": list(PROSE_STATUS_VOCABULARY),
        "obligations": obligations,
    }
    return registry, updated_ledger


def dump_canonical(data: dict) -> str:
    return json.dumps(data, sort_keys=True, indent=2, ensure_ascii=False) + "\n"


# ---------------------------------------------------------------------------
# frontier table
# ---------------------------------------------------------------------------


def frontier_table(registry: dict) -> str:
    counts: dict[str, dict[str, int]] = {}
    for obligation in registry["obligations"]:
        if not obligation["reachable"]:
            continue
        cluster = obligation["cluster"]
        module = module_stem(obligation["source_file"]) + ".lean"
        counts.setdefault(cluster, {})
        counts[cluster][module] = counts[cluster].get(module, 0) + 1

    def cluster_key(cluster: str) -> tuple[int, str]:
        if cluster in CLUSTER_ORDER:
            return (CLUSTER_ORDER.index(cluster), cluster)
        return (len(CLUSTER_ORDER), cluster)

    lines = [
        "# P97 open frontier (generated)",
        "",
        "Generated by `" + GENERATED_BY + "` from `proof-status/" + REGISTRY_NAME + "`.",
        "Do not edit by hand; regenerate instead.",
        "",
        "- Publish target: `" + registry["publish_target"] + "`",
        "- Source head: `" + registry["source_head"] + "`",
        "- Counted rows: obligations reachable from the publish target only.",
        "",
        "| Cluster | Module | Open |",
        "|---|---|---:|",
    ]

    total = 0
    for cluster in sorted(counts, key=cluster_key):
        modules = counts[cluster]
        ordered = sorted(modules, key=lambda name: (-modules[name], name))
        for index, module in enumerate(ordered):
            label = "**" + cluster + "**" if index == 0 else ""
            lines.append(
                "| " + label + " | `" + module + "` | " + str(modules[module]) + " |"
            )
            total += modules[module]
    lines.append("| **Total** | | **" + str(total) + "** |")
    lines.append("")
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# revision binding (check receipts)
# ---------------------------------------------------------------------------


def sha256_file(path: Path) -> str | None:
    if not path.is_file():
        return None
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(65536), b""):
            digest.update(chunk)
    return digest.hexdigest()


def git_lines(args: list[str]) -> list[str]:
    """Run a read-only git command, returning its stdout lines ([] on failure)."""
    try:
        result = subprocess.run(
            ["git"] + args,
            cwd=str(REPO_ROOT),
            capture_output=True,
            text=True,
            check=False,
        )
    except OSError:
        return []
    if result.returncode != 0:
        return []
    return [line for line in result.stdout.splitlines() if line.strip()]


def repo_relative_source(source_file: str) -> Path:
    """Repository-relative path of a registry ``source_file`` entry."""
    candidate = LEAN_ROOT / source_file
    if candidate.is_file():
        return Path("lean") / source_file
    return Path(source_file)


def source_file_state(registry: dict) -> dict:
    """Working-tree digest and dirty state for every roster source file."""
    relatives = sorted(
        {
            repo_relative_source(item.get("source_file") or "").as_posix()
            for item in registry.get("obligations", [])
            if item.get("source_file")
        }
    )
    dirty: set[str] = set()
    if relatives:
        dirty.update(git_lines(["diff", "--name-only", "HEAD", "--"] + relatives))
        dirty.update(
            git_lines(["ls-files", "--others", "--exclude-standard", "--"] + relatives)
        )

    files = {}
    for relative in relatives:
        absolute = REPO_ROOT / relative
        files[relative] = {
            "sha256": sha256_file(absolute),
            "present": absolute.is_file(),
            "dirty": relative in dirty,
        }
    return {
        "count": len(files),
        "any_dirty": any(entry["dirty"] for entry in files.values()),
        "missing": sorted(name for name, entry in files.items() if not entry["present"]),
        "files": files,
    }


def toolchain_state() -> dict:
    """Digest of the Lean toolchain pin actually governing the build."""
    found = []
    for candidate in TOOLCHAIN_CANDIDATES:
        absolute = REPO_ROOT / candidate
        if absolute.is_file():
            found.append(
                {
                    "path": candidate,
                    "sha256": sha256_file(absolute),
                    "content": absolute.read_text(encoding="utf-8").strip(),
                }
            )
    if not found:
        return {"path": None, "sha256": None, "content": None, "other_pins": []}
    primary = dict(found[0])
    primary["other_pins"] = found[1:]
    return primary


def parse_refs_check(text: str) -> dict:
    """Parse ``proof-blueprint refs --check`` output without regex.

    Recognised lines::

        current build: <id>
          mined (fresh):  56022
          stale:          36 (mined against an older build)
          never mined:    1
    """
    parsed: dict = {
        "build_id": None,
        "fresh": None,
        "stale": None,
        "never_mined": None,
    }

    def leading_int(value: str) -> int | None:
        token = value.strip().split(" ", 1)[0].strip()
        digits = "".join(ch for ch in token if ch.isdigit())
        if not digits or not token.startswith(digits):
            return None
        return int(digits)

    for raw in text.splitlines():
        line = raw.strip()
        if ":" not in line:
            continue
        label, _, value = line.partition(":")
        label = label.strip().lower()
        if label == "current build":
            parsed["build_id"] = value.strip() or None
        elif label == "stale":
            parsed["stale"] = leading_int(value)
        elif label == "never mined":
            parsed["never_mined"] = leading_int(value)
        elif label == "mined (fresh)":
            parsed["fresh"] = leading_int(value)
    return parsed


def refs_check_state() -> dict:
    """Run ``proof-blueprint refs --check`` and parse its build/staleness state."""
    command = [BLUEPRINT_CMD] + REFS_CHECK_ARGS
    try:
        result = subprocess.run(
            command,
            cwd=str(REPO_ROOT),
            capture_output=True,
            text=True,
            check=False,
        )
    except OSError as exc:
        return {
            "command": " ".join(command),
            "ran": False,
            "exit_code": None,
            "error": str(exc),
            "build_id": None,
            "fresh": None,
            "stale": None,
            "never_mined": None,
            "raw": None,
        }
    combined = result.stdout + result.stderr
    state = parse_refs_check(combined)
    state.update(
        {
            "command": " ".join(command),
            "ran": True,
            "exit_code": result.returncode,
            "raw": combined.strip(),
        }
    )
    return state


def roster_counts(obligations: list[dict]) -> dict:
    reachable = sum(1 for item in obligations if item.get("reachable"))
    return {
        "total": len(obligations),
        "reachable": reachable,
        "off_spine": len(obligations) - reachable,
    }


def receipt_filename(now: datetime.datetime) -> str:
    return RECEIPT_PREFIX + now.strftime("%Y%m%dT%H%M%SZ") + ".json"


def write_receipt(receipts_dir: Path, receipt: dict) -> Path:
    receipts_dir.mkdir(parents=True, exist_ok=True)
    now = datetime.datetime.strptime(receipt["generated_at_utc"], "%Y-%m-%dT%H:%M:%SZ")
    path = receipts_dir / receipt_filename(now)
    suffix = 2
    while path.exists():
        path = receipts_dir / (
            RECEIPT_PREFIX + now.strftime("%Y%m%dT%H%M%SZ") + "-" + str(suffix) + ".json"
        )
        suffix += 1
    path.write_text(dump_canonical(receipt), encoding="utf-8")
    return path


# ---------------------------------------------------------------------------
# commands
# ---------------------------------------------------------------------------


def gather_exports(
    baseline_dir: Path | None, fresh: bool, scratch_parent: Path
) -> tuple[list[dict], list[dict]]:
    """The two ROSTER record lists of one source, and nothing else.

    ``--baseline`` reads them from the recorded baseline directory; ``--fresh``
    re-exports them live into a throwaway directory below ``scratch_parent``.
    NEITHER mode exports an axiom closure: declarable consumer trust is read
    from the RECORDED closure by ``read_declarable_trust``, which the COMMAND
    calls with the directory that closure lives in (W3-0e-fix-2, auditor
    #7524).
    """
    if fresh:
        scratch_parent.mkdir(parents=True, exist_ok=True)
        temp_dir = Path(tempfile.mkdtemp(prefix=".fresh-export-", dir=str(scratch_parent)))
        try:
            export_fresh(temp_dir)
            spine = read_records(temp_dir / SPINE_EXPORT)
            offspine = read_records(temp_dir / OFFSPINE_EXPORT)
        finally:
            shutil.rmtree(temp_dir, ignore_errors=True)
        return spine, offspine
    assert baseline_dir is not None
    return (
        read_records(baseline_dir / SPINE_EXPORT),
        read_records(baseline_dir / OFFSPINE_EXPORT),
    )


def command_generate(
    args: argparse.Namespace, backend_factory=None, export_source=None
) -> int:
    """Build the registry, but only ever write a registry that passed the gate.

    The order is load, plan, build IN MEMORY, validate, and only then write.
    An alias-migration or factorization violation is a HARD error in every mode
    (W3-0c, auditor #7468) and returns before any file is touched, so a rejected
    rename cannot retire an id, allocate a new one, or leave an unverified
    ``p97-factorization/v2`` block stamped ``verified_at_build`` behind.  Only
    the ordinary reviewed-metadata join violations keep the soft path, where
    ``--strict-meta`` decides between a warning and exit 1.
    """
    out_dir = Path(args.out).resolve()
    baseline_dir = Path(args.baseline).resolve() if args.baseline else None

    spine, offspine = (
        gather_exports(baseline_dir, args.fresh, out_dir)
        if export_source is None
        else export_source()
    )
    # Declarable consumer trust is checked against the RECORDED closure in BOTH
    # modes (W3-0e-fix-2, auditor #7524): --baseline reads <baseline>/axioms.txt,
    # and --fresh, which cannot be given a baseline directory, reads the reviewed
    # copy kept with the OUTPUT tree at <out>/baseline/axioms.txt.  No live
    # export is consulted for trust.  None is fail-closed: every declaring block
    # is reported as "cannot verify", and the hard gate below refuses BEFORE any
    # output file is written.
    recorded_dir = (out_dir / BASELINE_DIR_NAME) if args.fresh else baseline_dir
    declarable_trust = read_declarable_trust(recorded_dir)

    if args.fresh:
        source_head = git_head() or read_base_head(baseline_dir, out_dir)
    else:
        source_head = read_base_head(baseline_dir, out_dir)

    ledger = load_id_assignments(out_dir / ID_ASSIGNMENTS_NAME)
    meta = load_meta(out_dir)
    backend = make_backend(meta, backend_factory)
    build_id = current_build_id(backend)
    migrations, migration_violations = plan_alias_migrations(ledger, meta, backend)
    migrated_ledger = apply_alias_migrations(ledger, migrations, git_head_short())

    # PROVISIONAL and in memory only.  Nothing is written until the hard gate
    # below has passed; this registry exists so the live factorization check has
    # the entry (id, lean_decl, reachable) it validates each block against.
    provisional, _provisional_ledger = build_registry(
        spine, offspine, source_head, migrated_ledger, meta, build_id
    )

    meta_violations = validate_meta(provisional, meta)
    factorization = check_factorizations(
        provisional,
        meta,
        backend,
        declarable_trust=declarable_trust,
        closure_path=recorded_closure_path(recorded_dir),
    )
    hard_violations = [
        "factorization: " + reason
        for reason in migration_violations + factorization["summary"]["violations"]
    ]

    if hard_violations:
        # HARD, TRANSACTIONAL gate (W3-0c).  Independent of --strict-meta, and
        # taken BEFORE any write: the three generated files keep the bytes they
        # had, and one that does not exist yet is not created.
        for reason in hard_violations:
            print("ERROR: " + reason, file=sys.stderr)
        print(
            "FAIL: refusing to write "
            + str(out_dir)
            + ": "
            + str(len(hard_violations))
            + " alias/factorization violation(s); "
            + REGISTRY_NAME
            + ", "
            + ID_ASSIGNMENTS_NAME
            + " and "
            + FRONTIER_TABLE_NAME
            + " are unchanged",
            file=sys.stderr,
        )
        return 1

    # Past the gate: materialize ONLY the blocks that passed live validation, so
    # a verified_at_build stamp is never written onto an unverified block.
    registry, updated_ledger = build_registry(
        spine,
        offspine,
        source_head,
        migrated_ledger,
        meta,
        build_id,
        verified_ids=factorization["verified_ids"],
    )
    violations = meta_violations

    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / REGISTRY_NAME).write_text(dump_canonical(registry), encoding="utf-8")
    (out_dir / ID_ASSIGNMENTS_NAME).write_text(
        dump_canonical(updated_ledger), encoding="utf-8"
    )
    (out_dir / FRONTIER_TABLE_NAME).write_text(frontier_table(registry), encoding="utf-8")

    counts = roster_counts(registry["obligations"])
    populated = sum(
        1 for item in registry["obligations"] if item.get("meta_status") is not None
    )
    print(
        "wrote "
        + str(out_dir / REGISTRY_NAME)
        + ": "
        + str(counts["reachable"])
        + " reachable, "
        + str(counts["off_spine"])
        + " off-spine, "
        + str(populated)
        + "/"
        + str(counts["total"])
        + " with reviewed meta_status"
    )
    print("wrote " + str(out_dir / ID_ASSIGNMENTS_NAME))
    print("wrote " + str(out_dir / FRONTIER_TABLE_NAME))
    print(factorization_line(factorization))
    for migration in migrations:
        print(
            "  alias migration: "
            + migration["id"]
            + " follows "
            + migration["new"]
            + " (was "
            + migration["old"]
            + ")"
        )
    if violations:
        print(
            "WARNING: reviewed metadata ("
            + META_NAME
            + ") has "
            + str(len(violations))
            + " violation(s); `check` will fail until they are resolved:",
            file=sys.stderr,
        )
        for reason in violations:
            print("  - " + reason, file=sys.stderr)
        if args.strict_meta:
            return 1
    return 0


CHECKED_FIELDS = ("lean_decl", "source_file", "reachable")


def factorization_line(factorization: dict) -> str:
    """One-line factorization census for the console."""
    summary = factorization["summary"]
    line = (
        "factorized "
        + str(summary["verified"])
        + "/"
        + str(len(factorization["reachable_ids"]))
        + " reachable leaves"
    )
    extras = []
    if summary["v1_warnings"]:
        extras.append(str(summary["v1_warnings"]) + " legacy v1 block(s), never verified")
    if summary["required_clusters"]:
        extras.append("required: " + ", ".join(summary["required_clusters"]))
    if summary["declared_trust"]["blocks"]:
        extras.append(
            str(summary["declared_trust"]["blocks"])
            + " with declared "
            + CONSUMER_TRUST_KEY
            + " ("
            + ", ".join(summary["declared_trust"]["axioms"])
            + ")"
        )
    if extras:
        line = line + " (" + "; ".join(extras) + ")"
    return line


def command_check(
    args: argparse.Namespace, backend_factory=None, export_source=None
) -> int:
    baseline_dir = Path(args.baseline).resolve()
    registry_path = (
        Path(args.registry).resolve()
        if args.registry
        else baseline_dir.parent / REGISTRY_NAME
    )
    status_dir = registry_path.parent
    receipts_dir = (
        Path(args.receipts_dir).resolve()
        if args.receipts_dir
        else status_dir / RECEIPTS_DIRNAME
    )
    now = datetime.datetime.now(datetime.timezone.utc).replace(microsecond=0)
    head = git_head()

    receipt: dict = {
        "schema": RECEIPT_SCHEMA,
        "generated_by": GENERATED_BY,
        "generated_at_utc": now.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "command": "check",
        "registry": str(registry_path.relative_to(REPO_ROOT))
        if registry_path.is_relative_to(REPO_ROOT)
        else str(registry_path),
        "git_head": head or None,
        "require_fresh_refs": bool(args.require_fresh_refs),
        "lean_toolchain": toolchain_state(),
        "blueprint_refs": None,
        "registry_source_head": None,
        "source_head_matches_git_head": None,
        "source_files": None,
        "roster": None,
        "meta": None,
        "factorization": None,
        "verdict": "error",
        "exit_code": 2,
        "reasons": [],
    }

    def finish(exit_code: int, verdict: str, reasons: list[str]) -> int:
        receipt["verdict"] = verdict
        receipt["exit_code"] = exit_code
        receipt["reasons"] = reasons
        try:
            path = write_receipt(receipts_dir, receipt)
            print("receipt: " + str(path))
        except OSError as exc:
            print("warning: could not write receipt: " + str(exc), file=sys.stderr)
        return exit_code

    try:
        committed = read_json(registry_path)
    except RegistryError as exc:
        print("error: cannot read the committed registry: " + str(exc), file=sys.stderr)
        return finish(2, "error", ["cannot read the committed registry: " + str(exc)])

    committed_head = committed.get("source_head")
    receipt["registry_source_head"] = committed_head
    # Report-only: the registry is regenerated on intentional roster change, so
    # a source_head behind HEAD is expected and is not a failure by itself.
    receipt["source_head_matches_git_head"] = bool(head) and committed_head == head
    receipt["source_files"] = source_file_state(committed)

    if committed.get("schema") != SCHEMA:
        reason = (
            str(registry_path) + " has schema " + repr(committed.get("schema"))
            + ", expected " + repr(SCHEMA)
        )
        print("FAIL: " + reason)
        return finish(1, "fail", [reason])

    receipt["blueprint_refs"] = refs_check_state()

    try:
        spine, offspine = (
            gather_exports(None, True, status_dir)
            if export_source is None
            else export_source()
        )
        ledger = load_id_assignments(status_dir / ID_ASSIGNMENTS_NAME)
        meta = load_meta(status_dir)
        backend = make_backend(meta, backend_factory)
        build_id = current_build_id(backend)
        migrations, migration_violations = plan_alias_migrations(ledger, meta, backend)
        ledger = apply_alias_migrations(ledger, migrations, git_head_short())
        # Throwaway: only the roster fields of this registry are read (added /
        # removed / CHECKED_FIELDS).  Its factorization keys are never compared,
        # so no ``verified_ids`` restriction is needed - the COMMITTED registry
        # is what ``compare_registry_factorizations`` audits below.
        fresh_registry, _ = build_registry(
            spine, offspine, committed_head or "unknown", ledger, meta, build_id
        )
    except RegistryError as exc:
        print("error: " + str(exc), file=sys.stderr)
        return finish(2, "error", ["live re-export failed: " + str(exc)])

    committed_by_decl = {item["lean_decl"]: item for item in committed.get("obligations", [])}
    fresh_by_decl = {item["lean_decl"]: item for item in fresh_registry["obligations"]}

    added = sorted(set(fresh_by_decl) - set(committed_by_decl))
    removed = sorted(set(committed_by_decl) - set(fresh_by_decl))
    changed: list[str] = []
    for decl in sorted(set(fresh_by_decl) & set(committed_by_decl)):
        fresh_item = fresh_by_decl[decl]
        committed_item = committed_by_decl[decl]
        for field in ("id",) + CHECKED_FIELDS:
            if fresh_item.get(field) != committed_item.get(field):
                changed.append(
                    decl
                    + "\n      "
                    + field
                    + ": committed="
                    + repr(committed_item.get(field))
                    + " live="
                    + repr(fresh_item.get(field))
                )

    fresh_counts = roster_counts(fresh_registry["obligations"])
    committed_counts = roster_counts(committed.get("obligations", []))
    receipt["roster"] = {
        "committed": committed_counts,
        "live": fresh_counts,
        "added": added,
        "removed": [str(committed_by_decl[decl].get("id")) for decl in removed],
        "changed_fields": len(changed),
    }

    # Reviewed metadata is validated against the COMMITTED registry: that file
    # is what downstream consumers read.
    meta_violations = validate_meta(committed, meta)
    populated = sum(
        1
        for item in committed.get("obligations", [])
        if item.get("meta_status") is not None
    )
    receipt["meta"] = {
        "file": META_NAME if (status_dir / META_NAME).is_file() else META_OVERLAY_NAME,
        "entries": len(meta),
        "registry_entries_with_meta_status": populated,
        "vocabulary": list(PROSE_STATUS_VOCABULARY),
        "violations": meta_violations,
    }

    # Factorization blocks are validated against the COMMITTED registry for the
    # same reason the reviewed metadata is: that file is what consumers read.
    required_clusters = tuple(args.require_factorized or ())
    # ``check`` audits the COMMITTED registry against the RECORDED closure kept
    # with its required baseline.  The live re-export above decides roster
    # drift only; it exports no axiom closure and ``check`` never runs one
    # (W3-0e-fix-2, auditor #7524).
    factorization = check_factorizations(
        committed,
        meta,
        backend,
        required_clusters,
        declarable_trust=read_declarable_trust(baseline_dir),
        closure_path=recorded_closure_path(baseline_dir),
    )
    factorization_violations = (
        migration_violations + factorization["summary"]["violations"]
    )
    # The registry must CARRY every verified factorization, not point at the
    # reviewed file: the materialized block on the committed entry is compared
    # to the normalized reviewed block, stamped with the CURRENT build.
    registry_drift = compare_registry_factorizations(committed, meta, build_id)
    receipt["factorization"] = dict(factorization["summary"])
    receipt["factorization"]["violations"] = factorization_violations
    receipt["factorization"]["registry_drift"] = registry_drift
    receipt["factorization"]["build_id"] = build_id

    reasons: list[str] = []
    if added or removed or changed:
        reasons.append(
            "roster drift: " + str(len(added)) + " added, " + str(len(removed))
            + " removed, " + str(len(changed)) + " changed field(s)"
        )
    for violation in meta_violations:
        reasons.append("metadata: " + violation)
    for violation in factorization_violations:
        reasons.append("factorization: " + violation)
    for violation in registry_drift:
        reasons.append("factorization registry drift: " + violation)

    refs = receipt["blueprint_refs"] or {}
    stale = refs.get("stale")
    never = refs.get("never_mined")
    if args.require_fresh_refs:
        if not refs.get("ran") or refs.get("build_id") is None:
            reasons.append(
                "--require-fresh-refs: could not read `"
                + " ".join([BLUEPRINT_CMD] + REFS_CHECK_ARGS)
                + "` state"
            )
        else:
            if stale:
                reasons.append(
                    "--require-fresh-refs: " + str(stale) + " stale mined symbol(s)"
                )
            if never:
                reasons.append(
                    "--require-fresh-refs: " + str(never) + " never-mined symbol(s)"
                )

    if not reasons:
        print(
            "OK: "
            + str(registry_path)
            + " matches the live spine ("
            + str(fresh_counts["reachable"])
            + " reachable, "
            + str(fresh_counts["off_spine"])
            + " off-spine); "
            + str(populated)
            + "/"
            + str(committed_counts["total"])
            + " reviewed meta_status, vocabulary clean"
        )
        print("  " + factorization_line(factorization))
        print(
            "  bound to: HEAD "
            + (head or "unknown")
            + ", build "
            + str(refs.get("build_id"))
            + ", roster sources "
            + ("dirty" if receipt["source_files"]["any_dirty"] else "clean")
        )
        return finish(0, "pass", [])

    if added or removed or changed:
        print("FAIL: generated obligation registry is stale")
        print("  registry: " + str(registry_path))
        print(
            "  committed: "
            + str(committed_counts["reachable"])
            + " reachable / "
            + str(committed_counts["off_spine"])
            + " off-spine"
        )
        print(
            "  live:      "
            + str(fresh_counts["reachable"])
            + " reachable / "
            + str(fresh_counts["off_spine"])
            + " off-spine"
        )
        if added:
            print("  NEW obligations on the live tree (" + str(len(added)) + "):")
            for decl in added:
                item = fresh_by_decl[decl]
                print(
                    "    + "
                    + item["id"]
                    + "  "
                    + decl
                    + "  ["
                    + ("reachable" if item["reachable"] else "off-spine")
                    + "]  "
                    + item["source_file"]
                )
        if removed:
            print("  GONE from the live tree (" + str(len(removed)) + "):")
            for decl in removed:
                item = committed_by_decl[decl]
                print("    - " + str(item.get("id")) + "  " + decl)
        if changed:
            print("  CHANGED fields (" + str(len(changed)) + "):")
            for entry in changed:
                print("    ~ " + entry)
        print(
            "  fix: uv run python "
            + GENERATED_BY
            + " generate --fresh --out proof-status"
        )
    if meta_violations:
        print(
            "FAIL: reviewed metadata ("
            + str(status_dir / META_NAME)
            + ") is inconsistent with the registry ("
            + str(len(meta_violations))
            + "):"
        )
        for violation in meta_violations:
            print("    ! " + violation)
        print("  controlled vocabulary: " + ", ".join(PROSE_STATUS_VOCABULARY))
    if factorization_violations:
        print(
            "FAIL: factorization entries are not verified ("
            + str(len(factorization_violations))
            + "):"
        )
        for violation in factorization_violations:
            print("    ! " + violation)
        print("  " + factorization_line(factorization))
    if registry_drift:
        print(
            "FAIL: the committed registry does not carry the reviewed"
            " factorization blocks (" + str(len(registry_drift)) + "):"
        )
        for violation in registry_drift:
            print("    ! " + violation)
        print(
            "  fix: uv run python "
            + GENERATED_BY
            + " generate --fresh --out proof-status"
        )
    stale_reasons = [
        reason for reason in reasons if reason.startswith("--require-fresh-refs")
    ]
    if stale_reasons:
        print("FAIL: kernel-mined refs are not fresh")
        for reason in stale_reasons:
            print("    ! " + reason)
        print("  fix: proof-blueprint refs --refresh")
    return finish(1, "fail", reasons)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="gen_obligation_registry.py",
        description="Generate and gate the P97 proof-obligation registry.",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    generate = subparsers.add_parser(
        "generate", help="build the registry from baseline exports or a live export"
    )
    source = generate.add_mutually_exclusive_group(required=True)
    source.add_argument(
        "--baseline", help="directory holding the recorded spine/off-spine exports"
    )
    source.add_argument(
        "--fresh",
        action="store_true",
        help="re-export live data with proof-blueprint before generating",
    )
    generate.add_argument("--out", required=True, help="proof-status output directory")
    generate.add_argument(
        "--strict-meta",
        action="store_true",
        help="exit 1 when the reviewed metadata join has violations (default: warn"
        " and still write, so a new obligation can be reviewed after generation)",
    )
    generate.set_defaults(func=command_generate)

    check = subparsers.add_parser(
        "check",
        help="regenerate from the live tree and fail if the committed registry is stale",
    )
    check.add_argument(
        "--baseline",
        required=True,
        help="baseline directory; its parent holds the committed registry",
    )
    check.add_argument(
        "--registry", help="explicit path to the committed obligations.json"
    )
    check.add_argument(
        "--receipts-dir",
        help="where to write the revision-binding receipt"
        " (default: <registry dir>/" + RECEIPTS_DIRNAME + ")",
    )
    check.add_argument(
        "--require-fresh-refs",
        action="store_true",
        help="also fail when `proof-blueprint refs --check` reports a nonzero"
        " stale or never-mined count",
    )
    check.add_argument(
        "--require-factorized",
        action="append",
        metavar="LABEL",
        choices=list(CLUSTER_CODES),
        help="require a VERIFIED " + FACTORIZATION_SCHEMA_V2 + " factorization block"
        " on every reachable leaf of this cluster code (" + ", ".join(CLUSTER_CODES)
        + "); repeatable. Without it, missing blocks are only counted.",
    )
    check.set_defaults(func=command_check)

    return parser


def main(argv: list[str] | None = None, backend_factory=None, export_source=None) -> int:
    """Command entry point.

    ``backend_factory`` and ``export_source`` are the COMMAND-LEVEL test seams
    (W3-0b).  Both default to None, which is the live behaviour: the backend is
    a ``BlueprintBackend`` and the roster comes from the recorded baseline
    exports (``generate --baseline``) or a live ``proof-blueprint`` re-export
    (``generate --fresh`` and every ``check``).  The command line cannot set
    either one - they exist so a test can drive the real ``generate`` / ``check``
    entry point over a COPY of ``proof-status`` without touching live data:

    * ``backend_factory()`` returns a ``FactorizationBackend`` (a
      ``MappingBackend`` in the tests) and is consulted only when a reviewed
      factorization block actually needs a backend;
    * ``export_source()`` returns the ``(spine, offspine)`` record lists that
      would otherwise be read or re-exported.  It is a 2-tuple in every mode:
      declarable consumer trust does NOT travel with the rosters, it is read
      from the RECORDED closure by the command itself (W3-0e-fix-2, auditor
      #7524), so a seam that hands back three values is a programming error and
      unpacking raises.
    """
    args = build_parser().parse_args(argv)
    try:
        return args.func(
            args, backend_factory=backend_factory, export_source=export_source
        )
    except RegistryError as exc:
        print("error: " + str(exc), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
