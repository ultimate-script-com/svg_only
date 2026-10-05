ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings, Base.MathConstants

x = range(-π, π, length = 10000)
y = @. sqrt((π^2 - x^2) / 2) / sin(4^ℯ * x) + log(abs(x) + 1/2)

plot(x, y,
     legend = false,
     linewidth = 1,
     size = (1000, 1000),
     color = :red,
     framestyle = :origin,
     aspect_ratio = :equal,
     xlims = (-5, 5),
     ylims = (-5, 5),
     grid = true,
     gridalpha = 0.4,
     gridlinewidth = 1,
     minorgrid = true,
     minorgridalpha = 0.15,
     xticks = -4:1:4,
     yticks = -4:1:4,
     tickfontsize = 12,
     tickfontcolor = :black,
     title = L"y = \frac{\sqrt{\dfrac{\pi^2 - x^2}{2}}}{\sin\left(4^{e} x\right)} + \ln\left(|x| + \frac{1}{2}\right)",
     titlefontsize = 24)

savefig("app.svg")
