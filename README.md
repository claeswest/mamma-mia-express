# Mamma Mia Express

A 3D gondola-taxi game set in Venice. Eight customers, eight deadlines.

- `index.html` is the whole game: one page, with three.js loaded from cdnjs.
  Open it in a browser to play locally.
- The published version lives at https://claude.ai/artifact/CPtRNE7SKiURkGcTMxBprJ
- To make the published copy, shrink the close-ups and bundle them into one self-contained page:

  ```
  powershell -File shrink.ps1 <tmp folder>
  node build.js <out.html> <tmp folder>
  ```

  `shrink.ps1` writes 1440-wide copies at JPEG quality 80. The originals in `closeups/` are left alone.

## Close-up images

Drop AI-generated close-ups in `closeups/`. Each customer gets three shots:
`intro` (waiting, impatient), `happy` (arrived on time) and `angry` (too late).

Format: landscape 16:9, about 1600×900, `.jpg` or `.webp`.
Short clips also work: `.mp4`, 3–5 seconds, under about 5 MB.

| Ride | Customer            | Files                                                          |
|------|---------------------|----------------------------------------------------------------|
| 1    | Mr. Lindqvist       | `lindqvist-intro` · `lindqvist-happy` · `lindqvist-angry`       |
| 2    | Nonna Pina          | `nonna-intro` · `nonna-happy` · `nonna-angry`                   |
| 3    | Maestro Tortellini  | `tortellini-intro` · `tortellini-happy` · `tortellini-angry`    |
| 4    | The Hendersons      | `hendersons-intro` · `hendersons-happy` · `hendersons-angry`    |
| 5    | Signor Rossi        | `rossi-intro` · `rossi-happy` · `rossi-angry`                   |
| 6    | Contessa Loredana   | `contessa-intro` · `contessa-happy` · `contessa-angry`          |
| 7    | Professor Brenner   | `brenner-intro` · `brenner-happy` · `brenner-angry`             |
| 8    | Mister X            | `misterx-intro` · `misterx-happy` · `misterx-angry`             |

Keep the same face across a customer's three shots, and don't use real famous people.
