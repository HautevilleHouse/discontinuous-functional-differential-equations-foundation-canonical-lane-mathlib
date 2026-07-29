import DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean.DFDEOperator

/-!
# DFDE Bridge Package
-/

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DFDEBridgePackage {S : DFDEStateSpacePackage} {O : DFDEOperatorPackage S} where
  solutionOperator : Type
  semiGroupProperty : Prop
  smoothingEffect : Prop
  jumpTransferEstimate : Prop

def DFDEBridgeClosed {S : DFDEStateSpacePackage} {O : DFDEOperatorPackage S} (B : DFDEBridgePackage S O) : Prop :=
  B.semiGroupProperty ∧ B.smoothingEffect ∧ B.jumpTransferEstimate

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse