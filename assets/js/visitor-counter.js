// Fetches visitor + unique-IP counts from /api/hit and renders them into
// #visitor-stats. Generates a stable anonymous visitor id in localStorage so
// repeat visits from the same browser are de-duplicated.
(function () {
  var el = document.getElementById("visitor-stats");
  if (!el) return;

  var KEY = "yw_visitor_id";
  var vid = "";
  try {
    vid = localStorage.getItem(KEY) || "";
    if (!vid) {
      vid =
        window.crypto && crypto.randomUUID
          ? crypto.randomUUID()
          : String(Date.now()) + "-" + Math.random().toString(16).slice(2);
      localStorage.setItem(KEY, vid);
    }
  } catch (e) {
    // localStorage unavailable (private mode); proceed without a stable id.
  }

  fetch("/api/hit", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ vid: vid }),
  })
    .then(function (r) {
      return r.json();
    })
    .then(function (d) {
      if (!d || typeof d.visitors !== "number") return;
      el.textContent =
        "Visitors " +
        d.visitors.toLocaleString() +
        " \u00b7 Unique IPs " +
        d.ips.toLocaleString();
      el.classList.remove("opacity-0");
    })
    .catch(function () {});
})();
