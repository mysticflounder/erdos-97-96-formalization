/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRupCompactBoundary

/-!
# Ground tests for compact checkpointed RUP ingress

These small examples cover a successful two-window replay and representative
fail-closed cases at the ASCII85, varuint, formula, and action layers.
-/

set_option warningAsError true

namespace Problem97.CheckpointedRup.CompactSelfTest

open Problem97.CheckpointedRup.CompactIngress

private def startText : String := "6Vp6,!WrK*\"9AN(!r"

private def firstText : String := "6Vp''!WW6(!W`?'!W`?"

private def checkpointText : String := "6Vp6,!WiB)!<`"

private def secondText : String := "6Vp''!<<*$!<N"

#guard decodeAscii85 "!!!!!" == some (ByteArray.mk #[0, 0, 0, 0])

#guard decodeAscii85 "rr" == some (ByteArray.mk #[255])

#guard (decodeAscii85 "!\"").isNone

#guard (decodeAscii85 "uuuuu").isNone

#guard (decodeAscii85 "!").isNone

#guard (decodeAscii85 "!!!! ").isNone

#guard decodeVarUInt (ByteArray.mk #[0]) == some 0

#guard (decodeVarUInt (ByteArray.mk #[128, 0])).isNone

#guard (decodeVarUInt (ByteArray.mk #[0, 0])).isNone

#guard
  decodeVarUInt (ByteArray.mk #[255, 255, 255, 255, 255, 255, 255, 255, 255, 1]) ==
    some 18446744073709551615

#guard
  (decodeVarUInt (ByteArray.mk #[255, 255, 255, 255, 255, 255, 255, 255, 255, 2])).isNone

#guard decodeZigZag (ByteArray.mk #[0]) == some 0

#guard decodeZigZag (ByteArray.mk #[1]) == some (-1)

#guard decodeZigZag (ByteArray.mk #[4]) == some 2

#guard checkRebaseCompact (n := 3) startText firstText checkpointText

#guard checkTerminalCompact (n := 3) checkpointText secondText

#guard (parseFormula (n := 4) startText).isNone

#guard
  (parseActions (n := 3) 4 firstText).map ParsedActions.nextAdditionId == some 5

-- One trailing zero byte after an otherwise valid formula.
#guard (parseFormula (n := 3) "6Vp6,!WrK*\"9AN(!rr").isNone

-- A clause containing the same variable twice.
#guard (parseFormula (n := 3) "6Vp6,!W`?(!W").isNone

-- Action tag 2 is outside the pure-RUP grammar.
#guard (parseActions (n := 3) 4 "6Vp''!<N").isNone

end Problem97.CheckpointedRup.CompactSelfTest
