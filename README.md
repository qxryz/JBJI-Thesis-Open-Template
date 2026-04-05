# JBJI Thesis Open Template

This folder is a public, sanitized JBJI undergraduate thesis LaTeX template.
It keeps the official-format structure while replacing personal thesis content
with neutral placeholder text.

## Included

- `main.tex` with neutral metadata placeholders
- `jnuthss.cls` with the recent formatting fixes migrated from the working thesis
- `jnuthss-gbt7714-author-year.bst` and `jnuthss-gbt7714-numerical.bst`
- `chapter1` to `chapter5`
- `misc/`
- official reference files in `.docx` and `.pdf`

## Reference Style

- The default bibliography mode is author-year style.
- In-text citations follow forms such as `(Smith, 2001)`.
- The references page is still generated through `\bibliography`.
- English references appear before Chinese references.
- Chinese references are intended to sort by pinyin through sample `key` values.
- If numerical style is preferred, switch to `\jnuthssUseNumericalBibliography` in `jnuthss.cls`.

## Compile

```powershell
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

## Notes

- The sample metadata in `main.tex` should be replaced before final submission.
- The sample chapters are placeholders and are safe to overwrite directly.
- The repository can be shared publicly without exposing the original private thesis content.
