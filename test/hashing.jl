types = {
    Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float32, Float64,
    Rational{Int8}, Rational{Uint8}, Rational{Int16}, Rational{Uint16},
    Rational{Int32}, Rational{Uint32}, Rational{Int64}, Rational{Uint64}
}
values = [
    typemin(Int64),
    -integer(maxintfloat(Float64))+(-4:1),
    typemin(Int32),
    -integer(maxintfloat(Float32))+(-4:1),
    -2:2,
    integer(maxintfloat(Float32))+(-1:4),
    typemax(Int32),
    integer(maxintfloat(Float64))+(-1:4),
    typemax(Int64),
]

for T=types, S=types, x=values
    a = convert(T,x)
    b = convert(S,x)
    #println("$(typeof(a)) $a")
    #println("$(typeof(b)) $b")
    @assert !isequal(a,b) || hash(a)==hash(b)
    # for y=values
    #     println("T=$T; S=$S; x=$x; y=$y")
    #     c = convert(T,x//y)
    #     d = convert(S,x//y)
    #     @assert !isequal(a,b) || hash(a)==hash(b)
    # end
end

f = prevfloat(float64(typemax(Uint64)))
@assert hash(f) == hash(0xfffffffffffff800)
@assert hash(f) == hash(-2048)
