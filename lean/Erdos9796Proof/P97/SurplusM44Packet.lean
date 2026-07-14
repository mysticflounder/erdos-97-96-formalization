/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard02
import Erdos9796Proof.P97.SurplusM44Packet.Shard03
import Erdos9796Proof.P97.SurplusM44Packet.Shard04
import Erdos9796Proof.P97.SurplusM44Packet.Shard05
import Erdos9796Proof.P97.SurplusM44Packet.Shard06
import Erdos9796Proof.P97.SurplusM44Packet.Shard07
import Erdos9796Proof.P97.SurplusM44Packet.Shard08
import Erdos9796Proof.P97.SurplusM44Packet.Shard09

/-!
# General-n `(m,4,4)` selected-apex packets

This file starts the proof-facing `SurplusCapPacket` interface needed by the
four-point subpacket reduction.  It deliberately proves only structural facts:
selected-apex extraction from global `K4`, cyclic adjacent-count vocabulary, and
the same-cap one-hit bound for a short cap of cardinality four.

It does not assert the adjacent one-hit bounds or Q lower bounds; those remain
geometric obligations.
-/

