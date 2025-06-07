"""
    MathSet

`MathSet`s are simply sets prepared to be used with mathematics symbols.
"""
struct MathSet{T}  <: AbstractSet{T}
    set::OrderedSet{T}

    MathSet{T}() where {T} = new{T}(OrderedSet{T}())
    MathSet{T}(xs) where {T} = union!(MathSet{T}(), xs)
    MathSet(xs::AbstractVector{T}) where T = MathSet(OrderedSet(xs))
end

MathSet() = MathSet{Any}()
MathSet(xs) = MathSet{eltype(xs)}(xs)

show(io::IO, s::MathSet) = (show(io, typeof(s)); print(io, "("); !isempty(s) && Base.show_vector(io, s.set,'[',']'); print(io, ")"))

isempty(s::MathSet) = isempty(s.set)
length(s::MathSet)  = length(s.set)

sizehint!(s::MathSet, sz::Integer) = sizehint!(s.set, sz)

in(x, s::MathSet) = in(x, s.set)

push!(s::MathSet, x) = push!(s.set, x)
pop!(s::MathSet, x) = pop!(s.set, x)
pop!(s::MathSet, x, deflt) = pop!(s.set, x, deflt)
delete!(s::MathSet, x) = delete!(s.set, x)

empty(s::MathSet{T}) where {T} = MathSet{T}()
copy(s::MathSet) = union!(empty(s), s)

empty!(s::MathSet{T}) where {T} = (empty!(s.set); s)

emptymutable(s::MathSet{T}, ::Type{U}=T) where {T,U} = MathSet{U}()
copymutable(s::MathSet) = copy(s)

iterate(s::MathSet) = iterate(s.set)
iterate(s::MathSet, st...) = iterate(s.set, st...)

pop!(s::MathSet) = pop!(s.set)
popfirst!(s::MathSet) = popfirst!(s.set)

==(l::MathSet, r::MathSet) = ==(l.set, r.set)

filter!(f::Function, s::MathSet) = filter!(f, s.set)

hash(s::MathSet, h::UInt) = hash(s.set, h)