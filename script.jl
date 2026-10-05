ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings

x = range(-π, π, length = 10000)
y = @. sin(π^π * x) * sqrt((π^2 - x^2)) + log(abs(x) + 1 / π)

plot(x, y,
     legend = false,
     linewidth = 1,
     size = (900, 900),
     color = :red,
     framestyle = :origin,
     aspect_ratio = :equal,          # 縦横の縮尺を 1:1 にする
     xlims = (-5, 5),                # x, y を同じ幅にして正方形に
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
     title = L"y = \sin\!\left(\pi^{\pi} x\right)\sqrt{\pi^{2}-x^{2}} + \ln\!\left(|x| + \frac{1}{\pi}\right)",
     titlefontsize = 24)

savefig("app.svg")
