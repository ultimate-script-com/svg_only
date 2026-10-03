ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings

x = range(-ℯ, ℯ, length = 4000)
y = @. sin(99x) * sqrt(max((ℯ^2 - x^2) / 1.8, 0)) + log(abs(x) + 0.7)

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
     title = L"y = \sin(99x)\sqrt{\frac{e^2-x^2}{1.8}}+\ln(|x|+0.7)",
     titlefontsize = 32)

savefig("app.svg")
