import Mathlib

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DFDESpace where
  carrier : Type
  delay : ℝ
  jumpData : Type

def DFDEClosed (M : DFDESpace) : Prop :=
  True

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse