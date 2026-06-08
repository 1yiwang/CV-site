// Visitor + unique-IP counter backed by Upstash Redis (HyperLogLog).
// Privacy: raw IPs are never stored — only a salted SHA-256 hash is added to a
// HyperLogLog structure, which keeps an approximate unique count without the
// underlying values. Zero npm dependencies: uses Node's global fetch + crypto.

const { createHash } = require("crypto");

const REDIS_URL =
  process.env.UPSTASH_REDIS_REST_URL || process.env.KV_REST_API_URL;
const REDIS_TOKEN =
  process.env.UPSTASH_REDIS_REST_TOKEN || process.env.KV_REST_API_TOKEN;
const SALT = process.env.IP_HASH_SALT || "";

async function redis(command) {
  const res = await fetch(REDIS_URL, {
    method: "POST",
    headers: {
      Authorization: "Bearer " + REDIS_TOKEN,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(command),
  });
  if (!res.ok) throw new Error("redis " + res.status);
  const data = await res.json();
  return data.result;
}

module.exports = async (req, res) => {
  res.setHeader("Cache-Control", "no-store");

  if (!REDIS_URL || !REDIS_TOKEN) {
    res.status(200).json({ visitors: 0, ips: 0, configured: false });
    return;
  }

  try {
    // Anonymous visitor id supplied by the client (stored in localStorage).
    let vid = "";
    if (req.method === "POST") {
      const body = req.body && typeof req.body === "object" ? req.body : {};
      vid = (body.vid || "").toString().slice(0, 64);
    }

    // Hash the caller IP with a salt; the raw IP is discarded immediately.
    const fwd = (req.headers["x-forwarded-for"] || "").toString();
    const ip = fwd.split(",")[0].trim() || "unknown";
    const ipHash = createHash("sha256").update(SALT + ip).digest("hex");

    if (vid) await redis(["PFADD", "stats:visitors", vid]);
    await redis(["PFADD", "stats:ips", ipHash]);

    const visitors = await redis(["PFCOUNT", "stats:visitors"]);
    const ips = await redis(["PFCOUNT", "stats:ips"]);

    res.status(200).json({ visitors: visitors || 0, ips: ips || 0 });
  } catch (e) {
    res.status(200).json({ visitors: 0, ips: 0, error: true });
  }
};
