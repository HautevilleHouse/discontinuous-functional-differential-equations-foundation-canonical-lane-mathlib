import DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean.DFDEStateSpace

/-!
# DFDE Operator Package
-/

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DFDEOperatorPackage {S : DFDEStateSpacePackage} where
  generator : Type
  domain : Type
  spectrum : Set ℝ
  resolventEstimate : Prop
  wellposedness : Prop

def DFDEOperatorClosed {S : DFDEStateSpacePackage} (O : DFDEOperatorPackage S) : Prop :=
  O.resolventEstimate ∧ O.wellposedness

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse