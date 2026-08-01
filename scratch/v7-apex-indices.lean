import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.LivePacket
import Erdos9796Proof.P97.Census554.CoverIndexBridge

open Problem97
open Problem97.ExactFiveCommonShellV7
open Problem97.Census554
open Problem97.Census554.CoverCnf
open Problem97.Census554.CoverIndexBridge

#eval (List.range (candCount 1)).filter fun candidateIndex =>
  let mask := (candMasks 1).getD candidateIndex 0
  mask == classMask ({2, 6, 7, 8} : Finset (Fin 11)) ||
    mask == classMask ({3, 6, 7, 8} : Finset (Fin 11))

#eval [0, 12, 13].map fun candidateIndex =>
  (candidateIndex, (candMasks 1).getD candidateIndex 0)
