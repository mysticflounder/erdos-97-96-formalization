/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0001
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0002
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0003
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0004
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0005
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0006
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0007
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0008
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0009
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0010
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0011
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0012
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0013
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0014
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0015
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0016
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0017
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0018
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0019
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0020
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0021
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0022
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0023
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0024
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0025
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0026
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0027
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0028
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0029
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0030
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0031
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0032
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0033
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0034
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0035
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0036
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0037
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0038
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Shard2.W0039

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace Balanced555DirectReplay.Shard2

open Problem97.CheckpointedRup.CompactBoundary

theorem throughW0001 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0039.text) :=
  W0001.sound

theorem throughW0002 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0040.text) :=
  composeRebaseCompact throughW0001 W0002.sound

theorem throughW0003 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0041.text) :=
  composeRebaseCompact throughW0002 W0003.sound

theorem throughW0004 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0042.text) :=
  composeRebaseCompact throughW0003 W0004.sound

theorem throughW0005 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0043.text) :=
  composeRebaseCompact throughW0004 W0005.sound

theorem throughW0006 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0044.text) :=
  composeRebaseCompact throughW0005 W0006.sound

theorem throughW0007 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0045.text) :=
  composeRebaseCompact throughW0006 W0007.sound

theorem throughW0008 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0046.text) :=
  composeRebaseCompact throughW0007 W0008.sound

theorem throughW0009 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0047.text) :=
  composeRebaseCompact throughW0008 W0009.sound

theorem throughW0010 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0048.text) :=
  composeRebaseCompact throughW0009 W0010.sound

theorem throughW0011 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0049.text) :=
  composeRebaseCompact throughW0010 W0011.sound

theorem throughW0012 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0050.text) :=
  composeRebaseCompact throughW0011 W0012.sound

theorem throughW0013 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0051.text) :=
  composeRebaseCompact throughW0012 W0013.sound

theorem throughW0014 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0052.text) :=
  composeRebaseCompact throughW0013 W0014.sound

theorem throughW0015 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0053.text) :=
  composeRebaseCompact throughW0014 W0015.sound

theorem throughW0016 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0054.text) :=
  composeRebaseCompact throughW0015 W0016.sound

theorem throughW0017 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0055.text) :=
  composeRebaseCompact throughW0016 W0017.sound

theorem throughW0018 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0056.text) :=
  composeRebaseCompact throughW0017 W0018.sound

theorem throughW0019 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0057.text) :=
  composeRebaseCompact throughW0018 W0019.sound

theorem throughW0020 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0058.text) :=
  composeRebaseCompact throughW0019 W0020.sound

theorem throughW0021 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0059.text) :=
  composeRebaseCompact throughW0020 W0021.sound

theorem throughW0022 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0060.text) :=
  composeRebaseCompact throughW0021 W0022.sound

theorem throughW0023 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0061.text) :=
  composeRebaseCompact throughW0022 W0023.sound

theorem throughW0024 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0062.text) :=
  composeRebaseCompact throughW0023 W0024.sound

theorem throughW0025 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0063.text) :=
  composeRebaseCompact throughW0024 W0025.sound

theorem throughW0026 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0064.text) :=
  composeRebaseCompact throughW0025 W0026.sound

theorem throughW0027 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0065.text) :=
  composeRebaseCompact throughW0026 W0027.sound

theorem throughW0028 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0066.text) :=
  composeRebaseCompact throughW0027 W0028.sound

theorem throughW0029 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0067.text) :=
  composeRebaseCompact throughW0028 W0029.sound

theorem throughW0030 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0068.text) :=
  composeRebaseCompact throughW0029 W0030.sound

theorem throughW0031 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0069.text) :=
  composeRebaseCompact throughW0030 W0031.sound

theorem throughW0032 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0070.text) :=
  composeRebaseCompact throughW0031 W0032.sound

theorem throughW0033 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0071.text) :=
  composeRebaseCompact throughW0032 W0033.sound

theorem throughW0034 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0072.text) :=
  composeRebaseCompact throughW0033 W0034.sound

theorem throughW0035 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0073.text) :=
  composeRebaseCompact throughW0034 W0035.sound

theorem throughW0036 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0074.text) :=
  composeRebaseCompact throughW0035 W0036.sound

theorem throughW0037 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0075.text) :=
  composeRebaseCompact throughW0036 W0037.sound

theorem throughW0038 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text)
      (formulaOfCompact (n := n) Checkpoint.C0076.text) :=
  composeRebaseCompact throughW0037 W0038.sound

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0038.text) :=
  closeRebaseCompact throughW0038 W0039.sound

end Balanced555DirectReplay.Shard2
