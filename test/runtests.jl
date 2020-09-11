using svopt
using Test


ϵ = 1e-5


@testset "optfun" begin
    f1(x) = x^2
    f2(x) = (x+1)^4 + 10
    f3(x) = (x+10)^2 - 10
    @test optfun(f1, -3, 10) - 0 < ϵ
    @test optfun(f2, -3, 10) - 1 < ϵ
    @test optfun(f3, 3, 30) - 10 < ϵ
end
