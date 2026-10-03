ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings

x = range(-π, π, length = 10000)
y = @. sin(factorial(5) * x) * sqrt((π^2 - x^2) / sqrt(π)) + log(abs(x) + sqrt(1 / 2))


plot(x, y,
     legend = false,
     linewidth = 1,
     size = (900, 900),
     color = :red,
     framestyle = :origin,
     grid = true,
     gridalpha = 0.4,
     gridlinewidth = 1,
     minorgrid = true,
     minorgridalpha = 0.15,
     xticks = -3:1:3,
     yticks = -3:1:3,
     tickfontsize = 12,
     tickfontcolor = :black,
     title = L"y = \sin(5!\,x)\,\sqrt{\frac{\pi^{2}-x^{2}}{\sqrt{\pi}}} + \ln\!\left(|x| + \sqrt{\frac{1}{2}}\right)",
     titlefontsize = 24)

savefig("app.svg")
