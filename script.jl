ENV["GKSwstype"] = "100"
using Plots, LaTeXStrings

x = -ℯ:0.008:ℯ

function draw(n)
    y = @. sin(ℯ^n * x) * sqrt(max(ℯ^2 - x^2, 0) / 1.8) + log(abs(x) + 0.7)
    plot(x, y,
         legend = false,
         linewidth = 1,
         size = (950, 950),
         color = :red,
         title = latexstring("y = \\sin(e^{$n}x)\\sqrt{\\dfrac{e^{2}-x^{2}}{1.8}} + \\ln(|x| + 0.7)"),
         titlefontsize = 32)

    savefig("tmp.svg")
    svg = read("tmp.svg", String)

    script = """<script>setTimeout(function(){location.reload()},1000)</script>"""

    i = findlast("</svg>", svg)
    svg = svg[1:first(i)-1] * script * svg[first(i):end]
    write("tmp.svg", svg)
    mv("tmp.svg", "app.svg"; force = true)

end

n = 0
t = Timer(0; interval = 1)
while true
    wait(t)
    global n += 1
    draw(n)
    println("n = ", n)
end
