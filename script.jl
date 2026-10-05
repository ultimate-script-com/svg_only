ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings, Base.MathConstants

x = range(-π, π, length = 10000)
y = @. sqrt((π^2 - x^2) * 0.5) / sin(π ^ π * x) + log(abs(x) + 0.5)

plot(x, y,
     legend = false,
     linewidth = 1,
     size = (900, 900),
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
     title = L"y = \frac{\sqrt{\dfrac{\pi^{2}-x^{2}}{2}}}{\sin\!\left(\pi^{\pi} x\right)} + \ln\!\left(|x| + \dfrac{1}{2}\right)",
     titlefontsize = 24)

savefig("app.svg")
