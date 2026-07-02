console.log("(･ω･)"); //用いる絵文字、絶対消すな！！

const svg = document.documentElement;

// ====================
// レスポンシブ
// ====================
function resize() {
    const s = Math.min(innerWidth, innerHeight);
    svg.setAttribute("width", s);
    svg.setAttribute("height", s);
    svg.setAttribute("viewBox", "0 0 1000 1000");
}
resize();
addEventListener("resize", resize);

// ====================
// SVG生成関数
// ====================
const el = (t, a = {}) => {
    const n = document.createElementNS("http://www.w3.org/2000/svg", t);
    Object.entries(a).forEach(([k, v]) => n.setAttribute(k, v));
    return n;
};

// ====================
// 背景・地面
// ====================
svg.append(
    el("rect", {
        x: 0,
        y: 0,
        width: 1000,
        height: 1000,
        fill: "#87CEEB",
    }),
);

svg.append(
    el("rect", {
        x: 0,
        y: 900,
        width: 1000,
        height: 100,
        fill: "silver",
    }),
);

// ====================
// 顔文字
// ====================
const face = el("text", {
    x: 500,
    y: 890,
    "text-anchor": "middle",
    "font-weight": "bold",
    "font-size": 64,
    fill: "teal",
});
face.textContent = "(･ω･)";
svg.append(face);

// ====================
// 雲
// ====================
const cloud = el("g");
svg.append(cloud);
cloud.append(
    el("circle", { cx: 0, cy: 0, r: 80, fill: "#fff" }),
    el("circle", { cx: 120, cy: 0, r: 100, fill: "#fff" }),
    el("circle", { cx: 240, cy: 0, r: 80, fill: "#fff" }),
);

let cloudX = -300;
let cloudY = 200;

// ====================
// 雨
// ====================
const rain = [];
const rainCount = 400;

for (let i = 0; i < rainCount; i++) {
    const r = el("line", {
        x1: 0,
        y1: 0,
        x2: 0,
        y2: 18,
        stroke: "#1E90FF",
        "stroke-width": 2,
        opacity: 0,
    });

    svg.append(r);

    rain.push({
        el: r,
        x: Math.random() * 1000,
        y: Math.random() * 600,
        speed: 6 + Math.random() * 6,
    });
}

// ====================
// 状態管理
// ====================
// 0:待機 → 1:雲進入 → 2:雨 → 3:悲しい → 4:リセット
let state = 0;
let timer = 0;

// ====================
// アニメーションループ
// ====================
function loop() {
    timer++;

    // --------------------
    // 雲の動き
    // --------------------
    if (state === 0) {
        cloudX += 2;
        if (cloudX > 250) state = 2;
    }

    if (state >= 2) {
        cloudX += 1;
    }

    if (cloudX > 1200) {
        cloudX = -300;
        state = 0;
        face.textContent = "(･ω･)";
    }

    cloud.setAttribute("transform", `translate(${cloudX},${cloudY})`);

    // --------------------
    // 雨開始条件
    // --------------------
    const raining = state >= 2 && cloudX > 200 && cloudX < 1000;

    if (raining) {
        face.textContent = "(´；ω；｀)";
        state = 3;
    }

    // --------------------
    // 雨アニメーション
    // --------------------
    for (let i = 0; i < rain.length; i++) {
        const p = rain[i];

        if (raining) {
            p.el.setAttribute("opacity", 1);

            p.y += p.speed;

            if (p.y > 1000) {
                p.y = -20;
                p.x = Math.random() * 1000;
            }
        } else {
            p.el.setAttribute("opacity", 0);
        }

        p.el.setAttribute("x1", p.x);
        p.el.setAttribute("x2", p.x);
        p.el.setAttribute("y1", p.y);
        p.el.setAttribute("y2", p.y + 18);
    }

    requestAnimationFrame(loop);
}

loop();
