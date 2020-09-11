module svopt
export optfun

ρ = (sqrt(5) - 1)/2

fw1(a, b) = a + (1 - ρ)*(b - a)
fw2(a, b) = b - (1 - ρ)*(b - a)

function optfun(f, a, b; ϵ=1e-5)
    @assert b > a
    k = 1
    w1 = fw1(a, b)
    w2 = fw2(a, b)

    while abs(b - a) > ϵ
        if f(w1) < f(w2)
            b = w2
            w2 = w1
            w1 = fw1(a, b)
        else
            a = w1
            w1 = w2
            w2 = fw2(a, b)
        end
    end
    return a
end

end # module
