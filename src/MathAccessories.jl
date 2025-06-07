module MathAccessories

import Base: \, ==, show, isempty, length, sizehint!, 
             in, push!, pop!, delete!, empty, copy, 
             empty!, emptymutable, copymutable, iterate,
             popfirst!, filter!, hash

import OrderedCollections: OrderedSet
import Infinities: ∞

export MathSet
export ⅈ, ⅉ
export ∅
export ∑, ∏, ∥, ∠, °, ∡, ∗, ℜ, ℑ, ∧, ∨, ¬, ⋅, ≟
export ╲, Ω, ⪽
export @∀
export ∞

include("mathset.jl")
include("symbols.jl")

end