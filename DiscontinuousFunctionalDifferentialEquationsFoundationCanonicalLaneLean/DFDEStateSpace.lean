import DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean.MathlibObjects

/-!
# DFDE State Space Package
-/

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DFDEStateSpacePackage where
  eta0 : ℝ
  xi0 : ℝ
  tau : ℝ
  delay : ℝ
  piecewiseContinuous : Prop
  jumpSizeControl : Prop

def DFDEStateSpaceClosed (S : DFDEStateSpacePackage) : Prop :=
  S.piecewiseContinuous ∧ S.jumpSizeControl

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse