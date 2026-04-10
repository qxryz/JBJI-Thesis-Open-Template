# JBJI Thesis Open Template

此文件夹中包含一个公开可用且经过净化处理的 JBJI 本科毕业论文的 LaTeX 模板。
它保留了官方格式的结构，同时用中性占位符文本取代了论文内容。并修改了cls文件，新增jbji风格的参考文献呈现

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

## Notes

- The sample metadata in `main.tex` should be replaced before final submission.
- The sample chapters are placeholders and are safe to overwrite directly.
- The repository can be shared publicly without exposing the original private thesis content.
