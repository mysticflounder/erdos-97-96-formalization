"""Named-local CNF shadow for the live B-family frontier.

This is deliberately a *projection*, not a finite model of the carrier.
Every emitted clause has a hypothesis/bank tag.  In particular the B1
delta contains the normal form now proved from the live B1 binders by
`Problem97.B2Arm3.b1_live_normalForm`; it does not import any stronger
historical B1 bank interface.
"""

from __future__ import annotations

import sys
from collections.abc import Collection, Sequence
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.sat_encoding import (  # noqa: E402
    CNF,
    CadicalResult,
    EncodingError,
    solve_cadical,
)

LABELS = ("z1", "z2", "u", "v", "a2", "b1", "b2", "bu", "bv")
SOURCES = ("z1", "z2", "u", "v")
BLOCKER = {"z1": "b1", "z2": "b2", "u": "bu", "v": "bv"}
PACKETS = ("first_u", "first_v", "cross")


class BEncoder:
    """Deterministic atom table plus tagged clause layers."""

    def __init__(self) -> None:
        self.cnf = CNF()
        self.names: dict[str, int] = {}
        self.tags: list[str] = []
        self.layers: dict[str, list[tuple[int, ...]]] = {
            "base": [],
            "B1-direct-shadow": [],
            "B2": [],
            "B3": [],
        }
        self.layer_tags: dict[str, list[str]] = {layer: [] for layer in self.layers}
        self._allocate_atoms()
        self._build_base()
        self._build_b1_live_normal_form_shadow()
        self._build_b2()
        self._build_b3()

    def atom(self, name: str) -> int:
        if name not in self.names:
            self.names[name] = self.cnf.new_variable()
        return self.names[name]

    def _allocate_atoms(self) -> None:
        for p in LABELS:
            self.atom(f"inA({p})")
        for s in SOURCES:
            for p in LABELS:
                self.atom(f"row({s},{p})")
        for x in LABELS:
            for c in LABELS:
                self.atom(f"surv({x},{c})")
        for packet in PACKETS:
            for p in LABELS:
                self.atom(f"packet({packet},{p})")
        for arm in ("u", "v", "b2"):
            self.atom(f"B2.collision.{arm}")
        for arm in ("u", "v"):
            self.atom(f"B2.mutual.{arm}")
        for arm in ("a2", "bu", "bv", "b2"):
            self.atom(f"B3.square.{arm}")

    def add(self, layer: str, tag: str, literals: Collection[int]) -> None:
        clause = tuple(literals)
        self.cnf.add_clause(clause)
        self.layers[layer].append(clause)
        qualified_tag = f"{layer}:{tag}"
        self.tags.append(qualified_tag)
        self.layer_tags[layer].append(qualified_tag)

    def unit(self, layer: str, tag: str, literal: int) -> None:
        self.add(layer, tag, (literal,))

    def imply(self, layer: str, tag: str, premise: int, conclusion: int) -> None:
        self.add(layer, tag, (-premise, conclusion))

    def iff_under(
        self, layer: str, tag: str, selector: int, left: int, right: int
    ) -> None:
        self.add(layer, tag, (-selector, -left, right))
        self.add(layer, tag, (-selector, left, -right))

    def _build_base(self) -> None:
        for p in LABELS:
            self.unit("base", "B0-carrier-binders", self.atom(f"inA({p})"))
        for s in SOURCES:
            blocker = BLOCKER[s]
            self.unit("base", "B0-row-self", self.atom(f"row({s},{s})"))
            self.unit("base", "B0-blocker-off-row", -self.atom(f"row({s},{blocker})"))
            self.unit(
                "base", "B0-no-qfree-at-blocker", -self.atom(f"surv({s},{blocker})")
            )
            for x in LABELS:
                # not-in-row -> survives deletion at the row's blocker.
                self.add(
                    "base",
                    "B0-omission-to-survival",
                    (self.atom(f"row({s},{x})"), self.atom(f"surv({x},{blocker})")),
                )

    def _build_b1_live_normal_form_shadow(self) -> None:
        """Project exactly the proved live B1 normal form into this vocabulary.

        The layer name remains `B1-direct-shadow` so existing artifact paths
        stay stable.  Its source is now `b1_live_normalForm`, not the obsolete
        pre-normal-form binder-only interface.
        """

        # hblockersEq: b1 = b2.  Project equality only through predicates
        # represented in this finite vocabulary.
        for pfx in ("inA",):
            self.add(
                "B1-direct-shadow",
                "B1-hblockersEq-congruence",
                (-self.atom(f"{pfx}(b1)"), self.atom(f"{pfx}(b2)")),
            )
            self.add(
                "B1-direct-shadow",
                "B1-hblockersEq-congruence",
                (self.atom(f"{pfx}(b1)"), -self.atom(f"{pfx}(b2)")),
            )
        for s in SOURCES:
            self.add(
                "B1-direct-shadow",
                "B1-hblockersEq-row-congruence",
                (-self.atom(f"row({s},b1)"), self.atom(f"row({s},b2)")),
            )
            self.add(
                "B1-direct-shadow",
                "B1-hblockersEq-row-congruence",
                (self.atom(f"row({s},b1)"), -self.atom(f"row({s},b2)")),
            )
        for x in LABELS:
            self.add(
                "B1-direct-shadow",
                "B1-hblockersEq-survival-congruence",
                (-self.atom(f"surv({x},b1)"), self.atom(f"surv({x},b2)")),
            )
            self.add(
                "B1-direct-shadow",
                "B1-hblockersEq-survival-congruence",
                (self.atom(f"surv({x},b1)"), -self.atom(f"surv({x},b2)")),
            )

        # b1_live_normalForm: Row(z1) = Row(z2).
        for p in LABELS:
            self.add(
                "B1-direct-shadow",
                "B1-live-normalForm-support-equality",
                (-self.atom(f"row(z1,{p})"), self.atom(f"row(z2,{p})")),
            )
            self.add(
                "B1-direct-shadow",
                "B1-live-normalForm-support-equality",
                (self.atom(f"row(z1,{p})"), -self.atom(f"row(z2,{p})")),
            )

        # Each deleted source lies on the other source's canonical row.
        self.unit(
            "B1-direct-shadow",
            "B1-live-normalForm-cross-membership",
            self.atom("row(z1,z2)"),
        )
        self.unit(
            "B1-direct-shadow",
            "B1-live-normalForm-cross-membership",
            self.atom("row(z2,z1)"),
        )

        # The common row meets the physical second-apex class in exactly
        # {z1,z2}.  Since u and v are distinct members of that physical class,
        # neither can lie on either (equal) canonical row.
        for source in ("z1", "z2"):
            for point in ("u", "v"):
                self.unit(
                    "B1-direct-shadow",
                    "B1-live-normalForm-physical-class-exclusion",
                    -self.atom(f"row({source},{point})"),
                )

    def _equality_projection(self, layer: str, selector: int, left: str, right: str) -> None:
        self.iff_under(
            layer,
            "B2-hcollision-congruence-inA",
            selector,
            self.atom(f"inA({left})"),
            self.atom(f"inA({right})"),
        )
        for s in SOURCES:
            self.iff_under(
                layer,
                "B2-hcollision-congruence-row",
                selector,
                self.atom(f"row({s},{left})"),
                self.atom(f"row({s},{right})"),
            )
        for c in LABELS:
            self.iff_under(
                layer,
                "B2-hcollision-congruence-survival-owner",
                selector,
                self.atom(f"surv({left},{c})"),
                self.atom(f"surv({right},{c})"),
            )
        for x in LABELS:
            self.iff_under(
                layer,
                "B2-hcollision-congruence-survival-center",
                selector,
                self.atom(f"surv({x},{left})"),
                self.atom(f"surv({x},{right})"),
            )

    def _build_b2(self) -> None:
        collisions = {
            "u": ("bu", "u"),
            "v": ("bv", "v"),
            "b2": ("b2", "z2"),
        }
        collision_vars = [self.atom(f"B2.collision.{arm}") for arm in collisions]
        self.add("B2", "B2-hcollision-at-least-one", collision_vars)
        for arm, (right, row_center) in collisions.items():
            selector = self.atom(f"B2.collision.{arm}")
            self._equality_projection("B2", selector, "z1", right)
            self.imply(
                "B2",
                "B2-bank-center-exclusion",
                selector,
                -self.atom(f"row({row_center},z1)"),
            )

        # The three packet B1 classes are forced to the corresponding
        # canonical rows by the statement-compatible bank theorem.
        packet_rows = {
            "first_u": "u",
            "first_v": "v",
            "cross": "z2",
        }
        for packet, source in packet_rows.items():
            for p in LABELS:
                left = self.atom(f"packet({packet},{p})")
                right = self.atom(f"row({source},{p})")
                self.add("B2", "B2-bank-canonical-row", (-left, right))
                self.add("B2", "B2-bank-canonical-row", (left, -right))

        mutual = [self.atom("B2.mutual.u"), self.atom("B2.mutual.v")]
        self.add("B2", "B2-bank-mutual-omission-disjunction", mutual)
        for arm, source, blocker in (("u", "u", "bu"), ("v", "v", "bv")):
            selector = self.atom(f"B2.mutual.{arm}")
            for conclusion, suffix in (
                (-self.atom(f"row(z1,{source})"), "omit-from-first"),
                (-self.atom(f"row({source},z1)"), "omit-from-other"),
                (self.atom(f"surv({source},b1)"), "survive-first-deletion"),
                (self.atom(f"surv(z1,{blocker})"), "survive-other-deletion"),
            ):
                self.imply("B2", f"B2-bank-mutual-{suffix}", selector, conclusion)

    def _build_b3(self) -> None:
        square_vars = [
            self.atom(f"B3.square.{center}") for center in ("a2", "bu", "bv", "b2")
        ]
        self.add("B3", "B3-hsurvivalSquare-at-least-one", square_vars)
        for center in ("a2", "bu", "bv", "b2"):
            selector = self.atom(f"B3.square.{center}")
            self.imply(
                "B3",
                "B3-hsurvivalSquare-forward",
                selector,
                self.atom(f"surv(z1,{center})"),
            )
            self.imply(
                "B3",
                "B3-hsurvivalSquare-return",
                selector,
                self.atom(f"surv({center},b1)"),
            )

    def clauses(self, *layers: str) -> list[tuple[int, ...]]:
        out: list[tuple[int, ...]] = []
        for layer in layers:
            out.extend(self.layers[layer])
        return out

    def unit_clause(self, atom_name: str, value: bool = True) -> list[tuple[int, ...]]:
        variable = self.atom(atom_name)
        return [(variable if value else -variable,)]

    def tag_counts(self) -> dict[str, int]:
        counts: dict[str, int] = {}
        for tag in self.tags:
            counts[tag] = counts.get(tag, 0) + 1
        return counts


class RunInstance:
    """Adapter for the shared CaDiCaL/DRAT driver."""

    def __init__(self, encoder: BEncoder, clauses: Sequence[tuple[int, ...]]) -> None:
        self.encoder = encoder
        self.base_clauses = tuple(tuple(c) for c in clauses)

    def dimacs(self, extra_clauses: Sequence[Collection[int]] = ()) -> str:
        clauses = self.base_clauses + tuple(tuple(c) for c in extra_clauses)
        lines = [f"p cnf {self.encoder.cnf.n_variables} {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive_variables: Collection[int]) -> dict[str, bool]:
        positive = set(positive_variables)
        return {name: variable in positive for name, variable in self.encoder.names.items()}


__all__ = [
    "BEncoder",
    "CadicalResult",
    "EncodingError",
    "RunInstance",
    "solve_cadical",
]
