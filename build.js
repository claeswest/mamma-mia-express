// Builds a single self-contained page for publishing: index.html with every
// closeups/*.jpg bundled in as data URLs (window.__PHOTOS).
// Usage: node build.js <output.html> [photo folder]
// The photo folder defaults to closeups/; pass the output of shrink.ps1 to bundle smaller copies.
const fs = require('fs'), path = require('path');
const out = process.argv[2] || path.join(__dirname, 'dist', 'index.html');
const dir = process.argv[3] || path.join(__dirname, 'closeups');
const photos = {};
for (const f of fs.readdirSync(dir).filter(f => /\.jpe?g$/i.test(f)).sort())
  photos['closeups/' + f] = 'data:image/jpeg;base64,' + fs.readFileSync(path.join(dir, f)).toString('base64');
const html = fs.readFileSync(path.join(__dirname, 'index.html'), 'utf8');
const tag = '<script>window.__PHOTOS = ' + JSON.stringify(photos) + ';</script>\n';
const i = html.indexOf('<script src="https://cdnjs');
fs.mkdirSync(path.dirname(out), { recursive: true });
fs.writeFileSync(out, html.slice(0, i) + tag + html.slice(i));
console.log(`Bundled ${Object.keys(photos).length} close-ups into ${out} (${(fs.statSync(out).size/1048576).toFixed(1)} MB)`);
