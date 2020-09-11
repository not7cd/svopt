using svopt
using Test


ϵ = 1e-5

@testset "ratio helpers" begin
    a = -5
    b = 10
    @test svopt.fw1(a, b) - a == b - svopt.fw2(a, b)
end # testset


@testset "optfun" begin
    f1(x) = x^2
    f2(x) = (x-1)^2*10 + 10
    f3(x) = (x+10)^2 - 10
    f4(x) = x^2 - 1
    f5(x) = x^2/3 + 2x - sin(x)

    @test isapprox(optfun(f1, -3, 10), 0, atol=ϵ)
    @test isapprox(optfun(f2, -3, 10), 1, atol=ϵ)
    @test isapprox(optfun(f3, -30, 30), -10, atol=ϵ)
    @test isapprox(optfun(f4, -10, 30), 0, atol=ϵ)
    @test isapprox(optfun(f5, -10, 5), -3.99083, atol=ϵ)
end
